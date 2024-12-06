SELECT X.name AS Employee 
FROM Employee X INNER JOIN Employee Y
ON Y.id = X.managerId
WHERE X.salary > Y.salary;