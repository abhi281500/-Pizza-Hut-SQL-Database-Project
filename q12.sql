-- Analyze the cumulative revenue generated over time.
 SELECT 
    orders.date,
    SUM(order_details.quantity * pizzas.price) AS daily_revenue,
    SUM(SUM(order_details.quantity * pizzas.price)) 
        OVER (ORDER BY orders.date) AS cumulative_revenue
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY orders.date
ORDER BY orders.date;
