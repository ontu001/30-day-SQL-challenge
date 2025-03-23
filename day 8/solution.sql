SELECT order_id, amount,
  CASE 
    WHEN amount > 150 THEN 'High'
    WHEN amount >= 100 THEN 'Medium'
    ELSE 'Low'
  END AS category
FROM orders;
