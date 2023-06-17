# Write your MySQL query statement below
# find total number of first orders - sort orders by order date ascending select first order. Rank function can be used.
# find total number of first orders that have same order_date and preferred date.
# find percentage.

with order_ranks as (
  select delivery_id,
  order_date,
  customer_pref_delivery_date as pref_date,
  rank() over (partition by customer_id order by order_date) as order_rank
  from Delivery
),
first_orders as (
select *
from order_ranks
where order_rank = 1)
Select
round ((sum(case when order_date = pref_date then 1 else 0 end)/count(delivery_id))*100, 2) as immediate_percentage
from first_orders;