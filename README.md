# 🏪 MySQL Retail Data Warehouse

An end-to-end **retail data warehouse project built entirely with MySQL**, demonstrating how raw CSV data can be transformed into a structured analytical warehouse using a **Bronze → Silver → Gold architecture**, dimensional modeling, a **Star Schema**, and a dedicated **Sales Mart**.

The project is designed to demonstrate practical SQL, ETL, data cleaning, data modeling, and analytical skills used in real-world data engineering and data analytics workflows.

---

## 📌 Project Overview

Retail businesses generate large amounts of transactional data across customers, products, employees, orders, payments, promotions, and categories.

The goal of this project is to transform raw retail CSV datasets into a clean and analytics-ready data warehouse.

The complete pipeline is:

```text
Raw CSV Files
      ↓
Bronze Layer
      ↓
Silver Layer
      ↓
Gold Layer
      ↓
Star Schema
      ↓
Fact & Dimension Tables
      ↓
Sales Mart
      ↓
Retail Analytics
```

The entire data warehouse is implemented using **MySQL**.

---

## 🎯 Project Objectives

* Build an end-to-end retail data warehouse using MySQL
* Implement a Bronze-Silver-Gold data architecture
* Load raw CSV datasets into MySQL
* Clean and transform raw data using SQL
* Handle data types and date conversions
* Apply data quality transformations
* Build reusable dimension tables
* Build a centralized sales fact table
* Implement a Star Schema
* Create a Sales Mart for analytical queries
* Demonstrate practical SQL and ETL skills
* Create a portfolio project suitable for data analytics and data engineering roles

---

## 🏗️ Data Warehouse Architecture

```text
                    ┌─────────────────┐
                    │   CSV DATASETS  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  BRONZE LAYER   │
                    │   Raw Data      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  SILVER LAYER   │
                    │ Cleaned &       │
                    │ Transformed Data│
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   GOLD LAYER    │
                    │ Dimensions +    │
                    │ Fact Tables     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   STAR SCHEMA   │
                    │                 │
                    │ Dimensions      │
                    │      ↓          │
                    │   Fact Sales    │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   SALES MART    │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    ANALYTICS    │
                    └─────────────────┘
```

---

# 🥉 Bronze Layer

The Bronze layer stores the raw data as it is received from the source CSV files.

The objective is to preserve the original source data before applying transformations.

### Bronze database

```text
bronze_retail_datawarehouse
```

### Bronze tables

```text
bronze_categories
bronze_customers
bronze_employees
bronze_order_items
bronze_orders
bronze_payments
bronze_products
bronze_promotions
```

### Main operations

* Database creation
* Table creation
* Raw CSV ingestion
* Source data preservation
* Initial data validation

CSV files are loaded into MySQL using:

```sql
LOAD DATA LOCAL INFILE
```

---

# 🥈 Silver Layer

The Silver layer contains cleaned and transformed versions of the Bronze data.

This layer prepares the data for dimensional modeling.

### Main transformations

* Data type conversion
* Date parsing
* Handling missing values
* Standardizing text values
* Removing or managing invalid records
* Data cleansing
* Column transformation
* Data validation

Example transformations include functions such as:

```sql
STR_TO_DATE()
COALESCE()
LEFT()
SUBSTRING()
CONCAT()
CAST()
```

The Silver layer acts as the bridge between raw source data and the analytical Gold layer.

---

# 🥇 Gold Layer

The Gold layer contains business-ready data structures designed for analytics.

The project uses dimensional modeling to organize the warehouse into dimensions and fact tables.

### Dimension tables

```text
dim_customers
dim_products
dim_stores
dim_promotions
dim_employees
dim_date
```

### Fact table

```text
fact_sales
```

### Sales Mart

```text
sales_mart
```

---

# ⭐ Star Schema

The Gold layer follows a Star Schema design.

```text
                    dim_date
                       │
                       │
dim_customers ──── fact_sales ──── dim_products
                       │
                       │
                dim_promotions
                       │
                       │
                  dim_stores
                       │
                       │
                 dim_employees
```

The central `fact_sales` table stores measurable business events, while the surrounding dimension tables provide descriptive information for analysis.

---

## 📊 Fact Table

### `fact_sales`

The sales fact table represents individual sales transactions and connects transactional measures with descriptive dimensions.

Typical analytical measures include:

* Quantity
* Unit price
* Sales amount
* Discount
* Total sales
* Transaction-level metrics

The fact table is designed to support analytical queries across customers, products, stores, employees, promotions, and dates.

---

# 📚 Dimension Tables

### `dim_customers`

Contains customer-related attributes used to analyze customer purchasing behavior.

### `dim_products`

Contains product information used for product-level sales analysis.

### `dim_stores`

Contains store-related information used for geographical and store-level analysis.

### `dim_promotions`

Contains promotional information used to analyze the impact of promotions on sales.

### `dim_employees`

Contains employee information used for employee and sales-performance analysis.

### `dim_date`

Provides a reusable calendar dimension for time-based analysis such as:

* Year
* Quarter
* Month
* Day
* Week
* Day of week

---

# 🛒 Sales Mart

The `sales_mart` provides a simplified analytical layer on top of the warehouse.

Instead of repeatedly joining multiple warehouse tables, analytical queries can use the Sales Mart to efficiently explore retail performance.

Possible analytical questions include:

```text
• What are total sales by month?
• Which products generate the most revenue?
• Which customers purchase the most?
• Which stores generate the highest sales?
• What are the most popular product categories?
• How do promotions affect sales?
• What are the sales trends over time?
• Which employees are associated with the highest sales?
```

---

# 🛠️ Technologies Used

| Technology      | Purpose                           |
| --------------- | --------------------------------- |
| MySQL 8.x       | Database & data warehouse         |
| SQL             | ETL, transformation & analytics   |
| CSV             | Source datasets                   |
| MySQL Workbench | Database development & management |
| Git             | Version control                   |
| GitHub          | Project repository                |

---

# 📁 Project Structure

Recommended repository structure:

```text
mysql-retail-data-warehouse/
│
├── Data/
│   └── Retail/
│       ├── categories.csv
│       ├── customers.csv
│       ├── employees.csv
│       ├── order_items.csv
│       ├── orders.csv
│       ├── payments.csv
│       ├── products.csv
│       └── promotions.csv
│
├── Scripts/
│   ├── Bronze/
│   │   ├── create_bronze_tables.sql
│   │   └── load_bronze_data.sql
│   │
│   ├── Silver/
│   │   └── silver_transformations.sql
│   │
│   └── Gold/
│       ├── create_dimensions.sql
│       ├── create_fact_sales.sql
│       └── create_sales_mart.sql
│
├── README.md
└── LICENSE
```

You should adjust the filenames/folders to match your actual project files.

---

# 🔄 ETL Process

## 1. Extract

Raw retail data is provided through CSV datasets.

```text
CSV Files
   ↓
MySQL
```

---

## 2. Load

The raw datasets are loaded into Bronze tables using MySQL.

```sql
LOAD DATA LOCAL INFILE
```

This preserves the source data before transformations are applied.

---

## 3. Transform

Data is cleaned and transformed in the Silver layer.

Examples:

```sql
CAST()
STR_TO_DATE()
COALESCE()
LEFT()
SUBSTRING()
CONCAT()
```

---

## 4. Model

The cleaned data is transformed into business-friendly dimensions and facts.

```text
Silver
  ↓
Dimensions
  +
Fact Sales
  ↓
Star Schema
```

---

## 5. Analyze

The Sales Mart provides an analytical layer for answering business questions.

```text
Sales Mart
    ↓
Business Analysis
    ↓
Insights
```

---

# 🧠 SQL Concepts Demonstrated

This project demonstrates practical SQL concepts including:

* Database creation
* Table creation
* Primary keys
* Foreign keys
* Constraints
* Data types
* `LOAD DATA LOCAL INFILE`
* `SELECT`
* `WHERE`
* `JOIN`
* `LEFT JOIN`
* `INNER JOIN`
* `GROUP BY`
* `ORDER BY`
* Aggregate functions
* `CASE`
* `COALESCE`
* String functions
* Date functions
* Type conversion
* Subqueries
* Common Table Expressions
* Data cleaning
* Data transformation
* Dimensional modeling
* Fact and dimension design
* Star Schema

---

# 📈 Business Value

This project demonstrates how raw transactional data can be converted into an analytical data warehouse that supports business reporting and decision-making.

The architecture separates:

```text
Raw Data
   ↓
Clean Data
   ↓
Business Data
   ↓
Analytics
```

This makes the data easier to maintain, understand, query, and analyze.

---

# 💡 Key Learning Outcomes

Through this project, I practiced:

* Designing a relational data warehouse
* Building an ETL pipeline using SQL
* Working with large datasets
* Cleaning raw data
* Handling dates and data types
* Creating dimensions and fact tables
* Implementing a Star Schema
* Building analytical data marts
* Writing business-oriented SQL queries
* Structuring a real-world data engineering project

