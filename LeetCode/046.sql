SELECT TOP 1 person_name
FROM
(
    SELECT *,
    SUM(weight) OVER(ORDER BY turn) AS prefix_sum
    FROM Queue 
) AS NewTable
WHERE prefix_sum <= 1000
ORDER BY prefix_sum DESC;