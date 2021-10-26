SELECT p_mfgr
FROM (SELECT p_mfgr, MIN(ps_availqty)
FROM part
INNER JOIN supplier on partsupp.ps_suppkey = supplier.s_suppkey
INNER JOIN partsupp on partsupp.ps_partkey = part.p_partkey
where s_name = 'Supplier#000000010')