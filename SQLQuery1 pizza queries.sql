
---DAILY TRENDS----
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);



----HOURLY TRENDS----
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);


----% of Sale Per Pizza Category----
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Percent_of_TotalSales
FROM pizza_sales 
GROUP BY pizza_category;

-----% of Sale by Pizza Size----
SELECT pizza_size, SUM(total_price) As Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Percent_of_TotalSales
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY pizza_size


----Pizza Sold by Category----
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
from pizza_sales GROUP BY pizza_category;

-----Top 5 best sellers by Total pizza sold-----
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY SUM(quantity) DESC

----Bottom 5 worst-sellers by total Pizza sold----
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
