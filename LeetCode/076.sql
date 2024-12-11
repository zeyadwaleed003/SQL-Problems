CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT salary
        FROM 
        (
            SELECT *, ROW_NUMBER() OVER(ORDER BY salary DESC) AS RN
            FROM (SELECT DISTINCT salary FROM Employee) AS EMP
        ) AS NT
        WHERE RN = @N
);
END