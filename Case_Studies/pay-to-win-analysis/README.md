# Detecting Pay-to-Win Behavior in Competitive Mobile Games

## Executive Summary
This case study evaluates the fairness of a mobile RPG game by analyzing whether high-spending players have a statistically significant advantage over non-spending players. Using gameplay metrics and player purchase tiers, I developed a fairness model that influenced balance changes in the game.

---

## Business Context
Mobile games often rely on in-app purchases for revenue. However, if paying users dominate gameplay too heavily, non-paying players may churn, affecting player retention and long-term profitability.

---

## Problem Statement
Players reported that those who spent money were consistently winning competitive matches. The game development team wanted to determine:
- Is there a measurable advantage for high-spenders?
- How much of that advantage is due to spend versus skill?

---

## Analytical Approach
1. **Data Cleaning**: Prepared datasets of player activity logs, spend tiers, match win/loss records.
2. **Segmentation**: Categorized users into 4 spend tiers: Free, Low, Mid, High.
3. **Statistical Testing**:
   - Used **ANOVA** to test win rate differences between tiers.
   - Controlled for confounding variables (e.g., player level, time spent).
4. **Regression Analysis**:
   - Built a multivariate regression model to predict win rates.
   - Included spend amount, match frequency, and skill metrics as features.
5. **Visualization**:
   - Designed a Power BI dashboard to showcase imbalance and trends.

---

## Tools & Technologies
- Python: Pandas, NumPy, Seaborn, Scikit-learn
- Power BI: KPI cards, box plots, leaderboard trends
- Statistical Tests: ANOVA, Linear Regression

---

## Results & Business Impact
- Found that **High spenders had a 17% higher win rate**, even after controlling for skill.
- Presented insights to the game designers → **game rebalance patch was implemented**.
- Improved player retention by reducing churn among free users.
- Boosted long-term monetization strategy through fairer competition mechanics.

---
