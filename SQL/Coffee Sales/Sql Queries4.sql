select * from coffee1;
select distinct month(transaction_date) from coffee1;
describe coffee1;

alter table coffee1
modify column transaction_date Date;

alter table coffee1
modify column transaction_time time;

alter table coffee1
rename column transaction_id to Id ;

-- Calculate Sales of each month
select round(sum(unit_price*transaction_qty),1) as Total_Sales
from coffee1
where 
month(transaction_date) = 3;

-- Determine the month-month increase or decrease in sales
With Monthly_Sales as(
   Select
        year(transaction_date)  as Year,
        month(transaction_date) as Month,
        round(sum(unit_price*transaction_qty),1) as Total_Sales
        from coffee1
		GROUP BY year(transaction_date),MONTH(transaction_date)
)
select 
   Year, 
   Month,
   Total_Sales,
   lag(Total_Sales) over (order by Month) as Previous_Month_Sales,
   round(Total_Sales - lag(Total_Sales) over (order by Month),1) as Sales_Difference,
    ROUND(
        (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Year, Month)) / NULLIF(LAG(Total_Sales) OVER (ORDER BY Year, Month), 0) * 100, 2
    ) AS Percentage_Change
from Monthly_Sales;


-- Total number of orders in every month

select 
    month(transaction_date) As Month,
    count(Id) As Total_Orders
from coffee1
group by month(transaction_date)
;

-- Determine the month-month increase or decrease in order

With Monthly_Orders as(
   Select
        year(transaction_date)  as Year,
        month(transaction_date) as Month,
        round(count(Id),1) as Total_Orders
        from coffee1
		GROUP BY year(transaction_date),MONTH(transaction_date)
)
select 
   Year, 
   Month,
   Total_Orders,
   lag(Total_Orders) over (order by Month) as Previous_Month_Sales,
   round(Total_Orders - lag(Total_Orders) over (order by Month),1) as Orders_Difference,
    ROUND(
        (Total_Orders - LAG(Total_Orders) OVER (ORDER BY Year, Month)) / NULLIF(LAG(Total_Orders) OVER (ORDER BY Year, Month), 0) * 100, 2
    ) AS Percentage_Change
from Monthly_Orders;

-- Total Quantity sold 

select 
    month(transaction_date) As Month,
    sum(transaction_qty) As Total_Quantity
from coffee1
group by month(transaction_date)
;

-- Determine the month-month increase or decrease in quantity

With Monthly_Quantity as(
   Select
        year(transaction_date)  as Year,
        month(transaction_date) as Month,
        round(sum(transaction_qty),1) as Total_Quantity
        from coffee1
		GROUP BY year(transaction_date),MONTH(transaction_date)
)
select 
   Year, 
   Month,
   Total_Quantity,
   lag(Total_Quantity) over (order by Month) as Previous_Month_Sales,
   round(Total_Quantity - lag(Total_Quantity) over (order by Month),1) as Quantity_Difference,
    ROUND(
        (Total_Quantity - LAG(Total_Quantity) OVER (ORDER BY Year, Month)) / NULLIF(LAG(Total_Quantity) OVER (ORDER BY Year, Month), 0) * 100, 2
    ) AS Percentage_Change
from Monthly_Quantity;

select * from coffee1;