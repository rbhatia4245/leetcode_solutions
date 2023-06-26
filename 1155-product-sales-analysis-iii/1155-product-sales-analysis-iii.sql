# Write your MySQL query statement below
with all_sales as
(select product_id, 
year,
quantity,
price,
rank() over (partition by product_id order by year) as year_sequence
from sales
)
select
product_id,
year as first_year,
quantity,
price
from all_sales
where year_sequence = 1;