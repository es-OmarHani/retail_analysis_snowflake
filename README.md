# 🛒 Retail Analytics with dbt Cloud & Snowflake

This project showcases a complete data transformation pipeline using **dbt Cloud** connected to **Snowflake**, enabling clean, modular analytics for a fictional retail business.

We leverage dbt Cloud to build scalable data models, transform raw data into actionable insights, and support business intelligence use cases like customer segmentation and monthly sales performance.

---

## 🚀 What We Did

- **Connected dbt Cloud to Snowflake** as the data warehouse.
- Created **source models** for raw retail data (customers, products, stores, and sales).
- Built **staging models** to clean and standardize data.
- Developed **marts** for business reporting:
  - **Customer segmentation** based on total purchases.
  - **Monthly sales summaries** with key metrics like revenue and transaction counts.

---

## 🔧 Tools Used

- **dbt Cloud** – for development, version control (with Git), and production jobs
- **Snowflake** – as the cloud data warehouse
- **SQL** – for modeling, transformations, and testing

---

## 📊 Key Analytics Features

| Feature                  | Description                                              |
|--------------------------|----------------------------------------------------------|
| Customer Segmentation    | Classifies customers as High, Medium, or Low value       |
| Monthly Sales Summary    | Aggregated sales, order count, and average per order     |
| Dimensional Modeling     | Clean `dim_` and `fct_` tables for reporting             |

---

## ✅ How to Use

1. **Connect dbt Cloud to your Snowflake account**
2. **Run or schedule jobs** directly in dbt Cloud interface
3. **Analyze models** in your BI tool or with SQL queries (e.g. Looker, Mode, Sigma)

---

## 🚀 Using dbt

Once setup is complete:

```bash
dbt run            # Run all models
dbt docs generate  # Build docs
dbt docs serve     # View docs in browser
```

---

## ✍️ Author & License

Developed by **Omar Elshanawany**  
License: [MIT](LICENSE).

---
