# Write your MySQL query statement below
WITH DAYS_TOTAL AS (
  SELECT visited_on,
  SUM(amount) as amount
  FROM Customer
  GROUP BY visited_on
),
MOVING_CALC AS (
  SELECT visited_on,
  SUM(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING) as amount,
  ROUND( AVG(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING), 2) as average_amount,
  COUNT(amount) OVER (ORDER BY visited_on ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as day_sequence
  FROM DAYS_TOTAL
)
SELECT visited_on,
amount,
average_amount
FROM MOVING_CALC
WHERE day_sequence > 6;
