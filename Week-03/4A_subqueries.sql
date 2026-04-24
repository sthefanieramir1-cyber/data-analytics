USE northwind;

-- Question 1: What is the product name(s) of the most expensive products?

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- Question 2: What is the product name(s) and categories of the least
-- expensive products?

SELECT p.ProductName, p.UnitPrice, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = (SELECT MIN(UnitPrice) FROM Products);

-- Question 3: What is the order id, shipping name and shipping address of all orders
-- shipped via "Federal Shipping"?

SELECT o.OrderID, o.ShipName, o.ShipAddress, s.CompanyName AS Shipper
FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE o.ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Federal Shipping');

-- Question 4: What are the order ids of the orders that included "Sasquatch Ale"?

SELECT od.OrderID, p.ProductName
FROM `Order Details` od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.ProductID = (SELECT ProductID FROM Products 
WHERE ProductName = 'Sasquatch Ale');

-- Question 5: What is the name of the employee that sold order 10266?

SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID = (SELECT EmployeeID FROM Orders WHERE OrderID = 10266);

-- Janet Leverling

-- Question 6: What is the name of the customer that bought order 10266?

SELECT CompanyName, ContactName
FROM Customers
WHERE CustomerID = (SELECT CustomerID FROM Orders WHERE OrderID = 10266);

-- Pirkko Koskitalo