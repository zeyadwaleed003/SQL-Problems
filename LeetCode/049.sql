SELECT DISTINCT *
FROM
(
    SELECT P.product_id, ISNULL(price, 10) AS price
    FROM 
    (
        SELECT *,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS RN
        FROM
        (
            SELECT product_id, new_price AS price, change_date
            FROM Products 
            WHERE change_date <= '2019-08-16'
        ) AS N
    ) AS NN
    RIGHT OUTER JOIN Products P
    ON P.product_id = NN.product_id
    WHERE RN = 1 OR RN IS NULL
) AS NNN