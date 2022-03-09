--
select account_name, sum(amount)
from tro.transactions t, tro.accounts a
where t.account_fk = a.account_id
and transaction_date <= '3/31/2020'
group by 1
order by 1;

