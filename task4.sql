SELECT 
    *
FROM
    task4.sample;
    
#Total count Region wise sales ,profit and discount using group by per year
SELECT 
    region,
    COUNT(sales) AS Total_Sales,
    SUM(CEIL(profit)) AS Total_Profit,
    SUM(CEIL(discount)) AS Total_Discount
FROM
    task4.sample
WHERE
    OrderDate BETWEEN '1-1-2014' AND '31-12-2015'
GROUP BY region
ORDER BY region DESC;

 
 #create 2 different tables of sample table for join
 drop table task4.customar;
 drop table task4.orders;
 
 #create 2 different tables from sample table
 
 #table 1 orders
 CREATE TABLE task4.orders AS SELECT OrderID, OrderDate, ShipDate, sales FROM
    task4.sample;
    
 SELECT 
    *
FROM
    task4.orders;
    
    #create table 2
    CREATE TABLE task4.customar AS SELECT CustomerID, sales, region FROM
    task4.sample;
    
    SELECT 
    *
FROM
    task4.customar;

    #left join of customar and orders
    SELECT 
    *
FROM
    task4.customar AS c
        LEFT JOIN
    task4.orders AS o ON c.sales = o.sales;
    
    #inner join between customer and orders
     SELECT 
    *
FROM
    task4.customar AS c
        inner JOIN
    task4.orders AS o ON c.sales = o.sales;
    
    #Right join between customers and orders
      SELECT 
    c.CustomerID,o.sales,o.OrderDate
FROM
    task4.customar AS c
        right JOIN
    task4.orders AS o ON c.sales = o.sales;
    
    #Subquery for top 5 profitable product
    
    SELECT ProductName, total_profit
FROM (
    SELECT  ProductName, SUM(Profit) AS total_profit
    FROM task4.sample
    GROUP BY ProductName
) AS productprofit
ORDER BY total_profit DESC
LIMIT 5;




#Use some aggrigate function 

#use count agg fun count for quantity by south region
SELECT 
    Region, Avg(ceil(Sales)) as Avg_Sales
FROM
    task4.sample
group by region order by region asc;

#Use sum agg fun for count quantity segment wise
SELECT 
	Segment,Sum(Quantity) as total_quantity
FROM
    task4.sample group by Segment;
    
    #create view for analysis
 CREATE VIEW analysis_view AS
    SELECT 
        OrderID, ShipDate, ShipMode, City, sales
    FROM
        task4.sample;

#create indexes 
create index task4 on task4.sample(orderid);
create index o_date on task4.sample(OrderDate);
    
    
    
    
    
    
    
    
    
    
    
    
    