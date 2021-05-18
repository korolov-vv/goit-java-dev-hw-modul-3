SELECT SUM(salary)
FROM developers AS d
RIGHT JOIN skills AS s
ON d.developer_id = s.developer_id
WHERE stack = 'Java';