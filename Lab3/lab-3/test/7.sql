SELECT strftime('%Y-%m', l_receiptdate), count(lineitem.l_receiptdate)
FROM lineitem
INNER JOIN orders ON lineitem.l_orderkey = orders.o_orderkey
INNER JOIN customer ON customer.c_custkey = orders.o_orderkey
WHERE (
    strftime('%Y', lineitem.l_receiptdate) = "1993" AND customer.c_name = "Customer#000000010"
)
GROUP BY strftime('%m', l_receiptdate);