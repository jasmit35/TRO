select transaction_id, account_name, category_name, sum(amount)
from tro.transactions t, tro.accounts a, tro.categories c
where a.account_id = t.account_fk
and c.category_id = t.category_fk
group by 1, 2, 3;

