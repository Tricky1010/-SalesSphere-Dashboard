CREATE DATABASE SalesSphere;
USE SalesSphere;

 # SALES ANALYSIS QUERIES — FOR DATA ANALYSTS
 #  1. Profit by Region -
 SELECT Region, SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY Region
ORDER BY Total_Profit DESC;

## Insight : profit by Region
# The **West** region is the most profitable, generating ₹1.06 Lakhs in total profit, followed by the **East** region. However, the **South and Central** regions are underperforming significantly, with less than ₹50k in total profit.
# **Recommendation:**  
# Focus marketing and sales efforts more in West & East to boost already profitable zones.  
# Investigate causes of low profit in South & Central — possibly high discounts, low demand, or supply chain issues.

# 2. Top 5 Most Profitable Cities  - 
SELECT City, SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 5;

## Insight: Top 5 Profitable Cities -

# New York City** is by far the most profitable city, contributing over ₹61k in profit, which is more than double that of the second city **Los Angeles**. Other key cities include **Seattle**, **San Francisco**, and **Detroit**.
# Recommendation:**
# Prioritize inventory, delivery speed, and customer experience in New York City.
# These 5 cities can be prime targets for future expansion, loyalty programs, or regional campaigns.

#  3. Sales by Category + Sub-Category - 
SELECT Category, `Sub-Category`, SUM(Sales) AS Total_Sales
FROM superstore_cleaned
GROUP BY Category, `Sub-Category`
ORDER BY Total_Sales DESC;

## Insight: Sales by Category and Sub-Category -

# Phones** (₹3.29L) and **Chairs** (₹3.28L) are the two highest-selling sub-categories, followed by **Storage**, **Tables**, and **Binders**. Technology and Furniture categories dominate the top 5 spots.
# Recommendation:**
# Ensure consistent stock and supply for Phones & Chairs.
# Push marketing campaigns for high performers like Phones & Storage.
#Analyze margins to see if high sales = high profits (align with Query 1 output).

#  4. Discount vs Profit Impact -
SELECT Discount, AVG(Profit) AS Avg_Profit
FROM superstore_cleaned
GROUP BY Discount
ORDER BY Discount;

## Insight: Impact of Discount on Profit -

# Profitability **decreases sharply** as discounts increase.  
# Discounts up to **0.2 (20%)** still yield **positive average profit**
# Discounts beyond **0.3 (30%)** turn profit negative
# Highest loss seen at **0.5 (50%)**, where avg profit = -₹310.70

# **Recommendation:**
# Avoid offering discounts > 20% unless necessary
# Consider alternate strategies like **cashback**, **bundle offers**, or **membership perks** to maintain margins
# This analysis can be shared with sales/promo teams to redesign discount structures


#5. Monthly Sales Trend - 
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month, SUM(Sales) AS Monthly_Sales
FROM superstore_cleaned
GROUP BY Month
ORDER BY Month;

## Insight: Monthly Sales Trend -

# Sales are **seasonal** with clear spikes in **September, November, and December**, indicating strong **Q4 performance** — likely due to holiday shopping or promotional campaigns.

# **Recommendation:**
# Plan inventory and marketing budgets to align with Q4 surge
# Use this trend for forecasting and optimizing staffing during high-demand months
# Run campaigns in August to build momentum before the surge


# 6. Category-wise Quantity Sold - 
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM superstore_cleaned
GROUP BY Category
ORDER BY Total_Quantity DESC;

## Insight: Quantity Sold by Category -

# Office Supplies** are sold in the highest quantity (21,990 units), followed by **Furniture** (7,855 units) and **Technology** (6,904 units). Despite lower prices, Office Supplies move at high volume.

# **Recommendation:**
# Office Supplies can be leveraged for volume-driven promotions or bulk sale bundles.
# Cross-sell opportunities: Offer discounts on Furniture/Tech with large Office Supplies orders.
# Evaluate profit margins to ensure high volume ≠ low value.



