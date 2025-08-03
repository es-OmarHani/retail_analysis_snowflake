-- Craeting database
CREATE DATABASE retail_db;


--Creating schema
CREATE SCHEMA retail_schema;



-- Customer Dimension
CREATE TABLE retail_schema.dim_customers (
   customer_id INT PRIMARY KEY,
   customer_name VARCHAR(100),
   email VARCHAR(100),
   region VARCHAR(50),
   signup_date DATE
);


-- Product Dimension
CREATE TABLE retail_schema.dim_products (
   product_id INT PRIMARY KEY,
   product_name VARCHAR(100),
   category VARCHAR(50),
   price DECIMAL(10,2)
);


-- Store Dimension
CREATE TABLE retail_schema.dim_stores (
   store_id INT PRIMARY KEY,
   store_name VARCHAR(100),
   location VARCHAR(100),
   manager_name VARCHAR(100)
);


-- Time Dimension
CREATE TABLE retail_schema.dim_time (
   date_id DATE PRIMARY KEY,
   year INT,
   quarter INT,
   month INT,
   day INT,
   day_of_week VARCHAR(20)
);


-- Employee Dimension
CREATE TABLE retail_schema.dim_employees (
   employee_id INT PRIMARY KEY,
   employee_name TEXT,
   department TEXT,
   employment_type TEXT,
   hire_date DATE,
   store_id INT  
);



-- Fact Sales
CREATE TABLE retail_schema.fact_sales (
   sale_id INT PRIMARY KEY,
   customer_id INT REFERENCES retail_schema.dim_customers(customer_id),
   product_id INT REFERENCES retail_schema.dim_products(product_id),
   store_id INT REFERENCES retail_schema.dim_stores(store_id),
   sale_date DATE REFERENCES retail_schema.dim_time(date_id),
   quantity_sold INT,
   total_amount DECIMAL(10,2)
);


-- Fact Inventory
CREATE TABLE retail_schema.fact_inventory (
   inventory_id INT PRIMARY KEY,
   product_id INT REFERENCES retail_schema.dim_products(product_id),
   store_id INT REFERENCES retail_schema.dim_stores(store_id),
   stock_date DATE REFERENCES retail_schema.dim_time(date_id),
   stock_level INT
);


