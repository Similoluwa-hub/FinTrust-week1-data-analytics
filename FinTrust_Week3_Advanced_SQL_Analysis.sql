-- FINTRUST WEEK 3 — ADVANCED SQL ANALYSIS
-- Track: Data Analytics | SQLite / DB Browser for SQLite
-- IMPORTANT: Confirm your imported table names before running.
-- This script assumes tables named customers and transactions.
-- The Risk_Review_Flag is synthetic and is NOT proof of fraud.

-- 1. Monthly trend with month-on-month change
WITH monthly AS (
    SELECT strftime('%Y-%m', Transaction_DateTime) AS txn_month,
           COUNT(*) AS transaction_count,
           ROUND(SUM(Amount_NGN), 2) AS total_value_ngn,
           ROUND(AVG(Amount_NGN), 2) AS average_value_ngn
    FROM transactions
    GROUP BY strftime('%Y-%m', Transaction_DateTime)
)
SELECT txn_month, transaction_count, total_value_ngn, average_value_ngn,
       transaction_count - LAG(transaction_count) OVER (ORDER BY txn_month) AS change_in_count,
       ROUND(100.0 * (transaction_count - LAG(transaction_count) OVER (ORDER BY txn_month))
             / NULLIF(LAG(transaction_count) OVER (ORDER BY txn_month), 0), 2) AS pct_change_in_count
FROM monthly
ORDER BY txn_month;

-- 2. Success, failure, reversal and pending rates by channel
SELECT Channel, COUNT(*) AS total_transactions,
       SUM(CASE WHEN Transaction_Status='Successful' THEN 1 ELSE 0 END) AS successful,
       SUM(CASE WHEN Transaction_Status='Failed' THEN 1 ELSE 0 END) AS failed,
       SUM(CASE WHEN Transaction_Status='Reversed' THEN 1 ELSE 0 END) AS reversed,
       SUM(CASE WHEN Transaction_Status='Pending' THEN 1 ELSE 0 END) AS pending,
       ROUND(100.0 * SUM(CASE WHEN Transaction_Status='Successful' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate_pct
FROM transactions
GROUP BY Channel
ORDER BY success_rate_pct ASC;

-- 3. Transaction type and channel performance (minimum 30 records)
SELECT Transaction_Type, Channel, COUNT(*) AS transaction_count,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
       ROUND(AVG(Amount_NGN),2) AS average_value_ngn,
       ROUND(100.0*SUM(CASE WHEN Transaction_Status='Successful' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate_pct
FROM transactions
GROUP BY Transaction_Type, Channel
HAVING COUNT(*) >= 30
ORDER BY total_value_ngn DESC;

-- 4. Customer-level activity, including average value and active months
WITH customer_activity AS (
    SELECT Customer_ID, COUNT(*) AS transaction_count,
           ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
           ROUND(AVG(Amount_NGN),2) AS average_transaction_ngn,
           COUNT(DISTINCT strftime('%Y-%m', Transaction_DateTime)) AS active_months
    FROM transactions
    GROUP BY Customer_ID
)
SELECT c.Customer_ID, c.Customer_Segment, ca.transaction_count, ca.total_value_ngn,
       ca.average_transaction_ngn, ca.active_months
FROM customer_activity ca
JOIN customers c ON c.Customer_ID = ca.Customer_ID
ORDER BY ca.total_value_ngn DESC
LIMIT 20;

-- 5. Customer segment comparison with within-segment success rates
SELECT c.Customer_Segment, COUNT(t.Transaction_ID) AS transaction_count,
       ROUND(SUM(t.Amount_NGN),2) AS total_value_ngn,
       ROUND(AVG(t.Amount_NGN),2) AS average_transaction_ngn,
       ROUND(100.0*SUM(CASE WHEN t.Transaction_Status='Successful' THEN 1 ELSE 0 END)
             / COUNT(*),2) AS success_rate_pct
FROM customers c
JOIN transactions t ON t.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY total_value_ngn DESC;

-- 6. International vs domestic comparison
SELECT International_Transaction, COUNT(*) AS transaction_count,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM transactions),2) AS share_of_transactions_pct,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
       ROUND(AVG(Amount_NGN),2) AS average_value_ngn,
       ROUND(100.0*SUM(CASE WHEN Transaction_Status='Successful' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate_pct,
       ROUND(100.0*SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS risk_review_rate_pct
FROM transactions
GROUP BY International_Transaction;

-- 7. Risk-review rates by transaction type and international status
-- These are patterns in a synthetic flag, not fraud findings.
SELECT Transaction_Type, International_Transaction, COUNT(*) AS transaction_count,
       SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END) AS flagged_count,
       ROUND(100.0*SUM(CASE WHEN Risk_Review_Flag='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS review_rate_pct
FROM transactions
GROUP BY Transaction_Type, International_Transaction
HAVING COUNT(*) >= 20
ORDER BY review_rate_pct DESC;

-- 8. High-value transaction bands (quartile-like business bands)
WITH ranked AS (
    SELECT Transaction_ID, Amount_NGN,
           CASE
             WHEN Amount_NGN < 5000 THEN 'Under ₦5,000'
             WHEN Amount_NGN < 25000 THEN '₦5,000–₦24,999'
             WHEN Amount_NGN < 100000 THEN '₦25,000–₦99,999'
             ELSE '₦100,000 and above'
           END AS amount_band
    FROM transactions
)
SELECT amount_band, COUNT(*) AS transaction_count,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM transactions),2) AS share_pct,
       ROUND(SUM(Amount_NGN),2) AS total_value_ngn,
       ROUND(AVG(Amount_NGN),2) AS average_value_ngn
FROM ranked
GROUP BY amount_band
ORDER BY MIN(Amount_NGN);

-- 9. Compare missing location/device information by channel
SELECT Channel, COUNT(*) AS total_transactions,
       SUM(CASE WHEN Location IS NULL OR TRIM(Location)='' THEN 1 ELSE 0 END) AS missing_location,
       SUM(CASE WHEN Device_Type IS NULL OR TRIM(Device_Type)='' THEN 1 ELSE 0 END) AS missing_device
FROM transactions
GROUP BY Channel
ORDER BY total_transactions DESC;

-- 10. Validate customer-transaction relationship
SELECT COUNT(*) AS transaction_rows,
       COUNT(DISTINCT Transaction_ID) AS unique_transaction_ids,
       COUNT(DISTINCT Customer_ID) AS customers_with_transactions,
       SUM(CASE WHEN c.Customer_ID IS NULL THEN 1 ELSE 0 END) AS unmatched_customer_ids
FROM transactions t
LEFT JOIN customers c ON c.Customer_ID=t.Customer_ID;

-- Suggested validation: compare total row count and total Amount_NGN in this output
-- with your Power BI Total Transactions and Total Value cards.
