SELECT o_orderpriority, COUNT(*) 
FROM orders 
WHERE (substr(orders.o_orderdate, 1, 7) = '1997-10' 
OR substr(orders.o_orderdate, 1, 7) = '1997-11'
OR substr(orders.o_orderdate, 1, 7) = '1997-12') 
AND EXISTS (SELECT * 
FROM lineitem 
WHERE l_orderkey = o_orderkey 
AND l_receiptdate < l_commitdate)
GROUP BY o_orderpriority