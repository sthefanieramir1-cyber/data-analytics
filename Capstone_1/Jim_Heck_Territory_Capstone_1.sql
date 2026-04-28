-- What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?
-- location

USE sample_sales;

SELECT
lo.State,
MIN(Transaction_Date) as Start_Date, 
MAX(Transaction_Date) as End_Date,
SUM(Sale_Amount) as Revenue
FROM store_locations as lo
INNER JOIN store_sales as sa
ON lo.StoreId = sa.Store_ID
WHERE State = 'Colorado'
GROUP BY State;

-- What is the month by month revenue breakdown for the sales territory?

SELECT
DATE_FORMAT(Transaction_Date, '%Y-%m') as Monthly_Sales22,
SUM(Sale_Amount) as Revenue
FROM store_locations as lo
INNER JOIN store_sales as sa
ON lo.StoreId = sa.Store_ID
WHERE State = 'Colorado'
GROUP BY Monthly_Sales22 ;

--  Provide a comparison of total revenue for the specific sales territory and the region it belongs to.
--  What is the number of transactions per month and average transaction size by product category
-- for the sales territory?



-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?



-- What is your recommendation for where to focus sales attention in the next quarter?