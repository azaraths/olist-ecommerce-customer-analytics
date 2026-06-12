# Where Should Marketing Focus Retention Spend?
### An End-to-End Customer Analytics Project on the Olist Brazilian Marketplace

## TL;DR

- **97% of Olist customers never returned for a second purchase** — retention spend should focus on converting one-time buyers, not preventing churn from a non-existent loyal base
- Late deliveries are the strongest predictor of customer loss — a 1.32× repeat-rate gap between on-time and late first deliveries
- The Northeast region carries 14.6% late-delivery rate vs 7.7% in the Southeast, and has the lowest repeat rate of any region (2.27%)
- The leverage point: ~11,000 **High-Potential Returners** (recent buyers with great first experiences who haven't yet returned) — the highest-converting target for re-engagement

---

## Introduction

Olist is a Brazilian e-commerce platform connecting small sellers to large marketplaces. Between September 2016 and August 2018, it processed 100,000 orders from 93,000 customers across all 27 Brazilian states.

This case study seeks to answer the question: **where should its marketing team focus retention spend to maximize revenue?**

Before working with the data, my expectations were that the company retained a significant loyal customer base, with some at-risk and lost customers — a very ordinary e-commerce retention story. Once I started my analysis, I was shocked by the main finding:

**97% of Olist customers only placed one order.**

Olist lacks a meaningful loyal customer base. Its main goal isn't preventing churn — it's converting one-time buyers into a second purchase.

To reach my conclusions, I cleaned 99K raw orders down to 96K delivered orders, built an RFM segmentation adapted for the one-time-buyer reality, identified the customer segments where retention spend has the highest leverage, and quantified the impact of two structural problems: delivery delays and regional logistics gaps in Brazil's Northeast.

Four research questions guided the analysis:

1. **Customer segmentation:** Which segments drive the most revenue, and how should marketing approach them?
2. **Delivery and reviews:** Does delivery performance and timing correlate with customer reviews and the probability of a second order?
3. **Geographic patterns:** Which areas of Brazil have the strongest retention possibilities?
4. **First-order signals:** What factors of a customer's first order influence their second purchase?

![Dashboard executive overview](../images/dashboard_page1_overview.png)
*Figure 1: Executive overview from the Power BI dashboard.*

---

## Problems

While conducting the analysis, I encountered issues at every step of the process — both in the technical sense and in the way my expectations were challenged.

### 1. Customer Segmentation

I used RFM segmentation for the customer base, a technique which I had to modify due to the uneven distribution across the three dimensions. I split the analysis in two: the 3% which were repeat customers got full RFM segmentation, while the one-time buyers got a simpler R + M segmentation combined with an experience-quality signal (review score + on-time delivery). The full SQL and Python code for the segmentation is in `notebooks/03_olist_rfm_segmentation.ipynb`.

**Findings:**

- One-time buyers with recent orders, high spend, and positive experience make up the **High-Potential Returners**, which are the easiest to convert for a second purchase, and make up 22.2% of revenue.
- One-time buyers with recent orders but poor experience make up the **Recent At-Risk** category, which marks the most preventable loss of the whole dataset, and represents 9.6% of revenue.
- The largest segment, however, was made up of the **Dormant — Recoverable** category. The pool of customers is massive, but reactivation is hard, therefore the per-customer ROI is also low. This category makes up 28.8% of revenue.

The categories where most analysts would traditionally focus on, like the Loyal Customers and Big Spenders, hold together just 1.13% of customers and 2.75% of revenue for Olist.

![Customer segments breakdown](../images/dashboard_page2_segments.png)
*Figure 2: Customer segment breakdown — 13 segments by customer count and revenue contribution.*

**What it means for marketing:**

Retention spend should concentrate on High-Potential Returners (the easiest conversions), back-stop the Recent At-Risk segment with delivery-recovery campaigns, and run a low-touch annual reactivation for the Dormant Recoverable segment.

---

### 2. Delivery and Reviews

*[WRITE THIS SECTION using these data points]*

**Method.** Joined delivery dates with review scores and customer return behavior. Computed: delivery delay vs estimate, lateness flag, review score correlation, and the repeat-rate gap between on-time and late first deliveries.

**Findings — facts to include in your prose:**

- Late orders receive an average review score of ~2 stars vs ~4 for on-time deliveries.
- Review score collapses with delay magnitude: 1-3 days late → ~3.75 average review, 15+ days late → ~1.71.
- Customers whose first order arrived on-time return at **3.01%**; customers whose first order arrived late return at **2.46%** — a 0.55 percentage-point gap, an 18% relative drop.
- Estimated retention cost from late first deliveries: **~5,046 BRL** in lost second-purchase revenue.

![Why customers churn](../images/dashboard_page3_churn.png)
*Figure 3: Late deliveries crash review scores and depress repeat purchase rates.*

**What it means for marketing:**

Marketing can patch the customer relationship with automated apology emails + vouchers triggered within 48 hours of any late delivery. But the durable fix is logistics, not marketing. This finding is the strongest financial argument in the dataset for ops investment in delivery reliability.

---

### 3. Geographic Patterns

*[WRITE THIS SECTION using these data points]*

**Method.** Aggregated customer behavior by Brazilian state and by region (the 5 official regions: North, Northeast, Center-West, Southeast, South). Compared revenue concentration, repeat rate, and late-delivery rate across geographies.

**Findings — facts to include in your prose:**

- Repeat rates across regions cluster tightly: 2.27% (Northeast) to 3.08% (Center-West). The geographic story isn't about retention behavior — it's about underlying logistics.
- The Northeast has the highest late-delivery rate (**14.6%**, nearly double the Southeast's 7.7%), the lowest average review score (3.96 vs 4.18), and the lowest repeat rate (2.27%).
- State-level: Ceará (CE) and Pernambuco (PE) are the clearest underperformers. CE has a 15.6% late-delivery rate and a 1.59% repeat rate (vs the country state-level average of 2.66%).
- São Paulo, despite being 42% of all customers, performs *at* the country average. It's not the retention problem.
- Honest caveat: the raw number of "extra repeat customers" gained if all underperforming states hit the national average is only ~24. The real opportunity is reducing the *volume* of late deliveries in the Northeast — even a small percentage-point improvement compounds across thousands of orders.

**What it means for marketing:**

Marketing investment in the Northeast won't move retention until delivery reliability improves. Two-track action: (1) ops priority on improving carrier coverage in CE, PE, MA, and BA; (2) marketing supports the recovery via the same late-delivery apology + voucher trigger from Section 2, weighted toward Northeast customers since they bear the brunt.

This is the same finding as Section 2, told from a different cut of the data — reinforcing the conclusion.

---

### 4. First-Order Predictors

*[WRITE THIS SECTION using these data points]*

**Method.** Compared first-order characteristics of customers who returned vs customers who didn't. Looked at experience tier (combination of on-time + review score), individual review score, and a surprise variable: customers who left no review at all.

**Findings — facts to include in your prose:**

- Repeat rate by experience tier: **Great** (on-time + ≥4 stars) → 3.00%, **Bad** (late + ≤2 stars) → 2.28%. A 1.32× lift, but only a 0.72 percentage-point absolute gap.
- Review score scales cleanly with return: 5-star reviewers return at the highest rate, but the lift over 1-star is modest.
- **The surprise:** customers who left no review at all return at **3.56%** — the highest of any tier, above baseline. Likely silent satisfaction or selection bias toward transactional buyers. Small sample; flagged for completeness, not for action.
- The deeper read: even the best first-order experience converts at only 3% — the same 97% structural ceiling from the introduction. First-order experience is a predictor, but a bounded one.

![First-order predictors](../images/dashboard_page4_predictors.png)
*Figure 4: First-order experience tier and review score predict return — modestly.*

**What it means for marketing:**

Don't over-invest in experience-based segmentation as a primary retention lever — the lift is too small to justify big spend. Where it does apply: the ~14,000 customers in the Great tier who haven't yet returned (the High-Potential Returners from Section 1). The bigger question — *why* even great experiences only convert at 3% — is outside this dataset, and is the conversation marketing should have with product.

---

## Solutions

*[WRITE THIS SECTION yourself. Use the structure below.]*

**Opening — 1 paragraph:** The dataset surfaces two structural problems: a tiny loyal base and a logistics gap in the Northeast. The recommendations below address both, while being honest about what marketing can and can't solve alone.

### Recommendation 1: Concentrate retention spend on High-Potential Returners

- **Who:** ~11,000 customers with recent good first orders, no return yet
- **Action:** Personalized "shop again" email triggered 14 days post-delivery + category-relevant product recommendation + 10% second-order voucher (30-day expiry)
- **Expected impact:** 8-12% conversion = roughly 200K BRL recovered revenue
- **Why this segment:** highest-leverage segment per the segmentation analysis; experience-tier data confirms these are conversion-ready

### Recommendation 2: Automate damage recovery on late deliveries

- **Who:** Every customer who experiences a late delivery (~8% of orders)
- **Action:** Apology email + 15% next-order voucher triggered within 48 hours of confirmed late delivery
- **Expected impact:** Recovery of ~5,046 BRL/year in lost second-purchase revenue
- **Strategic note:** Marketing patches the relationship; only ops can prevent the underlying problem

### Recommendation 3: Make the case to ops for delivery investment in the Northeast

- **Who:** Internal — marketing presents the data to ops leadership
- **Action:** Use the regional findings (14.6% Northeast late-delivery rate vs 7.7% Southeast) to justify carrier coverage investment in CE, PE, MA, BA
- **Expected impact:** Every percentage point of Northeast late-delivery reduction compounds retention across thousands of customers
- **Why marketing owns this conversation:** The financial argument for ops investment is strongest when framed as *lost retention revenue*, not just operational metrics

### Recommendation 4: Run a low-touch annual reactivation for Dormant Recoverable

- **Who:** ~27,000 customers with good past experiences who haven't ordered in 180+ days
- **Action:** One annual win-back campaign tied to a seasonal moment (Black Friday or Christmas), 15-20% voucher, category-relevant recommendation
- **Expected impact:** 1.5-3% reactivation = ~600-800 reactivated customers
- **Why not more:** Per-customer ROI is too low to justify higher investment

### What's intentionally not here

The recommendations above leave out two categories on purpose:

1. **Loyalty programs for the existing repeat base.** Olist's repeat customers (the 3%) collectively hold 2.75% of revenue. Building a VIP program for them is a small lever — they're already loyal and the population is tiny.

2. **Generic email marketing across all segments.** Spray-and-pray retention email to the full 93K base would produce noise without impact. The four targeted plays above are a better use of budget.

**Closing line:** Together, these four recommendations should be testable in a controlled A/B framework within one quarter. The honest expectation is that they recover meaningful but not transformative revenue — because the dataset's deeper finding (the 3% retention ceiling) suggests a product-level question that marketing alone can't answer.

---

## Conclusion

*[WRITE THIS SECTION yourself. Use the structure below.]*

**One sentence restating the business question.**

**The single most important finding in one sentence:** 97% of Olist customers never returned for a second purchase. Olist doesn't have a traditional retention problem — it has a conversion problem.

**Two other findings shape the answer:**
1. Late deliveries are the strongest predictor of churn — a 1.32× repeat-rate gap and ~5,046 BRL in lost second-purchase revenue.
2. The late-delivery problem isn't distributed evenly — the Northeast carries nearly double the rate of the Southeast.

**Closing line:** Marketing can recover some of this churn, but the deeper finding — that even great first experiences only convert at 3% — is a structural ceiling that limits what marketing alone can fix. That's the conversation Olist marketing should be having with product.

---

## Next Steps

*[WRITE THIS SECTION yourself. Use the bullets below.]*

Given more time and access, I would extend this analysis in four directions:

- **A/B test the recommended campaigns.** Every recommendation is a hypothesis based on observed correlation. Running controlled experiments — particularly on the High-Potential Returners voucher campaign and the late-delivery apology trigger — would validate the conversion estimates and refine voucher sizing.

- **Bring in external population and demographic data.** This analysis intentionally excluded per-capita regional analysis to keep scope tight. Adding state-level census data (income, urbanization, e-commerce penetration) would distinguish "Northeast underperforms because of logistics" from "Northeast underperforms because of demographics."

- **Build a propensity-to-return model.** RFM segmentation is descriptive. A logistic regression or gradient-boosted model on first-order features could produce per-customer probability scores — letting marketing target by predicted probability, not just segment membership.

- **Investigate the 3% structural ceiling with Olist product data.** The deepest unanswered question: why do *even great experiences* convert at only 3%? Candidates include catalog gaps, category lifecycle (single-purchase categories dominating), or competitive pressure. Investigating any of these requires additional data not in the Kaggle dataset.

---

## Appendix

- **Code & notebooks:** `notebooks/` folder in this repo
  - `01_olist_data_exploration.ipynb` — initial exploration and SQL setup
  - `02_olist_data_cleaning.ipynb` — cleaning, joins, master tables
  - `03_olist_rfm_segmentation.ipynb` — segmentation analysis
  - `04_olist_supporting_analyses.ipynb` — delivery, geography, predictors
- **Documentation:** `docs/data_dictionary.md`, `docs/cleaning_notes.md`, `docs/research_questions.md`, `docs/supporting_findings.md`
- **Interactive dashboard:** [Power BI Service link to be added after publishing]
- **Dataset source:** [Olist on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
