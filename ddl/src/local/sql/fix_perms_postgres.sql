create user tro_rw with password 'tro_rw_devl';

alter user tro_rw set search_path='tro, "$user", public';

--

create user tro_ro with password 'tro_ro_devl';

alter user tro_ro set search_path='tro, "$user", public';


