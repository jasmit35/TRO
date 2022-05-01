\o category_groups.log

DROP TABLE IF EXISTS tro.category_groups CASCADE;

CREATE TABLE tro.category_groups (
    category_group_id  	SERIAL PRIMARY KEY,
    category_group      VARCHAR NOT NULL 
);

GRANT SELECT, INSERT, UPDATE, DELETE ON tro.category_groups TO tro_rw;
GRANT SELECT ON tro.category_groups TO tro_ro;

INSERT INTO tro.category_groups VALUES (0, 'Unknown');
INSERT INTO tro.category_groups VALUES (1, 'personal expenses');
INSERT INTO tro.category_groups VALUES (2, 'personal income');
INSERT INTO tro.category_groups VALUES (3, 'rental property income');
INSERT INTO tro.category_groups VALUES (4, 'transfers');
INSERT INTO tro.category_groups VALUES (5, 'discretionary expenses');
INSERT INTO tro.category_groups VALUES (6, 'non-discretionary expenses');
INSERT INTO tro.category_groups VALUES (7, 'fixed income');
INSERT INTO tro.category_groups VALUES (8, 'other income');
