CREATE DATABASE DEMODB;		-- this will create database 
create database demodb2;	-- we can write command in lower case also
drop database demodb;		-- this will delete the database
drop database demodb2;  -- this will delete the database demodb2

-- -------------------------------------------

CREATE DATABASE college;
USE college;			-- this will use only college database
SELECT DATABASE();		-- using this you can check which database we are going to use for table creation

-- Create the 'Student' table
-- Format will be - 1st => Column name, 2nd=> data type, 3=> constraint, 
-- so In below table you can see 1st column name = ID , 2nd data type = INT OR VARCHAR and 3rd Constraint = PRIMARY KEY OR NOT NULL OR LENGTH OF DATA TYPE

CREATE TABLE Student (
ID INT PRIMARY KEY,
NAME VARCHAR (50),
LOCATION VARCHAR(50),
GENDER VARCHAR(2) NOT NULL
);

-- INSERT THE DATA INTO TABLE

INSERT INTO Student VALUES(001 , 'AKSHAY' , 'LUCKNOW' , 'M');		-- 001 will consider as 1 only in ID section.
INSERT INTO Student VALUES(002 , 'TANYA' , 'MUMBAI' , 'F');
INSERT INTO Student VALUES(003 , 'ROBOT' , 'BANARAS' , 'M');
INSERT INTO Student VALUES(004, 'GURU' , 'GUJRAT' , 'M');

SELECT * FROM Student;

