-- 02_order_revenue.sql
--
-- Aggregates order_items into one row per order with total revenue,
-- items count, and freight breakdown. Excludes freight from revenue
-- since freight is pass-through cost, not Olist margin.

CREATE TABLE order_revenue AS
SELECT
    order_id,
    COUNT(*) AS items_count,
    ROUND(SUM(price), 2) AS revenue,
    ROUND(SUM(freight_value), 2) AS freight,
    ROUND(SUM(price + freight_value), 2) AS total_value
FROM order_items
GROUP BY order_id;
