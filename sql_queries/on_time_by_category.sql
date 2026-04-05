-- On-time delivery rate by product category
-- This tells us which product types are hardest to deliver on time
SELECT 
    product_category_name_english,
    COUNT(*) AS total_orders,
    SUM(is_late) AS late_orders,
    ROUND(AVG(is_late) * 100, 2) AS late_pct,
    ROUND((1 - AVG(is_late)) * 100, 2) AS on_time_pct
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
WHERE product_category_name_english != 'unknown'
GROUP BY product_category_name_english
HAVING COUNT(*) > 100
ORDER BY late_pct DESC
LIMIT 20