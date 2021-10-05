SELECT r_name, COUNT(o_orderstatus)
FROM region
INNER JOIN nation ON nation.n_regionkey = region.r_regionkey
INNER JOIN orders ON orders.o_custkey = customer.c_custkey
INNER JOIN customer ON customer.c_nationkey = nation.n_nationkey
WHERE orders.o_orderstatus = 'F'
GROUP BY r_name;
