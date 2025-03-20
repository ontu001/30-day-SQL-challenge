SELECT c.state, SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.state;