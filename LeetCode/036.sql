SELECT Y.id AS Id FROM Weather X INNER JOIN Weather Y
ON ADD(DAY, Y.recordDate, X.recordDate) = 1
AND Y.temperature > X.temperature;