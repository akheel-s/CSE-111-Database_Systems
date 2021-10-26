SELECT COUNT(DISTINCT results.l_suppkey)
FROM (SELECT lineitem.l_suppkey, COUNT(DISTINCT orders.o_orderkey) AS ordernum
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN nation on nation.n_nationkey = customer.c_nationkey
WHERE(n_name = 'GERMANY' 
OR n_name = 'FRANCE')
GROUP BY l_suppkey)
AS results
WHERE results.ordernum < 50;
