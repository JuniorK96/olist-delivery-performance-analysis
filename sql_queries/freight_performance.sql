-- Delivery performance by freight cost
-- Shows if higher shipping costs lead to better delivery outcomes
SELECT
    CASE
        WHEN freight_value < 15 THEN 'Under R$15'
        WHEN freight_value BETWEEN 15 AND 30 THEN 'R$15-30'
        WHEN freight_value BETWEEN 30 AND 50 THEN 'R$30-50'
        ELSE 'Over R$50'
    END AS freight_range,
    COUNT(*) AS total_orders,
    ROUND(AVG(is_late) * 100, 2) AS late_pct,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days,
    ROUND(AVG(actual_delivery_days), 2) AS avg_actual_days,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
GROUP BY freight_range
ORDER BY late_pct DESC