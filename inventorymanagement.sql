-- 📌 Inventory Management System Database
-- Week 8 Assignment

-- ✅ Step 1: Create Database
CREATE DATABASE inventory_management;
USE inventory_management;

-- ✅ Step 2: Creating the Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each user
    FullName VARCHAR(255) NOT NULL,  -- Stores user's full name
    Email VARCHAR(255) UNIQUE NOT NULL,  -- Ensures each email is unique
    Role ENUM('Admin', 'Manager', 'Staff') NOT NULL  -- Defines user role
);

-- ✅ Step 3: Creating the Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each product
    ProductName VARCHAR(255) NOT NULL,  -- Name of the product
    Category VARCHAR(100) NOT NULL,  -- Product category (Electronics, Clothing, etc.)
    StockQuantity INT DEFAULT 0,  -- Track available stock
    Price DECIMAL(10,2) NOT NULL  -- Product price
);

-- ✅ Step 4: Creating the Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each supplier
    SupplierName VARCHAR(255) NOT NULL,  -- Name of the supplier
    ContactInfo VARCHAR(255)  -- Supplier contact details
);

-- ✅ Step 5: Creating the Inventory Transactions Table
CREATE TABLE InventoryTransactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each transaction
    ProductID INT NOT NULL,  -- References Products table
    SupplierID INT,  -- Optional reference to Suppliers table
    UserID INT NOT NULL,  -- References Users table (who recorded the transaction)
    TransactionType ENUM('Purchase', 'Sale', 'Return') NOT NULL,  -- Type of transaction
    Quantity INT NOT NULL,  -- Amount involved in the transaction
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Automatically logs transaction time
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ✅ Step 6: Verify Table Creation
SHOW TABLES;
DESCRIBE Users;
DESCRIBE Products;
DESCRIBE Suppliers;
DESCRIBE InventoryTransactions;
