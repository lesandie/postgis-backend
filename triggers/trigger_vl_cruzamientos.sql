--
CREATE OR REPLACE FUNCTION actualizar_vl_cruzamientos_before() RETURNS TRIGGER AS $$
BEGIN
    NEW.resultado := NEW.alt_circuito - NEW.alt_cruzamiento;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;
-- Triggers row-level con new y old
DROP TRIGGER vl_cruzamientos_trigger_before ON vl_cruzamientos_3857;
CREATE TRIGGER vl_cruzamientos_trigger_before BEFORE INSERT ON vl_cruzamientos_3857 FOR EACH ROW EXECUTE PROCEDURE actualizar_vl_cruzamientos_before();

CREATE OR REPLACE FUNCTION actualizar_vl_cruzamientos_after() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO vl_cruces_point_3857 (id_cruzamiento,id_conductor,the_geom) 
    SELECT cru.id_cruzamiento, cir.id_conductor, st_intersection(cru.the_geom,cir.the_geom) 
    FROM vl_cruzamientos_3857 AS cru, vl_conductor_3857 AS cir 
    WHERE (st_astext(st_intersection(cru.the_geom,cir.the_geom)) <> 'GEOMETRYCOLLECTION EMPTY') AND 
		cru.id_circuito = cir.id_circuito;
    RETURN NULL;
END
$$ LANGUAGE plpgsql;
--
DROP TRIGGER vl_cruzamientos_trigger_after ON vl_cruzamientos_3857;
CREATE TRIGGER vl_cruzamientos_trigger_after AFTER INSERT ON vl_cruzamientos_3857 FOR EACH STATEMENT EXECUTE PROCEDURE actualizar_vl_cruzamientos_after();