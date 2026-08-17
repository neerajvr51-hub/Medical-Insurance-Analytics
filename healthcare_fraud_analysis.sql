USE healthcare_db;
SELECT * 
FROM healthcare_fraud
LIMIT 10;

-- Q1. What is the overall claims and payment performance?
SELECT
	COUNT(*) AS total_claims,
    ROUND(SUM(Claim_Amount),2) AS total_claim_amount,
    ROUND(SUM(Approved_Amount),2) AS total_approved_amount,
    ROUND(SUM(Unapproved_Amount),2) AS total_unapproved_amount,
    ROUND(AVG(Approval_Rate),2) AS avg_approval_rate
FROM healthcare_fraud;

-- Q2. Is rejected claims still getting paid?
SELECT 
	Claim_Status,
    ROUND(SUM(Claim_Amount),2) AS rejected_claim_amount,
    ROUND(SUM(Approved_Amount),2) AS rejected_claim_approved_amount
FROM healthcare_fraud
WHERE Claim_Status = 'Rejected'
GROUP BY Claim_Status;

-- Q3. What is the extent of potential fraud in the claims portfolio?
SELECT
    Is_Fraud,
    COUNT(*) AS claim_count,
    ROUND(SUM(Claim_Amount),2) AS claim_amount,
    ROUND(SUM(Approved_Amount),2) AS approved_amount
FROM healthcare_fraud
GROUP BY Is_Fraud;

-- Q4. Which providers show unusually high fraud rates?
SELECT
    Provider_ID,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN Is_Fraud = 1 THEN 1 ELSE 0 END) AS fraudulent_claims,
    ROUND(
        100.0 * SUM(CASE WHEN Is_Fraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS fraud_rate,
    ROUND(SUM(Claim_Amount),2) AS total_claim_amount
FROM healthcare_fraud
GROUP BY Provider_ID
HAVING COUNT(*) >= 10
ORDER BY fraud_rate DESC;

-- Q5. Which provider specialties have higher fraud exposure?
SELECT
	Provider_Specialty,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraudulent_claims,
    ROUND(
		100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)/COUNT(*),2)
        AS fraud_rate
FROM healthcare_fraud
GROUP BY Provider_Specialty
ORDER BY fraud_rate DESC;

-- Q6. Which insurance types and visit types show higher fraud rates?
SELECT
	Insurance_Type,
    Visit_Type,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraudulent_claims,
    ROUND(
		100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)/COUNT(*),2)
        AS fraud_rate
FROM healthcare_fraud
GROUP BY Insurance_Type, Visit_Type
ORDER BY fraud_rate DESC;

-- Q7. Which fraudulent claims should be prioritized for investigation?
SELECT
	Claim_ID,
    Provider_ID,
    Claim_Amount,
    Approved_Amount,
    ROUND(Unapproved_Amount,2) AS Unapproved_Amount,
    Approval_Rate,
    Is_Fraud
FROM healthcare_fraud
WHERE is_fraud = 1
ORDER BY Claim_Amount DESC
LIMIT 20;

-- Q8. How does fraud activity change over time?
SELECT
	Submission_Month,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraudulent_claims,
    ROUND(
		100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)/COUNT(*),2)
        AS fraud_rate,
	SUM(Claim_Amount) AS total_claim_amount
FROM healthcare_fraud
GROUP BY Submission_Month
ORDER BY Submission_Month;