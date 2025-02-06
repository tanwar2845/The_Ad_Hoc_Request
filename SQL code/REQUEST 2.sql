SELECT 
	product_2021,
        product_2020,
        round(((product_2021 - product_2020)*100/product_2020),2) AS percnt_chng
FROM
(SELECT COUNT(DISTINCT(product_code)) AS product_2021
FROM fact_sales_monthly
WHERE fiscal_year = 2021) A1,
(SELECT COUNT(DISTINCT(product_code)) AS product_2020
FROM fact_sales_monthly
WHERE fiscal_year = 2020) A2
-- SECOND OPTION-- 
WITH
table1 AS
(SELECT COUNT(DISTINCT(product_code)) AS product_2020
FROM fact_sales_monthly
WHERE fiscal_year = 2020),
table2 AS
(SELECT COUNT(DISTINCT(product_code)) AS product_2021
FROM (fact_sales_monthly,table1)
WHERE fiscal_year = 2021)
SELECT 
	product_2020,
        product_2021,
        ROUND(((product_2021-product_2020)*100/product_2020),2) AS percnt_chng
FROM table1,table2
-- THIRD OPRION-- 
SELECT
get_product_count(2020) AS product_2020,
get_product_count(2021) AS product_2021,
round(((get_product_count(2021)-get_product_count(2020))*100/get_product_count(2020)),2) AS percnt_chng



