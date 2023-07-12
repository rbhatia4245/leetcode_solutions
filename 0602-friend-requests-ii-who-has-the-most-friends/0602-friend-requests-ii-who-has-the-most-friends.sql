# Write your MySQL query statement below
# total number of friends for an id will be it's total count in requester_id and accepter_id
# Sequentially find count in requester_id, accepted_id for each id.
# Add the counts
# Find id with maximum

WITH requested_friends AS (
    SELECT requester_id as id,
    COUNT(accepter_id) as total_friends
    FROM RequestAccepted
    GROUP BY requester_id
),
accepted_friends AS (
    SELECT accepter_id as id,
    COUNT(requester_id) as total_friends
    FROM RequestAccepted
    GROUP BY accepter_id
),
total_friends AS (
    SELECT id,
    SUM(total_friends) as num
    FROM (SELECT * FROM requested_friends UNION ALL SELECT * FROM accepted_friends) a
    GROUP BY id
)
SELECT id,
num
FROM total_friends
ORDER BY num DESC
LIMIT 1;