SELECT S.name
FROM SalesPerson S LEFT OUTER JOIN
(
    SELECT C.name, O.sales_id 
    FROM Company C INNER JOIN Orders O
    ON C.com_id = O.com_id AND C.name = 'RED'
) AS N
ON S.sales_id = N.sales_id 
WHERE N.name IS NULL;