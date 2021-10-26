SELECT COUNT(DISTINCT c_custkey)
FROM customer
INNER JOIN orders on orders.o_custkey = customer.c_custkey
AND o_orderkey NOT IN (
SELECT DISTINCT(o_orderkey)
FROM orders
INNER JOIN lineitem on lineitem.l_orderkey = orders.o_orderkey 
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey 
INNER JOIN region on region.r_regionkey = nation.n_regionkey
WHERE r_name NOT IN ('AMERICA'));