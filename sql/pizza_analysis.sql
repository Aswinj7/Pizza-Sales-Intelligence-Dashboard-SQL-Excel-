-	Total Revenue: 
  Select sum(total_price) as Total_Revenue from pizza_sales;

-	Average Order Value:
  Select sum(total_price) / count(distinct order_id) as Average_Order_Values from pizza_sales;

-	Total Pizza Sold: 
  Select sum(quantity) as Total_orders from pizza_sales;

-	Average pizza Per Order: 
  Select sum(quantity)/ count(distinct order_id) as Average_Pizza_Per_Order from pizza_sales;

- Daily Trend for Total Orders:
  Select weekday(str_to_date(order_date, '%d-%m-%Y')) as day_number ,dayname(str_to_date(order_date, '%d-%m-%Y')) as Order_Date,
  count(DISTINCT order_id) as Total_Orders from pizza_sales
  group by 
    dayname(str_to_date(order_date, '%d-%m-%Y')),
    weekday(str_to_date(order_date, '%d-%m-%Y'))
  order by day_number;

 - Hourly Trend for Total Orders:
  Select hour(order_time) as Order_houres, count(distinct order_id)as Total_Orders from pizza_sales
  group by hour(order_time)
  order by hour(order_time);	

 - % of Sales by Pizza Category:
  Select pizza_category, sum(total_price)*100/ (Select sum(total_price) from pizza_sales)as Total_Sales_Percentage
  from pizza_sales
  group by pizza_category;

 - % of Sales by Pizza Size
  Select pizza_size, sum(total_price)*100/(select sum(total_price) from pizza_sales) as Total_sales_Percentage
  from pizza_sales
  group by pizza_size;


- Total Pizzas Sold by Pizza Category
  Select pizza_category,count(quantity) as Total_pizza_sold from pizza_sales
  group by pizza_category
  order by pizza_category;

 -Top 5 Best Sellers by Total Pizzas Sold
 Select pizza_name,sum(quantity) as Total_pizza_sold from pizza_sales
 group by pizza_name
 order by sum(quantity) desc
 Limit 5;

- Bottom 5 Best Sellers by Total Pizzas Sold
 Select pizza_name,sum(quantity) as Total_pizza_sold from pizza_sales
 group by pizza_name
 order by sum(quantity) asc
 Limit 5;
