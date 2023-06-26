# Write your MySQL query statement below

with buy_count as
(
    Select customer_id,
    count(distinct product_key) as quantity
    from customer
    group by customer_id
)
select customer_id
from buy_count
where quantity = (select count(*) from product);