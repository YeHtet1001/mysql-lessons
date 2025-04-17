select 
c.name,
sum(o.quantity)
from
customer c
left join
orderItem o 
on o.customer_id = c.id
group by c.name;

create table temptable as select * from customer where 1=0;

insert into temptable select * from customer ;

UPDATE temptable set created_at = CURRENT_TIMESTAMP , modified_at = CURRENT_TIMESTAMP where id = 1;