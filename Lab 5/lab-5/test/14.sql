SELECT suppregion.r_name, custregion.r_name, SUBSTR(l_shipdate,1,4), SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey
INNER JOIN customer on customer.c_custkey = orders.o_custkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation custnation on custnation.n_nationkey = customer.c_nationkey
INNER JOIN nation suppnation on suppnation.n_nationkey = supplier.s_nationkey
INNER JOIN region custregion on custregion.r_regionkey = custnation.n_regionkey
INNER JOIN region suppregion on suppregion.r_regionkey = suppnation.n_regionkey
WHERE substr(l_shipdate,1,4) IN ('1996','1997') 
GROUP BY suppregion.r_name, custregion.r_name, substr(l_shipdate,1,4) 