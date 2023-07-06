# Write your MySQL query statement below
Select e.employee_id as employee_id,
e.name as name,
count(distinct e1.employee_id) as reports_count, 
round(avg(e1.age)) as average_age
from Employees e inner join Employees e1 on e.employee_id = e1.reports_to
group by e.employee_id,
e.name
order by e.employee_id;