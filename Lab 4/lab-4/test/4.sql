SELECT supplier.s_name, COUNT(part.p_partkey)
FROM part
INNER JOIN partsupp on partsupp.ps_partkey = part.p_partkey
INNER JOIN supplier on supplier.s_suppkey = partsupp.ps_suppkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
WHERE part.p_size < 20
AND nation.n_name = "CANADA"
GROUP BY supplier.s_suppkey;

-- Done with help of TA