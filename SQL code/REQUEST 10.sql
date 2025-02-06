SELECT 
    product_code,
    product,
    total_sold_quantity,
    division,
    rnk
FROM
    (SELECT 
        dp.product_code,product,SUM(sold_quantity) AS total_sold_quantity,division,
        DENSE_RANK () OVER(PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS rnk
    FROM fact_sales_monthly fs
    JOIN dim_product dp
    ON fs.product_code = dp.product_code
    GROUP BY 1,2,division) table1
WHERE rnk <= 3









