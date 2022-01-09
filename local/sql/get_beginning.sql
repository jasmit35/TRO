--
select account_fk, account_name, amount
from tro.transactions t, tro.accounts a
where category_fk = 1
and t.account_fk = a.account_id
order by 1;
--
