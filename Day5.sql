-- *********************************************** 22 - 12 - 2024 ************************************************

USE STUDENT;		-- here we're using Student database which is created in previous Day4.sql script.
SHOW TABLES;		-- it will show all the tables which are created under Student Database.

-- ***************************************** LIMIT CLAUSE ********************************************************
SELECT * FROM ENTRIES;				-- this will show all records from table
SELECT * FROM ENTRIES LIMIT 4;		-- this will show only 4 records from table since we have set the limit.

SELECT * FROM ENTRIES WHERE MARKS > 60 LIMIT 2; 	-- here total students is 4 who have > 60 marks since we have set the limit it will show only 2 students entry.


-- ******************************************** ORDER BY CLAUSE ***************************************************

SELECT * FROM ENTRIES ORDER BY CITY ASC;		-- it will short the order in asceding order as per City.
SELECT * FROM ENTRIES ORDER BY MARKS DESC;		-- it will short the order in disceding order as per Marks.
SELECT * FROM ENTRIES ORDER BY MARKS DESC LIMIT 3;		-- It will give TOP 3 students in class who scored high marks.


-- ******************************************* AGGREGATE FUNCTIONS **************************************************
SELECT COUNT(ROLLNO) AS TOTAL_STUDENTS FROM ENTRIES;
SELECT COUNT(ROLLNO) AS TOTAL_STUDENT_MARKS_MORE_THAN_70 FROM ENTRIES WHERE MARKS > 70;

SELECT MAX(MARKS) AS STUDENT_HAVING_MAX_MARKS FROM ENTRIES;
SELECT MIN(MARKS) AS STUDENT_HAVING_MIN_MARKS FROM ENTRIES;

SELECT AVG(MARKS) AS AVG_MARKS_IN_CLASS FROM ENTRIES;
SELECT SUM(MARKS) AS WHOLE_CLASS_TOTAL_MARKS FROM ENTRIES;


-- ********************************************* GROUP BY CLAUSE ***********************************************

-- The GROUP BY clause in SQL is used to group rows with the same values in specified columns and aggregate data (e.g., using COUNT, SUM, AVG) for each group.
-- Basically you can fetch / sort the data as per your desired column..
-- Note --> make sure each col(except aggregate fun col name. eg - count(rollno)) mention in select statement should be mentioned in Group By Clause. 
-- SEE EXP - 3RD SQL STATEMENT IT WILL ERROR 1055.

-- EXP - COUNT NO. OF STUDENTS IN EACH CITY
-- EXP - AVG MARKS OF STUDENTS IN EACH CITY

SELECT CITY , COUNT(ROLLNO) AS TOTAL_STUDENTS FROM ENTRIES GROUP BY CITY;
SELECT CITY , AVG(MARKS) AS AVG_MARKS FROM ENTRIES GROUP BY CITY;
SELECT CITY , NAME, COUNT(ROLLNO) AS TOTAL_STUDENTS FROM ENTRIES GROUP BY CITY;
-- To avoid 1055 Error see below query we have added Name coulmn also in GROUP BY clause.
SELECT CITY , NAME, COUNT(ROLLNO) AS TOTAL_STUDENTS FROM ENTRIES GROUP BY CITY , NAME;



-- ========================================= Practice Question ==================================================

-- QUES - 1 ---------- Write a query to find avg marks in each city in ascending order..alter

SELECT CITY , AVG(MARKS) AS AVG_MARKS FROM ENTRIES GROUP BY CITY ORDER BY AVG(MARKS) ASC ;
SELECT CITY , AVG(MARKS) AS AVG_MARKS FROM ENTRIES GROUP BY CITY ORDER BY CITY ASC;			-- You can sort by City also. 

-- QUES - 2 -------  CRAETE A DB CALLED CUSTOMER AND TABLE CALLED PAYMENT WHICH IS HAVING COLUMN ID , NAME , PAYMENT_MODE , CITY 
-- ----------------  AND THEN FIND THE TOTAL HOW MANY TIMES PAYMENT HAPPEND ACCORDING TO EACH PAYMENT METHOD.


CREATE DATABASE CUSTOMER;
USE CUSTOMER;

CREATE TABLE PAYMENT (
ID INT NOT NULL,
NAME VARCHAR(20),
PAYMENT_MODE VARCHAR(20),
CITY VARCHAR(20) );

INSERT INTO PAYMENT (ID , NAME , PAYMENT_MODE , CITY) VALUES 
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

SELECT * FROM PAYMENT;

SELECT PAYMENT_MODE , COUNT(NAME) AS TOTAL_PAYMENT FROM PAYMENT GROUP BY PAYMENT_MODE;		-- This will tell you how many times total payment happend through each mode.



-- QUES - 3 -----------------------> USE STUDENT DB AND TELL HOW MANY STUDENTS GOT WHICH GRADE.

USE STUDENT;
SELECT GRADE FROM ENTRIES GROUP BY GRADE;		-- THIS WILL GROUP THE GRADE COLUMN. IN 2ND QUERY WE CAN FETCH DATA.
SELECT GRADE , COUNT(ROLLNO) AS TOTAL_STUDENTS FROM ENTRIES GROUP BY GRADE;			-- THIS WILL TELL HOW MANY STUDENT GOT WHICH GRADE





-- *********************************************** HAVING CLAUSE ****************************************************

-- IT IS ALSO SAME AS WHERE CLAUSE. USED TO PUT CODITIONS BUT DIFFERENCE IS WE USED HAVING TO PUT CONDITION AFTER GROUPING.
-- WHERE USED TO PUT COND ON ROWS BUT HAVING USED TO PUT COND ON GROUPS.

-- EXP -- COUNT NO. OF STUDNETS IN EACH CITY WHERE MAX MARKS CROSS 80.

SELECT CITY , MARKS , COUNT(ROLLNO) FROM ENTRIES GROUP BY CITY , MARKS HAVING MAX(MARKS) > 80;



-- ============================================== GENERAL ORDER TO USE ALL CLAUSE AND STATEMENTS ====================================

-- SELECT columns 
-- FROM table_name
-- WHERE condition
-- GROUP BY columns
-- HAVING condition
-- ORDER BY columns ASC;

-- EXP -- BELOW 

SELECT CITY 
FROM ENTRIES 
WHERE GRADE ='B' 
GROUP BY CITY 
HAVING MAX(MARKS) > 70 
ORDER BY CITY ASC;