
DROP TABLE IF EXISTS transactions CASCADE;

CREATE TABLE transactions (
    transaction_id       	SERIAL PRIMARY KEY,
    account_fk			INTEGER NOT NULL,
    transaction_date		TIMESTAMP NOT NULL,
    category_fk			INTEGER NOT NULL,
    amount			NUMERIC(12, 2),
    cleared			CHAR(1),
    number			VARCHAR,
    tag				VARCHAR,
    description			VARCHAR,
    memo			VARCHAR,
    tax_item			VARCHAR
);

ALTER TABLE transactions 
ADD CONSTRAINT account_fk
FOREIGN KEY (account_fk)
REFERENCES accounts(account_id)
ON DELETE RESTRICT;

ALTER TABLE transactions 
ADD CONSTRAINT category_fk
FOREIGN KEY (category_fk)
REFERENCES categories(category_id)
ON DELETE RESTRICT;

GRANT SELECT, INSERT, UPDATE, DELETE ON tro.transactions TO tro_rw;
GRANT SELECT ON tro.transactions TO tro_ro;

