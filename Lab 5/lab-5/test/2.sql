SELECT region.r_name, COUNT(supplier.s_suppkey)
FROM supplier 
INNER JOIN nation on nation.n_nationkey = supplier.s_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
INNER JOIN (SELECT region.r_name as inner_r_name,
avg(supplier.s_acctbal) as r_avg_acctbal
FROM supplier
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
GROUP BY region.r_name)
as avg_table on avg_table.inner_r_name = region.r_name
WHERE supplier.s_acctbal < avg_table.r_avg_acctbal
GROUP BY region.r_name;

-- Done with the help of TA