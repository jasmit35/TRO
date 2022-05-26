
--  Create the database for the environment

CREATE DATABASE :environment;

\c :environment

--  Set up the user IDs 

CREATE USER jeff ENCRYPTED PASSWORD 'jeff';

CREATE USER tro ENCRYPTED PASSWORD 'tro';
ALTER USER tro SET SEARCH_PATH='tro, "$user", public';

CREATE USER tro_rw WITH PASSWORD 'tro_rw';
ALTER USER tro_rw SET SEARCH_PATH='tro, "$user", public';

CREATE USER tro_ro WITH PASSWORD 'tro_ro';
ALTER USER tro_ro SET SEARCH_PATH='tro, "$user", public';

--  Start setting up the privilages

REVOKE CREATE ON SCHEMA public FROM public;

CREATE SCHEMA tro AUTHORIZATION tro;
