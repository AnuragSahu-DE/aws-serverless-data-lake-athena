-- Create database
CREATE DATABASE IF NOT EXISTS pizza_db;

-- Orders table
CREATE EXTERNAL TABLE pizza_db.orders (
  order_id INT,
  order_date STRING,
  order_time STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'separatorChar' = ','
)
LOCATION 's3://anurag-pizza-data-lake/pizza_data/orders/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Order details table
CREATE EXTERNAL TABLE pizza_db.order_details (
  order_details_id INT,
  order_id INT,
  pizza_id STRING,
  quantity INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',')
LOCATION 's3://anurag-pizza-data-lake/pizza_data/order_details/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Pizzas table
CREATE EXTERNAL TABLE pizza_db.pizzas (
  pizza_id STRING,
  pizza_type_id STRING,
  size STRING,
  price DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',')
LOCATION 's3://anurag-pizza-data-lake/pizza_data/pizzas/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Pizza types table
CREATE EXTERNAL TABLE pizza_db.pizza_types (
  pizza_type_id STRING,
  name STRING,
  category STRING,
  ingredients STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',')
LOCATION 's3://anurag-pizza-data-lake/pizza_data/pizza_types/'
TBLPROPERTIES ("skip.header.line.count"="1");