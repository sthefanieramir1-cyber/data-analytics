USE sample_sales;
-- What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?
-- location

-- Colorado in store locations Timelife Record from from 2022 to 2025
SELECT
	sl.State,
	MIN(Transaction_Date) AS Start_Date, 
	MAX(Transaction_Date) AS End_Date,
	SUM(Sale_Amount) AS Revenue
FROM 
store_locations AS sl
INNER JOIN store_sales AS sa
	ON sa.Store_ID = sl.StoreId
WHERE sl.State = 'Colorado'
GROUP BY sl.State;

-- What is the month by month revenue breakdown for the sales territory?

-- Montly revenue for in store colorado locations from 2022 to 2025
SELECT
	DATE_FORMAT(sa.Transaction_Date, '%Y-%m') AS Monthly_Sales_Co,
	SUM(sa.Sale_Amount) AS Revenue
FROM  store_locations AS sl
INNER JOIN store_sales AS sa
	ON sa.Store_ID = sl.StoreId 
WHERE  State = 'Colorado'
GROUP BY Monthly_Sales_Co
ORDER BY Monthly_Sales_Co;

--  Provide a comparison of total revenue for the specific sales territory and the region it belongs to.

-- Colorado Physical Store territory Revenue
WITH CO_Physical_Store_Revenue AS 
( 
SELECT 
	sl.State AS State,
    MIN(sa.Transaction_Date) AS Start_Date, 
    MAX(sa.Transaction_Date) AS End_Date,
	SUM(sa.Sale_Amount) AS Revenue,
	mg.Region
FROM store_locations AS sl
INNER JOIN store_sales AS sa
	ON sa.Store_ID = sl.StoreId
INNER JOIN management AS mg
	ON mg.State = sl.State
WHERE sl.State = 'Colorado'
GROUP BY sl.State, mg.Region),

-- Online West Region Revenue
WestR_Online_Store AS
(
SELECT 
	mg.State AS State,
    MAX(os.Date) AS End_Date,
	MIN(os.Date) AS Start_Date, 
	SUM(os.SalesTotal) AS Revenue_By_ST,
	mg.Region
FROM online_sales AS os
INNER JOIN management AS mg
	ON mg.State = 'Online Sales'
GROUP BY mg.State, mg.Region
)

SELECT * FROM CO_Physical_Store_Revenue 
UNION ALL 
SELECT * FROM WestR_Online_Store;

--  What is the number of transactions per month and average transaction size by product category
-- for the sales territory?

-- Sales per month and average transactions size in Colorado physical stores
WITH Colorado_Sales AS
(  
SELECT
	sa.Store_ID,
	DATE_FORMAT(sa.Transaction_Date, '%Y-%m') AS Monthly_Sales,
	iv.Category AS Products_Category,
	sa.Sale_Amount 
FROM Store_sales AS sa
INNER JOIN Products AS pr
 ON pr.ProdNum = sa.Prod_Num
INNER JOIN store_locations AS sl
 ON sl.StoreId = sa.Store_ID
 INNER JOIN inventory_categories AS iv
	ON iv.Categoryid = pr.Categoryid
WHERE sl.State = 'Colorado'
),

Revenue_By_ProdcutsCO AS 
(
SELECT 
	Monthly_Sales,
	COUNT(Products_Category) AS Total_Transactions,
    SUM(Sale_Amount) AS Total_Revenue, 
    ROUND(AVG(Sale_Amount), 4) AS Average_Revenue,
SUM(CASE WHEN Products_Category = 'Apparel and Merchandise' THEN Sale_Amount ELSE 0 END) AS Apparel,
SUM(CASE WHEN Products_Category = 'Art Supplies' THEN Sale_Amount ELSE 0 END) AS Art_Supplies,
SUM(CASE WHEN Products_Category = 'Books (General)' THEN Sale_Amount ELSE 0 END) AS Books,
SUM(CASE WHEN Products_Category = 'Stationery and Supplies' THEN Sale_Amount ELSE 0 END) AS Stationery,
SUM(CASE WHEN Products_Category = 'Technology & Accessories' THEN Sale_Amount ELSE 0 END) AS Technology,
SUM(CASE WHEN Products_Category = 'Textbooks' THEN Sale_Amount ELSE 0 END) AS Textbooks
FROM Colorado_Sales
GROUP BY Monthly_Sales
)
SELECT * FROM Revenue_By_ProdcutsCO
ORDER BY Monthly_Sales;

-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?

-- Query and subquery for ranking in store colorado locations to calculate store performance
    
SELECT
    Store_Location,
    Monthly_Sales,
    Total_Transactions,
    Total_Revenue,
    Average_Revenue,
RANK() OVER (ORDER BY Total_Revenue DESC) AS Store_Rank
FROM (
  SELECT
	sa.Store_ID,
    sl.StoreLocation AS Store_Location,
	DATE_FORMAT(sa.Transaction_Date, '%Y-%m') AS Monthly_Sales,
	COUNT(sa.Sale_Amount) AS Total_Transactions,
	SUM(sa.Sale_Amount) AS Total_Revenue,
	ROUND(AVG(sa.Sale_Amount), 4) AS Average_Revenue
FROM Store_sales AS sa
INNER JOIN Products AS pr
 ON pr.ProdNum = sa.Prod_Num
INNER JOIN store_locations AS sl
 ON sl.StoreId = sa.Store_ID
WHERE sl.State = 'Colorado'
GROUP BY sa.Store_ID, sl.StoreLocation, Monthly_Sales
) AS CO_Store_Ranking
ORDER BY Store_Rank, Monthly_Sales;
-- What is your recommendation for where to focus sales attention in the next quarter?

-- For next quarter, I suggest focusing sales attention on the Denver and Greeley stores
--  These locations have consistently ranked in the top 10  for both total revenue 
--  and average revenue over the last 5 months, making them the strongest 
--  opportunities for continued growth.
-- As well Schedule territory visits for Rescue Sedalia, New Castle and Milliken
-- due of their flat growth, and below average transaction. 