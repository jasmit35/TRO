--
--  Clear tables
DELETE FROM tro.transactions;
DELETE FROM tro.accounts;
DELETE FROM tro.categories;
--
\i set_accounts.sql
--
--  Seed categories
INSERT INTO tro.categories VALUES (0, 'Unknown', 0, 0);
INSERT INTO tro.categories VALUES (1, 'Beginning Balance', 0, 0);
INSERT INTO tro.categories VALUES (2, 'Added', 0, 0);
INSERT INTO tro.categories VALUES (3, 'Bought', 0, 0);
INSERT INTO tro.categories VALUES (4, 'Removed', 0, 0);
INSERT INTO tro.categories VALUES (5, 'Stock Split', 0, 0);
INSERT INTO tro.categories VALUES (6, 'Sold', 0, 0);
ALTER SEQUENCE tro.categories_category_id_seq RESTART WITH 7;
--
ALTER SEQUENCE tro.transactions_transaction_id_seq RESTART WITH 1;
--
\i set_beginning.sql
--
\i get_start.sql
--
