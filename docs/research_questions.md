# Research Questions: Olist Customer Analytics Case Study

Where should the marketing team focus retention spend to maximize revenue?

### Q1 — Customer segmentation (RFM)
Which customer segments, defined by Recency, Frequency, and Monetary value,
drive the most revenue, and how should marketing prioritize them for retention?

- **Type:** Segmentation
- **Difficulty:** Medium
- **Retention relevance:** 5/5
- **Method:** RFM scoring in SQL/Python, segment definitions, revenue contribution by segment
- **Expected output:** Customer segments labeled, revenue and customer counts per segment, prioritization recommendation

### Q2 — Delivery performance and reviews
How does delivery performance, both on-time-vs-late status and the magnitude
of any delay, correlate with customer review scores, and what is the financial
impact of late deliveries?

- **Type:** Diagnostic
- **Difficulty:** Easy-to-Medium
- **Retention relevance:** 4/5
- **Method:** Compute delivery delay vs estimate, correlate with review_score, estimate revenue impact of late-delivery customers
- **Expected output:** Quantified relationship between lateness and reviews, estimated revenue lost to delivery problems

### Q3 — Regional patterns
How do revenue and repeat-customer behavior vary across Brazilian regions, and
which regions represent the best targets for retention marketing?

- **Type:** Geographic
- **Difficulty:** Easy
- **Retention relevance:** 3/5
- **Method:** Aggregate revenue and repeat-rate by region, identify high-value vs underperforming regions
- **Expected output:** Regional revenue map (Power BI), repeat-customer rate by state, prioritized region list
- **Note:** Population/per-capita analysis intentionally excluded to keep scope tight

### Q4 — First-order signals for repeat behavior
What % of customers are repeat buyers, and what aspects of their first order
predict whether they'll return?

- **Type:** Prescriptive
- **Difficulty:** Medium
- **Retention relevance:** 5/5
- **Method:** Identify repeat customers, examine first-order characteristics, compare to one-time buyers
- **Expected output:** % repeat rate (we suspect this is low based on Stage 2 exploration), key predictors of return, recommendations for first-purchase experience design
