SELECT
(
    SELECT salary 
    FROM
    (
        SELECT salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS DR
        FROM 
        (
            SELECT DISTINCT salary FROM
            Employee
        )
        AS Distinc
    )
    AS NewTable
    WHERE DR = 2
)
AS SecondHighestSalary;