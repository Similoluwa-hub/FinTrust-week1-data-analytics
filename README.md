# FinTrust-week1-data-analytics
Week 1 Data Analytics Deliverables for the AnalystLab Africa Experience Lab Internship Programme.
# FinTrust Digital Bank — Week 1 Data Analytics

This repository contains my Week 1 submission for the AnalystLab Africa Experience Lab Internship Programme — Data Analytics Track.

## Project

**FinTrust Financial Intelligence & Digital Banking Support Solution**

## Week 1 Deliverables

* Business Understanding
* Data Understanding and Profiling
* Analytical Questions
* KPI Definition Table
* Dashboard Wireframe
* Initial Analysis Plan

## Tools

* Excel
* Python/Pandas
* SQL
* Power BI

## Files

* `FinTrust_Week1_Data_Analytics_Report.pdf` — Week 1 report
* `FinTrust_Dashboard_Wireframe.png` — Dashboard planning wireframe

The FinTrust datasets used in this project are synthetic and intended for educational purposes.

## Week 3 — Advanced Data Analysis, Validation & Business Insights

As part of the **AnalystLab Africa Experience Lab Internship Programme — Data Analytics Track**, Week 3 focused on building on the Week 1 and Week 2 analysis of the FinTrust Digital Bank project.

The goal was to move beyond basic analysis by exploring customer-value concentration, monthly transaction trends, channel performance, customer transaction frequency, and risk-review patterns. I also focused on validating findings and translating them into practical business recommendations.

### Project Overview

**Project:** FinTrust Financial Intelligence & Digital Banking Support Solution
**Track:** Data Analytics
**Dataset:** Synthetic FinTrust Digital Bank customer and transaction data
**Tools:** SQL (SQLite), Python (Pandas, NumPy, Matplotlib, Seaborn), Power BI and Excel

### Week 3 Activities

* Extended SQL analysis using aggregations, window functions, rankings and customer segmentation.
* Analysed monthly transaction value and month-on-month changes.
* Examined transaction-value concentration across customer quartiles.
* Compared risk-review rates across customer segments and transaction-value bands.
* Investigated transaction frequency and monthly channel performance.
* Worked on validating findings against earlier analysis and identifying areas requiring further checks.
* Developed business recommendations based on the available evidence.

### Key Findings

* **Customer-value concentration:** The top 25% of customers by transaction value accounted for approximately **51% of total transaction value** in the analysis.
* **Monthly transaction value:** Total transaction value declined from January to February before increasing in March. Comparing daily averages helps distinguish changes in activity from differences in the number of days in each month.
* **Risk-review patterns:** High-value transactions had a higher synthetic risk-review rate than normal-value transactions across all four customer segments examined.
* **Channel performance:** Mobile App transactions contributed the largest transaction value among the channels analysed, while ATM transaction value increased across the three months.
* **Transaction frequency:** Most customers fell within the medium-frequency tier of 6–10 transactions during the period examined.

These findings describe patterns in the supplied synthetic dataset. They do not establish causation, customer churn, or actual fraud.

### Validation and Quality Checks

The validation process focuses on comparing SQL and Python outputs, checking calculations and confirming that reported findings are supported by the underlying data.

One important improvement was to examine monthly transaction value alongside daily averages, providing a fairer comparison between months of different lengths.

Python and Power BI checks are being completed alongside the SQL analysis. Any outstanding checks will be resolved before the final results are presented as fully validated.

### Business Recommendations

Based on the patterns observed, the following areas merit further investigation:

1. Explore appropriate engagement strategies for different customer-value groups.
2. Review the factors associated with higher risk-review rates, without treating the synthetic flag as proof of fraud.
3. Monitor monthly transaction value alongside daily averages.
4. Investigate the growth and decline patterns across transaction channels.
5. Segment customers by transaction frequency and study their activity over a longer period before making retention decisions.

### Limitations

* The dataset is synthetic and intended for educational analysis.
* The transaction data covers January–March 2026 only.
* Risk-review flags represent synthetic labels, not confirmed fraud outcomes.
* Three months of data are insufficient to establish long-term customer behaviour or channel trends.
* Findings and recommendations should be reassessed after all validation checks are complete.

### Repository Structure

```text
FinTrust-Week1-Data-Analytics/
├── README.md
├── Week 1/
├── Week 2/
└── Week 3/
    ├── FinTrust_Week3_Advanced_SQL_Analysis.sql
    ├── FinTrust_Week3_Advanced_Data_Analysis.ipynb
    ├── FinTrust_Week3_Project_Summary.md
    ├── FinTrust_Week3_Validation.md
    └── FinTrust_Week3_Business_Recommendations.md
```

*The filenames above are the intended structure. Keep only files that have actually been added to the repository, and adjust the names to match your final files.*

### Week 4 — Next Steps

* Complete the remaining Python and Power BI validation.
* Reconcile key metrics across SQL, Python and Power BI.
* Finalise the dashboard and supporting documentation.
* Address outstanding limitations and document any changes.
* Prepare the final project submission and communicate the findings clearly.

### Learning Reflection

Week 3 reinforced an important lesson for me: completing a query or creating a chart is only one part of data analysis. The findings also need to be checked, interpreted in context and communicated responsibly.

This project continues to strengthen my practical skills in SQL, Python, data visualisation and evidence-based business analysis.

**Programme:** AnalystLab Africa Experience Lab
**Hashtags:** #AnalystLabAfrica #DataAnalytics #SQL #Python #PowerBI #BusinessIntelligence

