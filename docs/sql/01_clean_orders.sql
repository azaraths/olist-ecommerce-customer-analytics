-- 01_clean_orders.sql
--
-- Filters the raw orders table to delivered orders only and adds
-- derived delivery metrics: total delivery time, delay vs estimate,
-- and a was_late binary flag.

-- Step 1: filter to delivered orders with non-null dates
CREATE TABLE orders_delivered AS
SELECT *
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;

-- Step 2: add derived delivery columns
CREATE TABLE orders_with_delivery AS
SELECT
    *,
    ROUND(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp), 1) AS delivery_days,
    ROUND(julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date), 1) AS delay_vs_estimate_days,
    CASE
        WHEN julianday(order_delivered_customer_date) > julianday(order_estimated_delivery_date) THEN 1
        ELSE 0
    END AS was_late
FROM orders_delivered;
