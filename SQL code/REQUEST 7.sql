SELECT 
		DATE_FORMAT(date,'%M-%Y') as MONTH_YEAR,
        fs.fiscal_year,
        CONCAT(ROUND(sum(gross_price*sold_quantity)/1000000,2),' M') as Gross_Sales
FROM fact_gross_price fg
JOIN fact_sales_monthly fs
ON fg.product_code = fs.product_code
JOIN dim_customer dc
ON fs.customer_code = dc.customer_code
WHERE customer = 'Atliq Exclusive'
GROUP BY MONTH_YEAR,fiscal_year
ORDER BY fiscal_year






