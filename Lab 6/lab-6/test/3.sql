SELECT count(results.p_partkey)
FROM (SELECT part.p_partkey
FROM supplier
INNER JOIN partsupp on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN part on partsupp.ps_partkey = part.p_partkey
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
WHERE nation.n_name = "UNITED STATES"
GROUP BY part.p_partkey
HAVING count(DISTINCT supplier.s_suppkey) = 2)
AS results;

-- Done with help from TA