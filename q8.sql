-- Join relevant tables to find the category-wise distribution of pizzas.
select count(name) , category from pizza_types
group by category 
order by  category  ;
