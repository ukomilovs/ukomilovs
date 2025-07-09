--1 /*  Data is the fundamental unit of information stored and managed by the database. It's structured within tables, which are organized collections of rows and columns. Data refers to raw facts, 
figures, or details collected for reference or analysis. It can be numbers, text, etc., and by itself may not carry meaning until processed or organized.
Ex: '1', 'umid', '45', 'Tashkent' — unprocessed pieces of information. 

And now we go to database.  A database is an organized collection of structured information or data that is stored electronically and can be accessed, managed, and updated systematically. 
Databases are typically managed by a Database Management System (DBMS) which ensures data integrity, security, and performance.
Ex:
A distributor company may use a database to store: Customer profiles, Orders, Inventory details, product information and etc.
This allows customer service representatives to quickly retrieve and update information.
  
A relational database is a type of database that stores data in structured tables consisting of rows and columns. 
Each table represents an entity (e.g., customers, orders) and is uniquely identified by a primary key.
Relationships between tables are established through foreign keys, which enable data consistency and reduce redundancy.
Ex:
In a retail company database system:
The customers table contains customer information.
The product table contains product details.
The Purchases table connects customers to the products they are buying, using CustomerID and ProductID as foreign keys.

A table is a database object that organizes data into rows and columns. Each row represents a unique instance of an entity, and each column contains a specific 
attribute related to that entity.
Ex:
A Customers table in a relational database might look like this:
CustomerID	  FirstName   	LastName	     Email
1001	        Umidjon	      Komilov	       u.komilov@mail.uz
1002	        bahodir 	    Jalolov        b.jalolov@mail.uz
Here, each row is a customer record, and each column represents an attribute of the customer.
*/

  
--2 /*
Five key features of SQL Server:
1.  Data Security
SQL Server offers strong security features such as authentication, authorization, encryption (e.g., Transparent Data Encryption), and advanced threat detection to protect sensitive data.

2. High Availability and Disaster Recovery
Features like Always On Availability Groups, database mirroring, and backup/restore capabilities ensure minimal downtime and data loss in case of failures.

3. Business Intelligence (BI) Tools
SQL Server includes integrated BI tools such as:
SQL Server Reporting Services (SSRS) for reporting,
SQL Server Integration Services (SSIS) for data transformation,
SQL Server Analysis Services (SSAS) for data analysis.  

4. Performance and Scalability
With features like In-Memory OLTP, Query Store, and Intelligent Query Processing, SQL Server is designed to handle large-scale workloads with high performance.  

5. Cross-Platform and Cloud Support
SQL Server runs on Windows, Linux, and Docker containers, and supports cloud deployment via Azure SQL, enabling flexible and scalable solutions.  
*/

--3
/* Here are different authentication modes available when connecting to Microsoft SQL Server:

1. Windows Authentication Mode (1)
Leverages the user's Windows credentials.
Integrates with Active Directory for centralized authentication and authorization.
Provides single sign-on (SSO) and is considered the most secure method.
Recommended for enterprise environments.

2. Windows Authentication Mode (2)
Authenticates users using their Windows domain or local accounts.
Integrated with Active Directory, allowing centralized credential management.
Most secure option, as it supports features like Kerberos and password policies.
Use Case: Ideal in enterprise environments where users are managed through Active Directory.

3. SQL Server Authentication Mode
Users connect using SQL Server-specific usernames and passwords stored in the database.
Does not rely on Windows accounts, making it suitable for cross-platform or internet-based applications.
Requires manual management of credentials and strong password enforcement.
Use Case: Often used when Windows Authentication is not feasible (e.g., legacy apps, external clients).

4. Mixed Mode Authentication
Enables both Windows Authentication and SQL Server Authentication.
Offers flexibility by supporting multiple types of users and applications.
Commonly used in environments requiring a combination of domain and non-domain access.
Use Case: An organization with internal users on Active Directory and external applications using SQL logins.
*/

--4
/*
CREATE DATABASE SchoolDB;
GO
*/

--5
/*
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
*/

--6
/*
1. SQL Server (Microsoft SQL Server)
Type: Database Management System (DBMS)
Description:
SQL Server is a relational database management system (RDBMS) developed by Microsoft. It is used to store, manage, and retrieve data in databases. It supports features like data security, transactions, high availability, and business intelligence.
Key Features:
Supports T-SQL (Transact-SQL) for querying and managing data.
Provides tools for data backup, replication, and recovery.
Offers integration with Azure, reporting services, and more.

2. SSMS (SQL Server Management Studio)
Type: Integrated Development Environment (IDE)
Description:
SSMS is a graphical user interface (GUI) tool provided by Microsoft to interact with SQL Server. It allows users to manage databases, write and execute SQL queries, configure security, and perform administrative tasks.
Key Features:
Query editor for writing and executing T-SQL commands.
Object Explorer to browse database objects (tables, views, stored procedures).
Visual tools for backup/restore, user management, and performance tuning.

3. SQL (Structured Query Language)
Type: Query Language
Description:
SQL is a standard programming language used to communicate with relational databases. It is used for creating, reading, updating, and deleting data (CRUD operations), as well as managing database structures and permissions.
Key Features:

Common SQL statements include SELECT, INSERT, UPDATE, DELETE, CREATE, and DROP.
SQL is used in many RDBMSs, including SQL Server, MySQL, Oracle, and PostgreSQL.
In SQL Server, a dialect called T-SQL (Transact-SQL) is used, which extends standard SQL with additional features.

Summary Table
Component	                    Type	                                     Purpose
SQL Server	                  Database System (RDBMS)	                   Stores and manages databases
SSMS	                        IDE / GUI Tool	                           Manages SQL Server and executes SQL scripts
SQL	                          Language	                                 Used to interact with and manipulate databases
*/

--7
/* In SQL, commands are categorized based on their purpose. 
Below is an explanation of the five main types of SQL commands — 

DQL  – Data Query Language
Purpose:
Used to retrieve data from the database.
Common Command:
SELECT
Ex: SELECT * FROM STUDENTS;
    select * from schooldb; 

DML– Data Manipulation Language
Purpose:
Used to manipulate data stored in tables (insert, update, delete).
Common Commands:
INSERT
UPDATE
DELETE
Ex: Insert a new student
INSERT INTO Students (StudentID int, Name varchar(20), Age int)
            VALUES (1, 'Alice', 20);

Update student information
UPDATE Students
SET Age = 21
WHERE StudentID = 1;

Delete a student
DELETE FROM Students
WHERE StudentID = 1; 

DDL – Data Definition Language
Purpose:
Used to define and manage the structure of database objects like tables, views, and schemas.
Common Commands:
CREATE
ALTER
DROP
TRUNCATE
Ex: CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

ALTER TABLE Students
ADD Email VARCHAR(100);

DROP TABLE Courses;

TRUNCATE TABLE Courses;

DCL– Data Control Language
Purpose:
Used to control access and permissions to data within the database.
Common Commands:
GRANT
REVOKE
Ex: GRANT SELECT ON Students TO User1;
    REVOKE SELECT ON Students FROM User1;
 

TCL – Transaction Control Language
Purpose:
Used to manage transactions and control changes made by DML commands.
Common Commands:
COMMIT
ROLLBACK
SAVEPOINT
Ex:    BEGIN TRANSACTION;
       INSERT INTO Students (StudentID, Name, Age)
       VALUES (2, 'Bob', 22);
       COMMIT;
       ROLLBACK;
       SAVEPOINT;  

Summary Table
Command Type	              Description	                            Key Commands
DQL	                        Query data from the database	          SELECT
DML	                        Manipulate data in tables	              INSERT, UPDATE, DELETE
DDL	                        Define/modify database objects	        CREATE, ALTER, DROP, TRUNCATE
DCL	                        Control user access and permissions	    GRANT, REVOKE
TCL	                        Manage transactions	                    COMMIT, ROLLBACK, SAVEPOINT
*/


--8
/*  CREATE TABLE STUDENTS;
    INSERT INTO Students (StudentID INT, Name VARCHAR(20), Age INT)
    VALUES (1, 'BOBUR', 20),
           (2, 'AHROR', 22),
           (3, 'AKROM', 19);

*/

--9
/* Steps to Restore AdventureWorksDW2022.bak in SQL Server
Step 1: Download the Backup File by Going to the following link:
Download AdventureWorksDW2022.bak

Save the file to a known directory, e.g.,
C:\Backups\AdventureWorksDW2022.bak

Step 2: Open SQL Server Management Studio (SSMS)
Launch SSMS.
Connect to your local SQL Server instance.

Step 3: Launch Restore Database Wizard
In Object Explorer, right-click on the Databases node.
Select Restore Database…

Step 4: Select Backup Source
In the Source section, select Device.
Click the ... (browse) button next to Device.
In the Select backup devices dialog:
Set Backup media type to File.
Click Add and select the file:
C:\Backups\AdventureWorksDW2022.bak
Click OK.

Step 5: Set Database Name
In the Destination section, enter the name for the new database, e.g.:
AdventureWorksDW2022

Step 6: Check Restore Settings
Go to the Files page (optional):
Review or change the restore path for the database .mdf and .ldf files.
Go to the Options page:
Check Overwrite the existing database (WITH REPLACE) if restoring over an existing one.

Step 7: Execute the Restore
Click OK to start the restore process.
You should see a confirmation message:
“Database 'AdventureWorksDW2022' restored successfully.”

Step 8: Verify the Database
In Object Explorer, expand the Databases folder.
You should now see AdventureWorksDW2022 listed.
Run a simple query to confirm:
USE AdventureWorksDW2022;
SELECT TOP 10 * FROM DimCustomer;
*/
