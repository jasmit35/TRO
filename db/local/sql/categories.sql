DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories (
    category_id       	SERIAL PRIMARY KEY,
    category_name       VARCHAR NOT NULL UNIQUE,
    category_type_fk  	INTEGER NOT NULL DEFAULT 0,
    category_group_fk 	INTEGER NOT NULL DEFAULT 0
);

ALTER TABLE categories 
ADD CONSTRAINT type_fk
FOREIGN KEY (category_type_fk)
REFERENCES category_types(category_type_id)
ON DELETE RESTRICT;

ALTER TABLE categories 
ADD CONSTRAINT group_fk
FOREIGN KEY (category_group_fk)
REFERENCES category_groups(category_group_id)
ON DELETE RESTRICT;

insert into categories values (0, 'Unknown')
