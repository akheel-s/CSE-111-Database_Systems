SELECT DISTINCT p_name
FROM part
INNER JOIN lineitem on lineitem.l_partkey = part.p_partkey
WHERE l_orderkey 
IN (SELECT o_orderkey
FROM orders    
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN nation on nation.n_nationkey = customer.c_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
WHERE r_name = 'AMERICA')
AND p_partkey 
IN (SELECT l_partkey
FROM lineitem  
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
WHERE r_name = 'ASIA' 
GROUP BY l_partkey
HAVING COUNT(l_suppkey) = 3);