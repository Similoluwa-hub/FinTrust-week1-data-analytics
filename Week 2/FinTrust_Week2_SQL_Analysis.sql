 FINTRUST DIGITAL BANK — WEEK 2 SQL BUSINESS ANALYSIS

   Track: Data Analytics | AnalystLab Africa FinTrust Experience Lab
   Environment: SQLite (tables loaded from the cleaned Customer & Transaction
   datasets — see Customer_Cleaned / Transaction_Cleaned in the Week 2
   Data Quality & Cleaning Workbook)
   
   Q1 — CUSTOMER BEHAVIOUR
   Business Question: Which customer segment generates the highest average
   transaction value, and how does that compare to their total contribution?

SELECT c.Customer_Segment,
       COUNT(t.Transaction_ID) AS total_transactions,
       ROUND(AVG(t.Amount_NGN),2) AS avg_transaction_ngn,
       ROUND(SUM(t.Amount_NGN),2) AS total_value_ngn
FROM transactions t
JOIN customers c ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY avg_transaction_ngn DESC;

 RESULT
Segment    | Txns | Avg Value (NGN) | Total Value (NGN)
SME        | 1706 | 49,115.69       | 83,791,371.71
Student    | 2289 | 46,953.20       | 107,475,866.33
Everyday   | 5644 | 46,325.11       | 261,458,920.99
Premium    | 2361 | 45,637.95       | 107,751,195.82

INTERPRETATION
SME customers transact the least often but at the highest average value per
transaction — consistent with fewer, larger business-related payments rather
than everyday spending. Everyday customers dominate total volume (47% of all
transactions) but at the lowest average ticket size, so they drive scale
while SME and Premium drive per-transaction value. Segment-specific product
strategy makes sense: SME needs high-value transfer/payment reliability,
Everyday needs low-friction, high-throughput rails.

   Q2 — TRANSACTION ACTIVITY
   Business Question: How did transaction volume and value trend across Q1 2026?

SELECT strftime('%Y-%m', Transaction_DateTime) AS txn_month,
       COUNT(*) AS transaction_count,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn
FROM transactions
GROUP BY txn_month
ORDER BY txn_month;

RESULT
Month   | Txns | Total Value (NGN)
2026-01 | 4133 | 188,489,434.69
2026-02 | 3734 | 175,786,896.99
2026-03 | 4133 | 196,201,023.17

INTERPRETATION
Volume dipped in February (28 days vs. 31) but per-day activity is actually
flat to slightly rising (4133/31 ≈133/day in Jan vs 3734/28 ≈133/day in Feb vs
4133/31 ≈133/day in Mar) — the dataset shows steady, not seasonal, activity
across the quarter. March closed the quarter with the highest transaction
value, a reasonable baseline for setting Q2 growth targets.


   Q3 — TRANSACTION VALUE / TYPE
   Business Question: Which transaction types contribute the most value, and
   which are highest-value per transaction?

SELECT Transaction_Type,
       COUNT(*) AS transaction_count,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
       ROUND(AVG(Amount_NGN),2) AS avg_value_ngn
FROM transactions
GROUP BY Transaction_Type
ORDER BY total_value_ngn DESC;

 RESULT
Type            | Txns | Total Value (NGN) | Avg Value (NGN)
Transfer        | 3549 | 237,916,700.41     | 67,037.67
Deposit         | 1328 | 130,985,059.85     | 98,633.33
Card Purchase   | 3033 | 85,863,413.78      | 28,309.73
Cash Withdrawal | 1430 | 67,772,362.11      | 47,393.26
Bill Payment    | 1475 | 28,163,647.51      | 19,094.00
Airtime/Data    | 1185 | 9,776,171.19       | 8,249.93

INTERPRETATION
Transfers are both the most frequent and highest-value transaction type,
making them the single most important flow to protect for uptime and fraud
controls. Deposits have the highest average ticket size (~₦98.6k) despite
fewer transactions — likely payroll or bulk fund-ins. Airtime/Data and Bill
Payment are high-frequency, low-value "utility" transactions that matter more
for engagement/retention than balance-sheet value.


   Q4 — TRANSACTION TYPE / OPERATIONAL QUALITY
   Business Question: Which transaction type has the highest failure or
   reversal rate?

SELECT Transaction_Type,
       COUNT(*) AS total_txns,
       SUM(CASE WHEN Transaction_Status IN ('Failed','Reversed') THEN 1 ELSE 0 END) AS failed_or_reversed,
       ROUND(100.0 * SUM(CASE WHEN Transaction_Status IN ('Failed','Reversed') THEN 1 ELSE 0 END) / COUNT(*), 2) AS failure_reversal_rate_pct
FROM transactions
GROUP BY Transaction_Type
ORDER BY failure_reversal_rate_pct DESC;

 RESULT
Type            | Total | Failed/Reversed | Rate %
Airtime/Data    | 1185  | 106              | 8.95
Bill Payment    | 1475  | 120              | 8.14
Cash Withdrawal | 1430  | 116              | 8.11
Card Purchase   | 3033  | 245              | 8.08
Transfer        | 3549  | 274              | 7.72
Deposit         | 1328  | 95               | 7.15

INTERPRETATION
Failure/reversal rates are fairly even across types (7.1%–9.0%), with no
single type standing out as badly broken — this looks like a consistent
baseline operational failure rate rather than a type-specific problem.
Airtime/Data has the highest rate; because it is high-frequency and low-value,
that is a good candidate for a quick reliability win(e.g retry logic) with
low financial risk if something goes wrong.


   Q5 — TRANSACTION CHANNEL
   Business Question: Which channel carries the most volume/value, and how
   does its success rate compare to the others?

SELECT Channel,
       COUNT(*) AS total_txns,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
       ROUND(100.0 * SUM(CASE WHEN Transaction_Status = 'Successful' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_pct
FROM transactions
GROUP BY Channel
ORDER BY total_txns DESC;

 RESULT
Channel    | Txns | Total Value (NGN) | Success %
Mobile App | 5102 | 240,104,365.19     | 89.75
POS        | 2393 | 104,346,681.23     | 90.85
Web        | 1869 | 89,324,999.94      | 90.85
ATM        | 1747 | 83,942,354.23      | 91.70
USSD       | 889  | 42,758,954.26      | 90.33

INTERPRETATION
Mobile App is the dominant channel (43% of all transactions and the largest
share of value) but has the lowest success rate of the five (89.75%),
meaning it is the single biggest lever for improving overall transaction
success — a 1-point reliability gain here moves the needle more than the
same gain on any other channel. ATM has the highest success rate, likely
because it is a controlled, single-purpose hardware environment.


   Q6 — TRANSACTION STATUS
   Business Question: What does the overall transaction status mix look like?

SELECT Transaction_Status,
       COUNT(*) AS txn_count,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM transactions), 2) AS pct_of_total
FROM transactions
GROUP BY Transaction_Status
ORDER BY txn_count DESC;

 RESULT
Status     | Count | % of Total
Successful | 10856 | 90.47
Failed     | 630   | 5.25
Reversed   | 326   | 2.72
Pending    | 188   | 1.57

INTERPRETATION
A 90.5% success rate is a workable baseline KPI to track week over week for
the Power BI dashboard. Failed + Reversed together (7.97%) represent nearly
1 in 12 transactions not completing cleanly — worth root-causing by channel
and type (see Q4/Q5) rather than treating as a single blended number.

   Q7 — CUSTOMER SEGMENTS / DIGITAL ENGAGEMENT
   Business Question: How does digital engagement differ by customer segment
   and preferred channel?

SELECT Customer_Segment, Preferred_Channel,
       COUNT(*) AS customer_count,
       ROUND(AVG(Digital_Engagement_Score),1) AS avg_engagement_score
FROM customers
GROUP BY Customer_Segment, Preferred_Channel
ORDER BY Customer_Segment, avg_engagement_score DESC;

 RESULT (abridged — full 12-row result in the notebook/output)
Segment  | Channel    | Customers | Avg Engagement
Everyday | Mobile App | 440       | 69.2
Everyday | Web        | 158       | 68.8
Everyday | USSD       | 113       | 64.4
Premium  | Mobile App | 181       | 67.3
Student  | Mobile App | 163       | 69.5
SME      | Mobile App | 140       | 68.8
... (USSD is the lowest-engagement channel in every segment)

INTERPRETATION
Across every customer segment, Mobile App and Web preference correlates with
higher digital engagement scores, while USSD preference consistently
correlates with the lowest engagement (~63-66) — this holds for Premium, SME,
Everyday and Student alike. USSD customers are likely a distinct
lower-connectivity or lower-smartphone-penetration group who would benefit
from USSD-specific engagement campaigns rather than being pushed toward app
features they are not using.

 Q8 — RISK-REVIEW PATTERNS
   Business Question: Which transaction type / channel combinations carry the
   highest risk-review flag rate?

SELECT Transaction_Type, Channel,
       COUNT(*) AS total_txns,
       SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END) AS flagged_txns,
       ROUND(100.0 * SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS risk_review_rate_pct
FROM transactions
GROUP BY Transaction_Type, Channel
HAVING total_txns >= 30
ORDER BY risk_review_rate_pct DESC
LIMIT 10;

RESULT (top 5 of 10)
Type            | Channel    | Total | Flagged | Rate %
Transfer        | ATM        | 532   | 163     | 30.64
Transfer        | Web        | 562   | 172     | 30.60
Transfer        | POS        | 679   | 191     | 28.13
Transfer        | Mobile App | 1526  | 423     | 27.72
Cash Withdrawal | Web        | 229   | 61      | 26.64

INTERPRETATION
Every single row in the top 10 is either a Transfer or a Cash Withdrawal —
these are the two transaction types where risk review concentrates,
regardless of channel. This lines up with real-world banking risk practice
(transfers and withdrawals move funds out, so they carry the most fraud/AML
scrutiny) and validates the synthetic Risk_Review_Flag as a sensible,
realistic label for future predictive modelling work.

   Q9 — RISK-REVIEW PATTERNS (INTERNATIONAL)
   Business Question: How do international transactions differ from domestic
   ones in value, success and risk-review rate?

SELECT International_Transaction,
       COUNT(*) AS txn_count,
       ROUND(AVG(Amount_NGN),2) AS avg_value_ngn,
       ROUND(100.0 * SUM(CASE WHEN Transaction_Status='Successful' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_pct,
       ROUND(100.0 * SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS risk_review_rate_pct
FROM transactions
GROUP BY International_Transaction;


Intl? | Count | Avg Value (NGN) | Success % | Risk Review %
No    | 11520 | 46,916.80        | 90.36     | 18.88
Yes   | 480   | 41,657.88        | 93.13     | 36.88

INTERPRETATION
International transactions are only 4% of volume but carry roughly double
the risk-review rate of domestic ones (36.9% vs 18.9%) — despite actually
having a slightly higher success rate and lower average value. This confirms
international status is a strong, independent risk signal in this dataset,
not merely a proxy for larger transaction size.

 Q10 — CUSTOMER BEHAVIOUR (TOP CUSTOMERS)
   Business Question: Who are the top 10 customers by total transaction value,
   and which segments do they belong to?

SELECT t.Customer_ID, c.Customer_Name, c.Customer_Segment,
       COUNT(t.Transaction_ID) AS txn_count,
       ROUND(SUM(t.Amount_NGN),2) AS total_value_ngn
FROM transactions t
JOIN customers c ON c.Customer_ID = t.Customer_ID
GROUP BY t.Customer_ID
ORDER BY total_value_ngn DESC
LIMIT 10;

 RESULT (top 5 of 10)
Customer_ID | Name             | Segment  | Txns | Total Value (NGN)
FT-C01075   | Ibrahim Mohammed | Everyday | 10   | 1,713,942.51
FT-C00357   | Ada Garba        | Everyday | 18   | 1,713,516.28
FT-C00816   | Yusuf Ibrahim    | Everyday | 17   | 1,611,209.24
FT-C00690   | Tunde Ibrahim    | SME      | 12   | 1,522,279.61
FT-C00023   | Tunde Ojo        | Student  | 11   | 1,440,772.53

INTERPRETATION
7 of the top 10 customers by value are labelled "Everyday", not Premium or
SME — segment labels here reflect an assigned tier, not necessarily actual
transaction value. This is worth flagging to the business: if "Premium" is
meant to track high-value customers, the segmentation logic (or at least
this synthetic version of it) does not fully allign with realised value and a 
value-based re-segmentation could be a future dashboard filter.

