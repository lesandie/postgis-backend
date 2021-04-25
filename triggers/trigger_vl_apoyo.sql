-- TRIGGER BEFORE
CREATE OR REPLACE FUNCTION actualizar_vl_apoyo_before() RETURNS TRIGGER AS $$
DECLARE
    row_var RECORD;
    max_num_ap INTEGER;
BEGIN
CASE TG_OP
-- Si es una insert y no proviene del trigger vl_red que tiene el num_ap=0    
    WHEN 'INSERT' THEN
        max_num_ap := (SELECT MAX(num_ap) FROM vl_apoyo_3857 WHERE matricula = NEW.matricula);
        IF (max_num_ap >= 0) THEN
            NEW.num_ap := (max_num_ap + 1);
        END IF;
        RETURN NEW;
-- Si es delete reordenar los apoyos con el campo num_ap 
    WHEN 'DELETE' THEN
        max_num_ap := (SELECT MAX(num_ap) FROM vl_apoyo_3857 WHERE matricula = OLD.matricula);
        FOR row_var IN
            SELECT id_apoyo, num_ap FROM vl_apoyo_3857 
            WHERE matricula = OLD.matricula ORDER BY num_ap
        LOOP
            IF (row_var.num_ap > OLD.num_ap) THEN
                UPDATE vl_apoyo_3857 SET num_ap = (row_var.num_ap - 1) 
                WHERE id_apoyo = row_var.id_apoyo;
            END IF;
        END LOOP;
        RETURN OLD;
END CASE;
END
$$ LANGUAGE plpgsql;
-- las estructuras NEW y OLD solo en triggers ROW-LEVEL
DROP TRIGGER vl_apoyo_trigger_before ON vl_apoyo_3857;
CREATE TRIGGER vl_apoyo_trigger_before BEFORE INSERT OR DELETE
ON vl_apoyo_3857 FOR EACH ROW 
WHEN (pg_trigger_depth() = 0)
EXECUTE PROCEDURE actualizar_vl_apoyo_before();
-----------------------------------------------------------------------------
-- TRIGGER AFTER
CREATE OR REPLACE FUNCTION actualizar_vl_apoyo_after() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') OR (TG_OP = 'UPDATE') THEN
            PERFORM funcion_rotar_apoyos();
            PERFORM funcion_calcular_tramos(NEW.matricula);
    ELSEIF (TG_OP = 'DELETE') THEN
            PERFORM funcion_rotar_apoyos();
            PERFORM funcion_calcular_tramos(OLD.matricula);
    END IF;
    RETURN NULL;
END
$$ LANGUAGE plpgsql;
-- las estructuras NEW y OLD solo en triggers ROW-LEVEL
DROP TRIGGER vl_apoyo_trigger_after ON vl_apoyo_3857;
CREATE TRIGGER vl_apoyo_trigger_after AFTER INSERT OR UPDATE OR DELETE
ON vl_apoyo_3857 FOR EACH ROW
WHEN (pg_trigger_depth() = 0)
EXECUTE PROCEDURE actualizar_vl_apoyo_after();