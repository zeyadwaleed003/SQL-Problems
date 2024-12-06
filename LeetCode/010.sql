SELECT R.contest_id, ROUND((COUNT(R.user_id) * 1.0 / (SELECT COUNT(*) FROM Users) * 1.0) * 100.0, 2) AS percentage
FROM Users U INNER JOIN Register R
ON U.user_id = R.user_id
GROUP BY R.contest_id
ORDER BY percentage DESC, R.contest_id ASC;