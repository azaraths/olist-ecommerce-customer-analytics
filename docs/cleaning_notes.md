# Data Cleaning Log

## Summary
My goal was to transform 9 raw Olist tables into an analysis-ready dataset. The final outputs
in the SQLite database are: `products_clean`, `orders_delivered`,
`orders_with_delivery`, `order_revenue`, `master_orders`, `customer_master`.

## Decisions made

### Portuguese category translations
I joined `category_translation` to `products`. Two categories (`pc_gamer`,
`portateis_cozinha_e_preparadores_de_alimentos`) had no English mapping so I had to
translate them manually. An additional 610 products had no source category
at all, so they were NULL. I retained them without imputation, since category
isn't central to the retention analysis.

### Order status filter
Filtered to `order_status = 'delivered'` AND non-null delivery dates.
I reduced order count from 99,441 to 96,470. Removed: cancelled, in-transit,
undelivered, or status-delivered-but-missing-date rows.

### Derived delivery metrics
Added three computed columns: `delivery_days` (purchase → customer),
`delay_vs_estimate_days` (actual vs promised), `was_late` (binary flag).

### Revenue definition
Used `SUM(price)` from `order_items` for revenue, excluding `freight_value`.
My reasoning: freight is pass-through cost, not Olist margin.

### Duplicate review handling
The initial join produced 10 duplicate orders due to 5 orders having multiple
review records. Investigated using a diagnostic CTE; fixed by selecting the
most recent review per order using `ROW_NUMBER() OVER (PARTITION BY order_id
ORDER BY review_creation_date DESC)`. Re-verified zero duplicates after the fix.

### Reference date for recency
Used the maximum `order_purchase_timestamp` in the dataset (2018-08-29) as
the reference "today" for recency calculations.

### Customer-level aggregation
One row per `customer_unique_id`. Includes RFM components, customer
lifespan, delivery history, average review, and a repeat-customer flag.

## Key numbers after cleaning
- Delivered orders: 96,470
- Unique customers: 93,388
- One-time buyers: 90,621 (97.04%)
- Repeat customers: 2,767 (2.96%)
- Late deliveries: 8.1% of delivered orders
- Average delivery time: 12.6 days
- Average customer lifetime value: 141.56 BRL
- Average review score: 4.15 / 5
- Date range: ~2016-09 to 2018-08

## What I did not do (and why)
- Did not impute missing review scores, but rather preserved as NULL so they're
  properly excluded in review-based analyses.
- Did not remove revenue outliers (top order: 13,440 BRL). I kept all
  customers; will flag outliers explicitly in RFM analysis if they distort.
- Did not bring in external population data for per-capita regional
  analysis, it's out of scope for this case study; revenue and repeat-rate
  by state is sufficient for the retention question.
