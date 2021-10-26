SELECT (SELECT SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey 
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation custnation on custnation.n_nationkey = customer.c_nationkey
INNER JOIN region custregion on custregion.r_regionkey = custnation.n_regionkey
INNER JOIN nation suppnation on suppnation.n_nationkey = supplier.s_nationkey
WHERE custregion.r_name = 'ASIA' 
AND suppnation.n_name = 'UNITED STATES' 
AND substr(l_shipdate,1,4) = '1997')/
(SELECT SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey 
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation custnation on custnation.n_nationkey = customer.c_nationkey
INNER JOIN region custregion on custregion.r_regionkey = custnation.n_regionkey
INNER JOIN nation suppnation on suppnation.n_nationkey = supplier.s_nationkey
WHERE custregion.r_name = 'ASIA' 
AND substr(l_shipdate,1,4) = '1997');