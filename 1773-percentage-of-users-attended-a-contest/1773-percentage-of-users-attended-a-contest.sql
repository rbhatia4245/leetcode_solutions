# Write your MySQL query statement below
with ucount as (
  select count(user_id) as total from Users
)
Select contest_id,
round((count(contest_id) / total)*100, 2) as percentage
from Register, ucount
group by contest_id
order by percentage desc, contest_id asc;