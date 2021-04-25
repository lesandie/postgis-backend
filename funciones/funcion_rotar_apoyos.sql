CREATE OR REPLACE FUNCTION funcion_rotar_apoyos() RETURNS VOID AS $$
DECLARE
    row_var RECORD;
BEGIN
   -- Loop para calcular la bisectriz y orientar apoyos intermedios
    -- Ahora creamos un loop para recorred los resultados de los cálculos de la bisectriz
    -- Esto podría mejorarse con una vista materializada y actualizarla regularmente.
    -- utilizmos ST_Intersects ya que ST_
    FOR row_var IN
        (WITH tabla_temporal AS (SELECT ap.id_apoyo,co.azimut FROM vl_apoyo_3857 AS ap, vl_conductor_3857 AS co
        WHERE ST_Intersects(ap.the_geom,co.the_geom) 
        GROUP BY ap.id_apoyo,co.azimut ORDER BY ap.id_apoyo)
        SELECT id_apoyo, AVG(azimut) AS bisectriz FROM tabla_temporal GROUP BY id_apoyo ORDER BY id_apoyo)
    LOOP
        -- actualizamos vl_apoyo con el valor de la bisectriz
        UPDATE vl_apoyo_3857 SET orientacion_ap = row_var.bisectriz 
        WHERE id_apoyo = row_var.id_apoyo AND orientacion_ap_bool = FALSE;
    END LOOP;
    -- Loop para orientar apoyos finales
     FOR row_var IN
        -- Obtenemos los apoyos finales
        SELECT ap.id_apoyo, co.azimut FROM vl_apoyo_3857 AS ap, vl_conductor_3857 AS co
        WHERE (ST_Intersects(ap.the_geom, co.the_geom)) AND 
            ap.id_apoyo NOT IN 
                (SELECT a1.id_apoyo FROM vl_apoyo_3857 AS a1, vl_conductor_3857 AS c1 
                 WHERE ST_Intersects(a1.the_geom,st_startpoint(c1.the_geom))) AND
            ap.orientacion_ap_bool = FALSE    
   LOOP
      IF row_var.azimut >= 270 THEN
         -- azimut_var := row_var.azimut - 270; 
         UPDATE vl_apoyo_3857 SET orientacion_ap = (row_var.azimut - 270) 
         WHERE id_apoyo = row_var.id_apoyo;                 
      END IF;
      IF row_var.azimut < 270 THEN 
         -- azimut_var := row_var.azimut + 90;
         UPDATE vl_apoyo_3857 SET orientacion_ap = (row_var.azimut + 90) 
         WHERE id_apoyo = row_var.id_apoyo;                
      END IF;
   END LOOP;
END
$$ LANGUAGE plpgsql;
--