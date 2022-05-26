--
--  Remove beginning balances
DELETE from tro.transactions where category_fk = 1;
--
--  Seed accounts
-- INSERT INTO tro.accounts VALUES (0, 'Unknown');
-- INSERT INTO tro.accounts VALUES (1, 'Checking');
-- INSERT INTO tro.accounts VALUES (2, 'Primary Savings');
-- INSERT INTO tro.accounts VALUES (3, 'Secondary Savings');
-- INSERT INTO tro.accounts VALUES (4, 'Fidelity HSA-Cash');
-- INSERT INTO tro.accounts VALUES (5, 'Optum HSA-Cash');
-- INSERT INTO tro.accounts VALUES (6, 'Chase Freedom Card (2214)');
-- INSERT INTO tro.accounts VALUES (7, 'Escrow Account');
--
--  Set beginning balances
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (1, 1, '01/12/1960', 8680.65);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (2, 1, '01/12/1960', 3286.91);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (3, 1, '01/12/1960', 77200.48);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (4, 1, '01/12/1960', 501.85);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (5, 1, '01/12/1960', 2445.18);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (6, 1, '01/12/1960', -251.62);
INSERT INTO tro.transactions (account_fk, category_fk, transaction_date, amount) VALUES (7, 1, '01/12/1960', 968.37);
--
--  Check
select account_fk, amount
from tro.transactions
where category_fk = 1;
--
--
