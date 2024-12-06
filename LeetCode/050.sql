SELECT ROUND(COUNT(T2.player_id) * 1.0 / COUNT(T1.player_id), 2) AS fraction  
FROM
(
    SELECT player_id, MIN(event_date) AS FD
    FROM Activity
    GROUP BY player_id
) 
AS T1 LEFT OUTER JOIN Activity T2
ON T1.player_id = T2.player_id AND T2.event_date = DATEADD(DAY, 1, T1.FD);