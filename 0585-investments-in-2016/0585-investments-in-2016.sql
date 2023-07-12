# Write your MySQL query statement below

WITH matching_2015_values AS (
  SELECT i1.pid as pid,
  i1.tiv_2015 as tiv_2015,
  i1.tiv_2016 as tiv_2016,
  i1.lat as lat,
  i1.lon as lon
  FROM Insurance i1 INNER JOIN Insurance i2
  ON i1.pid<> i2.pid and i1.tiv_2015 = i2.tiv_2015
),
unique_locations AS (
  SELECT distinct *
  FROM matching_2015_values
  WHERE pid NOT IN
  (SELECT m2v.pid FROM matching_2015_values m2v INNER JOIN Insurance i ON m2v.pid <> i.pid and m2v.lat = i.lat and m2v.lon = i.lon)
)
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016 from unique_locations