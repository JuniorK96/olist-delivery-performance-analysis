-- Monthly average delivery delay over time
-- This tells us if delivery performance improved or worsened over the years
SELECT
    order_year_month,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days,
    ROUND(AVG(is_late) * 100, 2) AS late_pct
FROM `olist-delivery-analysis.olist_raw.orders_cleaned`
GROUP BY order_year_month
ORDER BY order_year_month ASC