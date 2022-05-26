select transaction_date, amount
from tro.transactions 
where account_fk = 20
and transaction_date <= '1/31/2020'
order by 1;

