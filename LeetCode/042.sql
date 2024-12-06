SELECT S.user_id, 
ROUND(AVG(IIF(C.action = 'confirmed', 1, 0)) AS FLOAT, 2) AS confirmation_rate
FROM Signups S LEFT OUTER JOIN Confirmations C
ON S.user_id = C.user_id
GROUP BY S.user_id;