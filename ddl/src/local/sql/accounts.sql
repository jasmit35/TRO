DROP TABLE IF EXISTS tro.accounts CASCADE;

CREATE TABLE tro.accounts (
    account_id  	SERIAL PRIMARY KEY,
    account_name	VARCHAR NOT NULL 
);

INSERT INTO accounts VALUES (1, 'checking');

