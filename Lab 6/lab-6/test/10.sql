SELECT r_name
FROM (SELECT r_name, MIN(results.sums)
FROM (SELECT r_name, SUM(l_extendedprice) AS sums
FROM region
INNER JOIN nation on nation.n_regionkey = region.r_regionkey
INNER JOIN supplier on supplier.s_nationkey = nation.n_nationkey
INNER JOIN lineitem on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN customer on customer.c_nationkey = nation.n_nationkey
GROUP BY r_name)
AS results);