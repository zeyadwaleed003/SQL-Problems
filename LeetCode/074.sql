WITH CTE AS 
(
    SELECT id, name, salary, departmentId,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS DR
    FROM Employee
) 

SELECT D.name AS Department, C.name AS Employee, salary AS Salary 
FROM CTE C INNER JOIN Department D
ON D.id = C.departmentId
WHERE DR = 1;