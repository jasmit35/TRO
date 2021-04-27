DROP TABLE IF EXISTS tro.categories CASCADE;

CREATE TABLE tro.categories (
    category_id       	SERIAL PRIMARY KEY,
    category_name       VARCHAR NOT NULL UNIQUE,
    category_type_fk  	INTEGER NOT NULL DEFAULT 0,
    category_group_fk 	INTEGER NOT NULL DEFAULT 0
);

ALTER TABLE tro.categories 
ADD CONSTRAINT type_fk
FOREIGN KEY (category_type_fk)
REFERENCES tro.category_types(category_type_id)
ON DELETE RESTRICT;

ALTER TABLE tro.categories 
ADD CONSTRAINT group_fk
FOREIGN KEY (category_group_fk)
REFERENCES tro.category_groups(category_group_id)
ON DELETE RESTRICT;

insert into tro.categories values (0, 'Unknown')
