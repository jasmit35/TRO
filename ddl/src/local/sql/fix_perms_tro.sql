
grant usage on schema tro to tro_rw;

grant usage on all sequences in schema tro to tro_rw;

grant select, insert, update, delete on all tables in schema tro to tro_rw;

alter default privileges in schema tro grant select, insert, update, delete on tables to tro_rw;

--

grant usage on schema tro to tro_ro;

grant select on all tables in schema tro to tro_ro;

alter default privileges in schema tro grant select on tables to tro_ro;
