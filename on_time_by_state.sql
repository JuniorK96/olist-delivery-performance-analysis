-- On-time delivery rate by customer state
-- This tells us which states have the worst delivery experience from the customer perspective
SELECT 
    customer_state,
    COUNT(*) AS total_orders,
    SUM(is_late) AS late_orders,
    ROUND(AVG(is_late) * 100, 2) AS late_pct,
    ROUND((1 - AVG(is_late)) * 100, 2) AS on_time_pct
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
GROUP BY customer_state
ORDER BY late_pct DESC
