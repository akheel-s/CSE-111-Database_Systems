SELECT n_name, o_orderstatus, count(o_orderkey)
FROM nation
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN customer on customer.c_nationkey = nation.n_nationkey
INNER JOIN orders on orders.o_custkey = customer.c_custkey
WHERE r_name = 'AMERICA'
GROUP BY n_name, o_orderstatus