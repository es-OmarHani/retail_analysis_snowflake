-- Use our db in that current session
USE DATABASE retail_db;

-- Insert data into dim_customers
INSERT INTO retail_schema.dim_customers
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS id,
   CONCAT('Customer_', ROW_NUMBER() OVER (ORDER BY SEQ4())) AS customer_name,
   CONCAT('customer', ROW_NUMBER() OVER (ORDER BY SEQ4()), '@example.com') AS email,
   CASE MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 4)
       WHEN 0 THEN 'North'
       WHEN 1 THEN 'South'
       WHEN 2 THEN 'East'
       ELSE 'West'
   END AS region,
   DATEADD(day, -UNIFORM(0, 3650, RANDOM()), CURRENT_DATE) AS signup_date
FROM TABLE(GENERATOR(ROWCOUNT => 100000));

-- Check on insertion
SELECT * 
FROM retail_schema.dim_customers
LIMIT 10;


----------------------------------------------------------------------

-- Insert data into dim_products
INSERT INTO retail_schema.dim_products
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS id,
   CONCAT('Product_', ROW_NUMBER() OVER (ORDER BY SEQ4())) AS product_name,
   CASE MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 3)
       WHEN 0 THEN 'Electronics'
       WHEN 1 THEN 'Clothing'
       ELSE 'Home & Kitchen'
   END AS category,
   ROUND(UNIFORM(5, 505, RANDOM()), 2) AS price
FROM TABLE(GENERATOR(ROWCOUNT => 500));


-- Check on insertion
SELECT * 
FROM retail_schema.dim_products
LIMIT 10;

----------------------------------------------------------------------

-- Insert data into dim_stores
INSERT INTO retail_schema.dim_stores
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS id,
   CONCAT('Store_', ROW_NUMBER() OVER (ORDER BY SEQ4())) AS store_name,
   CASE MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 4)
       WHEN 0 THEN 'New York'
       WHEN 1 THEN 'Los Angeles'
       WHEN 2 THEN 'Chicago'
       ELSE 'Houston'
   END AS city,
   CONCAT('Address_', ROW_NUMBER() OVER (ORDER BY SEQ4())) AS address
FROM TABLE(GENERATOR(ROWCOUNT => 100));

-- Check on insertion
SELECT * 
FROM retail_schema.dim_products
LIMIT 10;


----------------------------------------------------------------------

-- Insert data into dim_employees
INSERT INTO retail_schema.dim_employees (employee_id, employee_name, department, employment_type, hire_date, store_id)
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS employee_id,
   CONCAT('Employee_', ROW_NUMBER() OVER (ORDER BY SEQ4())) AS employee_name,
   CASE MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 3)
       WHEN 0 THEN 'HR'
       WHEN 1 THEN 'Sales'
       ELSE 'Operations'
   END AS department,
   CASE MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 2)
       WHEN 0 THEN 'Full-time'
       ELSE 'Part-time'
   END AS employment_type,
   DATEADD(day, -UNIFORM(0, 3650, RANDOM()), CURRENT_DATE) AS hire_date,
   MOD(ROW_NUMBER() OVER (ORDER BY SEQ4()), 5) + 1 AS store_id
FROM TABLE(GENERATOR(ROWCOUNT => 10000));

-- Check on insertion
SELECT * 
FROM retail_schema.dim_employees
LIMIT 10;

----------------------------------------------------------------------


-- Insert data into dim_time
CREATE OR REPLACE TEMPORARY TABLE temp_date_series AS
SELECT DATEADD(day, -ROW_NUMBER() OVER (ORDER BY SEQ4()), CURRENT_DATE) AS date_id
FROM TABLE(GENERATOR(ROWCOUNT => 5000));

INSERT INTO retail_schema.dim_time (date_id, year, quarter, month, day, day_of_week)
SELECT
   date_id,
   EXTRACT(YEAR FROM date_id) AS year,
   EXTRACT(QUARTER FROM date_id) AS quarter,
   EXTRACT(MONTH FROM date_id) AS month,
   EXTRACT(DAY FROM date_id) AS day,
   TO_CHAR(date_id, 'Day') AS day_of_week
FROM temp_date_series;

DROP TABLE temp_date_series;

-- Check on insertion
SELECT * 
FROM retail_schema.dim_time
LIMIT 10;


----------------------------------------------------------------------

-- Insert data into fact_sales
INSERT INTO retail_schema.fact_sales
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS id,
   UNIFORM(1, 100001, RANDOM()) AS customer_id,
   UNIFORM(1, 501, RANDOM()) AS product_id,
   UNIFORM(1, 101, RANDOM()) AS store_id,
   DATEADD(day, -UNIFORM(0, 1825, RANDOM()), CURRENT_DATE) AS sale_date,
   UNIFORM(1, 101, RANDOM()) AS quantity_sold,
   ROUND(UNIFORM(1, 101, RANDOM()) * UNIFORM(5, 105, RANDOM()), 2) AS total_amount
FROM TABLE(GENERATOR(ROWCOUNT => 1000000));

-- Check on insertion
SELECT * 
FROM retail_schema.fact_sales
LIMIT 10;



----------------------------------------------------------------------

-- Insert data into fact_inventory
INSERT INTO retail_Schema.fact_inventory
SELECT
   ROW_NUMBER() OVER (ORDER BY SEQ4()) AS id,
   UNIFORM(1, 501, RANDOM()) AS product_id,
   UNIFORM(1, 101, RANDOM()) AS store_id,
   DATEADD(day, -UNIFORM(0, 1825, RANDOM()), CURRENT_DATE) AS stock_date,
   UNIFORM(1, 101, RANDOM()) AS stock_level
FROM TABLE(GENERATOR(ROWCOUNT => 500000));

-- Check on insertion
SELECT * 
FROM retail_schema.fact_sales
LIMIT 10;


----------------------------------------------------------------------
