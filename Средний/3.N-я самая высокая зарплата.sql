CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    SELECT ranked_salaries.salary
    FROM (
        SELECT E.salary, DENSE_RANK() OVER (ORDER BY E.salary DESC) AS ranking
        FROM Employee E
    ) ranked_salaries
    WHERE ranked_salaries.ranking = N
    LIMIT 1
  );
END;
$$ LANGUAGE plpgsql;
