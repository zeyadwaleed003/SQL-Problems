WITH CTE AS
(
    SELECT *, 
    LAG(people) OVER(ORDER BY visit_date) AS PREV1,
    LAG(people, 2) OVER(ORDER BY visit_date) AS PREV2,
    LEAD(people, 1) OVER(ORDER BY visit_date) AS NEXT1,
    LEAD(people, 2) OVER(ORDER BY visit_date) AS NEXT2
    FROM Stadium
)

SELECT id, visit_date, people
FROM CTE
WHERE (NEXT1 >= 100 AND NEXT2 >= 100 AND people >= 100)
OR (PREV1 >= 100 AND NEXT1 >= 100 AND people >= 100)
OR (PREV1 >= 100 AND PREV2 >= 100 AND people >= 100);