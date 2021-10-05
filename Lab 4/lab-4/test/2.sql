SELECT region.r_name, COUNT(supplier.s_suppkey)
FROM supplier 
INNER JOIN nation ON nation.n_nationkey = supplier.s_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
GROUP BY region.r_regionkey;

-- Done with help of TA