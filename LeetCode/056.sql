SELECT Y.name 
FROM  
(
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)
AS X
INNER JOIN Employee Y
ON Y.id = X.managerId;