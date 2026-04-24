USE northwind;

-- Question 1: Write a query to find the price of the cheapest item that Northwind sells.
-- Then write a second query to find the name of the product that has that price.

SELECT MIN(UnitPrice) AS CheapestPrice
FROM Products;

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products);

-- Question 2: Write a query to find the average price of all items that Northwind sells.
-- (Bonus: use ROUND to round the average price to the nearest cent.)

SELECT ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM Products;

-- Question 3: Write a query to find the price of the most expensive item that Northwind sells.
-- Then write a second query to find the name of the product with that price,
-- plus the name of the supplier for that product.

SELECT MAX(UnitPrice) AS MostExpensivePrice
FROM Products;

SELECT p.ProductName, p.UnitPrice, s.CompanyName AS SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- Question 4: Write a query to find total monthly payroll
-- (the sum of all the employees' monthly salaries).

SELECT ROUND(SUM(Salary), 3) AS TotalMonthlyPayroll
FROM Employees;

-- Question 5: Write a query to identify the highest salary and the lowest salary amounts
-- which any employee makes. (Just the amounts, not the specific employees!)

SELECT ROUND(MAX(Salary), 3) AS HighestSalary, ROUND(MIN(Salary), 3) AS LowestSalary
FROM Employees;

-- Question 6: Write a query to find the name and supplier ID of each supplier
-- and the number of items they supply. Hint: Join is your friend here.

SELECT s.SupplierID, s.CompanyName AS SupplierName, COUNT(p.ProductID) AS ItemCount
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY s.CompanyName ASC;

-- Question 7: Write a query to find the list of all category names and
-- the average price for items in each category.

SELECT c.CategoryName, ROUND(AVG(p.UnitPrice), 2) AS AveragePrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY c.CategoryName ASC;

-- Question 8: Write a query to find, for all suppliers that provide at least 5 items
-- to Northwind, what is the name of each supplier and the number of items they supply.

SELECT s.CompanyName AS SupplierName, COUNT(p.ProductID) AS ItemCount
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
HAVING COUNT(p.ProductID) >= 5
ORDER BY s.CompanyName ASC;

-- Question 9: Write a query to list products currently in inventory by the product id,
-- product name, and inventory value (calculated by multiplying unit price by the number
-- of units on hand). Sort the results in descending order by value. If two or more have
-- the same value, order by product name. If a product is not in stock, leave it off the list.

SELECT
    ProductID,
    ProductName,
    UnitPrice,
    UnitsInStock,
    ROUND(UnitPrice * UnitsInStock, 2) AS InventoryValue
FROM Products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName ASC;