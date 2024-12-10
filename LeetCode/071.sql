SELECT stock_name, 
SUM(IIF(operation = 'Sell', price, 0) - IIF(operation = 'Buy', price, 0)) AS capital_gain_loss 
FROM Stocks 
GROUP BY stock_name;