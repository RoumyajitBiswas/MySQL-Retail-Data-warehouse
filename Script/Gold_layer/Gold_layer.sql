USE bronze_retail_datawarehouse;


CREATE TABLE dim_customers AS
SELECT
    customer_id,
    city,
    signup_date
FROM silver_customers;

ALTER TABLE dim_customers
ADD PRIMARY KEY(customer_id);


CREATE TABLE dim_products AS
SELECT
    p.product_id,
    p.category_id,
    c.category_name,
    p.supplier_id,
    s.country AS supplier_country,
    p.price
FROM silver_products p
LEFT JOIN silver_categories c
       ON p.category_id = c.category_id
LEFT JOIN silver_suppliers s
       ON p.supplier_id = s.supplier_id;

ALTER TABLE dim_products
ADD PRIMARY KEY(product_id);

CREATE TABLE dim_stores AS
SELECT
    store_id,
    city
FROM silver_stores;

ALTER TABLE dim_stores
ADD PRIMARY KEY(store_id);


CREATE TABLE dim_promotions AS
SELECT
    promotion_id,
    discount
FROM silver_promotions;

ALTER TABLE dim_promotions
ADD PRIMARY KEY(promotion_id);


CREATE TABLE dim_employees AS
SELECT
    e.employee_id,
    e.store_id,
    s.city AS store_city,
    e.salary
FROM silver_employees e
LEFT JOIN silver_stores s
       ON e.store_id = s.store_id;

ALTER TABLE dim_employees
ADD PRIMARY KEY(employee_id);


CREATE TABLE dim_date AS
SELECT DISTINCT
    order_date,
    YEAR(order_date) AS year,
    QUARTER(order_date) AS quarter,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    DAY(order_date) AS day,
    DAYNAME(order_date) AS day_name
FROM silver_orders;

ALTER TABLE dim_date
ADD PRIMARY KEY(order_date);


CREATE TABLE fact_sales AS
SELECT
    oi.order_item_id,
    o.order_id,
    o.customer_id,
    o.store_id,
    oi.product_id,
    o.promotion_id,
    o.order_date,
    oi.qty,
    oi.price,
    (oi.qty * oi.price) AS sales_amount,
    COALESCE(pm.amount,0) AS payment_amount,
    COALESCE(r.refund,0) AS refund_amount,
    COALESCE(sh.status,'Pending') AS shipment_status
FROM silver_orders o
INNER JOIN silver_order_items oi
        ON o.order_id = oi.order_id
LEFT JOIN silver_payments pm
       ON o.order_id = pm.order_id
LEFT JOIN silver_returns r
       ON oi.order_item_id = r.order_item_id
LEFT JOIN silver_shipments sh
       ON o.order_id = sh.order_id;


CREATE TABLE sales_mart AS
SELECT
    fs.order_item_id,
    fs.order_id,
    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name,
    dd.day,
    dd.day_name,
    dc.customer_id,
    dc.city AS customer_city,
    ds.store_id,
    ds.city AS store_city,
    dp.product_id,
    dp.category_name,
    dp.supplier_country,
    dpr.discount,
    fs.qty,
    fs.price,
    fs.sales_amount,
    fs.payment_amount,
    fs.refund_amount,
    fs.shipment_status
FROM fact_sales fs
LEFT JOIN dim_customers dc
       ON fs.customer_id = dc.customer_id
LEFT JOIN dim_products dp
       ON fs.product_id = dp.product_id
LEFT JOIN dim_stores ds
       ON fs.store_id = ds.store_id
LEFT JOIN dim_promotions dpr
       ON fs.promotion_id = dpr.promotion_id
LEFT JOIN dim_date dd
       ON fs.order_date = dd.order_date;
       
SELECT * FROM sales_mart;