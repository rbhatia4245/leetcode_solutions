# Write your MySQL query statement below
WITH categorised_ids as (
    SELECT account_id,
    CASE WHEN income < 20000 THEN 1 ELSE 0 END as low_salary,
    CASE WHEN income >= 20000 and income <= 50000 THEN 1 ELSE 0 END as average_salary,
    CASE WHEN income > 50000 THEN 1 ELSE 0 END as high_salary
    FROM Accounts
)
SELECT "Low Salary" as category,
SUM(low_salary) AS accounts_count
FROM categorised_ids
UNION
SELECT "Average Salary" as category,
SUM(average_salary) as accounts_count
from categorised_ids
UNION
SELECT "High Salary" as category,
SUM(high_salary) as accounts_count
from categorised_ids