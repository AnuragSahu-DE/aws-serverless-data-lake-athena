CREATE TABLE pizza_db.orders_parquet
WITH (
  format = 'PARQUET',
  external_location = 's3://anurag-pizza-data-lake/pizza_parquet/orders/',
  write_compression = 'SNAPPY'
) AS
SELECT
  order_id,
  CAST(order_date AS DATE) AS order_date,
  order_time
FROM pizza_db.orders;