# CSE 414 Homework 3: Advanced SQL and Azure 

**Objectives:**
To practice advanced SQL. To get familiar with commercial database management systems (SQL Server) and using a database management system in the cloud (SQL Azure).

**Assignment tools:**
SQL Server on Windows Azure through SQL Azure. SQL Server Management Studio
has been installed on the CSE lab and [VDI machines](http://vdi.cs.washington.edu/vdi/).

**What to turn in:**
`hw3-q1.sql`, `hw3-q2.sql`, etc (see below).

## Assignment Details

This homework is a continuation of homework 2 but with three changes:

- The queries are more challenging
- You will get to use a commercial database system (i.e., no more SQLite :). 
SQLite simply cannot execute these queries in any reasonable amount of 
time; hence, we will use SQL Server, which has one of the most advanced 
query optimizers. SQL Server also has a very nice client application, 
[SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/sql-server-management-studio-ssms),
that you will get to use in this assignment.
- You will use the Microsoft Azure cloud.

In this homework, you will do three things:

1. Create a database in the SQL Server database management system running as a service on 
Windows Azure. 
2. Write and test the SQL queries below; keep in mind that the queries are quite challenging, 
both for you and for the database engine. 
3. Reflect on using a database management system running in a public cloud.


### SQL Queries (90 points):

For each question below, write a single SQL query to answer that question and save your submission in individual files hw3-q1.sql, hw3-q2.sql, etc. Each .sql file should include:

- The SQL query that once executed returns the expected result.
- A comment that indicated the number of rows your query returns
- A comment that indicates how long the query took, and
- A comment that contains the first 20 rows of the result (if the result has fewer than 20 rows, output all of them). 

Note that SQL Server interprets NULL values differently than sqlite! Try using it in a WHERE predicate and you will see the difference.

Now answer the following questions:

1. For each origin city, find the destination city (or cities) with the longest direct flight. By direct flight, we mean a flight with no intermediate stops. Judge the longest flight in time, not distance. (15 points)

    Name the output columns origin_city, dest_city, and time representing the flight time between them. Do not include duplicates of the same origin/destination city pair. Order the result by origin_city and then dest_city (ascending, i.e. alphabetically).

    [Output relation cardinality: 334 rows]
    
    
2. Find all origin cities that only serve flights shorter than 3 hours. You should not include cancelled flights in your determination. (15 points)

   Name the output column city and sort them in ascending order alphabetically. List each city only once in the result.

   [Output relation cardinality: 109]


3. For each origin city, find the percentage of departing flights shorter than 3 hours.You should not include cancelled flights in your determination. (15 points)

    Name the output columns origin_city and percentage. Order by percentage value, then city, ascending. Be careful to handle cities without any flights shorter than 3 hours. You should return 0 as the result for these cities, not NULL (which is shown as a blank cell in Azure) Report percentages as percentages not decimals (e.g., report 75.25 rather than 0.752534).

    [Output relation cardinality: 327]


4. List all cities that cannot be reached from Seattle though a direct flight but can be reached with 
one stop (i.e., with any two flights that go through an intermediate city). 
Do not include Seattle as one of these destinations (even though you could get back with two flights). 
(15 points)

    Name the output column `city`.
    
    [Output relation cardinality: 256]


5. List all cities that cannot be reached from Seattle through a direct flight nor with one stop 
(i.e., with any two flights that go through an intermediate city). Warning: this query might take a while to execute.
We will learn about how to speed this up in lecture. (15 points)

    Name the output column `city`.
    
    (You can assume "all cities" to be the collection of all `origin_city` or all `dest_city`)

    (Note: Do not worry if this query takes a while to execute. We are mostly concerned with the results)
    
    [Output relation cardinality: 3 or 4, depending on what you consider to be the set of all cities]


6. List the names of carriers that operate flights from Seattle to San Francisco, CA. 
Return each carrier's name only once. Use a nested query to answer this question. (7 points)

    Name the output column `carrier`.
    
    [Output relation cardinality: 4]

7. Express the same query as above, but do so without using a nested query. Again, name the output column
`carrier`. (8 points)



### Using a Cloud Service (10 points)

The DBMS that we use in this assignment is running somewhere in one of Microsoft's data centers. 
Comment on your experience using this DBMS cloud service. What do you think about the idea of offering a DBMS 
as a service in a public cloud?

Save your answer in a file called `hw3-d.txt` in the `submission` directory.



## Submission Instructions
Please make sure that
- You are submitting the script files directly to Gradescope
- Your file names match the expected file names (hw3-q1.sql, hw3-q2.sql, …, hw3-q7.sql, hw3-d.txt)
