SELECT count(results.s_suppkey)
FROM (SELECT supplier.s_suppkey
FROM supplier
INNER JOIN partsupp on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN part on partsupp.ps_partkey = part.p_partkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
WHERE nation.n_name = "UNITED STATES"
GROUP BY supplier.s_suppkey
HAVING count(DISTINCT part.p_partkey) >= 40)
AS results;

-- Done with help from TA 