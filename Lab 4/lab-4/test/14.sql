SELECT supplier_region, customer_region, MAX(o_totalprice) 
FROM (SELECT *, r_name AS supplier_region 
FROM supplier
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN lineitem on lineitem.l_suppkey = supplier.s_suppkey),
(SELECT *, r_name AS customer_region 
FROM customer
INNER JOIN nation on customer.c_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN orders on customer.c_custkey = orders.o_custkey)
WHERE o_orderkey = l_orderkey
GROUP BY supplier_region, customer_region;