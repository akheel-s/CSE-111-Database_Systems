SELECT n_name, COUNT(DISTINCT l_orderkey) 
FROM orders
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey 
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN  supplier on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN lineitem on orders.o_orderkey = lineitem.l_orderkey 
WHERE orders.o_orderstatus = 'F' 
AND orders.o_orderdate >= '1995-01-01' 
AND orders.o_orderdate <= '1995-12-31'
GROUP BY  nation.n_name 
HAVING COUNT(DISTINCT l_orderkey) > 50;