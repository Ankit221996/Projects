select * from coffee1;

select product_type,
       round(sum(unit_price * transaction_qty),1) as Total_Sales
from coffee1
where month(transaction_date) = 5
group by product_type
order by Total_Sales desc
limit 10;

-- Total Sales , Total Qty Sold by hour and week

select 
     dayofweek(transaction_date) as Day_of_Week,
     hour(transaction_time) as Hour_of_Day,
    round(sum(unit_price * transaction_qty),1) as Total_Sales,
    round(sum(transaction_qty)) AS Total_Qty
from coffee1
where month(transaction_date) = 5
group by Day_Of_Week,Hour_of_Day;


-- Peak Hour

select 
     hour(transaction_time) as Hour_of_Day,
    round(sum(unit_price * transaction_qty),1) as Total_Sales
from coffee1
where month(transaction_date) = 5
group by Hour_of_Day
order by Total_Sales desc;

-- Peak Day of the Week

select
      case
           when dayofweek(transaction_date) = 2 then "Monday"
           when dayofweek(transaction_date) = 3 then "Tuesday"
           when dayofweek(transaction_date) = 4 then "Wednesday"
           when dayofweek(transaction_date) = 5 then "Thursday"
           when dayofweek(transaction_date) = 6 then "Friday"
           when dayofweek(transaction_date) = 7 then "Saturday"
           else "Sunday"
	 end as Week_Of_Day,
     round(sum(unit_price * transaction_qty),1) as Total_Sales
from coffee1
where month(transaction_date) = 5
group by 
		case
           when dayofweek(transaction_date) = 2 then "Monday"
           when dayofweek(transaction_date) = 3 then "Tuesday"
           when dayofweek(transaction_date) = 4 then "Wednesday"
           when dayofweek(transaction_date) = 5 then "Thursday"
           when dayofweek(transaction_date) = 6 then "Friday"
           when dayofweek(transaction_date) = 7 then "Saturday"
           else "Sunday"
	    end
;
           
