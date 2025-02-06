SELECT DISTINCT(market) AS market
FROM dim_customer
WHERE region = 'APAC'
AND customer = 'Atliq Exclusive'
ORDER BY market