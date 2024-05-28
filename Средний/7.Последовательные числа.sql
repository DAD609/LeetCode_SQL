SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num, 
        LEAD(num, 1) OVER (ORDER BY id) AS prev_num,
        LEAD(num, 2) OVER (ORDER BY id) AS prev_prev_num
    FROM Logs
) 
WHERE num = prev_num AND num = prev_prev_num
