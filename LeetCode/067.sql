WITH CTE AS
(
    SELECT user_id, SUM(distance) AS travelled_distance 
    FROM Rides
    GROUP BY user_id
)

SELECT name, ISNULL(travelled_distance, 0) AS travelled_distance 
FROM Users U LEFT OUTER JOIN CTE C
ON U.id = C.user_id  
ORDER BY travelled_distance DESC, name;