USE northwind;

-- Question 1: Create a single query to list the product id, product name,
-- unit price and category name of all products.
-- Order by category name and within that, by product name.

SELECT
    p.ProductID,
    p.ProductName,
    p.UnitPrice,
    c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC, p.ProductName ASC;

-- Question 2: Create a single query to list the product id, product name,
-- unit price and supplier name of all products that cost more
-- than $75. Order by product name.

SELECT
    p.ProductID,
    p.ProductName,
    p.UnitPrice,
    s.CompanyName AS SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 75
ORDER BY p.ProductName ASC;

-- Question 3: Create a single query to list the product id, product name,
-- unit price, category name, and supplier name of every
-- product. Order by product name.

SELECT
    p.ProductID,
    p.ProductName,
    p.UnitPrice,
    c.CategoryName,
    s.CompanyName AS SupplierName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY p.ProductName ASC;

-- Question 4: Create a single query to list the order id, ship name,
-- ship address, and shipping company name of every order
-- that shipped to Germany. Assign the shipping company name
-- the alias 'Shipper.' Order by the name of the shipper,
-- then the name of who it shipped to.

SELECT
    o.OrderID,
    o.ShipName,
    o.ShipAddress,
    sh.CompanyName AS Shipper
FROM Orders o
JOIN Shippers sh ON o.ShipVia = sh.ShipperID
WHERE o.ShipCountry = 'Germany'
ORDER BY sh.CompanyName ASC, o.ShipName ASC;

-- Question 5: Start from the same query as above (#4), but omit OrderID
-- and add logic to group by ship name, with a count of how
-- many orders were shipped for that ship name.

SELECT
    o.ShipName,
    o.ShipAddress,
    sh.CompanyName AS Shipper,
    COUNT(*) AS OrderCount
FROM Orders o
JOIN Shippers sh ON o.ShipVia = sh.ShipperID
WHERE o.ShipCountry = 'Germany'
GROUP BY o.ShipName, o.ShipAddress, sh.CompanyName
ORDER BY sh.CompanyName ASC, o.ShipName ASC;

--  Question 6: Create a single query to list the order id, order date,
-- ship name, ship address of all orders that included
-- Sasquatch Ale.
-- Hint: Join on three tables (Order Details has a space in
-- its name, so it must be wrapped in backticks).

SELECT
    o.OrderID,
    o.OrderDate,
    o.ShipName,
    o.ShipAddress
FROM Orders o
JOIN `Order Details` od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Sasquatch Ale'
ORDER BY o.OrderDate ASC;