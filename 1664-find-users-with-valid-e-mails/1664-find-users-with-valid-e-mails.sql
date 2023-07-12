# Write your MySQL query statement below
SELECT * FROM Users WHERE mail REGEXP '^[A-Z][A-Z0-9_.-]*[@]leetcode[.]com$';