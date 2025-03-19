-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(quantity),0) from 
(select orders.date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.date) as data_quantity ;