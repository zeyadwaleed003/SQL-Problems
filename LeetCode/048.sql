SELECT ROUND(((1.0 * COUNT(IIF(order_date = customer_pref_delivery_date, 1, NULL)))/(1.0 * COUNT(*))) * 100.0, 2)
AS immediate_percentage
FROM
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS RN
    FROM Delivery 
) AS N
WHERE RN = 1