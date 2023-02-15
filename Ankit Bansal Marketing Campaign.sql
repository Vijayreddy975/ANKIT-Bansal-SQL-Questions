--SELECT * FROM marketing_campaign
--order by user_id


WITH CTE AS (
SELECT *,RANK() OVER (PARTITION BY user_id ORDER BY created_at asc) as rn FROM marketing_campaign),

First_time_purchases AS 
(SELECT user_id,product_id,created_at
FROM CTE 
WHERE rn=1),

Except_First_time_purchases AS 
(SELECT user_id,product_id,created_at
FROM CTE 
WHERE rn>1)


SELECT E.user_id
FROM Except_First_time_purchases E 
LEFT JOIN First_time_purchases F
ON F.user_id = E.user_id and F.product_id = E.product_id
WHERE F.user_id is null 







