SELECT * FROM KMS

----Alter Table to change to 2 decimal places

ALTER TABLE KMS
ALTER COLUMN Sales DECIMAL (10,2)

----a)	Which product category had the highest sales?

SELECT TOP 1 Product_Category, MAX(Sales) AS Highest_Selling_Product
FROM 
	KMS
GROUP BY 
	Product_Category
ORDER BY 
	Product_Category Desc



----b)	What are the Top 3 and Bottom 3 regions in terms of sales?
----Top 3

SELECT TOP 3 Region, MAX(Sales) AS Regional_Sales_Performance
FROM KMS
GROUP BY Region
ORDER BY Region Asc

----Botton 3

SELECT TOP 3 Region, MIN(Sales) AS Regional_Sales_Performance
FROM KMS
GROUP BY Region
ORDER BY Region Desc

----c)	What were the total sales of appliances in Ontario?
----Product Sales

SELECT Product_Sub_Category, SUM(Sales) AS Product_Sales
FROM KMS
GROUP BY Product_Sub_Category


----Ontario Appliances sales

SELECT Product_Sub_Category, SUM(Sales) AS Ontario_Appliances_Sales
FROM KMS
WHERE Product_Sub_Category = 'Appliances' AND Province = 'Ontario'
GROUP BY Product_Sub_Category

----Alternative
SELECT Province, SUM(Sales) AS Appliances_Sales
FROM KMS
WHERE Product_Sub_Category = 'Appliances' AND Province = 'Ontario'
GROUP BY Product_Sub_Category, Province


----d)	Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.
----ALTER Decimals

ALTER TABLE KMS
ALTER COLUMN Discount DECIMAL (10,2)
ALTER TABLE KMS
ALTER COLUMN Product_Base_Margin DECIMAL (10,2)
ALTER TABLE KMS
ALTER COLUMN Unit_Price DECIMAL (10,2)
ALTER TABLE KMS
ALTER COLUMN Shipping_Cost DECIMAL (10,2)

----Bottom 10 Customers

SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS total_customer_sales
FROM
    KMS
GROUP BY
    customer_name
ORDER BY
    total_customer_sales Asc


----Extract relevant columns

SELECT Row_ID, Order_Priority, Order_Quantity, Sales, Discount, Unit_Price, Shipping_Cost, Product_Base_Margin
FROM KMS

----Chech for trends
----Order Quantity ----No correlation to Sales

SELECT Row_ID, Order_Priority, Order_Quantity, Sales, Discount, Unit_Price, Shipping_Cost, Product_Base_Margin
FROM KMS
ORDER BY Order_Quantity Desc

----Discount-- -N0 correlation to sales

SELECT Row_ID, Order_Priority, Order_Quantity, Sales, Discount, Unit_Price, Shipping_Cost, Product_Base_Margin
FROM KMS
ORDER BY Discount Desc

----Unit_Price

SELECT Row_ID, Order_Priority, Order_Quantity, Sales, Discount, Unit_Price, Shipping_Cost, Product_Base_Margin
FROM KMS
ORDER BY Unit_Price Desc

----e)	KMS incurred the most shipping cost using which shipping method?

SELECT TOP 1 
	Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM KMS
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost Desc

SELECT * FROM KMS
