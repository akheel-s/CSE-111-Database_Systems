SELECT supplier.s_name, customer.c_name, MIN(orders.o_totalprice)
FROM orders
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN lineitem on lineitem.l_orderkey = orders.o_orderkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey;
