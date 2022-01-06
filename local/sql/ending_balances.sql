--
select account_name, sum(amount)
from tro.transactions t, tro.accounts a
where t.account_fk = a.account_id
and obsolete_date is null
group by 1;

