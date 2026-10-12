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

FinTrust Digital Bank | Data Analytics Track Project 

AnalystLab Africa Experience Lab Internship — October 2026

Project Overview

The FinTrust Financial Intelligence & Digital Banking Support Solution is a data analytics project focused on understanding customer behaviour, transaction performance, digital channel usage and transaction risk-review patterns.

Across the project weeks, I worked with customer and transaction data to identify business insights and present findings through SQL analysis, Python exploratory data analysis and an interactive Power BI dashboard.

Objectives

* Evaluate transaction performance and monthly trends.
* Analyse customer transaction frequency and value concentration.
* Compare digital channel performance and usage.
* Examine patterns in transaction risk-review flags.
* Develop actionable, data-driven business recommendations.

Tools and Technologies

* Microsoft Excel — Data inspection and quality checks
* SQL — Data analysis, aggregations, CTEs and window functions
* Python — Pandas, NumPy, Matplotlib and Seaborn
* Power BI — KPI reporting and interactive dashboard development
* GitHub — Project version control and documentation

Key Business Insights

* The dataset contains 1,500 customers and 12,000 transactions.
* Total transaction value is approximately ₦560.5 million.
* The overall transaction success rate is approximately 90.5%.
* Mobile App transactions account for 5,102 transactions.
* The top 25% of customers by transaction value contribute approximately 51% of total transaction value.
* High-value transactions show higher risk-review flag rates than normal-value transactions across customer segments.
* Monthly transaction value declined in February before recovering in March 2026.

Business Recommendations

1. Investigate failed transactions to identify potential causes and improve reliability.
2. Monitor monthly transaction trends and channel-level performance.
3. Develop suitable engagement and retention strategies for high-value customers.
4. Investigate risk-review patterns using appropriate checks without assuming that a review flag confirms fraud.
5. Use the dashboard to monitor key performance indicators and support business decisions.

Project Deliverables

* Power BI dashboard
* SQL business analysis scripts
* Python exploratory analysis notebook
* KPI documentation and business insights
* Data-quality checks and validation evidence
* Business recommendations
* Final project documentation

Limitations

The project uses synthetic banking data, which may not fully reflect real-world banking operations. Risk-review flags are analytical indicators and should not be interpreted as confirmed fraudulent transactions. Final technical validation and corrections are part of the project completion process.

Conclusion

This project demonstrates how SQL, Python and Power BI can be combined to transform customer and transaction data into actionable business insights. It strengthened my practical experience in data analysis, business problem-solving, data visualisation and communicating findings.


Project Track: Data Analytics
Programme: AnalystLab Africa Experience Lab Internship
Author: Oluwayomi Precious Similoluwa

#DataAnalytics #SQL #Python #PowerBI #BusinessIntelligence