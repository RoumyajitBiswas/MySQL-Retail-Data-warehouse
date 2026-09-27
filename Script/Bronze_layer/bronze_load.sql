USE bronze_retail_datawarehouse;
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- CATEGORIES
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/categories.csv'
INTO TABLE bronze_categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CUSTOMERS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/customers.csv'
INTO TABLE bronze_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- EMPLOYEES
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/employees.csv'
INTO TABLE bronze_employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ORDER ITEMS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/order_items.csv'
INTO TABLE bronze_order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ORDERS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/orders.csv'
INTO TABLE bronze_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- PAYMENTS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/payments.csv'
INTO TABLE bronze_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- PRODUCTS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/products.csv'
INTO TABLE bronze_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- PROMOTIONS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/promotions.csv'
INTO TABLE bronze_promotions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- RETURNS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/returns.csv'
INTO TABLE bronze_returns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- SHIPMENTS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/shipments.csv'
INTO TABLE bronze_shipments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- STORES
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/stores.csv'
INTO TABLE bronze_stores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- SUPPLIERS
LOAD DATA LOCAL INFILE '/Users/raja/Desktop/DataWarehouseSQL/Data/Retail/suppliers.csv'
INTO TABLE bronze_suppliers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
