# Olist Dataset — Data Dictionary

## Source
Kaggle: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## Time period
2016-09-04 21:15:19;  2018-10-17 17:30:18

# Description
Olist is a Brazilian e-commerce platform that connects small sellers to large
marketplaces. This dataset covers ~100K orders made from 2016 to 2018,
including customer information, order items, payments, reviews, delivery
performance, and seller and product details. The data is anonymized and
spread across 9 relational tables.

## Tables

### `customers`
- **Purpose:** The table showcases the number of customers and their location

- **Row count:** ~99,441

- **Grain:** One row per customer record per order

- **Key columns:**

| Column | Description |
|---|---|
| `customer_id` | Unique identifier for customers created per-order
| `customer_unique_id` | Unique identifier for distinct customers.
| `customer_zip_code_prefix` | First 5 digits of the Brazilian postcode
| `customer_city` | The city the customers are from
| `customer_state` | All customers are based in the same state, Brazil

**Notes:**
- This table has two separate identifiers per customer record. `customer_id` is **per-order**; `customer_unique_id` is the **actual person** and remains stable across orders.
- The zip code prefix is the first 5 digits of a Brazilian CEP postcode, thus multiple customers will share it
- All customers are based in Brazil;  `customer_state` uses the standard two-letter Brazilian state codes

### `orders`
**Purpose:** The central transactional table: one record for every order placed on the Olist marketplace, including its lifecycle status and key timestamps from purchase through delivery.

**Grain:** One row per order.

**Row count:** ~99,441

**Key columns:**

| Column | Description |
|---|---|
| `order_id` | Unique identifier for the order. Primary key for this table; foreign key in `order_items`, `order_payments`, `order_reviews`.
| `customer_id` | Links to the `customers` table. Order-specific, but NOT person-specific
| `order_status` | Lifecycle state of the order: `delivered`, `shipped`, `canceled`, `unavailable`, `invoiced`, `processing`, `created`, `approved`.
| `order_purchase_timestamp` | When the customer placed the order
| `order_approved_at` | When the payment was approved
| `order_delivered_carrier_date` | When the seller handed the package to the shipping carrier.
| `order_delivered_customer_date` | When the package actually arrived at the customer`s address.
| `order_estimated_delivery_date` | The delivery date promised to the customer at checkout.

**Useful derived metrics:**
- **Total delivery time** = `order_delivered_customer_date` − `order_purchase_timestamp`
- **Processing time** = `order_delivered_carrier_date` − `order_purchase_timestamp`
- **Delivery delay** = `order_delivered_customer_date` − `order_estimated_delivery_date` (positive = late, negative = early)
- **Was the order late?** = `order_delivered_customer_date` > `order_estimated_delivery_date`

**Notes:**
- The four delivery-related date columns are **NULL for orders that didn not complete the full journey** (cancelled, in transit, undelivered). For any delivery-performance analysis, filter to `order_status = 'delivered'` first.
- `customer_id` here is **order-specific**, not a stable identifier for the same person across orders. To analyze repeat customers, join to `customers` and use `customer_unique_id`.
- ~97% of orders are in the `delivered` status; the rest are spread across the other statuses.
- The date columns are stored as text in SQLite, so you would want to cast or parse them when computing time differences.


### `order_items`

**Purpose:** The column showcases which items were included in an order

**Grain:** One row per item within an order. An order containing 3 different products will have 3 rows in this table

**Row count:** ~112,650

**Key columns:**

| Column | Description |
|---|---|
| `order_id` | Unique order identifier
| `order_item_id` | Unique sequence within an order showcasing the number of items
| `product_id` | Unique product identifier
| `seller_id` | Unique seller identifier
| `shipping_limit_date` | The deadline the seller has to hand the item to the carrier
| `price` | The price value of an item
| `freight_value` | The total amount of money the carrier charged for transportation

**Useful derived metrics:**
- **Order revenue (items only)** = `SUM(price)` grouped by `order_id`
- **Total order value (with shipping)** = `SUM(price + freight_value)` grouped by `order_id`
- **Items per order** = `COUNT(*)` grouped by `order_id`

**Notes:**
- This table has *more rows than `orders`* because **one order can contain multiple items**, each on its own row. An order with 3 items has 3 rows here.
- When joining to `orders` for order-level analysis (like revenue per order), **aggregate first** otherwise the order level row count multiplies and metrics get distorted.

###  `order_payments`

**Purpose:** The table describes the method of payment customers used

**Grain:** One row per payment record. Most orders have one payment record; orders paid with split methods (partly credit card, partly voucher) have multiple rows.

**Row count:** ~103,886

**Key columns:**
| Column | Description |
|---|---|
| `order_id` | Unique order identifier
| `payment_sequential` | For orders where the payment was split, shows the sequence number of this payment installment
| `payment_type` | Values like `credit_card`, `boleto`, `voucher`, `debit_card`
| `payment_installments` | Number of installments the customer chose to pay in
| `payment_value` | The monetary value of the payment

**Useful derived metrics:**
- **Total amount paid per order** = `SUM(payment_value)` grouped by `order_id`

**Notes**
- About 4,000 orders have **multiple payment records** because the customer split the payment across methods. That's why this table has more rows than `orders`
- Same row-multiplication rule applies as `order_items`: aggregate by `order_id` before joining if you want one row per order.
- `payment_installments` only applies to credit card payments, for other payment types it's typically 1.
- The `boleto` payment type is uniquely Brazilian. Worth surfacing in any payment-related analysis.

### `order_reviews`

**Purpose:** Storring the reviews of orders for future analysis

**Grain:** A review per order most of the time

**Row count:** ~99,224

**Key columns:**

| Column | Description |
|---|---|
| `review_id` | Unique review identifier
| `order_id` | Foreign key, unique order identifier
| `review_score` | An integer value from 1 to 5
| `review_comment_title` | Usually empty or short
| `review_comment_message` | Usually empty or short, in Portuguese
| `review_creation_date` | The date the review was created
| `review_answer_timestamp` | When the review was submitted via the form

**Notes:**
- Not every order has a review, around 217 orders have no record in this table. When joining to orders, use a LEFT JOIN if you want to keep all orders.
- The `review_comment_title` and `review_comment_message` columns are **sparse** (mostly empty) and **in Portuguese**. They could support sentiment or text analysis but are not central to our retention angle.
- `review_score` (1–5) is the most useful column for analytical work. Lower scores correlate strongly with late deliveries
- Each review is tied to a specific `order_id`, reviews are about the order experience, not standalone product ratings.

### `products`

**Purpose:** A description of the products

**Grain:** One row per unique product

**Row count:** ~32,951

**Key columns:**

| Column | Description |
|---|---|
| `product_id` | Unique product identifier
| `product_category_name` | The category in which each product belongs to
| `product_name_length` | Character count of the product name
| `product_description_length` | Character count of the description
| `product_photos_qty` | Quantity of photos per product
| `product_weight_g` | Product weight in grams
| `product_length_cm`, `product_height_cm`, `product_width_cm` | Dimensions in cm

**Notes:**
- **Product category names are in Portuguese.** Always join to `category_translation` before producing any English-language output
- About **610 products have missing values** across one or more columns (category, description length, weight, dimensions). For most analyses these can be dropped or imputed;
- The catalog (~33K products) is much smaller than the order count, meaning popular products are sold repeatedly across many orders.
- Physical dimensions and weight are mostly useful for shipping analysis

### `sellers`

**Purpose:** Table including all possible sellers

**Grain:** A row per seller

**Row count:** ~3,095

**Key columns:**

| Column | Description |
|---|---|
| `seller_id` | Unique seller identifier
| `seller_zip_code_prefix` | Area code prefix of the seller
| `seller_city` | The city the seller is based in
| `seller_state` | The state the seller is based in, for this dataset all of them are based in Brazil

**Notes:**
- Only ~3,000 sellers serve ~99,000 orders, meaning most sellers handle dozens to hundreds of orders.
- Like `customers`, the state field uses two-letter Brazilian state codes.

### `category_translation`

**Purpose:** Translating the name of the categories from Portugese to English

**Grain:** A row per category

**Row count:** ~71

**Key columns:**

| Column | Description |
|---|---|
| `product_category_name` | Original description in Portuguese
| `product_category_name_english` | Translated description in English

**Notes:**
- Join to `products` whenever you need English category names for analysis or reporting.
- The translation table has **71 rows but the `products` table contains ~74 unique categories** meaning a small number of categories have no English translation. We will either translate the gaps manually during cleaning or accept that ~3 categories appear in Portuguese in outputs.

### `geolocation`

**Purpose:** The geo location of the sellers and customers

**Grain:** One row per geocoded coordinate. Each zip code prefix appears in many rows

**Row count:** ~1,000,163

**Key columns:**

| Column | Description |
|---|---|
| `geolocation_zip_code_prefix` | Zip code prefix
| `geolocation_lat`, `geolocation_lng` | Geographical coordinates
| `geolocation_city` | The city from which the data comes from
| `geolocation_state` | All from Brazil in this case

**Notes:**
- ~1M rows but only ~20K unique zip code prefixes —> meaning each zip code has many rows with slightly different coordinates
- **Never join this table directly** to `customers` or `sellers` on zip code without aggregating first
- For our analysis: if we need geographic visualization, we will aggregate this table down to **one row per zip code** and then join.


...
