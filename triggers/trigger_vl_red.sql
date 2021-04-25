CREATE OR REPLACE FUNCTION actualizar_vl_red() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO vl_apoyo_3857 (matricula, num_ap, fecha, the_geom) 
        VALUES (NEW.matricula, 0, current_timestamp, NEW.the_geom);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;
-- row-level trigger con NEW
DROP TRIGGER vl_red_insert_trigger ON vl_red_3857;
CREATE TRIGGER vl_red_insert_trigger AFTER INSERT ON vl_red_3857 FOR EACH ROW EXECUTE PROCEDURE actualizar_vl_red();
--
CREATE OR REPLACE FUNCTION borrar_vl_red() RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM vl_apoyo_3857 WHERE matricula = OLD.matricula;
    RETURN OLD;
END
$$ LANGUAGE plpgsql;
-- row-level trigger con OLD
DROP TRIGGER vl_red_delete_trigger ON vl_red_3857;
CREATE TRIGGER vl_red_delete_trigger BEFORE DELETE ON vl_red_3857 FOR EACH ROW EXECUTE PROCEDURE borrar_vl_red();
