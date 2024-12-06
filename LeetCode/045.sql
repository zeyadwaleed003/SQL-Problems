-- We can use the Common Table Expression (CTE)

WITH CTE AS
(
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
), 

CTE2 AS
(
    SELECT visited_on, 
    SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(1.0 * total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount 
    FROM CTE
), 

CTE3 AS 
(
    SELECT *, 
    ROW_NUMBER() OVER(ORDER BY visited_on) AS RN 
    FROM CTE2
)

SELECT visited_on, amount, average_amount
FROM CTE3
WHERE RN >= 7;