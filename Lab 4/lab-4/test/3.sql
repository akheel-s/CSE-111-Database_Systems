SELECT nation.n_name, COUNT(orders.o_orderkey)
FROM orders
INNER JOIN nation ON nation.n_nationkey = customer.c_nationkey
INNER JOIN region ON region.r_regionkey = nation.n_regionkey
INNER JOIN customer ON customer.c_custkey = orders.o_custkey
WHERE region.r_name = 'AMERICA'
GROUP BY nation.n_nationkey;

-- Done with help of TA