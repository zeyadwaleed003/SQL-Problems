SELECT query_name, 
ROUND((1.0 * SUM((1.0 * rating)/(1.0 * position)))/(1.0 * COUNT(*)),2) AS quality, 
ROUND((1.0*COUNT(IIF(rating < 3, 1, NULL)
))/(1.0 * COUNT(*))*100.0,2) 
AS poor_query_percentage
FROM Queries 
WHERE query_name IS NOT NULL
GROUP BY query_name;