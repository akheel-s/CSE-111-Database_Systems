SELECT strftime("%m", lineitem.l_shipdate) AS month, SUM(lineitem.l_quantity)
FROM lineitem
WHERE strftime("%Y", lineitem.l_shipdate) = "1995"
GROUP BY month;

-- Done with help from TA