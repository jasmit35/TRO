
--  Start setting up the privilages

\o create_privs.log

REVOKE CREATE ON SCHEMA public FROM public;

CREATE SCHEMA tro AUTHORIZATION tro;
