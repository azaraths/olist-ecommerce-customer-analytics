**Late deliveries cost Olist twice: once in reviews, twice in retention.**

On average late orders receive a 2-star review, compared to the 4-star review average for items delivered on time.

More importantly, customers whose first order arrived late return at 2.46% vs 3.01% for on-time first orders, which represents an 18% relative drop in repeat-purchase rate, that translated to ~5,046 BRL in lost revenue for a second purchase (conservative estimate).

The loss in revenue is the strongest financial argument for investing in delivery reliability. Marketing should focus on triggering an automated apology and a voucher within 48 hours of any late delivery for damage repair.

**Geography doesn't drive retention, logistics does.**

Across Brazil's 5 regions, repeat-purchase rates cluster tightly (2.27%–3.08%).
The bigger geographic story isn't retention, it's the underlying logistics gap that drives it. The Northeast region has the country's highest late-delivery rate (14.6%, nearly double the Southeast's 7.7%), the lowest average review score (3.96 vs 4.18), and the lowest repeat rate (2.27%). At the state level, Ceará (CE) and Pernambuco (PE) are the clearest examples: CE has a 15.6% late-delivery rate and a 1.59% repeat rate, well below the country's 2.66% state-level average.

São Paulo, despite being 42% of all customers, performs at the country average, therefore it's not the retention that's the problem. The retention problem is logistical reach beyond the Southeast.

The main priorities at the moment for ops is improving carrier coverage in the Northeast. Marketing should focus on recovery via the same late-delivery apology + voucher trigger.

**First-order experience predicts return, but the effect is smaller than expected.**

Across 93,388 first orders, the spread in repeat rates across experience tiers is only 0.72 percentage points: customers with a "Great" first experience (on-time + 4-5 stars) return at 3%, while those with a "Bad" first experience (late + 1-2 stars) return at 2.28%. A 1.32x lift, but on tiny absolute numbers given the dataset's 2.96% baseline repeat rate.

However an intersting counter-pattern arose: customers who left no review at all return at 3.56%, which is the highest of any tier, though on a smaller sample. The likely reasons are silent satisfaction (happy customers who didn't bother reviewing), or selection bias (customers who skipped the review may simply be more transactional, returning out of habit rather than from delight).

**Conclusion:** first-order experience is a predictor, but not a dominant one. The retention ceiling at Olist appears to be structural, so even customers with the best possible first experience return at only 3%. This is where the 97% one-time-buyer pattern showing up in a new cut of the data.

**Implication for marketing:** Don't over-invest in first-experience-based segmentation as a retention lever, the lift is too small to justify big spend.

**Where it does apply:** the ~14,000 customers in the Great tier who haven't yet returned ("High-Potential Returners" from the RFM segmentation) are still the highest-conversion-probability cohort for a "shop again" campaign, but even then expect single-digit-percent conversion, not a transformation.

 The Bad-tier customers should receive the late-delivery apology + voucher from Analysis A. The bigger retention question, why even great experiences only convert 3%, is outside the scope of this dataset and is the conversation marketing should have with product.

# **Retention recommendations:**

# Champions (0.24% of customers, 0.81% of revenue)

**Who**: Customers who bought recently, frequently, and at high value.

**Why**: Smallest segment but highest revenue per customer.

**Action**: VIP retention program by early access, personalized recommendations, loyalty incentives. Lowest-cost retention because they already love the platform. Avoid heavy discounting, they're not price-sensitive and you'd be leaving margin on the table.

**Target outcome:** Retain 90%+ of this segment year-over-year. Measure via repeat-purchase rate.

#Dormant — Recoverable (29.66% of customers, 28.78% of total revenue)

**Who**: Old one-time buyers (180+ days since purchase) who had a good experience. 27,701 customers, the largest single segment.

**Why**: Massive pool, but each customer is hard to reach (they've forgotten about Olist). Win-back rates on year-old e-commerce customers are typically 1-3%.

**Action:** Annual "we've missed you" campaign tied to a seasonal moment (Black Friday, Christmas, Mother's Day). 15-20% voucher to overcome the activation cost. Use category from their original purchase to make the recommendation relevant ("New arrivals in [their category]").

**Target outcome:** 1.5-3% re-activation within 90 days. Even at 2%, that's 554 customers × 142 BRL avg = ~79K BRL.

#High-Potential Returners (12.13% of customers, 22.19% of purchases)

**Who**: Recent one-time buyers (last 90 days) with high order value AND a positive experience (no late delivery, review ≥ 4). 11,330 customers; this is the most actionable segment in the entire dataset.

**Why**: They just bought a product and liked it. The shortest possible distance from one order to two. It's where retention spend has the highest ROI.

**Action**: "Second purchase" campaign triggered 14 days post-delivery: personalized "complete the look / shop the category" email + 10% off second order with 30-day expiry. Push notification 7 days before voucher expiry. For the top-quintile by spend, add free shipping on order #2.

**Target outcome:** 8–12% conversion to second purchase within 60 days. If 10% of 11,330 customers convert at average basket of 175 BRL, that's ~198K BRL recovered revenue.

#Mid-Funnel ( 19.41% of customers, 17.79% of purchases)

**Who**: One-time buyers in the middle of every dimension: moderate recency, moderate spend, mixed experience signal.

**Why**: Largest unclassified segment that could go either way. Treat them as a low-cost broad funnel rather than over-investing per customer.

**Action**: General lifecycle email program (monthly newsletter, seasonal promotions, category trending content). No personalized voucher. Watch behavior: customers in this segment who open emails repeatedly should be upgraded to High-Potential Returners treatment.

**Target outcome**: 3-5% conversion to second purchase within 6 months via general nurture.

# Recent At-Risk (9.07% of total customers, 9,59% of purchases)

**Who**: Recent one-time buyers who had a late delivery OR review score below 4. 8,499 customers, the most preventable churn in the dataset.

**Why**: These customers just bought, but the experience was poor.

**Action**: Automated apology email triggered within 48 hours of a late delivery: acknowledgment + 15% voucher for next order + a clear "what we're doing to fix this" messaging. Stronger voucher than other segments because we're recovering from a bad experience.

**Target outcome**: 5% conversion to second purchase within 60 days. Recovering even half of this group's projected lifetime value matters because it's preventable.

# Likely Lost (9.04% of customers, 9.38% of purchases)

**Who**: Old one-time buyers with bad experience (late delivery or low review). 8,444 customers.

**Why**: Hardest segment to win back. They forgot Olist and they have a reason not to come back. Win-back rates here are typically under 1%.

**Action**: One final attempt with a "things have changed at Olist" email with a meaningful voucher (20%) and a single line acknowledging their bad experience. If they don't convert in 60 days, suppress from active marketing lists to keep costs down.

**Target outcome:** 0.5-1% re-activation. The realistic value of this segment is learning, not revenue. Track which messages get any response and use that signal to improve other segments.

# Recent Satisfied (17.74% of total customers, 6.82% of total purchases)

**Who**: Recent one-time buyers with good experience (review ≥ 4, no late delivery) but lower order value than High-Potential Returners.

**Why**: Large segment, satisfied with Olist, but low spending limits how much retention investment is justified. The play is volume-cheap nudging.

**Action**: Lighter-touch re-engagement than High-Potential Returners. Category-specific newsletter based on their first purchase. Free shipping threshold promo to drive basket size on order #2.

**Target outcome:** 5% conversion to second purchase within 90 days, with average basket value 20%+ higher than first order.

# At Risk (0.99% of total customers, 1.97% of total purchases)

**Who**: Customers who used to be valuable (multi-order or high spend) but haven't bought in 180+ days.

**Why**: Revenue is at risk of disappearing entirely. Win-back is harder than retention but the customer still has demonstrated demand.

**Action**: Win-back email sequence: (1) "We miss you" + 10% voucher with 30-day expiry, (2) reminder if no purchase after 14 days, (3) final voucher boosted to 15% in week 4.

**Target outcome**: 5–8% re-activation rate within 60 days. Track which voucher tier drives reactivation.

# Big Spender (0.41% of customers, 1.24% of purchases)

**Who**: Customers whose individual orders are large but who haven't ordered as frequently as Champions.

**Why**: High revenue per transaction but the relationship is shallow  

**Action**: Premium-category targeted emails (their order history suggests they buy higher-end items). Free shipping threshold lowered for this segment. Priority customer service routing if they message support.

**Target outcome**: Increase order frequency from current 2 to 3+ within 12 months.

#Loyal Customers (0.48% of customers, 0.70% of purchases)

**Who**: Customers with multiple orders and good recency, but lower order value than Champions.

**Why**: Proven repeat buyers, therefore a habit is already formed. The goal here is increasing basket size, not preventing churn.

**Action**: "You might also like" cross-sell emails using their purchase history. Bundle offers (buy 2 in a category, get free shipping). Move them up the value ladder.

**Target outcome**: 15% increase in average order value within 6 months.

# Need Attention (0.38% of customers, 0.35% of total purchases)

**Who**: Mid-tier customers who don't cleanly fit other segments: moderate recency, moderate frequency, moderate value.

**Why**: Could move up or churn out. Cheap to nudge in the right direction.

**Action**: General lifecycle email program: seasonal promotions, category-relevant newsletters, no special treatment. Watch their next order, if their next purchase pushes them into a higher segment, escalate engagement; if they go quiet, deprioritize.

**Target outcome**: Reclassify 25% of this segment into Loyal/Champions within 12 months.

# Recent / Promising (0.28% of customers, 0.24% of purchases)

**Who**: Repeat customers who came back recently but haven't built a strong pattern yet.

**Why**: The goal is to convert them into Loyal, and habits form in the first 3-5 orders.

**Action**: Personalized product recommendations based on their last 2 orders, sent 2 weeks after each purchase. Modest free-shipping offer to lower the friction on order #3.

**Target outcome**: 30% of this segment reaches 3+ orders within 6 months.

# Lost (0.2% of customers, 0.14% of purchases)

**Who**: A small group of repeat customers who haven't returned in a very long time. 192 customers.

**Why**: Tiny segment, low priority. Not worth dedicated campaign spend.

**Action**: Include in the broader Dormant win-back blast at minimal incremental cost.

**Target outcome**: Whatever falls out of broad reactivation, likely negligible.
