SELECT p.project_name, total_cost
FROM projects p
JOIN 
(	SELECT p.project_id, SUM (d.salary)  AS total_cost
	FROM projects p
	INNER JOIN developers_on_projects dp ON p.project_id = dp.project_id
	INNER JOIN developers d ON d.developer_id=dp.developer_id
	GROUP BY p.project_id
)	AS calculated_cost
ON calculated_cost.project_id=p.project_id
WHERE total_cost =
	(SELECT MAX(calculated_cost.total_cost)
	 AS max_cost
	FROM 
	(SELECT p.project_id, SUM (d.salary)  AS total_cost
	FROM projects p
	INNER JOIN developers_on_projects dp ON p.project_id = dp.project_id
	INNER JOIN developers d ON d.developer_id=dp.developer_id
	GROUP BY p.project_id
) AS calculated_cost);