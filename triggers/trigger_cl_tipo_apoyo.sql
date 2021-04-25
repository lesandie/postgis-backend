CREATE OR REPLACE FUNCTION actualizar_cl_tipo_apoyo() RETURNS TRIGGER AS $$
BEGIN
    NEW.num_tipoapoyo := concat(lpad(NEW.id_tipoapoyo::text,2,'0'), ' ', NEW.tipoapoyo);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;
-- Variables NEW y OLD soloen triggers ROW-Level
DROP TRIGGER cl_tipo_apoyo_trigger ON cl_tipo_apoyo;
CREATE TRIGGER cl_tipo_apoyo_trigger BEFORE INSERT OR UPDATE ON cl_tipo_apoyo FOR EACH ROW EXECUTE PROCEDURE actualizar_cl_tipo_apoyo();
