# Write your MySQL query statement below
# if id is odd select student name for the next id
# if id is even select student name for the previous id
# When number of student is odd last element will be null so in case of null keep the original student name.
Select id,
CASE WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id) 
ELSE COALESCE(
  LEAD(student) OVER (ORDER BY id), student) END as student
FROM Seat;