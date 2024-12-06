SELECT firstName, lastName, city, state
FROM Person P LEFT OUTER JOIN Address A
ON P.personId = A.personId;