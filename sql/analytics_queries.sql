-- Total revenue
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id;

-- Revenue by pizza category
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

-- Top 10 best-selling pizzas
SELECT
pt.name,
SUM(od.quantity) AS total_orders
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_orders DESC
LIMIT 10;

-- Monthly sales trend
SELECT
year,
month,
COUNT(order_id) AS total_orders
FROM pizza_db.orders_partitioned
GROUP BY year, month
ORDER BY year, month;