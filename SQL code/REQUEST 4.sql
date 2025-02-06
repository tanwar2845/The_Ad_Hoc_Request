WITH 
table1 AS
    (SELECT 
    COUNT(DISTINCT(dp.product_code)) AS product_2020,segment
    FROM fact_sales_monthly fs
    JOIN dim_product dp
    ON dp.product_code = fs.product_code
    WHERE fiscal_year = 2020
    GROUP BY segment),
table2 AS
    (SELECT 
    COUNT(DISTINCT(dp.product_code)) AS product_2021,segment
    FROM fact_sales_monthly fs
    JOIN dim_product dp
    ON dp.product_code = fs.product_code
    WHERE fiscal_year = 2021
    GROUP BY segment)
SELECT 
    table1.segment,product_2020,
    product_2021,
    product_2021-product_2020 as difference
FROM table1
JOIN table2
ON table1.segment = table2.segment



