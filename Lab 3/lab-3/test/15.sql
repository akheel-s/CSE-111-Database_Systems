SELECT substr(o_orderdate, 1,4) AS year, COUNT(o_orderpriority)
FROM orders
INNER JOIN nation ON nation.n_nationkey = supplier.s_nationkey
INNER JOIN supplier ON supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN lineitem ON lineitem.l_orderkey = orders.o_orderkey 
WHERE o_orderpriority = '3-MEDIUM' 
AND n_name = 'CANADA'
GROUP BY year;