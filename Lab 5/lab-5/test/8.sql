SELECT COUNT(DISTINCT s_name)
FROM supplier
INNER JOIN partsupp on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN part on part.p_partkey = partsupp.ps_partkey
WHERE p_type LIKE '%POLISHED%' 
AND p_size IN (3, 23, 36, 49)