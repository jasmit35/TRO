\o transactions.log

DROP TABLE IF EXISTS tro.transactions CASCADE;

CREATE TABLE tro.transactions (
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

ALTER TABLE tro.transactions 
ADD CONSTRAINT account_fk
FOREIGN KEY (account_fk)
REFERENCES tro.accounts(account_id)
ON DELETE RESTRICT;

ALTER TABLE tro.transactions 
ADD CONSTRAINT category_fk
FOREIGN KEY (category_fk)
REFERENCES tro.categories(category_id)
ON DELETE RESTRICT;

GRANT ALL PRIVILEGES ON tro.transactions TO tro_rw;
GRANT ALL PRIVILEGES ON SEQUENCE tro.transactions_transaction_id_seq TO tro_rw;

GRANT SELECT ON tro.transactions TO tro_ro;

