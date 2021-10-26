SELECT p_name
FROM part
INNER JOIN partsupp on partsupp.ps_partkey = part.p_partkey
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN supplier on partsupp.ps_suppkey = supplier.s_suppkey
WHERE n_name = 'UNITED STATES'
AND ps_supplycost * ps_availqty 
IN (SELECT ps_supplycost * ps_availqty 
FROM partsupp
ORDER BY ps_supplycost * ps_availqty 
DESC LIMIT 
(SELECT COUNT(*) * 0.01
FROM partsupp));