SELECT t_cust_counts.cust_n_name, t_cust_counts.cust_counts, t_supp_counts.supp_counts
FROM (SELECT nation.n_name as cust_n_name,
COUNT(customer.c_custkey) as cust_counts
FROM customer 
INNER JOIN nation on customer.c_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
WHERE region.r_name = "AFRICA"
GROUP BY nation.n_name)
as t_cust_counts
INNER JOIN (SELECT nation.n_name as supp_n_name,
COUNT(supplier.s_suppkey) as supp_counts
FROM supplier 
INNER JOIN nation on supplier.s_nationkey = nation.n_nationkey
INNER JOIN region on nation.n_regionkey = region.r_regionkey
WHERE region.r_name = "AFRICA"
GROUP BY nation.n_name)
as t_supp_counts on t_cust_counts.cust_n_name = t_supp_counts.supp_n_name;

-- Done with the help of TA