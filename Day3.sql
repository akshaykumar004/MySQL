--------------------- UNIQUE CONSTRAINTS ------------

CREATE DATABASE TEMPDB;
USE TEMPDB;

CREATE TABLE DATA (
ROLL_NO INT UNIQUE
);

INSERT INTO DATA VALUES(101);
SELECT * FROM DATA;
INSERT INTO DATA VALUES(101);	-- THIS WILL GIVE ERROR LIKE DUPLICATE ENTRY THAT MEANS ROLL_NO COL SHOULD BE UNIQUE.

------------------------- NOT NULL -----------------------------------------------
CREATE TABLE DATA1 (
NAME VARCHAR(50) NOT NULL
);
 INSERT INTO DATA1 VALUES('AKSHAY');
 SELECT * FROM DATA1;
 INSERT INTO DATA1 VALUES(NULL);	-- THIS WILL GIVE ERROR BCZ OF NOT NULL CONSTRAINTS. THIS SHOULD NOT BE NULL.
 
 ------------------------- PRIMARY KEY -----------------------------------------------
 
 CREATE TABLE EMP (
 -- EMP_ID INT PRIMARY KEY, 	-- THIS WAY ALSO YOU CAN DEFINE PRIMARY KEY BUT 
 EMP_ID INT,
 NAME VARCHAR(50),
 AGE INT,
 CITY VARCHAR(50),
 PRIMARY KEY (EMP_ID , NAME)		-- LIKE THIS ALSO YOU CAN DEFINE PK. AND YOU CAN SEE TWO COL ARE PK SO BOTH COMINATION WILL NOT SAME.
 );
 
 ------------------------- DEFAULT -----------------------------------------------
 
 CREATE TABLE SALARY (
 EMP_ID INT,
 SALARY INT DEFAULT 25000
 );
 
 INSERT INTO SALARY (EMP_ID) VALUES(101);		-- HERE YOU CAN SEE WE'RE INSERTING DATA INTO SALARY BUT IT IS TAKING DEFUALT AS 25000.
 SELECT * FROM SALARY;
 
