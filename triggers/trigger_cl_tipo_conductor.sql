CREATE OR REPLACE FUNCTION actualizar_cl_tipo_conductor() RETURNS TRIGGER AS $$
BEGIN
    NEW.num_tipoconductor := concat(lpad(NEW.id_tipoconductor::text,2,'0'), ' ', NEW.tipo_conductor);
	NEW.tipo_conductor_tense := concat(NEW.tipo_conductor, ' ', NEW.tense);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;
-- Variables new y old solo en row level triggers
DROP TRIGGER cl_tipo_conductor_trigger ON cl_tipo_conductor;
CREATE TRIGGER cl_tipo_conductor_trigger BEFORE INSERT OR UPDATE ON cl_tipo_conductor FOR EACH ROW EXECUTE PROCEDURE actualizar_cl_tipo_apoyo();
