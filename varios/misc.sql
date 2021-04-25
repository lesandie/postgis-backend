-- string functions devuelve 0 si no hay
SELECT position('x' IN 'Thomas');

-- ST_Dump igual, se puede manejar el orden de los conductores.
SELECT id_tramo, matricula, tipo_conductor, tense, (ST_DumpPoints(the_geom)).path[1], (ST_DumpPoints(the_geom)).geom 
        FROM vl_tramo_3857
        WHERE matricula = 'Coturiña_CTI' AND
                tipo_conductor = 'RZ 50' AND
                tense = '500'
        GROUP BY id_tramo, matricula, tipo_conductor, tense;