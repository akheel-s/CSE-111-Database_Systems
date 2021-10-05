SELECT p_type, min(l_discount), max(l_discount)
FROM lineitem
INNER JOIN part on lineitem.l_partkey = part.p_partkey
WHERE p_type LIKE '%ECONOMY%'
AND p_type LIKE '%COPPER%'
GROUP BY p_type