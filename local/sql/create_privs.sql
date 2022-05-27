
--  Start setting up the privilages

\o create_privs.log

REVOKE CREATE ON SCHEMA public FROM public;

GRANT ALL PRIVILEGES ON SCHEMA tro TO tro;

