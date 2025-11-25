--Skapa databas
GO
CREATE DATABASE ECommerceDB;
GO
USE ECommerceDB;
GO

--Skapa tabeller

--Customer
CREATE TABLE Customer (
  CustomerId INT PRIMARY KEY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  City NVARCHAR(50) NOT NULL
);

--Product
CREATE TABLE Product (
  ProductId INT PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL,
  Price DECIMAL(8,2) CHECK (Price >= 0)
);

--OrderHeader
CREATE TABLE OrderHeader (
  OrderId INT PRIMARY KEY,
  FkCustomerId INT NOT NULL,
  OrderDate DATE NOT NULL,
  CONSTRAINT FK_OrderHeader_Customer FOREIGN KEY (FkCustomerId)
    REFERENCES Customer(CustomerId)
);

--OrderLine
CREATE TABLE OrderLine (
  OrderLineId INT PRIMARY KEY,
  FkOrderId INT NOT NULL,
  FkProductId INT NOT NULL,
  Quantity INT CHECK (Quantity > 0),
  CONSTRAINT FK_OrderLine_OrderHeader FOREIGN KEY (FkOrderId)
    REFERENCES OrderHeader(OrderId),
  CONSTRAINT FK_OrderLine_Product FOREIGN KEY (FkProductId)
    REFERENCES Product(ProductId)
);

--Fyll tabellerna med dummy-data

--Customer
INSERT INTO Customer (CustomerId, FirstName, LastName, City) VALUES
(1, 'Anna', 'Andersson', 'Stockholm'),
(2, 'Bertil', 'Berg', 'Göteborg'),
(3, 'Carina', 'Carlsson', 'Malmö'),
(4, 'David', 'Dahl', 'Uppsala');

--Product
INSERT INTO Product (ProductId, Name, Price) VALUES
(101, 'Laptop', 8999.00),
(102, 'Mobiltelefon', 6999.00),
(103, 'Hörlurar', 499.00),
(104, 'Tangentbord', 299.00),
(105, 'Skärm', 1999.00);

--OrderHeader
INSERT INTO OrderHeader (OrderId, FkCustomerId, OrderDate) VALUES
(1001, 1, '2025-11-01'),
(1002, 2, '2025-11-05'),
(1003, 1, '2025-11-10'),
(1004, 3, '2025-11-15');

--OrderLine
INSERT INTO OrderLine (OrderLineId, FkOrderId, FkProductId, Quantity) VALUES
(2001, 1001, 101, 1),   -- Anna köper Laptop
(2002, 1001, 103, 2),   -- Anna köper Hörlurar
(2003, 1002, 102, 1),   -- Bertil köper Mobiltelefon
(2004, 1002, 104, 1),   -- Bertil köper Tangentbord
(2005, 1003, 105, 2),   -- Anna köper 2 Skärmar
(2006, 1004, 103, 3);   -- Carina köper 3 Hörlurar