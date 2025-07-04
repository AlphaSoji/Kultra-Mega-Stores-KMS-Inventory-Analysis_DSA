[Most expensive Ship Mode.csv](https://github.com/user-attachments/files/21058660/Most.expensive.Ship.Mode.csv)[bottom 10 customers.csv](https://github.com/user-attachments/files/21058087/bottom.10.customers.csv)[Ontario _Appliances_Sales Correct.csv](https://github.com/user-attachments/files/21057842/Ontario._Appliances_Sales.Correct.csv)[bottom 3 by region.csv](https://github.com/user-attachments/files/21057683/bottom.3.by.region.csv)[top 3 by region.csv](https://github.com/user-attachments/files/21057580/top.3.by.region.csv)[top 3 by region.csv](https://github.com/user-attachments/files/21057566/top.3.by.region.csv)[top 3 by region.csv](https://github.com/user-attachments/files/21057556/top.3.by.region.csv)[top selling.csv](https://github.com/user-attachments/files/21057146/top.selling.csv)# Kultra-Mega-Stores-KMS-Inventory-Analysis_DSA

## Project Overview:

Kultra Mega Stores (KMS), headquartered in Lagos, specialises in office supplies and
furniture. KMS has connissioned an in-depth analysis of its Sales Order for the 4 years from 2009 to 2012 with 
a view to obtaining key insights and findings that would help improve its sales performance.

## Project Process: 
### 1.	PLAN:
i)	**Tools**

a) Microsoft SQL: 
- For Data Extraction, Transformation and Loading (ETL).
- Analyze data. Draw key insights.
- Present insights and findings under 2 scenarios.

b) Microsoft Excel:
- For DashBoard
      
ii)	**Data Source**:

  - KMS.csv file provided by the Abuja division Business Manager.
  - Order_Status.csv file provided by the Abuja division Business Manager.

### 2.	ANALYSE:
i)	**Data Cleaning & Preparation**

a) Import data: DataBase name>Tasks>Import Flat Files.

b) Set Datatypes accordingly ( particularly for Orderid, Margin and Profit columns).

    ```ALTER TABLE KMS 
       ALTER COLUMN Sales DECIMAL (10,2)```

    ```ALTER TABLE KMS
       ALTER COLUMN Discount DECIMAL (10,2)
       ALTER TABLE KMS
       ALTER COLUMN Product_Base_Margin DECIMAL (10,2)
       ALTER TABLE KMS
       ALTER COLUMN Unit_Price DECIMAL (10,2)
       ALTER TABLE KMS
       ALTER COLUMN Shipping_Cost DECIMAL (10,2)
ii) **Exploratory Data Analysis(EDA)**
   
### 3.	CONSTRUCT:

### Case Scenario I: 

***SQL Query file for Scenario I***

	- https://github.com/AlphaSoji/Kultra-Mega-Stores-KMS-Inventory-Analysis_DSA/blob/main/SQLQuery_CaseScenario_I.sql
 
***a)	Which product category had the highest sales?***

    ```SELECT TOP 1 
	          Product_Category, MAX(Sales) AS Highest_Selling_Product
        FROM 
	          KMS
        GROUP BY 
	          Product_Category
        ORDER BY 
	          Product_Category Desc```

-  [Uploading top selling.csv…]Technology,89061.05
()

***b)	What are the Top 3 and Bottom 3 regions in terms of sales?***

***- Top 3 Sales By Region.***

    ```SELECT TOP 3 Region, MAX(Sales) AS Regional_Sales_Performance
       FROM 
          KMS
       GROUP BY 
          Region
       ORDER BY 
           Region Asc```
   - Region	Regional_Sales_Performance
      Atlantic	89061.05
      Northwest Territories	26133.39
      Nunavut	14223.82
   - [Uploading top 3 by Atlantic,89061.05
Northwest Territories,26133.39
Nunavut,14223.82
region.csv…]()

***- Bottom 3 Sales By Region.***

    ```SELECT TOP 3 Region, MIN(Sales) AS Regional_Sales_Performance
       FROM 
           KMS
       GROUP BY 
           Region
       ORDER BY 
           Region Desc```
           
  - Region|	Regional_Sales_Performance
    Yukon|	3.23
    West	|2.24
    Quebec|	3.42
  - [UploadiYukon,3.23
West,2.24
Quebec,3.42
ng bottom 3 by region.csv…]()

***c)	What were the total sales of appliances in Ontario?***

    ```SELECT Province, SUM(Sales) AS Appliances_Sales
       FROM
           KMS
       WHERE
           Product_Sub_Category = 'Appliances' AND Province = 'Ontario'
       GROUP BY
           Product_Sub_Category, Province```

- Province	Appliances_Sales
  Ontario	202346.84
- [UploadingOntario,202346.84
 Ontario _Appliances_Sales Correct.csv…]()

***d)	Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.***

    ```SELECT TOP 10
           Customer_Name,
           SUM(Sales) AS total_customer_sales
       FROM
          KMS
       GROUP BY
          customer_name
       ORDER BY
          total_customer_sales Asc```

- Customer_Name	total_customer_sales
  Jeremy Farry	85.72
  Natalie DeCherney	125.90
  Nicole Fjeld	153.03
  Katrina Edelman	180.76
  Dorothy Dickinson	198.08
  Christine Kargatis	293.22
  Eric Murdock	343.33
  Chris McAfee	350.18
  Rick Huthwaite	415.82
  Mark Hamilton	450.99

- [UploadiJeremy Farry,85.72
Natalie DeCherney,125.90
Nicole Fjeld,153.03
Katrina Edelman,180.76
Dorothy Dickinson,198.08
Christine Kargatis,293.22
Eric Murdock,343.33
Chris McAfee,350.18
Rick Huthwaite,415.82
Mark Hamilton,450.99
ng bottom 10 customers.csv…]()

The only factor that apper to have a relationship with Sales is the Unit Price and Shipping_Cost. KMS can encourage the 
lower-end customers through Promotions that that offer more discounts(Price and Quantity Discounts, lower prices and Free Shipping).

***e)	KMS incurred the most shipping cost using which shipping method?***

	```SELECT TOP 1
    		ship_mode,
    		SUM(shipping_cost) AS total_shipping_cost
	   FROM
   		 KMS
	   GROUP BY
    		 ship_mode
	   ORDER BY
    		 total_shipping_cost DESC```

   - ship_mode	total_shipping_cost
	Delivery Truck	51971.94
   - [Uploading MosDelivery Truck,51971.94
t expensive Ship Mode.csv…]()

### Case Scenario II:

***a)	Who are the most valuable customers, and what products or services do they typically purchase?***

	
***b)	Which small business customer had the highest sales?***
***c)	Which Corporate Customer placed the most number of orders in 2009 – 2012?***
***d)	Which consumer customer was the most profitable one?***
***e)	Which customer returned items, and what segment do they belong to?***
***f)	If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the companyappropriately spent shipping costs based on the Order Priority? Explain your answer!!***
### 5.	EXECUTE:
**i.  DashBoard** 


**Transformed Dataset**

**Summary and recommendations**

ii. Also use the Dashboard to develop a write up or presentation to explain and present your insights and finish with recommendations.



Project Process: 


2.	ANALYSE:


3.	CONSTRUCT:

4.	EXECUTE:
iii. Upload Queries and export results into Excel or Power BI for Explanations.

