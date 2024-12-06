SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count 
FROM Accounts
WHERE income < 20000
UNION  
SELECT 'Average Salary', COUNT(*)
FROM Accounts
WHERE income >= 20000 AND income <= 50000
UNION  
SELECT 'High Salary', COUNT(*)
FROM Accounts
WHERE income > 50000;