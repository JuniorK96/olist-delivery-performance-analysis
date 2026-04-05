-- Delivery performance by customer location
-- Shows which customer states receive the worst service
SELECT
    customer_state,
    COUNT(*) AS total_orders,
    SUM(is_late) AS late_orders,
    ROUND(AVG(is_late) * 100, 2) AS late_pct,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days,
    ROUND(AVG(actual_delivery_days), 2) AS avg_actual_days,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
GROUP BY customer_state
ORDER BY late_pct DESC