Healthcare Claims Fraud & Payment Risk Analysis

Project Overview

Healthcare insurance companies process a large number of claims every day. Some claims may show unusual patterns or potential fraud, which can lead to unnecessary payments and financial losses.

This project analyzes healthcare claims data to:

Understand overall claims and payment performance

Identify areas with higher potential fraud exposure

Compare fraud patterns across providers, specialties, insurance types and visit types

Prioritize high-value flagged claims for further investigation

Note: This project identifies potential fraud patterns for review. It does not prove that a claim or provider is fraudulent.

Business Problem

The business needs a simple way to understand claims and payment patterns and identify where potential fraud exposure is concentrated.

The analysis answers:

What is the overall claims and payment performance?

Are rejected claims associated with any approved payment amount?

What is the extent and financial impact of potential fraud?

Which providers show unusually high fraud rates?

Which provider specialties have higher fraud exposure?

Which insurance and visit-type combinations show higher fraud rates?

Which high-value fraudulent claims should be prioritized for investigation?

How does fraud activity change over time?

Dataset

The dataset contains 10,000 healthcare claims with 20 original columns.

Key fields include:

Claim_ID

Provider_ID

Claim_Amount

Approved_Amount

Claim_Status

Is_Fraud

Provider_Specialty

Insurance_Type

Visit_Type

Claim_Date

Submission_Month

Tools Used

Tool

Purpose

Python / Pandas

Data audit, cleaning and simple feature engineering

MySQL

Business analysis and SQL queries

Power BI

Dashboard and visualization

Project Flow: Python → SQL → Power BI

Python Analysis

The data was checked for:

Dataset structure

Missing values

Duplicate Claim IDs and records

Categorical values

Numerical fields and unusual values

Approved Amount greater than Claim Amount

Negative Claim Amount values

Simple Feature Engineering

Only a few useful fields were created:

Unapproved_Amount = Claim Amount − Approved Amount

Approval_Rate = Approved Amount / Claim Amount × 100

Submission_Month = Month extracted from the claim submission date

No machine-learning model or artificial fraud-risk score was created.

SQL Analysis

SQL was used to answer business questions covering:

Overall claims and payment performance

Rejected claims and approved payments

Potential fraud level and financial impact

Provider fraud rates

Specialty fraud exposure

Insurance and visit-type fraud rates

High-value fraudulent claims

Monthly fraud trends

For provider analysis, a minimum of 10 claims per provider was used so very small claim volumes were not treated as strong risk signals.

Key Findings

10,000 claims were analyzed.

Total submitted claim amount is approximately $5.73M.

Total approved amount is approximately $4.76M.

Average approval rate is approximately 84.9%.

829 claims are flagged as potential fraud, around 8.3% of all claims.

Flagged claims have approximately $821K in total claim amount and approximately $453K in approved amount.

1,748 claims have a Rejected status, while the data shows approximately $832.8K of approved amount against these claims. This should be reviewed as a possible data or process issue.

Among providers with at least 10 claims, P0086 has the highest fraud rate at approximately 42.1%, with 16 fraudulent claims out of 38.

General Practice has the highest fraud rate among the listed specialties at approximately 9.7%.

The highest-value flagged claim is C0000507, from provider P0101, with a claim amount of approximately $6,590.70.

Power BI Dashboard

The Power BI report contains 2 pages.

Page 1 — Claims & Fraud Overview

Includes:

Total Claims

Total Claim Amount

Total Approved Amount

Fraudulent Claims

Fraud Rate

Claim Status Distribution

Monthly Claims & Fraud Trend

Fraud Rate by Provider Specialty

Fraud Rate by Insurance Type

Submission Month and Claim Status filters

Page 2 — Provider Risk & Investigation

Includes:

Provider Risk Table

Provider Risk Scatter Plot

Fraud Rate by Insurance & Visit Type

Top 10 High-Value Fraudulent Claims

Page 1 - Claims & Fraud Overview

<img width="1476" height="808" alt="Screenshot 2026-08-17 214505" src="https://github.com/user-attachments/assets/f2872234-783a-4a92-8ac4-d102f7ef2320" />

Page 2 - Provider Risk & Investigation

<img width="1429" height="801" alt="Screenshot 2026-08-17 214639" src="https://github.com/user-attachments/assets/23a6caad-c8ec-4a3a-96d4-26dbc39be43c" />

Business Recommendations

Review providers with high fraud rates and enough claim volume.

Prioritize high-value flagged claims for manual review.

Review rejected claims that still show approved payment amounts.

Monitor specialties and insurance/visit-type combinations with higher fraud rates.

Use the dashboard as a monitoring and investigation-support tool, not as proof of fraud.

Project Structure

Healthcare-Claims-Fraud-Analysis/
│
├── data/
│   └── healthcare_fraud_detection.csv
│
├── python/
│   └── Healthinsurance_fraud_analysis.ipynb
│
├── sql/
│   └── healthcare_fraud_analysis.sql
│
├── powerbi/
│   └── healthcare_fraud_dashboard.pbix
│
├── report/
│   └── Healthcare_Claims_Fraud_Business_Report.docx
│
└── README.md

What I Learned

Through this project, I practiced:

Data cleaning using Python/Pandas

Basic feature engineering

SQL aggregation and conditional logic

Provider-level analysis

Fraud-rate calculations

Business-focused data analysis

Power BI dashboard design

Turning analysis into simple business recommendations

Conclusion

This project demonstrates a complete Data Analyst workflow:

Python → SQL → Power BI → Business Insights

