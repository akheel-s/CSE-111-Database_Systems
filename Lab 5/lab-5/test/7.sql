SELECT o_orderpriority, COUNT(*) 
FROM orders
INNER JOIN lineitem on lineitem.l_orderkey = orders.o_orderkey
WHERE l_receiptdate > l_commitdate
AND substr(o_orderdate,1,4) IN ('1997') 
GROUP BY o_orderpriority;