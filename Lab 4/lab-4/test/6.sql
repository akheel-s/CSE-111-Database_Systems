SELECT s_name, o_orderpriority, COUNT(DISTINCT p_partkey)
FROM supplier
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN orders on lineitem.l_orderkey = orders.o_orderkey
INNER JOIN lineitem on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN part on lineitem.l_partkey = part.p_partkey
WHERE n_name = 'CANADA'
GROUP BY s_name, o_orderpriority;