-- Step 1: Convert raw CSV to Parquet
CREATE TABLE pizza_db.orders_parquet
WITH (
  format = 'PARQUET',
  external_location = 's3://anurag-pizza-data-lake/pizza_parquet/orders/'
)
AS
SELECT
  order_id,
  CAST(order_date AS DATE) AS order_date,
  order_time
FROM pizza_db.orders;


-- Step 2: Create partitioned table
CREATE TABLE pizza_db.orders_partitioned
WITH (
  format = 'PARQUET',
  external_location = 's3://anurag-pizza-data-lake/pizza_parquet/orders_partitioned/',
  partitioned_by = ARRAY['year','month']
)
AS
SELECT
  order_id,
  order_time,
  CAST(order_date AS DATE) AS order_date,
  year(CAST(order_date AS DATE)) AS year,
  month(CAST(order_date AS DATE)) AS month
FROM pizza_db.orders;
