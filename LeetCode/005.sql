SELECT Y.employee_id, Y.name, COUNT(X.reports_to) AS reports_count, ROUND(AVG(X.age * 1.0), 0) AS average_age
FROM Employees X INNER JOIN Employees Y
ON Y.employee_id = X.reports_to 
GROUP BY Y.employee_id, Y.name
HAVING COUNT(X.reports_to) >= 1
ORDER BY Y.employee_id;