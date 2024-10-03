SELECT 
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000,
                    1),
            'k') AS Total_Sales,
    CONCAT(ROUND(SUM(transaction_qty) / 1000, 1),
            'k') AS Total_Qty_Sold,
    CONCAT(ROUND(COUNT(Id) / 1000, 1), 'k') AS Total_Orders
FROM
    coffee1
GROUP BY transaction_date;

SELECT 
    CASE
        WHEN DAYOFWEEK(transaction_date) IN (1 , 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_type,
    Concat(ROUND(SUM(unit_price * transaction_qty)/1000, 1),'k') AS Total_Sales
FROM
    coffee1 
where month(transaction_date) = 2
GROUP BY CASE
    WHEN DAYOFWEEK(transaction_date) IN (1 , 7) THEN 'Weekend'
    ELSE 'Weekday'
END;
      
     