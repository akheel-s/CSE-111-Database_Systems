SELECT SUM(o_totalprice)
FROM orders
INNER JOIN customer ON customer.c_custkey = orders.o_custkey
INNER JOIN nation ON nation.n_nationkey = customer.c_nationkey
INNER JOIN region ON region.r_regionkey = nation.n_regionkey
WHERE r_name = 'AMERICA' 
AND o_orderdate >= '1996-01-01' 
AND o_orderdate <= '1996-12-31';