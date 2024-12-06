SELECT project_id, 
ROUND(SUM(1.0*experience_years)/(1.0*COUNT(project_id)),2) AS average_years 
FROM Project P INNER JOIN Employee E
ON P.employee_id = E.employee_id
GROUP BY project_id;