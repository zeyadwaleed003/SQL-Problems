WITH CTE AS
(
    SELECT account, SUM(amount) AS balance
    FROM Transactions
    GROUP BY account
)

SELECT name, balance
FROM Users U INNER JOIN CTE C
ON U.account = C.account AND balance > 10000;