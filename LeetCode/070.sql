SELECT transaction_date, 
SUM(IIF(amount % 2 = 1, amount, 0)) AS odd_sum,
SUM(IIF(amount % 2 = 0, amount, 0)) AS even_sum
FROM transactions
GROUP BY transaction_date;