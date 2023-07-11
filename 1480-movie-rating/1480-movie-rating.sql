# Write your MySQL query statement below
# Test case no. 18 shows that if user name and movie name are same, both should be present in the result as duplicates. Hence, we use
# UNION ALL instead of UNION
WITH count_ratings AS (
SELECT user_id,
COUNT(rating) AS count_of_ratings
FROM MovieRating
GROUP BY user_id),
user_names AS (
  SELECT distinct name,
  count_of_ratings
  FROM count_ratings cr INNER JOIN Users u ON cr.user_id = u.user_id
  ORDER BY count_of_ratings DESC, name LIMIT 1),
average_ratings AS (
  SELECT movie_id,
  AVG(rating) AS average_rating
  FROM MovieRating
  WHERE MONTH(created_at) = 2
  GROUP BY movie_id),
  highest_rated AS (
    SELECT title,
    ar.average_rating
    FROM average_ratings ar INNER JOIN Movies m ON ar.movie_id = m.movie_id
    ORDER BY average_rating DESC, title LIMIT 1
  )
SELECT name AS results FROM user_names
  UNION ALL
SELECT title AS results FROM highest_rated
