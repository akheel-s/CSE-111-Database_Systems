SELECT COUNT(*)
FROM orders
INNER JOIN nation ON nation.n_nationkey = customer.c_nationkey
INNER JOIN customer ON customer.c_custkey = orders.o_custkey
WHERE n_name = 'BRAZIL' 
AND o_orderpriority = '1-URGENT' 
AND o_orderdate >= '1994-01-01' 
AND o_orderdate <= '1997-12-31';