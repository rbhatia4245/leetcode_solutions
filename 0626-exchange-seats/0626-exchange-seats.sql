# Write your MySQL query statement below
Select id,
CASE WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id) 
ELSE COALESCE(
  LEAD(student) OVER (ORDER BY id), student) END as student
FROM Seat