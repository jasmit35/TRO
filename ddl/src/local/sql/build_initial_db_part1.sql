
--  Create the database for the environment

CREATE DATABASE :environment;

\c :environment

--  Set up the user IDs 

CREATE USER jeff ENCRYPTED PASSWORD 'jeff';

CREATE USER tro ENCRYPTED PASSWORD 'tro';

--  Start setting up the privilages

REVOKE CREATE ON SCHEMA public FROM PUBLIC;

CREATE SCHEMA tro AUTHORIZATION tro;


