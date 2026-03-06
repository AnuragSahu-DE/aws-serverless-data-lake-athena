# Pizza Sales Dataset

This dataset represents transaction data from a fictional pizza restaurant.

It contains order information, pizza types, and item-level sales data.

## Tables

### orders
Contains order-level information.

Columns:
- order_id – unique identifier for each order
- order_date – date of order
- order_time – time of order

---

### order_details
Contains item-level details for each order.

Columns:
- order_details_id – unique identifier
- order_id – reference to orders table
- pizza_id – pizza ordered
- quantity – number of pizzas ordered

---

### pizzas
Contains pizza pricing and size information.

Columns:
- pizza_id
- pizza_type_id
- size
- price

---

### pizza_types
Contains pizza category and ingredient details.

Columns:
- pizza_type_id
- name
- category
- ingredients

---

## Use Case

This dataset can be used for:

- sales analytics
- product performance analysis
- customer ordering patterns
- revenue trend analysis

It is commonly used in SQL practice and data engineering projects.