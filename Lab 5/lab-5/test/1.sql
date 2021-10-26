SELECT COUNT(customer.c_custkey)
FROM customer 
INNER JOIN nation on nation.n_nationkey = customer.c_nationkey
INNER JOIN region on region.r_regionkey = nation.n_regionkey
WHERE (region.r_name != "EUROPE" 
AND region.r_name != "AFRICA"
AND region.r_name != "ASIA");

-- Done with the help of TA