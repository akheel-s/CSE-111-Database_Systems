SELECT r_name, s_name, s_acctbal
FROM region
INNER JOIN nation on region.r_regionkey = nation.n_regionkey
INNER JOIN supplier on nation.n_nationkey = supplier.s_nationkey
GROUP BY r_name
HAVING max(s_acctbal)