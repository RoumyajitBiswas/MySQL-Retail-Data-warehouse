CREATE DATABASE silver_retail_datawarehouse;
USE silver_retail_datawarehouse;

CREATE TABLE silver_categories AS
SELECT DISTINCT
    CAST(category_id AS UNSIGNED) AS category_id,
    TRIM(category_name) AS category_name
FROM bronze_retail_datawarehouse.bronze_categories
WHERE category_id IS NOT NULL;

CREATE TABLE silver_customers AS
SELECT DISTINCT
    CAST(customer_id AS UNSIGNED) AS customer_id,
    TRIM(city) AS city,
    STR_TO_DATE(signup_date,'%Y-%m-%d') AS signup_date
FROM bronze_retail_datawarehouse.bronze_customers
WHERE customer_id IS NOT NULL;

CREATE TABLE silver_employees AS
SELECT DISTINCT
    CAST(employee_id AS UNSIGNED) AS employee_id,
    CAST(store_id AS UNSIGNED) AS store_id,
    CAST(salary AS DECIMAL(10,2)) AS salary
FROM bronze_retail_datawarehouse.bronze_employees
WHERE employee_id IS NOT NULL;

CREATE TABLE silver_order_items AS
SELECT DISTINCT
    CAST(order_item_id AS UNSIGNED) AS order_item_id,
    CAST(order_id AS UNSIGNED) AS order_id,
    CAST(product_id AS UNSIGNED) AS product_id,
    CAST(qty AS UNSIGNED) AS qty,
    CAST(price AS DECIMAL(10,2)) AS price
FROM bronze_retail_datawarehouse.bronze_order_items
WHERE order_item_id IS NOT NULL;

CREATE TABLE silver_orders AS
SELECT DISTINCT
    CAST(order_id AS UNSIGNED) AS order_id,
    CAST(customer_id AS UNSIGNED) AS customer_id,
    CAST(store_id AS UNSIGNED) AS store_id,
    STR_TO_DATE(order_date,'%Y-%m-%d') AS order_date,
    CAST(promotion_id AS UNSIGNED) AS promotion_id
FROM bronze_retail_datawarehouse.bronze_orders
WHERE order_id IS NOT NULL;

CREATE TABLE silver_payments AS
SELECT DISTINCT
    CAST(payment_id AS UNSIGNED) AS payment_id,
    CAST(order_id AS UNSIGNED) AS order_id,
    CAST(amount AS DECIMAL(10,2)) AS amount
FROM bronze_retail_datawarehouse.bronze_payments
WHERE payment_id IS NOT NULL;

CREATE TABLE silver_products AS
SELECT DISTINCT
    CAST(product_id AS UNSIGNED) AS product_id,
    CAST(category_id AS UNSIGNED) AS category_id,
    CAST(supplier_id AS UNSIGNED) AS supplier_id,
    CAST(price AS DECIMAL(10,2)) AS price
FROM bronze_retail_datawarehouse.bronze_products
WHERE product_id IS NOT NULL;

CREATE TABLE silver_promotions AS
SELECT DISTINCT
    CAST(promotion_id AS UNSIGNED) AS promotion_id,
    CAST(discount AS DECIMAL(5,2)) AS discount
FROM bronze_retail_datawarehouse.bronze_promotions
WHERE promotion_id IS NOT NULL;

CREATE TABLE silver_returns AS
SELECT DISTINCT
    CAST(return_id AS UNSIGNED) AS return_id,
    CAST(order_item_id AS UNSIGNED) AS order_item_id,
    CAST(refund AS DECIMAL(10,2)) AS refund
FROM bronze_retail_datawarehouse.bronze_returns
WHERE return_id IS NOT NULL;

CREATE TABLE silver_shipments AS
SELECT DISTINCT
    CAST(shipment_id AS UNSIGNED) AS shipment_id,
    CAST(order_id AS UNSIGNED) AS order_id,
    TRIM(status) AS status
FROM bronze_retail_datawarehouse.bronze_shipments
WHERE shipment_id IS NOT NULL;

CREATE TABLE silver_stores AS
SELECT DISTINCT
    CAST(store_id AS UNSIGNED) AS store_id,
    TRIM(city) AS city
FROM bronze_retail_datawarehouse.bronze_stores
WHERE store_id IS NOT NULL;

CREATE TABLE silver_suppliers AS
SELECT DISTINCT
    CAST(supplier_id AS UNSIGNED) AS supplier_id,
    TRIM(country) AS country
FROM bronze_retail_datawarehouse.bronze_suppliers
WHERE supplier_id IS NOT NULL;