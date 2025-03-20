SELECT * 
FROM orders 
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';
