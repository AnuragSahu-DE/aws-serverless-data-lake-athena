# Data Pipeline Architecture

This project implements a simplified **data lake pipeline** using AWS serverless services.

The architecture follows a **Medallion Data Lake pattern**.

## Bronze Layer – Raw Data

Raw transactional CSV files are stored in Amazon S3.

Example location:

s3://anurag-pizza-data-lake/pizza_data/

Tables:
- orders.csv
- order_details.csv
- pizzas.csv
- pizza_types.csv

Characteristics:
- Raw ingestion
- No transformation
- Source-of-truth data

---

## Silver Layer – Processed Data

Raw CSV datasets are transformed into **Parquet format** using Amazon Athena CTAS.

Example transformation:

CSV → Parquet

Benefits:
- Columnar storage
- Reduced data scan size
- Faster analytical queries

Location:

s3://anurag-pizza-data-lake/pizza_parquet/

---

## Gold Layer – Optimized Analytics

Processed data is further optimized by **partitioning** the dataset.

Partition strategy:

year
month

Example S3 structure:

orders_partitioned/
   year=2015/
       month=1/
       month=2/

Benefits:

- Query pruning
- Faster execution
- Lower Athena cost

---

## Query Layer

Amazon Athena queries the optimized datasets using SQL.

Example analytical queries:

- revenue by category
- best-selling pizzas
- monthly order trends

---

## Final Data Flow

Raw CSV
     ↓
Amazon S3 (Bronze Layer)
     ↓
Athena CTAS Transformation
     ↓
Parquet Data (Silver Layer)
     ↓
Partitioned Tables (Gold Layer)
     ↓
Athena SQL Analytics