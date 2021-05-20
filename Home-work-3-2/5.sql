	SELECT p.project_id, coast, avg_salary
	FROM projects p
	JOIN
	(
		SELECT p.project_id, AVG(salary) AS avg_salary
		FROM projects p
		INNER JOIN developers_on_projects AS dp ON p.project_id = dp.project_id
		INNER JOIN developers AS d ON d.developer_id = dp.developer_id
		GROUP BY p.project_id
	)as min_coast_table
	on min_coast_table.project_id = p.project_id
	WHERE coast = 
	(
		SELECT MIN(coast)
		FROM projects p
		INNER JOIN developers_on_projects AS dp ON p.project_id = dp.project_id
		INNER JOIN developers AS d ON d.developer_id = dp.developer_id
	);