SELECT request_at AS Day, 
ROUND((COUNT(IIF(SUBSTRING(status, 1, 9) = 'cancelled', 1, NULL)) * 1.0) / (1.0 * COUNT(*)), 2) AS [Cancellation Rate]
FROM Trips 
WHERE (request_at BETWEEN '2013-10-01' AND '2013-10-03')
AND client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
AND driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
GROUP BY request_at;
