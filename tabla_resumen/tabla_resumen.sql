-- Creamos una vista materializada para los conductores con su geometría
DROP MATERIALIZED VIEW conductores;
CREATE MATERIALIZED VIEW conductores AS
(SELECT c.matricula, c.id_circuito, c.alumbrado, tc.tipo_conductor, tc.tense, tc.designacion, c.the_geom
FROM vl_conductor_3857 AS c, cl_tipo_conductor AS tc
WHERE c.id_tipoconductor = tc.id_tipoconductor
GROUP BY c.matricula, c.id_circuito, c.alumbrado, tc.tipo_conductor, tc.tense, tc.designacion, c.the_geom
ORDER BY c.matricula, c.id_circuito, c.alumbrado, tc.tipo_conductor, tc.tense, tc.designacion);
CREATE INDEX conductores_multi_idx ON conductores(matricula, id_circuito, tipo_conductor, tense);
-- Creamos una vista materializada para los apoyos
DROP MATERIALIZED VIEW apoyos;
CREATE MATERIALIZED VIEW apoyos AS 
(SELECT matricula,num_ap,the_geom FROM vl_apoyo_3857 
    GROUP BY matricula, num_ap,the_geom);
-- Creamos la tabla tramos
DROP TABLE vl_tramo_3857;
CREATE SEQUENCE vl_tramo_3857_id_tramo_seq;
CREATE TABLE vl_tramo_3857(
    id_tramo INTEGER NOT NULL DEFAULT nextval('vl_tramo_3857_id_tramo_seq'),
    matricula CHARACTER VARYING(30) NOT NULL,
    id_circuito INTEGER NOT NULL,
    alumbrado BOOLEAN,
    tipo_conductor CHARACTER VARYING(25),
    tense CHARACTER VARYING(25),
    designacion CHARACTER VARYING(25),
    the_geom geometry(MultiLineString,3857),
    lista_apoyos TEXT,
    CONSTRAINT id_tramo_pkey PRIMARY KEY(id_tramo)
);
ALTER SEQUENCE vl_tramo_3857_id_tramo_seq OWNED BY vl_tramo_3857.id_tramo;
CREATE INDEX vl_tramo_3857_matricula_idx ON vl_tramo_3857(matricula, id_circuito, tipo_conductor, tense);    

-- Funcion calcular tramos, añade todos los conductores que forman un tramo y crea una geometria LineString.
CREATE OR REPLACE FUNCTION calcular_tramos() RETURNS VOID AS $$
DECLARE
    row_conductor RECORD;
BEGIN
    REFRESH MATERIALIZED VIEW conductores WITH DATA;
    TRUNCATE vl_tramo_3857;
    FOR row_conductor IN
        -- Selecciono todos los conductores de un tramo, que es un multilinestring ya que ST_Collect y ST_linemerge 
        -- pueden generar un multilinestring
        SELECT matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion, (ST_LineMerge(ST_Collect(array_agg(the_geom)))) AS tramo
        FROM conductores
		WHERE matricula = 'RED0001NEW' OR matricula = '14788' OR matricula = '3235'	OR matricula = '876Y' OR matricula = 'AP' OR matricula = 'RED002'
		OR matricula = 'Red003'	OR matricula = 'RED005' OR matricula = 'Red999'	OR matricula = 'uso30'																							 
        GROUP BY matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion
        ORDER BY matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion
    LOOP
        -- Si devuelve algo que no sea LineString no lo inserta.
        -- RAISE LOG '-----------------------------------';
		-- RAISE LOG 'Matricula: %', row_conductor.matricula;
		-- RAISE LOG 'Geometría: %', ST_GeometryType(row_conductor.tramo);
        IF ST_GeometryType(row_conductor.tramo) = 'ST_LineString' THEN
            INSERT INTO vl_tramo_3857 (matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion, the_geom)
            VALUES (row_conductor.matricula, row_conductor.id_circuito, row_conductor.alumbrado,
                    row_conductor.tipo_conductor, row_conductor.tense, 
                    row_conductor.designacion, row_conductor.tramo);
        END IF;
    END LOOP;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calcular_apoyos_tramo() RETURNS VOID AS $$
DECLARE
    row_tramo RECORD;
    lista_orden_apoyos TEXT := NULL;
    id_tramo_ante INTEGER := NULL;
    num_apoyo INTEGER;
    max_row INTEGER;
    row_actual INTEGER := 0;
BEGIN
    REFRESH MATERIALIZED VIEW apoyos WITH DATA;
    -- Saco el id máximo 
    max_row := (WITH puntos_totales AS (SELECT ROW_NUMBER () OVER (ORDER BY (ST_DumpPoints(the_geom)).geom) FROM vl_tramo_3857)
	            SELECT count(*) FROM puntos_totales);
    FOR row_tramo IN
    -- Selecciono los tramos y la lista ordenada por geometria de puntos que lo componen
    -- Este ordenamiento lo hace ST_DumpPoints
        SELECT matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion, (ST_DumpPoints(the_geom)).geom AS punto, id_tramo 
        FROM vl_tramo_3857
        GROUP BY matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion, punto, id_tramo
        ORDER BY matricula, id_circuito, alumbrado, tipo_conductor, tense, designacion, punto, id_tramo
    LOOP
        -- voy comprobando que el row actual sea menor que el total de rows agregadas por ST_DumpPoint
        row_actual := row_actual + 1;
        -- Busco el punto en la vista de apoyos y si son iguales y lo añado a la lista ordenada
        -- El campo matrícula es importante para reducir el escaneado en la tabla y el Limit 1 es para
        -- que sólo devuelva un punto. Un apoyo puede ser parte de varios tramos (y conductores)
        num_apoyo := (SELECT DISTINCT num_ap FROM apoyos 
                        WHERE matricula = row_tramo.matricula 
                        AND ST_Equals(row_tramo.punto,the_geom) LIMIT 1);
        -- hay 3 opciones nuevo tramo, tramo continuo y final de tramo
        CASE 
            WHEN id_tramo_ante IS NULL THEN 
                -- la comparacion tiene q ser IS, si fuese = la op daria NULL siempre
                lista_orden_apoyos := num_apoyo::TEXT;
                -- concat() ignora los parametros null y los trata como vacio
                id_tramo_ante := row_tramo.id_tramo;
            WHEN id_tramo_ante <> row_tramo.id_tramo THEN   
                UPDATE vl_tramo_3857 SET lista_apoyos = lista_orden_apoyos WHERE id_tramo = id_tramo_ante;
                id_tramo_ante := row_tramo.id_tramo;
                lista_orden_apoyos := num_apoyo::TEXT;
            WHEN id_tramo_ante = row_tramo.id_tramo THEN
                lista_orden_apoyos := concat(lista_orden_apoyos, ',', num_apoyo::TEXT);
                -- Si es el ultimo row hago el últio Update
                IF row_actual = max_row THEN
                    UPDATE vl_tramo_3857 SET lista_apoyos = lista_orden_apoyos WHERE id_tramo = row_tramo.id_tramo;
                END IF;    
        END CASE;    
    END LOOP;
END
$$ LANGUAGE plpgsql;