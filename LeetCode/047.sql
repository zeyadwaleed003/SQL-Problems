SELECT SUBSTRING(trans_date, 1, 7) AS month, 
country, 
COUNT(*) AS trans_count,
SUM(amount) AS approved_count,
COUNT(
    CASE
    WHEN state = 'approved' THEN 1
    ELSE NULL
    END
) AS trans_total_amount,
SUM(
    CASE
    WHEN state = 'approved' THEN amount
    ELSE 0
    END
) AS approved_total_amount 
FROM Transactions
GROUP BY month, country