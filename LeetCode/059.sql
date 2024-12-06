WITH CTE1 AS
(
    SELECT E.id, E.name AS Employee, E.salary AS Salary, D.name AS Department
    FROM Employee E, Department D
    WHERE E.departmentId = D.id
), 
CTE2 AS 
(
    SELECT *, DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS DR
    FROM CTE1   
)

SELECT Department, Employee, Salary 
FROM CTE2
WHERE DR <= 3;