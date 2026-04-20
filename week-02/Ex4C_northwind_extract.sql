/*) What is the name of the table that holds the items Northwind sells? 
Order_Details
b) What is the name of the table that holds the types/categories of the items 
Northwind sells?
Products */

SELECT * FROM employees;

/*a) Who is the Northwind employee whose name makes it look like she’s a bird? 
Margaret Peacock*/

SELECT * FROM products;

/* This query returns 77 records total. To retrieve only 10 rows, change the toolbar dropdown from 
Don't Limit" to "Limit to 10 rows" at the top of the query panel */

SELECT * FROM products
LIMIT 10;

SELECT * FROM categories;

-- Seafood have CateroryID number 8

SELECT OrderID, OrderDate, ShipName, ShipCountry
FROM orders
LIMIT 50;
