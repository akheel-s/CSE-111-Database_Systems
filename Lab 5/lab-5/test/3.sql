SELECT min(lineitem.l_discount)
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey
WHERE ( substr(orders.o_orderdate, 1, 7) = '1996-10'
AND lineitem.l_discount >
(SELECT avg(lineitem.l_discount)
FROM lineitem
INNER JOIN orders on orders.o_orderkey = lineitem.l_orderkey));

-- Done with the help of TA