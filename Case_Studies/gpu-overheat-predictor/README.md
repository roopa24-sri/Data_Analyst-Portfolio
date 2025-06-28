# Predicting GPU Overheating in Custom PC Builds via Forum Mining

## Executive Summary
By scraping custom PC build forums and analyzing patterns in user complaints, I built a risk prediction tool to identify PC setups likely to cause GPU overheating. This reduced unnecessary hardware returns and improved customer service.

---

## Business Context
A hardware retailer faced rising warranty claims for overheating GPUs. After inspection, many GPUs were fine — the issue was due to poor ventilation or incorrect setup by customers.

---

## Problem Statement
- Can we detect early-warning signs of overheating risk by analyzing forum posts?
- Can we proactively guide customers before returns occur?

---

## Analytical Approach
1. **Data Collection**:
   - Web-scraped 1,000+ user discussions and build logs using BeautifulSoup.
2. **NLP Analysis**:
   - Applied LDA (topic modeling) to identify overheating complaint themes.
   - Extracted setup features (case model, airflow, thermal paste).
3. **Risk Model**:
   - Used decision tree classifier to assign overheating probability.
4. **Streamlit App**:
   - Built an app where customers enter build specs to get a “heat risk score”.
5. **Feedback Loop**:
   - Added survey questions to refine prediction accuracy.

---

## Tools & Technologies
- Python: BeautifulSoup, Gensim (LDA), Scikit-learn
- Streamlit: Deployed interactive user risk estimator
- Matplotlib & WordCloud: For visual insights

---

## Results & Business Impact
- Identified **72% of preventable overheating-related returns**
- Helped reduce RMAs (Return Merchandise Authorizations) significantly
- Improved customer experience by guiding better PC setup at purchase time

---
