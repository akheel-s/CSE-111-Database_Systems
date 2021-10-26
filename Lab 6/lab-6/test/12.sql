SELECT n_name
FROM (SELECT n_name, MIN(results.sums)
FROM (SELECT n_name, SUM(o_totalprice) AS sums
FROM nation
INNER JOIN customer on customer.c_nationkey = nation.n_nationkey
INNER JOIN orders on orders.o_custkey = customer.c_custkey
GROUP BY n_name)
AS results);