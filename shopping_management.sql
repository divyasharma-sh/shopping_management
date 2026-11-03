-- DATABASE SETUP--
DROP DATABASE IF EXISTS Shopping_management;
CREATE DATABASE Shopping_management;
USE Shopping_management;


CREATE TABLE customer(
	Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name CHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone_Number CHAR(10),
    Age INT CHECK(Age > 0),
    Gender ENUM('Male','Female','Other'),
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customer_status ENUM('Active','Inactive','Blocked') DEFAULT 'Active',
    Customer_Notes TINYTEXT
);


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    Payment_Method ENUM('Cash', 'Card', 'UPI', 'Net Banking'),
    Payment_Status ENUM('Pending', 'Paid', 'Failed') DEFAULT 'Pending',
    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched', 'In Transit', 'Delivered', 'Returned') DEFAULT 'Not Dispatched',
    Order_Notes TINYTEXT,
-- foreign key with CASCADE
    CONSTRAINT fk_customer_order FOREIGN KEY (Customer_Id) REFERENCES customer(Customer_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

USE Shopping_Management;
SHOW TABLES;
  
DESCRIBE customer;
DESCRIBE orders;
    

    
    
    
    
    