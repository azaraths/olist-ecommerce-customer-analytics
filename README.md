
# Olist E-commerce Customer Analytics

An end-to-end customer analytics case study using Olist's Brazilian e-commerce
marketplace data. The analysis answers a single business question: **where
should the marketing team focus retention spend to maximize revenue?**

## Headline finding

**97% of Olist customers never returned for a second purchase.** The retention
question isn't "how do we prevent churn", but rather "how do we convert one-time
buyers into a second order." This reframing drives every recommendation in
the analysis.

## What's in this repo

 **[Full case study writeup](docs/case_study.md)** - the complete analysis,
findings, and recommendations

**Notebooks** (`notebooks/` folder):
- `01_olist_data_exploration.ipynb` - initial exploration and SQL setup
- `02_olist_data_cleaning.ipynb` - cleaning, joins, master tables
- `03_olist_rfm_segmentation.ipynb` - RFM segmentation analysis
- `04_olist_supporting_analyses.ipynb` - delivery, geography, first-order predictors

 **Documentation** (`docs/` folder):
- [Data dictionary](docs/data_dictionary.md) - schema and table descriptions
- [Cleaning notes](docs/cleaning_notes.md) - methodology decisions and gotchas
- [Research questions](docs/research_questions.md) - scope and prioritization
- [Supporting findings](docs/supporting_findings.md) - detailed Q2/Q3/Q4 findings

**SQL** (`sql/` folder) - standalone SQL scripts for the major queries

## Methodology summary

- **Dataset:** 99,441 raw orders → 96,470 delivered orders, 93,388 unique
  customers, 9 connected tables
