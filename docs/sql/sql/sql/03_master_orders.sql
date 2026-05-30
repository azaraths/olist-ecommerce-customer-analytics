-- 03_master_orders.sql
--
-- Builds the master order-level table by joining orders, customers,
-- revenue, and reviews. Handles a data-quality issue: some orders have
-- multiple review records. A CTE picks the most recent review per
-- order using ROW_NUMBER() to prevent duplication.

CREATE TABLE master_orders AS
WITH latest_reviews AS (
    SELECT
        order_id,
        review_score,
        review_creation_date,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY review_creation_date DESC
        ) AS rn
    FROM order_reviews
)
SELECT
    o.order_id,
    c.customer_unique_id,
    c.customer_state,
    c.customer_city,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.delivery_days,
    o.delay_vs_estimate_days,
    o.was_late,
    r.revenue,
    r.items_count,
    r.total_value,
    rv.review_score
FROM orders_with_delivery o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_revenue r ON o.order_id = r.order_id
LEFT JOIN latest_reviews rv ON o.order_id = rv.order_id AND rv.rn = 1;
