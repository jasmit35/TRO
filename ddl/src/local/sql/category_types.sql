SET SEARCH_PATH TO 'tro';

DROP TABLE IF EXISTS category_types CASCADE;

CREATE TABLE category_types (
    category_type_id   	SERIAL PRIMARY KEY,
    category_type       VARCHAR NOT NULL 
);

INSERT INTO CATEGORY_TYPES VALUES (0, 'Unknown');
INSERT INTO CATEGORY_TYPES VALUES (1, 'income');
INSERT INTO CATEGORY_TYPES VALUES (2, 'expense');
INSERT INTO CATEGORY_TYPES VALUES (3, 'transfer');