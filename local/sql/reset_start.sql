--
--  Clear tables
DELETE FROM tro.transactions;
DELETE FROM tro.accounts;
DELETE FROM tro.categories;
--
--  Seed accounts
INSERT INTO tro.accounts VALUES (0, 'Unknown');
INSERT INTO tro.accounts VALUES (1, 'Checking');
INSERT INTO tro.accounts VALUES (2, 'Primary Savings');
INSERT INTO tro.accounts VALUES (3, 'Secondary Savings');
--
--  Seed categories
INSERT INTO tro.categories VALUES (0, 'Unknown', 0, 0);
INSERT INTO tro.categories VALUES (1, 'Beginning Balance', 0, 0);
--
--  Beginning balances
INSERT INTO tro.transactions (transaction_id, account_fk, category_fk, transaction_date, amount) VALUES (0, 1, 1, '01/12/1960', 8680.65);
INSERT INTO tro.transactions (transaction_id, account_fk, category_fk, transaction_date, amount) VALUES (1, 2, 1, '01/12/1960', 3286.91);
INSERT INTO tro.transactions (transaction_id, account_fk, category_fk, transaction_date, amount) VALUES (2, 3, 1, '01/12/1960', 77200.48);
--
--  Reset sequence numbers
ALTER SEQUENCE tro.transactions_transaction_id_seq RESTART WITH 3;
ALTER SEQUENCE tro.accounts_account_id_seq RESTART WITH 4;
ALTER SEQUENCE tro.categories_category_id_seq RESTART WITH 2;
--
--
