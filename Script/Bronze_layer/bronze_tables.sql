CREATE DATABASE bronze_retail_datawarehouse;
USE bronze_retail_datawarehouse;


CREATE TABLE bronze_categories (
    category_id VARCHAR(50),
    category_name VARCHAR(255)
);

CREATE TABLE bronze_customers (
    customer_id VARCHAR(50),
    city VARCHAR(100),
    signup_date VARCHAR(50)
);

CREATE TABLE bronze_employees (
    employee_id VARCHAR(50),
    store_id VARCHAR(50),
    salary VARCHAR(50)
);

CREATE TABLE bronze_order_items (
    order_item_id VARCHAR(50),
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    qty VARCHAR(50),
    price VARCHAR(50)
);

CREATE TABLE bronze_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    store_id VARCHAR(50),
    order_date VARCHAR(50),
    promotion_id VARCHAR(50)
);

CREATE TABLE bronze_payments (
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    amount VARCHAR(50)
);

CREATE TABLE bronze_products (
    product_id VARCHAR(50),
    category_id VARCHAR(50),
    supplier_id VARCHAR(50),
    price VARCHAR(50)
);

CREATE TABLE bronze_promotions (
    promotion_id VARCHAR(50),
    discount VARCHAR(50)
);

CREATE TABLE bronze_returns (
    return_id VARCHAR(50),
    order_item_id VARCHAR(50),
    refund VARCHAR(50)
);

CREATE TABLE bronze_shipments (
    shipment_id VARCHAR(50),
    order_id VARCHAR(50),
    status VARCHAR(100)
);


CREATE TABLE bronze_stores (
    store_id VARCHAR(50),
    city VARCHAR(100)
);


CREATE TABLE bronze_suppliers (
    supplier_id VARCHAR(50),
    country VARCHAR(100)
);

