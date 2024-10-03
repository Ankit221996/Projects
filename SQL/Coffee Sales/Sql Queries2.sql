select * from coffee1;

select
     store_location,
     concat(round(sum(unit_price * transaction_qty)/1000,1),'K') as Total_Sales
from coffee1
where month(transaction_date) = 5
group by store_location
order by Total_Sales desc;

select
      avg(Total_Sales) as Avg_Sales
from
   (
   select
   sum(unit_price * transaction_qty) as Total_Sales
   from coffee1
   where month(transaction_date) = 5
   group by transaction_date
   ) As internal_query
;

-- Daily Sales for a selected Month
select
     day(transaction_date) as Day,
     concat(round(sum(unit_price * transaction_qty)/1000,1),'K') as Total_Sales
from coffee1
where month(transaction_date) = 6
group by Day;




