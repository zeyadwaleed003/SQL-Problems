-- No REGEX in SQL Server!!!!

SELECT * FROM Users 
WHERE mail LIKE '[A-Za-z]%' 
AND mail LIKE '%@leetcode.com' 
AND LEFT(mail, LEN(mail) - 13) NOT LIKE '%[^0-9a-zA-Z_.-]%';