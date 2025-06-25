# Rural Loan Fraud Detection via Collateral Consistency Modeling

## Executive Summary
This project tackles financial fraud in micro-loans by applying NLP and fuzzy matching techniques to detect inconsistencies in collateral declarations across rural branches. Results improved fraud detection workflows and protected loan capital.

---

## Business Context
In rural areas, collateral details are manually recorded, often in free-text. Fraudsters may reuse asset descriptions (like the same motorbike or land) across multiple loans in different districts to gain multiple approvals.

---

## Problem Statement
- How can we detect repeated or vague collateral claims across applications?
- Can we assign a “fraud likelihood score” to each loan application?

---

## Analytical Approach
1. **Data Preparation**:
   - Cleaned text data from thousands of loan forms, including asset descriptions and locations.
2. **Text Normalization**:
   - Removed stopwords, special characters, spelling variations.
3. **Fuzzy Matching**:
   - Applied string similarity algorithms (e.g., Levenshtein distance, cosine similarity) to flag duplicates.
4. **Geospatial Overlay**:
   - Compared claim patterns across GPS-tagged branches.
5. **Scoring Model**:
   - Assigned fraud probability using similarity + unusual frequency scores.
6. **Visualization**:
   - Created a Tableau dashboard to let field officers filter and investigate.

---

## Tools & Technologies
- Python: spaCy, FuzzyWuzzy, TextBlob
- SQL: Joins + filters across branch IDs
- Tableau: Interactive dashboard for fraud flagging

---

## Results & Business Impact
- Flagged over **200 high-risk loans** with reused or vague assets.
- Protected over **₹45 lakhs** in loan capital in 3 regions.
- Enabled better internal compliance and risk assessment in rural banking.

---
