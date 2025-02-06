SELECT 
    concat(round((sum(sold_quantity)/1000000),2),' M') AS total_sold_quantity,
    CASE 
        WHEN MONTH(date_add(date,interval 4 month)) in (1,2,3) THEN 'Q1'
        WHEN MONTH(date_add(date,interval 4 month)) in (4,5,6) THEN 'Q2'
        WHEN MONTH(date_add(date,interval 4 month)) in (7,8,9) THEN 'Q3'
        ELSE 'Q4'
    END AS quater
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quater





