WITH SENDD AS 
(
    SELECT DISTINCT requester_id, accepter_id 
    FROM RequestAccepted
),
ACC AS 
(
    SELECT DISTINCT accepter_id, requester_id 
    FROM RequestAccepted
),
UNIONED AS 
(
    SELECT * FROM SENDD UNION ALL SELECT * FROM ACC
)

SELECT TOP 1 requester_id AS id, COUNT(*) AS num FROM UNIONED
GROUP BY requester_id
ORDER BY num DESC;