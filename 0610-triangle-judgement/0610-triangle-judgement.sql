# Write your MySQL query statement below
Select x, y, z, 
CASE WHEN ((x+y) > z and (y+z) > x and (z+x) > y) then 'Yes' else 'No' end as triangle
from Triangle;