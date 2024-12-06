SELECT product_id, year AS first_year, quantity, price
FROM 
(
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS RN
    FROM Sales 
)
AS NewTable
WHERE RN = 1
ORDER BY product_id;