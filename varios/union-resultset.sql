-- UNION de los dos resultsets
(SELECT a.id_apoyo, COUNT(c.id_apoyo_i) FROM vl_apoyo_3857 AS a LEFT JOIN 
vl_conductor_3857 AS c ON  
a.id_apoyo = c.id_apoyo_i
GROUP BY a.id_apoyo)
UNION
(SELECT a.id_apoyo, COUNT(c.id_apoyo_f) FROM vl_apoyo_3857 AS a LEFT JOIN 
vl_conductor_3857 AS c ON  
a.id_apoyo = c.id_apoyo_f
GROUP BY a.id_apoyo);

--
CREATE UNLOGGED TABLE apoyos_i (id_apoyo INT, apoyo_count BIGINT, id_conductor INT);
INSERT INTO apoyos_i
	SELECT a.id_apoyo, COUNT(c.id_apoyo_i), c.id_conductor FROM vl_apoyo_3857 AS a LEFT JOIN vl_conductor_3857 AS c 
	ON a.id_apoyo = c.id_apoyo_i 
	GROUP BY a.id_apoyo , c.id_conductor
	ORDER BY a.id_apoyo;

CREATE UNLOGGED TABLE apoyos_f (id_apoyo INT, apoyo_count BIGINT, id_conductor INT);
INSERT INTO apoyos_f
	SELECT a.id_apoyo, COUNT(c.id_apoyo_f), c.id_conductor FROM vl_apoyo_3857 AS a LEFT JOIN vl_conductor_3857 AS c 
	ON a.id_apoyo = c.id_apoyo_f 
	GROUP BY a.id_apoyo, c.id_conductor 
	ORDER BY a.id_apoyo;