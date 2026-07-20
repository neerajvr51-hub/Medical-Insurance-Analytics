# Healthcare Fraud & Operational Risk Analysis

## 📌 Project Overview
This is my data analytics project where I analyzed 10,000 healthcare insurance claims to find fraud patterns and system mistakes. I used **Python** to clean the data and do the basic analysis, and then built an interactive dark-mode dashboard in **Power BI** to show the final insights.

---

## 🚀 Main Insights I Found

### 1. The System Loophole (Big Leakage)
* Overall fraud rate in the data is **8.29%**. 
* But when I filtered by **"Rejected"** claims, the fraud rate jumped to **23.11%**! 
* Also, these rejected claims still have approved payout amounts. This means there is a big bug in the IT system—it is releasing money even when a claim fails validation.

### 2. High-Risk Providers (Bad Actors)
* Using a Matrix table in Power BI, I sorted the data to find the exact doctors/providers doing the most fraud. 
* For example, **Provider P0086** has a **42.1% fraud rate** across 38 claims. We can target them directly instead of checking everyone.

### 3. Department Wise Trend
* Fraud is almost the same (around 7% to 9.7%) across all medical departments (Cardiology, Orthopedics, etc.). 
* This proves that fraud is not a department-wide problem, but it is driven by a few specific bad individuals.

---

## 🛠️ Tools & What I Did

* **Python (Pandas & NumPy):** 
  * Filled missing values as `"Unknown"` because deleting them could lose important fraud signals.
  * Extracted year and month names from the claim date column.
  * Created a new column called `Amount_Gap` (Claim Amount minus Approved Amount) to track extra billing.
* **Power BI & DAX:**
  * Wrote custom DAX formulas to calculate the dynamic fraud percentages.
  * Built a clean Dark Mode Dashboard for easy reading.
  * Fixed the month sorting issue so the line chart flows correctly from January to December.

---

## 📊 Dashboard Preview
<img width="1448" height="806" alt="Screenshot 2026-07-20 211900" src="https://github.com/user-attachments/assets/1504c216-4da0-4315-a32c-a9f50fb993fc" />










## 💡 Simple Business Suggestions
1. **Fix the IT Bug:** Immediately stop the payment system from releasing money if the claim status says "Rejected".
2. **Block Bad Providers:** Directly blacklist or audit the top 5 highest-risk providers (like P0086) to save company money instantly.
