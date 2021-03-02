CSE 414
Homework 1
Due: 01/12/21

Q2.1
--Create a table Edges(Source, Destination) where both Source and Destination are integers.
CREATE TABLE Edges (
	source INT, 
	destination INT);

Q2.2
--Insert the tuples (10,5), (6,25), (1,3), and (4,4)
INSERT INTO Edges
VALUES (10, 5), 
	   (6, 25), 
	   (1, 3), 
	   (4, 4);

Q2.3
--Write a SQL statement that returns all tuples.
SELECT *
FROM Edges;

Q2.4
--Write a SQL statement that returns only column Source for all tuples.
SELECT e.Source
FROM Edges AS e;

Q2.5
--Write a SQL statement that returns all tuples where Source > Destination.
SELECT *
FROM Edges AS e
WHERE e.source > e.destination;

Q2.6
--Now insert the tuple ('-1','2000'). Do you get an error? Why?
INSERT INTO Edges
VALUES ('-1', '2000');
-- I do not get an error. Even though I declared the attribute of both columns
-- to be integers and I'm passing through a string when I'm inserting the 
-- newest tuple, since there's rigid typing it automatically converts values 
-- into the appropriate datatypes. So it's making str(-1) and 
-- str(2000) into int(-1) and int(2000).

Q3.0
-- Create a table called MyRestaurants with the following attributes 
-- (you can pick your own names for the attributes, just make sure 
-- it is clear which one is for which):
-- Name of the restaurant: a varchar field
-- Type of food they make: a varchar field
-- Distance (in minutes) from your house: an int
-- Date of your last visit: a varchar field, interpreted as date
-- Whether you like it or not: an int, interpreted as a Boolean
CREATE TABLE MyRestaurants (
	name varchar(256),
	food_type varchar(256),
	distance INT,
	last_visit varchar(256),
	enjoy INT);

Q4.0
-- Insert at least five tuples using the SQL INSERT command five 
-- (or more) times. You should insert at least one restaurant you liked, 
-- at least one restaurant you did not like, 
-- and at least one restaurant where you leave the “I like” field NULL.
INSERT INTO MyRestaurants
VALUES ('Xian Noodles', 'Chinese', 10, '2021-01-01', 1),
	   ('Deru Market', 'American', 25, '2020-12-08', 1),
	   ('Olive Garden', 'Italian', 15, '2018-04-01', 0),
	   ('Musashi', 'Sushi', 15, '2019-03-06', 1),
	   ('The Hub', 'American', 15, '2019-11-14', NULL),
	   ('Jack in the Box', 'Fast food', 12, '2018-05-21', 0);

Q5.0
-- Write a SQL query that returns every row in your MyRestaurants table. 
-- Experiment with a few of SQLite's output formats and repeat this query six times,
-- formatting the output in the following ways. 
-- Remember to include both the command you use to format the output along
-- with your query. When we run your code for 5.1 and 5.2 we should see the 
-- table printed 6 times.

Q5.1
-- Turn column headers on, then output the results in these three formats:
-- 1. print the results in comma-separated form
-- 2. print the results in list form, delimited by "|"
-- 3. print the results in column form and make every column have width 15 
-- (be sure that every column has width 15 and not just the first one)
.mode column
.header ON
.nullvalue NULL

.mode csv
SELECT *
FROM MyRestaurants;

.mode list
.separator "|"
SELECT *
FROM MyRestaurants;

.mode column
.width 15 15 15 15 15
SELECT *
FROM MyRestaurants;

Q5.2
-- Now turn the column headers off, and output the results again in the three formats.
.headers OFF

.mode csv
SELECT *
FROM MyRestaurants;

.mode list
.separator "|"
SELECT *
FROM MyRestaurants;

.mode column
.width 15 15 15 15 15
SELECT *
FROM MyRestaurants;

Q6.0
-- Write a SQL query that returns only the name and distance of all restaurants within and 
-- including 20 minutes of your house. The query should list the restaurants 
-- in alphabetical order of names.
SELECT m.name, m.distance
FROM MyRestaurants AS m
WHERE m.distance <= 20
ORDER BY m.name;

Q7.0
-- Write a SQL query that returns all restaurants that you like, but has not visited since more 
-- than 3 months ago. Make sure that you use the date() function to calculate the date 3 months ago.
SELECT *
FROM MyRestaurants AS m
WHERE m.enjoy == 1 AND
		date('now', '-3 months') <= m.last_visit;

Q8.0
-- Write a SQL query that returns all restaurants that are within and including 10 mins from your house.
SELECT *
FROM MyRestaurants AS m
WHERE m.distance <= 10;