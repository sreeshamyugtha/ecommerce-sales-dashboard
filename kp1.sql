USE ecommerce;

SELECT
  COUNT(DISTINCT o.order_id) AS total_orders,
  COUNT(DISTINCT o.customer_id) AS total_customers,
  ROUND(SUM(p.payment_value), 2) AS total_revenue,
  ROUND(AVG(p.payment_value), 2) AS avg_order_value
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p 
ON o.order_id = p.order_id
WHERE o.order_status = 'delivered';