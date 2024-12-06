(
    SELECT T1.name AS results
    FROM
    (
        SELECT TOP 1 name, COUNT(name) AS Number_of_movies
        FROM MovieRating M INNER JOIN Users U
        ON M.user_id = U.user_id
        GROUP BY name
        ORDER BY Number_of_movies DESC, name
    ) AS T1
)
UNION ALL
(
    SELECT T2.title FROM
    (
        SELECT TOP 1 title, AVG(1.0 * rating) AS average_rating
        FROM MovieRating M INNER JOIN Movies MV
        ON M.movie_id = MV.movie_id
        WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
        GROUP BY title
        ORDER BY average_rating DESC, title
    ) AS T2
)
      