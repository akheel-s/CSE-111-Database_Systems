SELECT s_name, s_acctbal
FROM supplier 
WHERE (s_nationkey = '1' 
OR s_nationkey = '2' 
OR s_nationkey = '3'
OR s_nationkey = '17'
OR s_nationkey = '24')
AND s_acctbal > 5000
GROUP BY s_name;