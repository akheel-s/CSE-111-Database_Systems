SELECT n_name
FROM nation
INNER JOIN supplier on supplier.s_nationkey = nation.n_nationkey
INNER JOIN lineitem on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey
WHERE substr(lineitem.l_shipdate, 1, 4) = '1994'  
GROUP BY nation.n_name
HAVING SUM(l_extendedprice) = (
SELECT MAX(results.sums)
FROM (SELECT SUM(l_extendedprice) AS sums
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
WHERE substr(lineitem.l_shipdate, 1, 4) = '1994'
GROUP BY nation.n_name)
AS results); 