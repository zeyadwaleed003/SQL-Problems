SELECT P.product_id, COALESCE(ROUND(SUM(1.0 * price * units)/SUM(units), 2), 0) AS average_price
FROM Prices P LEFT OUTER JOIN UnitsSold U
ON P.product_id = U.product_id 
AND purchase_date BETWEEN start_date AND end_date
GROUP BY P.product_id;