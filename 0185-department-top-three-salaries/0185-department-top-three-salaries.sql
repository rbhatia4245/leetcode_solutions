# Write your MySQL query statement below
WITH ranked_salaries AS (
  SELECT id,
  name,
  departmentId,
  salary,
  DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as salary_rank
  FROM EMPLOYEE
)
SELECT d.name as Department,
rs.name as Employee,
rs.salary as Salary
FROM ranked_salaries rs INNER JOIN Department d
ON rs.departmentId = d.id
WHERE rs.salary_rank <= 3;