SELECT emp_id ,event_day AS day,  SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY event_day ,emp_id
