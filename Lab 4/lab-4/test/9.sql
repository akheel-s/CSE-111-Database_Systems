SELECT COUNT(*)
FROM (SELECT DISTINCT o_clerk
FROM orders
INNER JOIN lineitem on orders.o_orderkey = lineitem.l_orderkey 
INNER JOIN supplier on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey 
WHERE n_name = 'UNITED STATES');