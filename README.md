## Sales Analysis (SQL + Power BI)

## About This Project

I worked on this project to practice and showcase my skills in **SQL and Power BI** by analyzing a sales dataset. The goal was simple: take raw data and turn it into useful insights that can actually help in decision-making.

Instead of just writing queries, I focused on understanding the story behind the data — like what sells the most, when sales are highest, and which locations perform better.

---

## What I Did

### 🔹 Data Analysis in SQL

I used SQL Server to clean and analyze the dataset. Some of the key things I worked on:

* Tracked **monthly revenue trends**
* Calculated **month-over-month growth** using window functions (`LAG`)
* Identified **top-selling products**
* Found **high-revenue but low-sales products (premium items)**
* Analyzed **sales by city**
* Studied **street-level order patterns** by extracting street names from full addresses
* Looked at **hourly sales patterns**
* Calculated **average spending per order**

One interesting part was working with messy address data and breaking it down to get meaningful insights from it.

---

### 🔹 Street-Level Analysis (Highlight)

The dataset had full purchase addresses, so I extracted **street names using SQL string functions**.

This allowed me to:

* See which streets had the **highest number of orders**
* Understand **micro-level demand patterns**
* Go beyond city-level analysis into more detailed location insights

It was a small step, but it shows how raw text data can be turned into something useful.

---

### 🔹 Dashboard in Power BI

After the SQL analysis, I built an interactive dashboard in Power BI to visualize the results.

The dashboard includes:

* **KPIs** (Total Revenue, Orders, Quantity, Avg Order Value)
* **Sales trend by month**
* **Revenue by city (treemap)**
* **Product performance (scatter + bar chart)**
* **Sales by hour**
* Filters for **date, product, and city**

The idea was to make it easy for anyone to quickly explore the data and get insights.

---

## Key Insights

* Sales are not consistent every month — there are clear peaks and drops
* A few products contribute a big portion of total revenue
* Some products sell less but generate high revenue (premium category)
* Certain cities perform much better than others
* Street-level analysis shows clusters of high order activity
* Sales tend to peak at specific hours of the day
* Average order value gives a good idea of customer spending behavior

---

## Tools Used

* MYSQL
* Power BI

---

## What I Learned

This project really helped me improve my practical skills. I got comfortable with:

* Writing complex SQL queries (CTEs, window functions, ranking)
* Handling and transforming raw text data (like addresses)
* Thinking in terms of business insights, not just data
* Designing clean and interactive dashboards in Power BI
* Writing complex SQL queries (CTEs, window functions, ranking)
* Handling and transforming raw text data (like addresses)
* Thinking in terms of business insights, not just data
* Designing clean and interactive dashboards in Power BI


