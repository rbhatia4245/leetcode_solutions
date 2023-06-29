# Write your MySQL query statement below
# product_id price latest change was before or on 08/16 - latest price would be the price on 08/16
# product_id price changed before and after 08/16 - latest price on or before 08/16
# product_id price changes after 08/16 - latest price 10
# find price of products on latest change on or before 08/16
# set price of products with change_date after 08/16 as 10
# now the maximum price of products from results of first two operations is the final price
WITH last_change_date AS
(
         SELECT   product_id,
                  Max(change_date) AS latest_change
         FROM     products
         WHERE    change_date <= '2019-08-16'
         GROUP BY product_id ), last_change_price AS
(
           SELECT     p.product_id,
                      p.new_price AS price
           FROM       products p
           INNER JOIN last_change_date l
           where      p.product_id = l.product_id
           AND        p.change_date = l.latest_change ), post_change_date AS
(
         SELECT   product_id,
                  10 AS price
         FROM     products
         WHERE    change_date > '2019-08-16'
         GROUP BY product_id ), union_pre_post_prices AS
(
       SELECT *
       FROM   last_change_price
       UNION
       SELECT *
       FROM   post_change_date )
SELECT   product_id,
         max(price) AS price
FROM     union_pre_post_prices
GROUP BY product_id;