SELECT n_name, COUNT(*) AS suppliers, MAX(s_acctbal)
FROM nation
INNER JOIN supplier ON supplier.s_nationkey = nation.n_nationkey
GROUP BY supplier.s_nationkey
HAVING suppliers > 5