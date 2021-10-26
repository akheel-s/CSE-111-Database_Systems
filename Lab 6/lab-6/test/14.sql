SELECT countries, (numitems2 - numitems)
FROM (SELECT nations.n_name as countries, nations2.n_name, COUNT(o_orderkey) AS numitems
FROM nation nations
INNER JOIN customer ON customer.c_nationkey = nations.n_nationkey
INNER JOIN orders ON orders.o_custkey = customer.c_custkey
INNER JOIN lineitem ON lineitem.l_orderkey = orders.o_orderkey
INNER JOIN supplier ON supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation nations2 ON nations2.n_nationkey = supplier.s_nationkey
WHERE nations.n_name != nations2.n_name
AND substr(lineitem.l_shipdate, 1, 4) = '1994' 
GROUP BY nations.n_name), 

(SELECT nations.n_name, nations2.n_name as countries2, COUNT(o_orderkey) as numitems2
FROM nation nations
INNER JOIN customer on customer.c_nationkey = nations.n_nationkey
INNER JOIN orders on orders.o_custkey = customer.c_custkey
INNER JOIN lineitem on lineitem.l_orderkey = orders.o_orderkey
INNER JOIN supplier on supplier.s_suppkey = lineitem.l_suppkey
INNER JOIN nation nations2 on nations2.n_nationkey = supplier.s_nationkey
WHERE nations.n_name != nations2.n_name
AND substr(lineitem.l_shipdate, 1, 4) = '1994' 
GROUP BY nations2.n_name)
WHERE countries = countries2;
