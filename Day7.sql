-- *********************************************** 23 - 12 - 2024 ************************************************

-- ------------------------------ TABLE RELATED QUERIES - DDL ------------------------------------------

-- ******************************** ALTER  *************************************
-- We use ALTER in DDL (Data Definition Language) to modify the structure of an existing database object, 
-- such as adding, deleting, or updating columns, constraints, or other properties of tables.

USE STUDENT;
SHOW TABLES;

SELECT * FROM ENTRIES;

ALTER TABLE ENTRIES ADD COLUMN AGE INT ;		-- USING ALTER WE CAN ADD A COLUMN IN EXISTING TABLE.
SELECT * FROM ENTRIES;
ALTER TABLE ENTRIES ADD COLUMN COLLEGE INT AFTER NAME;	-- ALSO WE CAN ADD COL IN BETWEEN TWO COLUMN USING KEYWORD AFTER.
SELECT * FROM ENTRIES;

-- DROP: Used in DDL to delete database objects like tables, databases, or constraints permanently.

ALTER TABLE ENTRIES DROP COLUMN AGE;		-- USING DROP WE DELETED THE AGE COLUMN. WE CAN'T DIRECTLY DELETE THE COLUMN, WE HAVE TO ALTER THE TABLE FIRST.
SELECT * FROM ENTRIES;


-- RENAME: Used in DDL to change the name of a database object, such as a table or column.

ALTER TABLE ENTRIES RENAME COLUMN COLLEGE TO AGE;		-- WE RENAMED THE COLUMN COLLEGE TO AGE.
SELECT * FROM ENTRIES;

ALTER TABLE ENTRIES RENAME TO STDDB;
SHOW TABLES;
SELECT * FROM STDDB;

ALTER TABLE STDDB RENAME TO ENTRIES;		-- RENAMED BACK TO ENTRIES.
SHOW TABLES;
SELECT * FROM ENTRIES;


-- ************************** CHANGE AND MODIFY USING ALTER ******************

ALTER TABLE ENTRIES CHANGE COLUMN AGE COLLEGE INT;
SELECT * FROM ENTRIES;

ALTER TABLE ENTRIES MODIFY COLUMN COLLEGE VARCHAR(60);		-- MODIFIED THE COLUMN COLLEGE IT'S DATATYPE.
SELECT * FROM ENTRIES;
SHOW COLUMNS FROM ENTRIES;		-- WILL SHOW COLUMN DETAILS OF ENTRIES TABLE.
DESCRIBE ENTRIES;		-- USING DESCRIBE KEYWORD WE CAN SEE THE DETAILS OF ALL COLUMN OF TABLE. 


-- CREATE: Used in DDL to create new database objects like tables, databases, or views.
-- TRUNCATE: Used in DDL to delete all rows from a table without logging individual row deletions.
-- ***************************************************************
-- DIFFERENCE BETWEEN DROP AND TRUNCATE
-- DROP -->	Deletes the entire table (structure + data). Removes the table structure completely. Cannot be rolled back.
-- TRUNCATE --> Deletes all rows in a table, keeps structure. Retains the table structure. Cannot be rolled back.
-- 	
-- Create the table for products
USE CUSTOMER;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(100)
);

SHOW TABLES;

-- Insert demo data
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier)
VALUES
    (1, 'Laptop', 'Electronics', 899.99, 30, 'Tech Supplies Co.'),
    (2, 'Wireless Mouse', 'Accessories', 19.99, 100, 'Accessories World'),
    (3, 'Smartphone', 'Electronics', 499.99, 50, 'Mobile Gadgets Ltd.'),
    (4, 'Office Chair', 'Furniture', 129.99, 15, 'Comfort Seating'),
    (5, 'Bluetooth Headphones', 'Electronics', 79.99, 60, 'SoundTech Inc.'),
    (6, 'Gaming Monitor', 'Electronics', 299.99, 20, 'Vision Displays');

-- To check if the data is inserted
SELECT * FROM Products;

TRUNCATE TABLE Products;		-- IT WILL DELETE ALL THE DATA OF TABLE ENTRIES BUT NOT STRUCTURE. WE CAN RE-INSERT THE DATA.
SELECT * FROM Products;			-- HERE ONLY TABLE STRUCTURE WILL SHOW. ALL DATA ARE DLEETED NOW.



-- =================================================== PRACTICE QUESTION =============================================================

-- QUES - 1 CREATE A TABLE WITH NAME MARKS AND GRADE

CREATE DATABASE PRACTICE_QUESTION;
USE PRACTICE_QUESTION;

CREATE TABLE DEMO (ROLLNO INT NOT NULL , 
NAME VARCHAR (30), 
MARKS INT, 
GRADE VARCHAR(2) );

SELECT * FROM DEMO;

INSERT INTO DEMO (ROLLNO, NAME, MARKS, GRADE) VALUES 
(1, 'John Doe', 85, 'A'),
(2, 'Jane Smith', 75, 'B'),
(3, 'Alice Brown', 92, 'A'),
(4, 'Bob White', 68, 'C'),
(5, 'Charlie Green', 80, 'B');

SELECT * FROM DEMO;

-- QUES - 2 ----------CHANGE THE NAME OF COLUMN NAME TO FULL NAME--------------
ALTER TABLE DEMO CHANGE COLUMN NAME FULL_NAME VARCHAR (30);			-- USING CHANGE COMMAND YOU CAN CHANGE THE NAME OF COLUMN.
ALTER TABLE DEMO RENAME COLUMN NAME TO FULL_NAME;			-- LIKE THIS ALSO YOU CAN CHANGE THE NAME. RENAME CAN BE USE IN POSTGREY SQL OR SQL SERVER.
SELECT VERSION();		-- TO CHECK VERSION OF MYSQL. SINCE I AM USING V8.0.39 THATS WHY RENAME IS WORKING IN MYSQL OTHERWISE IT WILL NOT WORK FOR BELOW VERSIONS.
SELECT * FROM DEMO;

-- QUES - 3 ----------DELETE ALL THE STUDENTS WHO SCORED MARKS LESS THAN 80 --------------

DELETE FROM DEMO WHERE MARKS < 80; 
SELECT * FROM DEMO;


-- QUES - 4 ----------DELETE THE COLUMN FOR GRADE ----------------------------------

ALTER TABLE DEMO DROP COLUMN GRADE;
SELECT * FROM DEMO;
