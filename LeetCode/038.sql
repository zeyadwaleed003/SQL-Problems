SELECT name AS Customers
FROM Customers C LEFT OUTER JOIN Orders O
ON C.id = O.customerId 
WHERE O.id IS NULL;