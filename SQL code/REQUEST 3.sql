SELECT 
    COUNT(DISTINCT(product_code)) AS product_count, 
    segment
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC








