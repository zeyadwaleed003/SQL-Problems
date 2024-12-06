SELECT name, bonus FROM Employee E LEFT OUTER JOIN Bonus B
ON E.empId = B.empId
WHERE bonus IS NULL OR bonus < 1000;