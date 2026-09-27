# FinTrust Digital Bank — Week 2 Data Analytics Project

**AnalystLab Africa Experience Lab — Data Analytics Track**

## Project Overview

The FinTrust Digital Bank project focuses on transforming synthetic customer and transaction data into meaningful business intelligence that can support management decision-making.

During Week 2, the project moved from the planning stage established in Week 1 into practical data preparation, analysis, exploratory data analysis and dashboard development.

## Objectives

The main objectives for Week 2 were to:

* Assess and improve the quality of the FinTrust customer and transaction datasets.
* Perform business-focused analysis using SQL.
* Explore customer and transaction patterns using Python.
* Develop an interactive Power BI management dashboard.
* Identify meaningful business findings.
* Test and validate analytical outputs.
* Document important decisions, assumptions and limitations.

## Data Resources

The analysis used the approved FinTrust project resources:

* FinTrust Customer Data
* FinTrust Transaction Data
* FinTrust Data Dictionary

The datasets are synthetic and were provided for educational purposes.

## Tools Used

* Microsoft Excel
* SQL
* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Power BI
* Jupyter Notebook / Google Colab

## Part A — Data Preparation & Quality Assessment

The customer and transaction datasets were assessed using Microsoft Excel.

### Quality Assessment Results

* Customer records: 1,500
* Transaction records: 12,000
* Customer columns: 12
* Transaction columns: 11
* Exact duplicate rows: 0
* Duplicate key values: 0
* Missing transaction cells: 192
* Unique Customer IDs: 1,500
* Unmatched transaction Customer IDs: 0
* Customers with no transactions: 0
* Potential transaction amount outliers flagged: 1,474

Potential transaction amount outliers were identified using the IQR rule. These records were flagged for review rather than automatically deleted.

Missing values were documented rather than replaced with unsupported assumptions.

## Part B — SQL Business Analysis

SQL was used to answer business questions covering:

* Customer behaviour
* Transaction activity
* Transaction value
* Transaction types
* Transaction channels
* Transaction status
* Customer segments
* Digital engagement
* Risk-review patterns

Each query was interpreted in a business context rather than presenting SQL results without explanation.

## Part C — Python Exploratory Data Analysis

Python was used for exploratory analysis of the FinTrust datasets.

The analysis examined:

* Customer segments
* Transaction types
* Transaction amounts
* Transaction channels
* Transaction status
* International transactions
* Customer behaviour
* Risk-review patterns

Multiple visualizations were created to identify patterns and support interpretation of the data.

## Part D — Power BI Dashboard

An interactive management dashboard was developed in Power BI.

The dashboard includes:

### KPI Cards

* Total Transactions
* Total Transaction Value
* Average Transaction Value
* Transaction Success Rate
* Failed Rate
* Risk Review Rate

### Dashboard Analysis Areas

**Transaction Overview**

* Transaction trend over time
* Transactions by transaction type

**Customer Behaviour**

* Transactions by customer segment
* Transaction value by customer segment

**Channel & Status**

* Transactions by channel
* Transaction status distribution by channel

**Risk Review**

* Risk-review rate by transaction type
* Risk-review rate by location

The dashboard also contains filters for date, customer segment, transaction type, channel, location, transaction status, international transaction and risk-review flag.

## Key Analytical Findings

### Finding 1 — High transaction activity

**Evidence:** The dataset contains 12,000 transactions with a total transaction value of approximately ₦560.5M.

**Business Meaning:** FinTrust's transaction dataset represents substantial customer activity and provides enough transaction volume for analysis of transaction behaviour, value and operational outcomes.

### Finding 2 — Most transactions were successful

**Evidence:** The dashboard recorded a transaction success rate of 90.5%, while failed transactions accounted for 5.3%.

**Business Meaning:** Transaction outcomes can be monitored through success and failure rates to identify areas where transaction processing performance may require further investigation.

### Finding 3 — Mobile App was the largest transaction channel

**Evidence:** The Mobile App recorded 5,102 of the 12,000 transactions.

**Business Meaning:** Digital channel usage is an important part of the transaction activity represented in the dataset. Channel-level analysis can therefore help FinTrust understand how customers interact with its transaction services.

### Finding 4 — A significant proportion of transactions carried the synthetic risk-review flag

**Evidence:** 19.6% of transactions had `Risk_Review_Flag = Yes`.

**Business Meaning:** The flagged transactions provide an analytical dimension for examining transaction patterns and reviewing how the flag varies across transaction types and locations.

**Important:** The `Risk_Review_Flag` is a synthetic field in the educational dataset. It is not treated as a real fraud determination, customer risk decision or production banking control.

### Finding 5 — Data quality required targeted attention

**Evidence:** The transaction dataset contained 192 missing cells, while 1,474 transaction amounts were identified as potential outliers using the IQR rule.

**Business Meaning:** Data-quality checks are important before relying on transaction-level analysis. Missing values and statistical outliers can affect analytical results and therefore need to be documented and interpreted carefully rather than automatically removed.

## Testing & Evaluation

| Work Completed                    | Test/Evaluation                                                  | Finding                                                                              | Action/Improvement                                                   | Result                                |
| --------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------------- | ------------------------------------- |
| Data preparation                  | Checked duplicates, IDs, missing values and ranges               | No exact duplicate rows or duplicate IDs; missing transaction fields were identified | Retained legitimate missing values and documented them               | Dataset prepared for analysis         |
| Customer-transaction relationship | Checked Customer_ID matching                                     | No unmatched transaction Customer IDs                                                | Created a one-to-many relationship from customer to transaction data | Relationship validated                |
| KPI calculations                  | Cross-checked dashboard totals against reference analysis values | KPI values were consistent                                                           | Reviewed measures and formatting                                     | KPI cards validated                   |
| Dashboard filtering               | Tested slicers and visual interactions                           | Relevant visuals responded to filters                                                | Reviewed relationships and visual interactions                       | Filtering validated                   |
| Risk analysis                     | Reviewed Risk_Review_Flag patterns                               | Flag patterns could be analyzed by transaction type and location                     | Treated the flag only as a synthetic analytical field                | Risk analysis presented appropriately |

## Important Decisions

### 1. Missing-value handling

Missing values were retained rather than filled with invented information because there was no justified basis for imputing the missing fields.

### 2. Outlier handling

Potential transaction amount outliers were flagged using the IQR method rather than automatically deleted. A statistical outlier is not automatically a data error.

### 3. Customer-to-transaction relationship

A one-to-many relationship was used between the customer and transaction datasets because a customer can have multiple transactions.

### 4. Risk-review interpretation

The Risk_Review_Flag was treated strictly as a synthetic analytical field because the project documentation states that it must not be presented as a real fraud determination or banking risk decision.

## Limitations

* The FinTrust datasets are synthetic and designed for educational purposes.
* Missing transaction fields remain in the dataset and may affect some analyses.
* Potential outliers were identified statistically but were not automatically removed.
* The Risk_Review_Flag cannot be interpreted as a real-world fraud or banking-risk decision.
* Findings describe patterns within the available dataset and should not automatically be generalized to real banking customers.

## Remaining Work

The main Week 2 Data Analytics outputs have been completed:

* Data Quality & Cleaning Workbook
* SQL Business Analysis
* Python EDA Notebook
* Power BI Dashboard
* Business Findings
* Week 2 Documentation

## Proposed Week 3 Focus

The next stage should build on the Week 2 analytical foundation by refining the insights, strengthening dashboard storytelling, and extending the analysis based on the project roadmap and mentor requirements.

## Conclusion

Week 2 provided practical experience in moving from raw data to business intelligence. The work combined data-quality assessment, SQL analysis, Python exploratory analysis and Power BI dashboard development to create a structured view of FinTrust customer and transaction activity.
