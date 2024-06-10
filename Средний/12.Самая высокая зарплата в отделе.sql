SELECT d.name AS Department , e.name   AS Employee , e.Salary as Salary
FROM Employee AS e LEFT JOIN  Department AS d ON e.DepartmentId  = d.id 
WHERE (d.Id, e.Salary) in (SELECT DepartmentId, max(Salary) FROM Employee GROUP BY DepartmentId)
