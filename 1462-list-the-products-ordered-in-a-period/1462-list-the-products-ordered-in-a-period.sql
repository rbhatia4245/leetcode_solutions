# Write your MySQL query statement below
SELECT p.product_name as product_name,
SUM(unit) as unit 
FROM Orders o INNER JOIN Products p ON o.product_id = p.product_id
WHERE MONTH(order_date) = 2
GROUP BY o.product_id
HAVING SUM(unit) >= 100