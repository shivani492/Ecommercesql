# Ecommerce SQL
Advanced SQL Interview Questions &amp; Customer Analytics using CTEs, Window Functions, Aggregations, Date Functions, and Business Case Studies.

# SQL E-commerce Analytics Project

## Project Overview

This project contains advanced SQL interview questions based on an E-commerce Orders dataset. The objective is to analyze customer purchasing behavior using SQL concepts such as:

- CTEs
- Window Functions
- Aggregations
- Date Functions
- Ranking Functions
- GROUP BY
- HAVING
- Subqueries

---

## Database

Table Name

```
orders
```

Columns

| Column | Description |
|---------|-------------|
| Order_id | Unique Order ID |
| Customer_code | Customer Identifier |
| Placed_at | Order Date & Time |
| Restaurant_id | Restaurant Identifier |
| Cuisine | Cuisine Type |
| Order_status | Order Status |
| Promo_code_Name | Promo Code Used |

---

# SQL Questions

## Q1. Find the Top 3 Restaurants for each Cuisine

### Problem Statement

Find the top 3 restaurants within each cuisine based on the total number of orders.

### SQL Concepts

- GROUP BY
- COUNT()
- ROW_NUMBER()
- CTE
- PARTITION BY

---

## Q2. Find Daily New Customer Acquisition

### Problem Statement

Find how many new customers were acquired every day based on their first order date.

### SQL Concepts

- MIN()
- GROUP BY
- CTE
- COUNT()

---

## Q3. Customers Acquired in January with Only One Order

### Problem Statement

Find customers who:

- were acquired in January 2025
- placed only one order in January
- never placed another order after January.

### SQL Concepts

- GROUP BY
- HAVING
- Subquery
- NOT IN
- COUNT()

---

## Q4. Customers Inactive for the Last 7 Days

### Problem Statement

Find customers who:

- have not placed any order in the last 7 days
- were acquired more than one month ago
- used a promo code on their first order.

### SQL Concepts

- MIN()
- MAX()
- INNER JOIN
- DATEADD()
- CTE

---

## Q5. Trigger Every Third Order

### Problem Statement

The Growth Team wants to send personalized communication after every third order.

Find customers who are placing their:

- 3rd
- 6th
- 9th
- 12th
- ...

order.

### SQL Concepts

- ROW_NUMBER()
- Window Functions
- PARTITION BY
- ORDER BY
- Modulus Operator

---

# SQL Skills Demonstrated

✔ Common Table Expressions (CTEs)

✔ Window Functions

✔ ROW_NUMBER()

✔ GROUP BY

✔ HAVING

✔ Aggregate Functions

✔ Date Functions

✔ INNER JOIN

✔ Subqueries

✔ Filtering

✔ Customer Analytics

✔ Business Problem Solving

---

# Files

| File | Description |
|------|-------------|
| SQL Project Ecommerce.sql | Database creation and SQL solutions |
| README.md | Project Documentation |
| Results | Query Output Screenshots |

---

