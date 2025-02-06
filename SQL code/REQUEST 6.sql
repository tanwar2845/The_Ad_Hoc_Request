WITH 
table1 AS
	(SELECT 
		customer_code, 
		AVG(pre_invoice_discount_pct) AS avg_PIDP 
	FROM fact_pre_invoice_deductions
	WHERE fiscal_year = '2021'
	GROUP BY customer_code),
table2 AS
	(SELECT 
		customer_code,
		customer 
	FROM dim_customer
	WHERE market = 'India')
SELECT table2.customer_code,customer,ROUND (table1.avg_PIDP, 4) AS avg_discount_percnt
FROM table1 JOIN table2
ON table1.customer_code = table2.customer_code
ORDER BY avg_discount_percnt DESC
LIMIT 5






