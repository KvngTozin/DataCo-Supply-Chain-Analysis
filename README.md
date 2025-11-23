# 📦 DataCo supply Chain Analysis - Data Analysis & ML Project

This project delivers a comprehensive analysis of order deliveries, aiming to help businesses **identify late deliveries and understand the factors driving them**.  
It combines **interactive dashboards** for delivery performance insights with **machine learning** to identify the key features influencing late deliveries, enabling proactive operational decisions.

---

## 🛠 Tools and Technologies

- **SQL**: Extracted, joined, and aggregated data from multiple tables to create a clean dataset.  
- **Excel**: Cleaned and preprocessed data.
- **Tableau**: Built an **interactive dashboard** displaying KPIs, delivery performance, and geographic insights with dropdown filters for country and date.  
- **R (Random Forest)**: Developed a machine learning model to predict **late delivery risk** and visualize feature importance driving late deliveries.

---

## 🎯 Objectives

- Visualize delivery performance through interactive dashboards  
- Explore delivery patterns across time and geography  
- Highlight late delivery occurrences and trends  
- Predict high-risk orders using machine learning  
- Identify actionable insights to reduce late deliveries

---

## 🔍 Process / Methodology

### 1. Tableau Dashboard

- **KPIs**: Total Sales, Total Profit, Number of Orders, Percentage of Delivered Late Orders  
- **Visualizations**:  
  - Sales over time (daily, monthly, yearly)  
  - Sales per country  
  - Delivery status comparison (revealed late deliveries are most frequent)  
- **Interactivity**: Dropdowns for **Country** and **Date** (day/month/year) to explore specific segments  

### 2. Machine Learning (R - Random Forest)

- **Target**: Late_delivery_risk (1 = late, 0 = on-time)  
- **Features**: Only pre-delivery metrics such as Shipping Mode, Order Quantity, Product Price, Customer Country, etc. (avoiding data leakage)  
- **Output**: Single **feature importance visualization** highlighting the factors most responsible for late deliveries  

---

## 📈 Key Insights

- **Shipping Mode** is the strongest driver of late deliveries — standard shipping orders are far more likely to be late.  
- Certain **customer regions** consistently have higher late delivery occurrences.  
- Higher order quantities and total order value slightly increase late delivery risk.  
- ML visualization helps **identify orders at risk before shipping**, allowing proactive interventions.

---

## 🧭 Recommendations

1. **Encourage Faster Shipping**  
   - Offer discounts or incentives for customers to choose express shipping.  

2. **Optimize Standard Shipping Processes**  
   - Prioritize high-risk orders and collaborate with carriers to reduce delays.  

3. **Proactive Risk Management Using ML**  
   - Use the model to flag high-risk orders for intervention before shipment.  

4. **Targeted Customer Communication**  
   - Notify customers of potential delays to manage expectations and improve trust.  

5. **Focus on High-Risk Regions**  
   - Review logistics and inventory strategies for areas with frequent late deliveries.  

---

## 🖼 Dashboard & ML Visualization 
> <img width="858" height="452" alt="dataco1" src="https://github.com/user-attachments/assets/c0e5c862-188c-41d5-aa02-35656c198a45" />

---

<img width="887" height="454" alt="dataco2" src="https://github.com/user-attachments/assets/50c68906-dc95-40ca-9369-509f871cbfb0" />

---

<img width="780" height="402" alt="dataco3" src="https://github.com/user-attachments/assets/3d6c2319-25af-4220-8b68-0049c4a84afc" />

---

<img width="780" height="413" alt="dataco4" src="https://github.com/user-attachments/assets/656a2c42-4eca-449e-a05b-0babc4812462" />

---
## ML Visualization to highlight key reasons 

<img width="780" height="654" alt="dataco5" src="https://github.com/user-attachments/assets/f9be62f2-6be4-4e2f-a209-bac35eb97b2b" />
