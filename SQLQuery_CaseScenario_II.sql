----a)	Who are the most valuable customers, and what products or services do they typically purchase?

ALTER TABLE KMS
ALTER COLUMN Profit DECIMAL (10,2)

----Table By Highest Sales
SELECT *
FROM KMS
ORDER BY Sales Desc

----Top 10 Sales By Product Category

SELECT TOP 10
    customer_name,
    SUM(sales) AS Total_customer_sales
FROM
    KMS
GROUP BY
    customer_name
ORDER BY
    total_customer_sales DESC

----Top 10 Sales By Product Category and Name
SELECT TOP 10 Customer_Name, Sales, Product_CATEGORY,Product_Name
FROM KMS
ORDER BY Sales Desc

----Top 10 Profit By Product Category and Name
SELECT TOP 10 Customer_Name, Sales, Product_CATEGORY,Product_Name
FROM KMS
ORDER BY Profit Desc

----Typical Top 10 Customers Products

SELECT
    Customer_Name,
    product_Category,
    SUM(sales) AS Customer_Sales_by_Category,
    COUNT(*) AS Orders_in_category
FROM
    KMS
WHERE
    customer_name IN ('Emily Phan', 'Deborah Brumfield', 'Roy Skaria', 'Sylvia Foulston', 'Grant Carroll', 'Alejandro Grove',
						'Darren Budd','Julia Barnett','John Lucas','Liz MacKendrick')
GROUP BY
    Customer_Name,
    Product_Category
ORDER BY
    Customer_Name,
    Customer_Sales_by_Category DESC;

----b)	Which small business customer had the highest sales?
SELECT TOP 1 Customer_Name, Order_Quantity, Sales
FROM KMS
WHERE Customer_Segment = 'Small Business'
ORDER BY Sales

----c)	Which Corporate Customer placed the most number of orders in 2009 – 2012?

SELECT TOP 1 Customer_Name, Order_Quantity, Customer_Segment
FROM KMS
WHERE Customer_Segment = 'Corporate' AND YEAR(Order_date) BETWEEN 2009 AND 2012
ORDER BY Order_Quantity Desc

----d)	Which consumer customer was the most profitable one?
SELECT TOP 1 Customer_Name, Profit, Customer_Segment
FROM KMS
WHERE Customer_Segment = 'Consumer' 
ORDER BY Profit Desc

-----------------------e)	Which customer returned items, and what segment do they belong to?

SELECT DISTINCT
    K.Customer_Name,
    K.Customer_Segment
FROM
    KMS AS K
JOIN
    Order_Status AS O ON K.order_id = O.order_id
WHERE
    O.status = 'Returned';

SELECT DISTINCT
    K.Customer_Segment
FROM
    KMS AS K
JOIN
    Order_Status AS O ON K.order_id = O.order_id
WHERE
    O.status = 'Returned';

-----------------------f)	If the delivery truck is the most economical but the slowest shipping 
----------------------------method and Express Air is the fastest but the most expensive one, do you
----------------------------think the company appropriately spent shipping costs based on the Order Priority? 

SELECT
    order_priority,
    ship_mode,
    SUM(shipping_cost) AS Total_shipping_cost_BY_priorityMode,
    COUNT(order_id) AS OrdersCount_by_priorityAndship_mode
FROM
    KMS
GROUP BY
    order_priority,
    ship_mode
ORDER BY
	Order_Priority Asc,
    Total_shipping_cost_BY_priorityMode DESC

