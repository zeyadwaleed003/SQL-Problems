SELECT S.product_id, product_name
FROM Product P INNER JOIN Sales S
ON P.product_id = S.product_id
GROUP BY S.product_id, product_name
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';