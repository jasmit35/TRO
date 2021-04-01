DROP TABLE IF EXISTS accounts CASCADE;

CREATE TABLE accounts (
    account_id  	SERIAL PRIMARY KEY,
    account_name	VARCHAR NOT NULL 
);

INSERT INTO accounts VALUES (1, 'checking');

