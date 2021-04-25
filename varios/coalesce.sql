SELECT
  COALESCE((simple.id || '.' || simple.path[1]::text)::float, simple.id) as id,
  simple.name,
  simple.simple_geom as geom,
  ST_GeometryType(simple.simple_geom) as geom_type,
  ST_AsEWKT(simple.simple_geom) as geom_wkt
FROM (
  SELECT
    dumped.*,
    (dumped.geom_dump).geom as simple_geom,
    (dumped.geom_dump).path as path
  FROM (
    SELECT *, ST_Dump(geom) AS geom_dump FROM complex
  ) as dumped
) AS simple;