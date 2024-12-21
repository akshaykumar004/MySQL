CREATE DATABASE STUDENT;
USE STUDENT;

CREATE TABLE ENTRIES (
ROLLNO INT NOT NULL,
NAME VARCHAR(20),
MARKS INT NOT NULL,
GRADE VARCHAR(2),
CITY VARCHAR(10) );

INSERT INTO ENTRIES (ROLLNO , NAME, MARKS , GRADE , CITY) VALUES  (100 , 'AKSHAY' , 85 , 'A' , 'LUCKNOW') ,
(101 , 'AKSHAY' , 75 , 'B' , 'PUNE') ,
(102 , 'AMAN' , 65 , 'C' , 'MUMBAI') ,
(103 , 'TANYA' , 60 , 'D' , 'DELHI') ,
(104 , 'POOJA' , 50 , 'E' , 'MUMBAI') ,
(105 , 'ARUN' , 75 , 'B' , 'VARANASI') ,
(106 , 'VRUSHALI' , 90 , 'A' , 'DELHI') ,
(107 , 'TANU' , 65 , 'C' , 'PUNE');

-- ----------------------------------- SELECT --------------------------------------

SELECT * FROM ENTRIES;		-- It will give all details from table entries
SELECT NAME , CITY FROM ENTRIES;		-- It will give only name and city
SELECT DISTINCT CITY FROM ENTRIES;		-- It will give only distinct city(no duplicate) from table

-- Since the name is same for rollno 100 and 101 as Akshay so using update command we can change like below. ----------------------------

UPDATE ENTRIES SET NAME = 'ANUP' WHERE ROLLNO = 101;
-- After executig above update query I'm getting error like I cant update because the safe update mode is enabled in MySQL configuration. 
-- MySQL prevents updates or deletions unless the WHERE clause references a key column 
-- (like a primary key or a unique key). This is a safety feature to prevent accidental updates or deletions.
-- For temporary purpose you can disable the safe mode using below command

SET SQL_SAFE_UPDATES = 0;
-- Now update query executed fine hence again activating safe mode using below command.
SET SQL_SAFE_UPDATES = 1;


------------------------------------ WHERE CLAUSE WITH OPERATORS ---------------------
----------------------- COMPARISON OPERATOR ---------------------------------

SELECT * FROM ENTRIES WHERE MARKS > 70;
SELECT * FROM ENTRIES WHERE MARKS < 70;
SELECT * FROM ENTRIES WHERE MARKS >= 60;
SELECT * FROM ENTRIES WHERE MARKS <= 60;
SELECT * FROM ENTRIES WHERE CITY = 'PUNE';
SELECT * FROM ENTRIES WHERE CITY != 'PUNE';

----------------------- ARITHMETIC OPERATOR ---------------------------------
SELECT * FROM ENTRIES WHERE MARKS + 10 > 70;
SELECT * FROM ENTRIES WHERE MARKS - 20 < 70;
SELECT * FROM ENTRIES WHERE MARKS / 5 >= 60;		-- NO OUTPUT COMING BCZ NO CANDIDATE IS SATISFYING THE CONDITION.
SELECT * FROM ENTRIES WHERE MARKS * 5 <= 60;		-- NO OUTPUT COMING BCZ NO CANDIDATE IS SATISFYING THE CONDITION.
SELECT * FROM ENTRIES WHERE MARKS % 20 < 10;

----------------------- LOGICAL OPERATOR ---------------------------------

SELECT * FROM ENTRIES WHERE MARKS > 70 AND CITY = 'DELHI';
SELECT * FROM ENTRIES WHERE MARKS > 70 OR CITY = 'DELHI';		-- OUTPUT IS COMING DIFFERENT FROM 1ST QUERY BCZ OF OR CONDITION..

SELECT * FROM ENTRIES WHERE MARKS BETWEEN 70 AND 80;			-- THIS WILL GIVE VALUE FROM A RANGE 70 TO 80.
SELECT * FROM ENTRIES WHERE CITY IN ('JAUNPUR' , 'DELHI');			-- IT WILL MATCH ANY VALUE IN THE TABLE MEANS OUTPUT WILL BE FROM JAUNPUR AND DELHI CITY.
SELECT * FROM ENTRIES WHERE MARKS BETWEEN 35 AND 45;				-- OUTPUT IS EMPTY BCZ NO STUDENT HAVING MARKS BETWEEN THIS RANGE. NO ERROR BCZ IT CHECKS COND ONLY.
SELECT * FROM ENTRIES WHERE CITY IN ('BANGLORE' , 'HYDERABAD');		-- OUTPUT IS EMPTY BCZ NO STUDENT IS FROM THIS CITIES. ALSO THIS WILL NOT GIVE ANY ERROR.
SELECT * FROM ENTRIES WHERE CITY NOT IN ('DELHI' , 'PUNE');			-- WILL GIVE OUTPUT WHO IS NOT FROM THIS CITIES.


-- The ALL operator ----- compares a value to all the values in a subquery. It ensures that a condition is true for all rows in the subquery.

-- Example: Find students who scored higher than all students in the MUMBAI CITY .

SELECT NAME , MARKS FROM ENTRIES WHERE MARKS > ALL (	-- The ALL operator ensures the MARKS in the outer query is higher than the marks of every student in MUMBAI CITY.
SELECT MARKS FROM ENTRIES WHERE CITY = 'MUMBAI');		-- The subquery selects all STUDENTS MARKS FROM MUMBAI CITY.

-- -------------------- LIKE Operator --------------------------------------------------------
-- The LIKE operator is used for pattern matching with strings. You can use % for zero or more characters and _ for a single character.

-- Example 1: Find students whose names start and end with "A".

SELECT NAME FROM ENTRIES WHERE NAME LIKE 'A%';		--  % matches any number of characters, so this finds all names starting with "A".
SELECT NAME FROM ENTRIES WHERE NAME LIKE '%A';		--  % matches any number of characters, so this finds all names ending with "A".

-- Example 2: Find students whose names are exactly 4 characters long and start with "A".

SELECT NAME FROM ENTRIES WHERE NAME LIKE 'A___';		--  _ matches a single character, so this finds names like having 4 char and start with A.
SELECT NAME FROM ENTRIES WHERE NAME LIKE '____A';		--  _ matches a single character, so this finds names like having 5 char and ending with A.


-- ------------- ANY Operator -------------------------------------
-- The ANY operator compares a value to any value in a subquery. It is true if the condition is satisfied by at least one row in the subquery.

-- Example: Find students who scored higher than at least one student in the PUNE CITY.

SELECT NAME , MARKS FROM ENTRIES WHERE MARKS > ANY (	-- The ANY operator ensures the MARKS in the outer query is greater than at least one MARKS in the subquery.
SELECT MARKS FROM ENTRIES WHERE CITY = 'PUNE');		-- The subquery selects all STUDENTS MARKS FROM PUNE CITY.



-- ---------------------------------- BITWISE OPERATOR ------------------------------------

-- Bitwise operators in SQL are used to perform operations on binary representations of integers. 
-- These operators work at the bit level, which means they manipulate the individual bits of numbers.

-- 1.---------------------------- Bitwise AND (&) ---------------------------------------------

-- Exp - Returns 1 only if both corresponding bits are 1

SELECT 5 & 3 AS Result;			-- OUTPUT WILL BE 1. SEE BELOW EXPLANATION

-- Binary representation:
-- 5 = 101
-- 3 = 011
-- Bitwise AND:
-- 101 & 011 = 001
-- Result: 1


-- 2. ----------------------------------- Bitwise OR (|) -------------------------------------------------

-- EXP - Returns 1 if at least one corresponding bit is 1.

SELECT 5 | 3 AS Result;			-- OUTPUT WILL BE 7. SEE BELOW EXPLANATION.

-- Binary representation:
-- 5 = 101
-- 3 = 011
-- Bitwise OR:
-- 101 | 011 = 111
-- Result: 7


-- 3. --------------------------------------- Bitwise XOR (^)  --------------------------------------------

-- EXP - Returns 1 if the corresponding bits are different.

SELECT 5 ^ 3 AS Result;			-- OUTPUT WILL BE 6. SEE BELOW EXPLANATION

-- Binary representation:
-- 5 = 101
-- 3 = 011
-- Bitwise XOR:
-- 101 ^ 011 = 110
-- Result: 6