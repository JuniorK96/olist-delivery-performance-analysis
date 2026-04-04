# Olist Delivery Performance Analysis

## Project Overview
This project analyses delivery performance data from Olist, Brazil's largest e-commerce platform, covering 110,189 orders placed between 2016 and 2018. The analysis identifies key drivers of late deliveries, their impact on customer satisfaction, and actionable recommendations for the operations team.

**Tools used:** Python (pandas) · SQL (BigQuery) · Tableau Public

**Dashboard:** [View on Tableau Public](https://public.tableau.com/shared/677HKTP7T?:display_count=n&:origin=viz_share_link)

---

## Dataset
Source: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) via Kaggle

The dataset consists of 9 CSV tables covering orders, customers, sellers, products, payments, reviews, and geolocation data spanning September 2016 to August 2018.

---

## Key Findings

### 1. Strong Overall Delivery Performance
Olist achieved a 93.4% on-time rate across 110,189 orders, delivering on average 11 days ahead of the estimated 23-day window. This is a strong indicator of operational reliability and customer trust, with 102,925 orders delivered on time out of 110,189 total.

### 2. Northeastern States Are Underserved by Logistics Infrastructure
States like AL, MA, and SE have late rates of 18–21%, significantly higher than the 6.6% national average. Olist Pax's 5 cross-docking hubs are entirely concentrated in southeastern cities — São Paulo, Rio de Janeiro, Curitiba, Belo Horizonte, and Porto Alegre — with zero presence in the northeast. Despite being low volume regions, customers in these states pay higher freight costs and receive worse delivery service, representing a clear infrastructure gap.

### 3. Seasonal Demand Spikes Are Straining Delivery Capacity
Monthly trends show late rate spikes in November and March, coinciding with peak shopping seasons. Christmas supplies (10%) and fashion/beach items (9.4%) both exceed the national average late rate of 6.6%, suggesting delivery capacity is insufficient during these predictable seasonal peaks.

### 4. Certain Product Categories Show Disproportionate Late Rates
Audio (11.6%) and home comfort (9.3%) have higher than average late rates despite lower order volumes, suggesting potential handling, packaging, or carrier-specific issues unique to these product types that are not explained by volume alone.

### 5. Late Deliveries Severely Damage Customer Satisfaction
Orders delivered late score an average of 2.3/5 compared to 4.2/5 for on-time deliveries — nearly half the satisfaction score. Given that delivery timing is the single biggest driver of customer experience, every percentage point reduction in the 6.6% late rate directly translates to measurably higher satisfaction across the platform.

---

## Recommendations

### 1. Expand Logistics Coverage into Northeastern Brazil
Olist Pax should prioritise establishing at least one cross-docking hub in a strategically located northeastern city such as Fortaleza (CE) or Recife (PE). The current infrastructure gap — with the nearest hub being São Paulo — directly explains the consistently high late rates in AL, MA, and SE. Even a single northeastern hub could significantly reduce last-mile delivery distances and costs for customers in this underserved region.

### 2. Implement a Gig Economy Surge Model During Peak Seasons
Similar to how GrabExpress and Shopee operate surge delivery programmes in Southeast Asia, Olist should offer higher delivery payouts during predictable peak periods such as November and the summer season. This flexible capacity model attracts more gig delivery drivers precisely when demand is highest, directly addressing the seasonal late rate spikes seen in the data — without incurring permanent staffing costs.

### 3. Investigate Handling and Carrier Processes for Audio and Home Comfort
These categories consistently underperform on delivery despite lower order volumes. A targeted operational review of how these items are picked, packed, and handed to carriers may reveal whether size, fragility, or specific carrier partnerships are causing delays. Resolving category-specific logistics issues here could meaningfully improve overall late rates.

### 4. Reassess Delivery Estimates for Underserved Regions
Olist currently over-delivers by 11 days on average nationally, which is impressive. However, northeastern states with 18–21% late rates suggest delivery estimates there may be too optimistic given the infrastructure gap. Adjusting estimates to be more conservative for these states would reduce broken promises and improve review scores in the northeast, while buying time to build out logistics infrastructure.

### 5. Treat On-Time Delivery as the Primary Customer Satisfaction Lever
The 2.3 vs 4.2 review score gap is the single most actionable insight in this analysis. Olist should establish on-time delivery rate as a primary KPI tracked at the executive level, with monthly reporting broken down by state, category, and seller. Given the direct correlation between late deliveries and poor reviews, even a 1–2 percentage point improvement in on-time rate would have a measurable positive impact on platform-wide satisfaction scores.

---

## Project Structure

    ├── olist_cleaning.ipynb          # Python data cleaning and feature engineering
    ├── sql_queries/                  # BigQuery SQL analysis scripts
    │   ├── on_time_by_state.sql
    │   ├── on_time_by_category.sql
    │   ├── monthly_trends.sql
    │   ├── delay_vs_reviews.sql
    │   ├── customer_state_performance.sql
    │   └── freight_performance.sql
    ├── data/                         # Exported query results (CSV)
    └── README.md

## Data Pipeline
1. **Data Setup** — Downloaded 9 CSV tables from Kaggle, uploaded to BigQuery as `olist_raw` dataset
2. **Python Cleaning** — Merged tables, handled nulls, fixed date formats, and engineered delivery features using pandas
3. **SQL Analysis** — Ran 6 analytical queries in BigQuery covering delivery performance by state, category, time, customer location, and freight
4. **Visualisation** — Built interactive Tableau dashboard published to Tableau Public

---

## Feature Engineering
Three key features were engineered in Python:
- **`delivery_delay_days`** — difference in days between actual and estimated delivery date (positive = late, negative = early)
- **`is_late`** — binary flag (1 = arrived after estimated date, 0 = on time or early)
- **`actual_delivery_days`** — total days from purchase to delivery

---

## Data Limitations
- The dataset covers 2016–2018 and may not reflect current Olist operations

---

*Analysis by Junior Khalit · [LinkedIn](https://www.linkedin.com/in/junior-k-473700155/) · [Tableau Public](https://public.tableau.com/app/profile/junior.khalit/)*
