# Write your MySQL query statement below
Select distinct num as ConsecutiveNums from
(Select num,
LAG(num, 1) OVER (order by id) as first_up,
LAG(num, 2) OVER (order by id) as second_up
FROM Logs) a
where num = first_up and first_up = second_up;

