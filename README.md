[highest profit consumer.csv](https://github.com/user-attachments/files/21060142/highest.profit.consumer.customer.csv)
 
 [highest order in corporate customer.csv](https://github.com/user-attachments/files/21060110/highest.order.in.corporate.customer.csv)
 
 [Top sales small business customer.csv](https://github.com/user-attachments/files/21059947/Top.sales.small.business.customer.csv)
 
 [Most expensive Ship Mode.csv](https://github.com/user-attachments/files/21058660/Most.expensive.Ship.Mode.csv)
 
 [bottom 10 customers.csv](https://github.com/user-attachments/files/21058087/bottom.10.customers.csv)
 
 [Ontario _Appliances_Sales Correct.csv](https://github.com/user-attachments/files/21057842/Ontario._Appliances_Sales.Correct.csv)
 
 [bottom 3 by region.csv](https://github.com/user-attachments/files/21057683/bottom.3.by.region.csv)
 
 [top 3 by region.csv](https://github.com/user-attachments/files/21057580/top.3.by.region.csv)
 
 [top 3 by region.csv](https://github.com/user-attachments/files/21057566/top.3.by.region.csv)
 
 [top 3 by region.csv](https://github.com/user-attachments/files/21057556/top.3.by.region.csv)
 
 [top selling.csv](https://github.com/user-attachments/files/21057146/top.selling.csv)
 
 # Kultra-Mega-Stores-KMS-Inventory-Analysis_DSA

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
   
### 3.	CONSTRUCT:

### Case Scenario I: 

***SQL Query file for Scenario I***

[Case_Scenario I SQL Query](https://github.com/AlphaSoji/Kultra-Mega-Stores-KMS-Inventory-Analysis_DSA/blob/main/SQLQuery_CaseScenario_I.sql)

 
***a)	Which product category had the highest sales?***

    ```SELECT TOP 1 
	          Product_Category, MAX(Sales) AS Highest_Selling_Product
        FROM 
	          KMS
        GROUP BY 
	          Product_Category
        ORDER BY 
	          Product_Category Desc```

-  Result

|Product_Category |Highest_Selling_Product|
|-----------------|--------------------|
|Technology |	89061.05|

The highest selling product category is Technology ar $89,061.05.

***b)	What are the Top 3 and Bottom 3 regions in terms of sales?***

***- Top 3 Sales By Region.***

    ```SELECT TOP 3 Region, MAX(Sales) AS Regional_Sales_Performance
       FROM 
          KMS
       GROUP BY 
          Region
       ORDER BY 
           Region Asc```

|Region	|Regional_Sales_Performance|
|--------|---------|
|Atlantic|	89061.05|
|Northwest Territories|	26133.39|
|Nunavut|14223.82|

      
- The 3 highest selling regions are: Atlantic $89,061.o5, Northwest Territories $26,133.39, Nunavut $14,223.82.

***- Bottom 3 Sales By Region.***

    ```SELECT TOP 3 Region, MIN(Sales) AS Regional_Sales_Performance
       FROM 
           KMS
       GROUP BY 
           Region
       ORDER BY 
           Region Desc```
           

|Region|Regional_Sales_Performance|
|:-------|-------|
|Yukon|	3.23|
|West|2.24|
|Quebec|3.42|

- The 3 lowest selling regions are: Yukon $3.23, West $2.24.39, Quebec $3.42.

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

|Province|	Appliances_Sales|
|:-------|----------------------|
  |Ontario|	202346.84|

  
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


|Customer_Name	|total_customer_sales|
|:--------------|------------------|
| Jeremy Farry	|85.72|
  |Natalie DeCherney|	125.90|
  |Nicole Fjeld	|153.03|
 | Katrina Edelman|	180.76|
 | Dorothy Dickinson|	198.08|
  |Christine Kargatis|	293.22|
 | Eric Murdock|	343.33|
 | Chris McAfee|	350.18|
 |Rick Huthwaite|	415.82|
  |Mark Hamilton|	450.99|

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

|ship_mode|	total_shipping_cost|
|:--------|------------------|
|Delivery Truck|	51971.94|

- KMS incured the most shipping cost using the Delivery Truck method, $51,971.94.
  
   - [Uploading MosDelivery Truck,51971.94
t expensive Ship Mode.csv…]()

### Case Scenario II:

***SQL Query file for Scenario II***



***a)	Who are the most valuable customers, and what products or services do they typically purchase?***

  ***Top 10 Most valuable***
	```SELECT TOP 10
    		customer_name,
    		SUM(sales) AS Total_customer_sales
	   FROM
    		KMS
	   GROUP BY
    		customer_name
	   ORDER BY
   		total_customer_sales DESC```


|customer_name|	Total_customer_sales|
|:------------|---------------|
|Emily Phan	|117124.43|
|Deborah Brumfield|	97433.14|
|Roy Skaria	|92542.16|
|Sylvia Foulston|	88875.76|
|Grant Carroll	|88417.00|
|Alejandro Grove|	83561.93|
|Darren Budd	|81577.35|
|Julia Barnett	|80044.46|
|John Lucas	|79696.19|
|Liz MacKendrick|	76306.43|


	```SELECT
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
    		Customer_Sales_by_Category DESC;```

	Customer_Name	product_Category	Customer_Sales_by_Category	Orders_in_category
	Alejandro Grove	Office Supplies	51696.02	8
	Alejandro Grove	Furniture	31865.91	6
	Darren Budd	Furniture	43367.21	32
	Darren Budd	Technology	38210.14	9
	Deborah Brumfield	Technology	76795.80	8
	Deborah Brumfield	Furniture	12809.62	4
	Deborah Brumfield	Office Supplies	7827.72	8
	Emily Phan	Technology	110481.96	4
	Emily Phan	Furniture	4011.65	1
	Emily Phan	Office Supplies	2630.82	5
	Grant Carroll	Office Supplies	50837.27	15
	Grant Carroll	Furniture	29826.85	5
	Grant Carroll	Technology	7752.88	7
	John Lucas	Furniture	44090.34	4
	John Lucas	Office Supplies	25818.99	9
	John Lucas	Technology	9786.86	5
	Julia Barnett	Furniture	46359.63	7
	Julia Barnett	Office Supplies	16925.45	10
	Julia Barnett	Technology	16759.38	4
	Liz MacKendrick	Technology	33457.21	6
	Liz MacKendrick	Office Supplies	22346.10	8
	Liz MacKendrick	Furniture	20503.12	6
	Roy Skaria	Furniture	50177.24	8
	Roy Skaria	Technology	30349.40	6
	Roy Skaria	Office Supplies	12015.52	12
	Sylvia Foulston	Furniture	48173.38	10
	Sylvia Foulston	Technology	29669.04	5
	Sylvia Foulston	Office Supplies	11033.34	9
   
    - [Uploading ToAlejandro Grove,Office Supplies,51696.02,8
Alejandro Grove,Furniture,31865.91,6
Darren Budd,Furniture,43367.21,32
Darren Budd,Technology,38210.14,9
Deborah Brumfield,Technology,76795.80,8
Deborah Brumfield,Furniture,12809.62,4
Deborah Brumfield,Office Supplies,7827.72,8
Emily Phan,Technology,110481.96,4
Emily Phan,Furniture,4011.65,1
Emily Phan,Office Supplies,2630.82,5
Grant Carroll,Office Supplies,50837.27,15
Grant Carroll,Furniture,29826.85,5
Grant Carroll,Technology,7752.88,7
John Lucas,Furniture,44090.34,4
John Lucas,Office Supplies,25818.99,9
John Lucas,Technology,9786.86,5
Julia Barnett,Furniture,46359.63,7
Julia Barnett,Office Supplies,16925.45,10
Julia Barnett,Technology,16759.38,4
Liz MacKendrick,Technology,33457.21,6
Liz MacKendrick,Office Supplies,22346.10,8
Liz MacKendrick,Furniture,20503.12,6
Roy Skaria,Furniture,50177.24,8
Roy Skaria,Technology,30349.40,6
Roy Skaria,Office Supplies,12015.52,12
Sylvia Foulston,Furniture,48173.38,10
Sylvia Foulston,Technology,29669.04,5
Sylvia Foulston,Office Supplies,11033.34,9
p 10 Customers and Typical products.csv…]()

***b)	Which small business customer had the highest sales?***

    ```SELECT TOP 1 
    		Customer_Name, Order_Quantity, Sales	
       FROM 
       		KMS
       WHERE 
       		Customer_Segment = 'Small Business'
       ORDER BY 
       		Sales```

  - Customer_Name	Order_Quantity	Sales
	Ken Dana	1	3.20
  - [Uploading TKen Dana,3553,25318,2011-11-19,Critical,1,3.20,0.09,Regular Air,-3.16,1.88,1.49,Ken Dana,Alberta,West,Small Business,Office Supplies,Binders and Binder Accessories,Staples® General Use 3-Ring Binders,Small Box,0.37,2011-11-21
op sales small business customer.csv…]()


***c)	Which Corporate Customer placed the most number of orders in 2009 – 2012?***

	```SELECT TOP 1 Customer_Name, Order_Quantity, Customer_Segment
	   FROM 
    		KMS
	   WHERE 
    		Customer_Segment = 'Corporate' AND YEAR(Order_date) BETWEEN 2009 AND 2012
	   ORDER BY 
    		Order_Quantity Desc```

      
   - Customer_Name	Order_Quantity	Customer_Segment
	Barry Weirich	50	Corporate
   - [Uploading Barry Weirich,50,Corporate
highest order in corporate customer.csv…]()

***d)	Which consumer customer was the most profitable one?***

	```SELECT TOP 1 
 		Customer_Name, Profit, Customer_Segment
	   FROM 
    		KMS
	   WHERE 
    		Customer_Segment = 'Consumer' 
	   ORDER BY 
    		Profit Desc```

	- Customer_Name	Profit	Customer_Segment
	Emily Phan	27220.69	Consumer
 	- [Uploading highEmily Phan,27220.69,Consumer
est profit consumer customer.csv…]()

***e)	Which customers returned items, and what segment do they belong to?***

	```SELECT DISTINCT
   		K.Customer_Name,
   		K.Customer_Segment
	   FROM
    		KMS AS K
	   JOIN
    		Order_Status AS O ON K.order_id = O.order_id
	    WHERE
    		O.status = 'Returned';```

      419 customers returned various items accross 4 segements: Corporate, Home Office, Consumer and Small Business.

      ```SELECT DISTINCT
    		K.Customer_Segment
	 FROM
    		KMS AS K
	 JOIN
    		Order_Status AS O ON K.order_id = O.order_id
	WHERE
    		O.status = 'Returned';

      - Customer_Segment
	Corporate
	Home Office
	Consumer
	Small Business
***f)	If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the companyappropriately spent shipping costs based on the Order Priority? Explain your answer!!***
### 5.	EXECUTE:
**i.  DashBoard** 


**Transformed Dataset**

**Summary and recommendations**



