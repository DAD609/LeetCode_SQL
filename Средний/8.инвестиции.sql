select round(sum(tiv_2016)::numeric,2) AS tiv_2016 FROM insurance WHERE tiv_2015 IN 
(SELECT tiv_2015 FROM insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1) AND 
(lat, lon) NOT IN 
(SELECT lat, lon FROM insurance GROUP BY lat, lon HAVING COUNT(*) > 1)
