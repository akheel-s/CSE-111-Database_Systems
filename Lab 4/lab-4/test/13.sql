SELECT COUNT(*)
FROM(SELECT* FROM lineitem
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN supplier on lineitem.l_suppkey = supplier.s_suppkey
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
WHERE region.r_name = 'AFRICA'),
(SELECT* FROM orders
INNER JOIN customer on orders.o_custkey = customer.c_custkey
INNER JOIN nation on customer.c_nationkey = nation.n_nationkey
WHERE nation.n_name = 'UNITED STATES')
WHERE l_orderkey = o_orderkey;