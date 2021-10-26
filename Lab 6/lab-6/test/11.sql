SELECT n_name
FROM nation
INNER JOIN customer on customer.c_nationkey = nation.n_nationkey
GROUP BY n_name         
HAVING COUNT(c_custkey) = (
SELECT MIN(results.sums) 
FROM (SELECT COUNT(c_custkey) AS sums
FROM customer
INNER JOIN nation on nation.n_nationkey = customer.c_nationkey
GROUP BY n_name)
AS results);