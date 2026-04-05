-- Impact of delivery delay on customer review scores
-- This tells us how late deliveries affect customer satisfaction
SELECT
    is_late,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
GROUP BY is_late
ORDER BY is_late ASC
