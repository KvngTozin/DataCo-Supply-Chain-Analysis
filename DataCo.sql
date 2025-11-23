select * 
from DataCoSupplyChainDataset$

--create duplicate table
select *
into supply
from DataCoSupplyChainDataset$

select * 
from supply

-- check for duplicates using order id and order item id as both together cant be the same

select
    [Order Id],
    [Order Item Id],
    count(*) as cnt
from supply
group by [Order Id], [Order Item Id]
having count(*) > 1;

-- change ee.uu to us

update supply
set [Customer Country] = 'US'
where [Customer Country] = 'EE. UU.'

--kpis
-- total sales
select
    sum(sales) as total_sales
from supply


-- total profit
select 
    sum([benefit per order]) as total_profit
from supply

-- total orders
select
    count(distinct [Order Id]) as total_orders
from supply
--

---top 10 customers per sales
select top 10 
    concat([customer Fname], ' ', [customer Lname]) as full_name,
    sum(sales) as total_sales
from supply
group by  concat([customer Fname], ' ', [customer Lname])
order by total_sales desc

-- top 10 customers per profit
select top 10
    concat([customer Fname], ' ', [customer Lname]) as full_name,
    sum([benefit per order]) as total_profit
from supply
group by  concat([customer Fname], ' ', [customer Lname])
order by total_profit desc


-- profit over time
select  [order date (DateOrders)], 
    sum([Benefit per order]) as total_profit
from supply
group by  [order date (DateOrders)]
order by  [order date (DateOrders)];

-- profit by category
select 
    [category name],
    sum([Benefit per order]) as total_profit
from supply
group by [category name]
order by total_profit desc

--profit by customer country
select 
    [Order Country],
    SUM([Benefit per order]) as total_profit
from supply
group by [Order Country]
order by total_profit desc;

--for interactive tableu dashboard
select 
   type,
   [Benefit per order],
   [Sales per customer],
   [Delivery Status],
   Late_delivery_risk,
   [Category Name],
   [Customer City],
   [Customer Country],
   [Customer Fname],
   [Customer Lname],
   [Order City],
   [Order Country],
   [Order Id],
   [order date (DateOrders)],
   [Order Item Discount],
   [Order Item Discount Rate],
   [Order Item Product Price],
   [Order Item Profit Ratio],
   [Order Item Quantity],
   Sales,
   [Order Item Total],
   [Order Status],
   [Product Name],
   [Product Price],
   [shipping date (DateOrders)],
   [Shipping Mode]
from supply