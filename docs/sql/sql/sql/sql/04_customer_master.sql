-- 04_customer_master.sql
--
-- Aggregates the master order table to one row per unique customer.
-- Includes RFM components (Recency, Frequency, Monetary), customer
-- lifespan, delivery experience, average review, and a repeat-customer
-- flag. Foundation for the RFM segmentation in Stage 4.
--
-- Note: '2018-08-29 15:00:37' is the max order date in the dataset
-- and serves as the reference "today" for recency calculation.

CREATE TABLE customer_master AS
SELECT
    customer_unique_id,
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS avg_order_value,
    ROUND(julianday('2018-08-29 15:00:37') - julianday(MAX(order_purchase_timestamp)), 0) AS recency_days,
    MIN(order_purchase_timestamp) AS first_order_date,
    MAX(order_purchase_timestamp) AS last_order_date,
    ROUND(julianday(MAX(order_purchase_timestamp)) - julianday(MIN(order_purchase_timestamp)), 0) AS customer_lifespan_days,
    MAX(was_late) AS ever_had_late_delivery,
    SUM(was_late) AS num_late_deliveries,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    CASE WHEN COUNT(DISTINCT order_id) > 1 THEN 1 ELSE 0 END AS is_repeat_customer
FROM master_orders
WHERE customer_unique_id IS NOT NULL
GROUP BY customer_unique_id, customer_state;
