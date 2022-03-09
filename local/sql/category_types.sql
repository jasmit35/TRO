
DROP TABLE IF EXISTS tro.category_types CASCADE;

CREATE TABLE tro.category_types (
    category_type_id   	SERIAL PRIMARY KEY,
    category_type       VARCHAR NOT NULL 
);

GRANT SELECT, INSERT, UPDATE, DELETE ON tro.category_types TO tro_rw;
GRANT SELECT ON tro.category_types TO tro_ro;

INSERT INTO CATEGORY_TYPES VALUES (0, 'Unknown');
INSERT INTO CATEGORY_TYPES VALUES (1, 'income');
INSERT INTO CATEGORY_TYPES VALUES (2, 'expense');
INSERT INTO CATEGORY_TYPES VALUES (3, 'transfer');
