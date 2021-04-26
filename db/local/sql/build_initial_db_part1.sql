
--  

CREATE DATABASE :environment;

\c :environment

--  Set up the user IDs. 

CREATE USER jeff ENCRYPTED PASSWORD 'jeff';

CREATE USER tro ENCRYPTED PASSWORD 'tro';

