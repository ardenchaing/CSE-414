# problem 1
CREATE TABLE salesMFD(
	name varchar(256),
	discount int,
	month varchar(10),
	price int
);

.mode csv
.import C:/Users/arden/Downloads/mrFrumbleData.csv salesMFD


# problem 2
# name -> discount DNE as a FD
SELECT *
FROM salesMFD A, salesMFD B
WHERE A.name = B.name and 
	  A.discount != B.discount;

# month -> discount
SELECT *
FROM salesMFD A, salesMFD B
WHERE A.month = B.month and
	  A.discount != B.discount;

# name -> price
SELECT *
FROM salesMFD A, salesMFD B
WHERE A.name = B.name and
	  A.price != B.price;

# price, month --> discount, name
SELECT *
FROM salesMFD A, salesMFD B
WHERE A.price = B.price and
	  A.month = B.month and
	  A.discount != B.discount and
	  A.name != B.name;

# discount, name --> price, month
SELECT *
FROM salesMFD A, salesMFD B
WHERE A.discount = B.discount and
	  A.name = B.name and
	  A.price != B.price and
	  A.month != B.month;
/*
Since we got month -> discount and also name -> price
We can conclude that month, name -> discount, price
Therefore the FDs are:
month -> discount
name -> price
month, name -> discount, price
price, month -> discount, name
discount, name -> price, month
*/


# problem 3
/* 
Given R(name, discount, month, price)
1st: month -> discount violates BCNF
{month}+ = {month, discount}
{month}+ != {month} and {month}+ != {name, discount, month, price}
Now split R into R1(month, discount) and R2(name, month, price)
2nd: name -> price violates BCNF
{name}+ = {name, price}
{name}+ != {name} and {name}+ != {name, month, price}
Now split R2 into R3(name, price) and R4(name, month)
Can't find any X such that X != X+ and X+ != C
Thus the BCNF is R1(month, discount), R3(name, price), and R4(name, month)
*/

CREATE TABLE monthDiscount(
	month varchar(10) PRIMARY KEY,
	discount int
);

CREATE TABLE namePrice(
	name varchar(256) PRIMARY KEY,
	price int
);

CREATE TABLE nameMonth(
	name varchar(256) REFERENCES namePrice(name),
	month varchar(10) REFERENCES monthDiscount(month)
);


# problem 4
INSERT INTO monthDiscount(month, discount)
SELECT DISTINCT month, discount
FROM salesMFD;

SELECT count(*)
FROM monthDiscount;

INSERT INTO namePrice(name, price)
SELECT DISTINCT name, price
FROM salesMFD;

SELECT count(*)
FROM namePrice;

INSERT INTO nameMonth(name, month)
SELECT DISTINCT name, month
FROM salesMFD;

SELECT count(*)
FROM nameMonth;

SELECT B.name, A.discount, A.month, B.price
FROM monthDiscount A, namePrice B, nameMonth C
WHERE A.month = C.month and
	  B.name = C.name;