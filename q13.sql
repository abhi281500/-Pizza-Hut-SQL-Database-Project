
WITH PizzaRevenue AS (
    SELECT 
        pizza_types.category,
        pizzas.pizza_type_id,
        pizza_types.name AS pizza_name,
        SUM(order_details.quantity * pizzas.price) AS revenue,
        RANK() OVER (PARTITION BY pizza_types.category ORDER BY SUM(order_details.quantity * pizzas.price) DESC) AS rank_order
    FROM order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_types.category, pizzas.pizza_type_id, pizza_types.name
)
SELECT 
    category, 
    pizza_name, 
    revenue, 
    rank_order
FROM PizzaRevenue
WHERE rank_order <= 3
ORDER BY category, rank_order;
