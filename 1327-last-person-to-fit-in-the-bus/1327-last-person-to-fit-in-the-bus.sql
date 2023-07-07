# Write your MySQL query statement below
with total_weights as (
  Select turn,
    person_name,
    sum(weight) over (order by turn) as total_weight
    from Queue
    group by turn, person_name
),
under_limit as ( Select person_name,
  turn,
  total_weight
  from total_weights
  where total_weight <= 1000
  order by turn desc
)
select person_name
from under_limit
limit 1;