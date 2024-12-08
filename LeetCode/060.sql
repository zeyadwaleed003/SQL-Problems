WITH CTE AS
(
    SELECT S.employee_id 
    FROM Employees E INNER JOIN Salaries S
    ON E.employee_id = S.employee_id
)

SELECT E.employee_id 
FROM Employees E
WHERE E.employee_id NOT IN (SELECT employee_id  FROM CTE)
UNION 
SELECT S.employee_id 
FROM Salaries S
WHERE S.employee_id NOT IN (SELECT employee_id  FROM CTE)