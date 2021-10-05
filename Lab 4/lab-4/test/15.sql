SELECT COUNT(*) 
FROM (SELECT DISTINCT o_orderkey
FROM customer
INNER JOIN orders on customer.c_custkey = orders.o_custkey
INNER JOIN supplier on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN lineitem on orders.o_orderkey = lineitem.l_orderkey
WHERE c_acctbal > 0
AND s_acctbal < 0);