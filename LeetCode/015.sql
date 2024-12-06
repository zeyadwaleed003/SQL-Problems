SELECT unique_id, name FROM Employees E LEFT OUTER JOIN EmployeeUNI U
ON E.id = U.id;