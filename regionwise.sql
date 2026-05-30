USE ecommerce;

SELECT 
  c.customer_state AS state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_customers_dataset c 
ON o.customer_id = c.customer_id
JOIN olist_order_payments_dataset p 
ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC;