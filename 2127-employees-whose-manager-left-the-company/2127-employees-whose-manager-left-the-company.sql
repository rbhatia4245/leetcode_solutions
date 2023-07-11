# Write your MySQL query statement below
Select e.employee_id
FROM Employees e left join Employees e1 on e.manager_id = e1.employee_id
where e.manager_id IS NOT NULL and e1.employee_id IS NULL and e.salary < 30000
order by e.employee_id;