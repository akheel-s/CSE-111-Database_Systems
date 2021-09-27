SELECT strftime('%Y-%m', l_receiptdate), COUNT(lineitem.l_receiptdate)
FROM lineitem
INNER JOIN orders ON lineitem.l_orderkey = orders.o_orderkey
INNER JOIN customer ON customer.c_custkey = orders.o_custkey
WHERE strftime('%Y', lineitem.l_receiptdate) = '1993' 
AND customer.c_name = 'Customer#000000010'
GROUP BY strftime('%Y-%m', l_receiptdate);

-- Completed with the help of TA