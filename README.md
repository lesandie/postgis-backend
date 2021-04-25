
# A PostGIS backend for a QGis application  


## Rationale

A PostGIS backend for a Qgis template, written in PL/pgSQL and using many capabilities of a PostgreSQL database like Materialized views, triggers and functions.


## Use Case

This backend was developed for a Spanish engineering SME that used Qgis to locate and expand and electrical network in rural areas. They used Qfield to map the towers, orientation, altitude and many other properties during field trips using QField as frontend and PostGIS/PostgreSQL as a backend.
It is incomplete and many parts of this code can be improved a lot, but it was a showcase to present the multiple and powerful possibilities that PostGIS, PostgreSQL and PL/pgSQL can bring together.

This code is divided into different parts. First the functions, the triggers and some complementary code with the database structure and schemas. The naming of variables and functions are in Spanish and many of the code comments are also in Spanish. I had to clean and delete many parts with sensible information and craft a repo to upload to github. 
