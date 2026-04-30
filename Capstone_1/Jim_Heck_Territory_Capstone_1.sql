-- What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?
-- location

USE sample_sales;

SELECT
lo.State,
MIN(Transaction_Date) AS Start_Date, 
MAX(Transaction_Date) AS End_Date,
SUM(Sale_Amount) AS Revenue
FROM store_locations AS lo
INNER JOIN store_sales AS sa
ON lo.StoreId = sa.Store_ID
WHERE State = 'Colorado'
GROUP BY State;

-- What is the month by month revenue breakdown for the sales territory?

SELECT
DATE_FORMAT(Transaction_Date, '%Y-%m') AS Monthly_Sales22,
SUM(Sale_Amount) AS Revenue
FROM store_locations AS lo
INNER JOIN store_sales AS sa
ON lo.StoreId = sa.Store_ID
WHERE State = 'Colorado'
GROUP BY Monthly_Sales22;


--  Provide a comparison of total revenue for the specific sales territory and the region it belongs to.

-- Colorado Physical Store territory Revenue
WITH ColoradoPh_Store AS
( 
SELECT
lo.State as State,
MIN(sa.Transaction_Date) AS Start_Date, 
MAX(sa.Transaction_Date) AS End_Date,
SUM(sa.Sale_Amount) AS Revenue,
mg.Region
FROM store_locations AS lo
INNER JOIN store_sales AS sa
ON lo.StoreId = sa.Store_ID
INNER JOIN management AS mg
ON lo.State = mg.State
WHERE lo.State = 'Colorado'
GROUP BY lo.State, mg.Region
),
-- Online West Region Revenue
WestR_Online_Store AS
(
SELECT 
mg.State AS State,
MIN(os.Date) AS Start_Date, 
MAX(os.Date) AS End_Date,
SUM(os.SalesTotal) AS Revenue_By_ST,
mg.Region
FROM online_sales AS os
INNER JOIN management AS mg
ON mg.State = 'Online Sales'
GROUP BY mg.State, mg.Region
)

SELECT * FROM ColoradoPh_Store 
UNION ALL 
SELECT * FROM WestR_Online_Store;

--  What is the number of transactions per month and average transaction size by product category
-- for the sales territory?

-- Sales per month and average transactions size in Colorado physical store
SELECT
sa.Store_ID,  
DATE_FORMAT(sa.Transaction_Date, '%Y-%m') AS Monthly_Sales_CL,
pr.Categoryid AS Products_Category,
sa.Prod_Num,
AVG(sa.Sale_Amount) AS Revenue
FROM Store_sales AS sa
INNER JOIN Products AS pr
ON pr.ProdNum = sa.Prod_Num
INNER JOIN store_locations AS lo
ON lo.StoreId = sa.Store_ID
WHERE lo.State = 'Colorado'
GROUP BY
sa.Store_ID,
Monthly_Sales_CL,
pr.Categoryid,
sa.Prod_Num;




-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?



-- What is your recommendation for where to focus sales attention in the next quarter?