-- admin
CREATE ROLE admin WITH LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION VALID UNTIL 'infinity';
ALTER ROLE admin WITH PASSWORD 'xxxx';
ALTER DATABASE tendido OWNER TO admin;
ALTER SCHEMA PUBLIC OWNER TO admin;
ALTER SCHEMA TOPOLOGY OWNER TO admin;
GRANT ALL PRIVILEGES ON SCHEMA public TO admin;
GRANT ALL PRIVILEGES ON SCHEMA topology TO admin;
GRANT ALL PRIVILEGES ON DATABASE proeste TO admin;
-- importar
CREATE ROLE importar WITH LOGIN NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity';
ALTER ROLE importar WITH PASSWORD 'xxxxx';
GRANT CONNECT ON DATABASE proeste TO importar;
GRANT USAGE ON SCHEMA public TO importar;
GRANT USAGE ON SCHEMA topology TO importar;
GRANT SELECT,INSERT,UPDATE ON ALL TABLES IN SCHEMA public TO importar;
GRANT SELECT,INSERT,UPDATE ON ALL TABLES IN SCHEMA topology TO importar;
-- edit
CREATE ROLE editar WITH LOGIN NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity';
ALTER ROLE editar WITH PASSWORD 'xxxxx';
GRANT CONNECT ON DATABASE proeste TO editar;
GRANT USAGE ON SCHEMA public TO editar;
GRANT USAGE ON SCHEMA topology TO editar;
GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public to editar;
GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA topology to editar;