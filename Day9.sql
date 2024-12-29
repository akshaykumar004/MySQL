-- ********************************************* 29-12-2024 ******************************************

-- ************************************** STORED PROCEDURE **************************

-- ITS WORKS LIKE A FUNCTION. IN STORED PROCEDURE WE CAN PERFORM SPECIFIC TASKS BEASED ON STORED QUERY. IT IS A BASICALLY PRE-WRITTEN SQL STATEMENTS GROUPED TOGETHER 
-- UNDER A SPECIFIC NAME.

-- IT CAN BE CREATE IN TWO WAYS - WITH PARAMS AND WITHOUT PARAMS

-- SYNTAX --
-- CREATE PROCEDURE procedure_name()
-- BEGIN
-- query
-- END

-- CALL procedure_name();

-- =================================== WITH NO PARAMS =================================================
-- EXPLANATION OF BELOW CODE ---------------
-- DELIMITER /  -- Change the delimiter to /
-- BEGIN
--     SELECT * FROM SALARY;  -- Use ; to terminate the SELECT statement within the procedure
-- END /
-- DELIMITER ;  -- Switch the delimiter back to ;

USE COMPANY;

DELIMITER /
CREATE PROCEDURE PROCWITHNOPARAMS()
BEGIN
    SELECT * FROM SALARY;
END /
DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'company';		-- IT WILL SHOW PROCEDURE IS CREATED OR NOT.

CALL PROCWITHNOPARAMS();  -- Call the procedure using the default delimiter (;). IT WILL SHOW ALL THE DETAILS OF SALARY TABLE..


-- =================================== WITH PARAMS =================================================

DELIMITER /
CREATE PROCEDURE PROCWITHPARMS(IN ID INT)
BEGIN
    SELECT * FROM SALARY WHERE SALARYID = ID;
END /

DELIMITER ;

SHOW PROCEDURE STATUS WHERE DB = 'COMPANY';
-- DROP PROCEDURE IF EXISTS PROCWITHPARMS;			-- TO DROP PROCEDURE

CALL PROCWITHPARMS(3);			-- IT WILL SHOW SALARYID 3 DETAILS...

-- The PROCWITHPARMS procedure takes one input parameter ID of type INT.
-- IN specifies that this parameter is for input purposes (a value must be passed to the procedure when calling it).



-- ***************************************** CASE Statement: ********************************************************
-- Used to apply conditional logic in SQL queries.
-- It works in SELECT or UPDATE to check conditions and return specific results.
-- Syntax -->
-- CASE  
--   WHEN condition1 THEN result1  
--   WHEN condition2 THEN result2  
--   ...  
--   ELSE resultN  
-- END

Use STUDENT;

show tables;
select * from entries;

SELECT NAME , MARKS, GRADE,
CASE 
	WHEN MARKS > 80 THEN "EXCELLENT"
    WHEN MARKS > 60 THEN "1ST DIVISION"
    WHEN MARKS > 50 THEN "2ND DIVISION"
    ELSE "FAIL"
END AS RESULT
FROM ENTRIES ORDER BY MARKS DESC;

SET SQL_SAFE_UPDATES = 0;			-- TO DISABLE SQL SAFE MODE TO UPDATE THE TABLE...
UPDATE ENTRIES 
SET GRADE =
CASE
	WHEN MARKS > 90 THEN  'A+'
    WHEN MARKS > 80 THEN 'B+'
    WHEN MARKS > 70 THEN 'B'
    WHEN MARKS > 60 THEN 'C'
	ELSE 'D'
END;
SELECT * FROM ENTRIES;


-- ************************************************** IF **********************************************
-- The IF function returns one of two values based on whether a condition is TRUE or FALSE.
-- Not supported in all databases. Supported in MySQL.

-- SYNTAX -- IF(condition, value_if_true, value_if_false)

-- *************************************** IF with SELECT Statement *********************
-- FOR EXP - Categorize students based on their MARKS into "Top", "Pass", and "Fail"

SELECT ROLLNO, NAME, MARKS, 
       IF(MARKS > 90, 'Top', 										-- HERE IF IS WORKING LIKE THIS - (condition, value_if_true, value_if_false)
          IF(MARKS BETWEEN 60 AND 90, 'Pass', 'Fail')) AS RESULT
FROM ENTRIES;


-- *************************************** IF with UPDATE Statement *********************
-- FOR EXP - Swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single UPDATE statement and no intermediate temporary tables.

UPDATE ENTRIES  
SET CITY = IF(CITY = 'PUNE', 'MUMBAI', 
				IF (CITY = 'MUMBAI' , 'PUNE', CITY));	-- THIS IS UPDATE CITY PUNE TO MUMBAI AND MUMBAI TO PUNE. REMAINING WILL BE SAME AS IT IS.

SELECT * FROM ENTRIES ;
SET SQL_SAFE_UPDATES = 1;


-- ========================================= Find the nth highest salary ===============================

-- so find the nth salry we have to write a query in such way that whatever the value of n it return the correct output.
-- here n is a number. it can be any number. eg - 1,2,3,4,5
-- suppose there is salary column in DB and you have to find 5th highest salary or 4th highest salary so how you will find.

-- solution -----------------

-- SELECT DISTINCT Salary 
-- FROM tableName 
-- ORDER BY Salary DESC 
-- LIMIT n-1, 1;

-- Explanation:-------------------------------------------
-- SELECT DISTINCT Salary:
-- This retrieves unique salary values from the column Salary in the table tableName. Using DISTINCT ensures no duplicate salary values are included.

-- FROM tableName:
-- Specifies the table from which the data is being queried.

-- ORDER BY Salary DESC:
-- Sorts the salaries in descending order, i.e., from the highest salary to the lowest. This makes it easier to pick the nth highest salary.

-- LIMIT n-1, 1 as m , n... 	m=n-1	, n=1 

-- LIMIT is used to specify which rows to retrieve from the sorted result.
-- n-1 is the offset, indicating the position to start retrieving records. For example:
-- If n = 2, n-1 = 1, meaning it skips the first record (highest salary) and starts from the second.
-- If n = 3, n-1 = 2, meaning it skips the first two records and starts from the third.
-- 1 after comma specifies the number of rows to fetch. In this case, it fetches exactly one record.

-- LIMIT m,n 	-- here you can give ay value instead of  m , n supose if you want to print two highest salaries i.e 4 , 5 then just give LIMIT 3, 2
-- it will skip 1 to 3rd row and will print ony 4 and 5 row salaries..

Show DATABASES;
USE COMPANY;

SHOW TABLES;
SELECT * FROM SALARY;

SELECT DISTINCT TOTALSALARY FROM SALARY
ORDER BY TOTALSALARY DESC
LIMIT 2,2;		-- THIS WILL SHOW 3RD AND 4TH HIGHEST SALARY IN THE COLUMN. FIRST 2 IS M WHICH WILL SKIP ROWS 1&2. SECOND 2 IS N WHICH WILL PRINT 2 ROWS 3&4.


