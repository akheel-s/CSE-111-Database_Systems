SELECT COUNT(DISTINCT o_custkey)
FROM orders
INNER JOIN lineitem ON orders.o_orderkey = lineitem.l_orderkey
WHERE l_discount >= 0.1