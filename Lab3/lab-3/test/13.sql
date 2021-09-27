SELECT SUM(c_acctbal)
FROM customer 
INNER JOIN nation ON customer.c_nationkey = nation.n_nationkey
WHERE (c_nationkey = '6'
OR c_nationkey = '7'
OR c_nationkey = '19'
OR c_nationkey = '22'
OR c_nationkey = '23')
AND c_mktsegment = 'MACHINERY'