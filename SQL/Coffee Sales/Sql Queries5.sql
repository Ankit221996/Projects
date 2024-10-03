create database coffee_Shop;
use coffee_Shop;

select * from coffee_sales;

UPDATE coffee_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');

describe coffee_sales;