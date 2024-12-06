SELECT 
(
    SELECT TOP(1) * 
    FROM MyNumbers
    GROUP BY num 
    HAVING COUNT(num)  = 1
    ORDER BY num DESC
)
AS num;