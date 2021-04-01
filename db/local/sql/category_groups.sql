DROP TABLE IF EXISTS category_groups CASCADE;

CREATE TABLE category_groups (
    category_group_id  	SERIAL PRIMARY KEY,
    category_group      VARCHAR NOT NULL 
);

INSERT INTO CATEGORY_GROUPS VALUES (0, 'Unknown');
INSERT INTO CATEGORY_GROUPS VALUES (1, 'personal expenses');
INSERT INTO CATEGORY_GROUPS VALUES (2, 'personal income');
INSERT INTO CATEGORY_GROUPS VALUES (3, 'rental property income');
INSERT INTO CATEGORY_GROUPS VALUES (4, 'transfers');
INSERT INTO CATEGORY_GROUPS VALUES (5, 'discretionary expenses');
INSERT INTO CATEGORY_GROUPS VALUES (6, 'non-discretionary expenses');
INSERT INTO CATEGORY_GROUPS VALUES (7, 'fixed income');
INSERT INTO CATEGORY_GROUPS VALUES (8, 'other income');
