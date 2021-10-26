SELECT r_name, COUNT(DISTINCT c_name)
FROM customer
INNER JOIN nation on nation.n_nationkey = customer.c_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
WHERE c_acctbal < (
SELECT AVG(c_acctbal) 
FROM customer) 
AND NOT c_custkey 
IN (SELECT o_custkey 
FROM orders) 
GROUP BY r_name;