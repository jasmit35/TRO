\o category_types.log

DROP TABLE IF EXISTS tro.category_types CASCADE;

CREATE TABLE tro.category_types (
    category_type_id   	SERIAL PRIMARY KEY,
    category_type       VARCHAR NOT NULL 
);

GRANT SELECT, INSERT, UPDATE, DELETE ON tro.category_types TO tro_rw;
GRANT SELECT ON tro.category_types TO tro_ro;

INSERT INTO tro.category_types VALUES (0, 'Unknown');
INSERT INTO tro.category_types VALUES (1, 'Income');
INSERT INTO tro.category_types VALUES (2, 'Expense');
INSERT INTO tro.category_types VALUES (3, 'Transfer');
