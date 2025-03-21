SELECT e.name , a.attendance_date , a.status FROM employee e left join attendance a on a.emp_id = e.id ;

select (ROW_NUMBER() over( order by e.name )) as No , e.name , a.attendance_date , a.status from employee e right join attendance a on a.emp_id = e.id;

select (ROW_NUMBER() over( order by e.name )) as No , e.name , a.attendance_date , a.status ,d.department from employee e right join attendance a on a.emp_id = e.id left join department d on d.id = a.dep_id;

select  
( ROW_NUMBER() over( order by d.department )) as No ,
d.department,
count( e.name ) as Total,
d.floor
from department d left join employee e on d.id = e.department_id group by d.department,d.floor;

select 
f.name ,
case
when f.price < 0.0 then 'cheap price' 
when f.price between 0.0 and 2.0 then 'normal price'
when f.price > 2.0 then 'expensive price'
end as description,
f.price
from fruit f;

