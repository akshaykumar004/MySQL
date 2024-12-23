-- *********************************************** 22 - 12 - 2024 ************************************************

-- ------------------------------ TABLE RELATED QUERIES - DML ------------------------------------------

-- *********************** UPDATE  *************************************
-- It will update the existing records.alter

USE STUDENT;		-- THIS WILL USE STUDENT DATABASE
SHOW TABLES;		-- THIS WILL SHOW ALL THE TABLES UNDER STUDENT DB.

SELECT * FROM ENTRIES;
-- TO UPDATE OUR TABLE WE HAVE TO DISABLE THE SAFE MODE OTHERWISE IT WILL GIVE ERROR 1175. CHECK WITH BELOW QUERY.
UPDATE ENTRIES SET NAME = 'ANKITA' WHERE NAME = 'POOJA';

-- DISABLE SAFE MODE --
SET SQL_SAFE_UPDATES = 0;

UPDATE ENTRIES SET NAME = 'ANKITA' WHERE NAME = 'POOJA';
SELECT * FROM ENTRIES;		-- NOW YOU CAN CHECK. NAME HAS BEEN CHANGED TO ANKITA.

UPDATE ENTRIES SET MARKS = MARKS + 1;		-- IT WILL INCREASE EVERY STUDENT MARKS BY 1.
SELECT * FROM ENTRIES;



-- ********************************** DELETE **************************************************************

INSERT INTO ENTRIES (ROLLNO , NAME , MARKS , GRADE , CITY) VALUES
(108, 'Lucas Carter', 33, 'F', 'Boston'),
(109, 'Isabella Martinez', 40, 'F', 'Nashville'),
(110, 'Jackson Brooks', 45, 'F', 'Boston');

SELECT * FROM ENTRIES;		-- WE HAVE ADDED FEW ENTRIES TO PERFORM DELETE OPERATION. 

DELETE FROM ENTRIES WHERE MARKS < 45;		-- IT WILL DELETE ALL ENTRIES WHICH HAVING MARKS < 45.
SELECT * FROM ENTRIES;

DELETE FROM ENTRIES WHERE GRADE = 'F';		-- IT WILL DELETE ALL ENTRIES WHICH HAVING GRADE F.
SELECT * FROM ENTRIES;



-- ************************************ FOREIGN KEY ***********************************************

CREATE TABLE BOOKS (
ID INT PRIMARY KEY ,
NAME VARCHAR (20));
-- while inserting data into table books since column NAME having length 20 so books name more 20 char are not coming. so tried to drop table and again create a new
-- table with same name with extended length but its not happening because this table is linked with 2nd table with forein key.
-- so I have to alter the table now. see below queries for explanation.

DROP TABLE BOOKS;
ALTER TABLE BOOKS
MODIFY COLUMN NAME VARCHAR(60);

INSERT INTO BOOKS (ID , NAME) VALUES
	(1001, 'The Alchemist'),
    (1002, 'The Catcher in the Rye'),
    (1003, 'The Kite Runner'),
    (1004, 'Little Women'),
    (1005, 'A Song of Ice and Fire'),
    (1006, 'Thinking, Fast and Slow'),
    (1007, 'Sapiens: A Brief History of Humankind'),
    (1008, 'The Silent Patient'),
    (1009, 'Rich Dad Poor Dad'),
    (1010, 'How to Win Friends and Influence People');
    
SELECT * FROM BOOKS;


CREATE TABLE TEACHER (
ID INT ,
NAME VARCHAR(20),
BOOK_ID INT ,
FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(ID)
ON UPDATE CASCADE							-- SEE BELOW EXPLANATION
ON DELETE CASCADE							-- SEE BELOW EXPLANATION
);
DROP TABLES TEACHER;		-- AT FIRST TIME FORGOT TO ADD THIS CASCADE SO DELETED THE TABLE AND RECREATED WITH CASCADE
SHOW TABLES;		-- THIS WILL SHOW ALL TABLES FROM STUDENT DATABASE.

INSERT INTO TEACHER (ID, NAME, BOOK_ID)
VALUES
    (1, 'John Smith', 1001),
    (2, 'Emily Davis', 1002),
    (3, 'Michael Brown', 1003),
    (4, 'Sophia Taylor', 1004),
    (5, 'Daniel Wilson', 1005),
    (6, 'Olivia Johnson', 1006),
    (7, 'William Moore', 1007),
    (8, 'Ava Martin', 1008),
    (9, 'James Anderson', 1009),
    (10, 'Isabella Thomas', 1010);
    
SELECT * FROM TEACHER;

-- You can check this table relationship into EER (Entity Relationship Diagram).. 
-- Go to – Database -> Reverse Engineer -> Next -> Next -> choose your DB (which having table of primary key and foreign key) -> Next till execute -> Execute -> Finish

-- ***************************************** CASCADING FOREIGN KEY ************************************************
-- 1st table(Having Primary Key) is called -> Parent Table and 2nd table(Having Foreign Key) is called -> Child Table

-- On Delete Cascade: When a row is deleted from the parent table, the corresponding rows in the child table are also automatically deleted.
-- On Update Cascade: When a row in the parent table is updated, the corresponding rows in the child table are automatically updated as well.
-- You can use ON DELETE CASCADE and ON UPDATE CASCADE together.

UPDATE BOOKS SET ID = 1111 WHERE ID = 1004;
SELECT * FROM BOOKS;		-- NOW PARENT TABLE HAS UPDATED 
SELECT * FROM TEACHER;		-- YOU CAN SEE CHILD TABLE ALSO UPDATED AUTOMATICALLY FOR ID 1004. LIKE THAT DELETE ALSO WILL WORK.
