\o accounts.log

DROP TABLE IF EXISTS tro.accounts CASCADE;

CREATE TABLE tro.accounts (
    account_id  	SERIAL PRIMARY KEY,
    account_name	VARCHAR NOT NULL 
);

GRANT SELECT, INSERT, UPDATE, DELETE ON tro.accounts TO tro_rw;
GRANT SELECT  ON tro.accounts TO tro_ro;

