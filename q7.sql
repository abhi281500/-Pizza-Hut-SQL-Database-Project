-- Determine the distribution of orders by hour of the day.-- 
select  hour(time),count(order_id) from orders
group by hour(time) ;