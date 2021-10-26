SELECT supplier.s_name, part.p_size, MIN(partsupp.ps_supplycost)
FROM supplier 
INNER JOIN partsupp on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
INNER JOIN part on part.p_partkey = partsupp.ps_partkey
WHERE (region.r_name = 'ASIA'
AND part.p_type LIKE '%STEEL%')
GROUP BY part.p_size
ORDER BY supplier.s_name, part.p_size;

-- Done with the help of TA