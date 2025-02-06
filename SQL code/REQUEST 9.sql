WITH 
table1 AS
	(SELECT 
			sum(gross_price*sold_quantity) AS gross_sales,
			channel
	FROM fact_gross_price fg
	JOIN fact_sales_monthly fs
	ON fg.product_code = fs.product_code
	JOIN dim_customer dc
	ON fs.customer_code = dc.customer_code
	WHERE fs.fiscal_year = 2021
    GROUP BY channel),
table2 AS
    (SELECT 
        gross_sales/sum(gross_sales) OVER() AS total,
        channel
    FROM table1)
SELECT 
	CONCAT(ROUND((gross_sales/1000000),2),' M') AS total_gross_sales,
    CONCAT(ROUND((total*100),2),' %') AS contribution,
    table1.channel
FROM table2
JOIN table1
ON table2.channel = table1.channel


