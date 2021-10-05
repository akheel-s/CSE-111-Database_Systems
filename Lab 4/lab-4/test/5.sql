SELECT customer.c_name, COUNT(orders.o_orderkey)
FROM orders
INNER JOIN nation on customer.c_nationkey = nation.n_nationkey
INNER JOIN customer on customer.c_custkey = orders.o_custkey 
WHERE nation.n_name = "GERMANY"
AND substr(orders.o_orderdate, 1, 4) = "1993"
GROUP BY customer.c_custkey;

-- Done with help of TA