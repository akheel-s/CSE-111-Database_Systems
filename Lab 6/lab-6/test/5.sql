SELECT COUNT(DISTINCT supplier.s_suppkey)
FROM supplier
INNER JOIN partsupp on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN part on partsupp.ps_partkey = part.p_partkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
WHERE part.p_retailprice = (SELECT max(part.p_retailprice) FROM part)

-- Done with help from TA