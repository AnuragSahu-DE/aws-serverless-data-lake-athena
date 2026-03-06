# AWS Serverless Data Lake Analytics – Pizza Sales Dataset

This project demonstrates how to build a serverless data lake architecture on AWS for performing scalable SQL analytics on raw datasets.

## Data Lake Architecture

This project implements a **three-layer data lake architecture**:

Bronze Layer  
Raw CSV files stored in Amazon S3.

Silver Layer  
Data transformed into columnar Parquet format using Athena CTAS.

Gold Layer  
Partitioned tables optimized for analytical queries.

This design improves query performance and reduces scan costs in Athena.

![Architecture](architecture/aws-data-lake-architecture.png)

## Tech Stack

- Amazon S3 – Data Lake Storage
- Amazon Athena – Serverless SQL Analytics
- AWS Glue Data Catalog – Metadata management
- SQL – Data transformation and analytics

## Data Pipeline

Raw CSV Data → Amazon S3 → Athena External Tables → Parquet Optimization → Partitioned Analytics Tables

## Key Implementations

• Created external tables in Amazon Athena to query S3 datasets using schema-on-read  
• Converted raw CSV datasets to columnar Parquet format using Athena CTAS  
• Implemented partitioning (year/month) to optimize query performance  
• Performed analytical SQL queries including joins and aggregations  

## Example Query

```sql
SELECT
pt.category,
SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY revenue DESC;