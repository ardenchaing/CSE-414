# PRAGMA foreign_keys=ON;

CREATE TABLE InsuranceCo(
	name varchar(256) PRIMARY KEY,
	phone int
);

CREATE TABLE Person(
	ssn int PRIMARY KEY,
	name varchar(256)
);

CREATE TABLE Driver(
	ssn int PRIMARY KEY,
	driverID int,
	FOREIGN KEY(ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver(
	ssn int PRIMARY KEY,
	FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE ProfessionalDriver(
	ssn int PRIMARY KEY,
	medicalHistory varchar(256),
	FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE Vehicle(
	licensePlate varchar(10) PRIMARY KEY,
	year int,
	name varchar(256),
	ssn int,
	maxLiability real,
	FOREIGN KEY(name) REFERENCES InsuranceCo(name),
	FOREIGN KEY(ssn) REFERENCES Person(ssn)
);

CREATE TABLE Car(
	licensePlate varchar(10) PRIMARY KEY,
	make varchar(256),
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Truck(
	licensePlate varchar(10) PRIMARY KEY,
	capacity int,
	ssn int,
	FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate),
	FOREIGN KEY(ssn) REFERENCES ProfessionalDriver(ssn)
);

CREATE TABLE Drives(
	ssn int,
	licensePlate,
	PRIMARY KEY (ssn, licensePlate),
	FOREIGN KEY(ssn) REFERENCES NonProfessionalDriver(ssn),
	FOREIGN KEY(licensePlate) REFERENCES Car(licensePlate)
);

/*
b) Insures is represented in the vehicle table because based off the diagram a vehicle
cannot have more than one insurance company. Therefore to save a table I put maxLaibility
as a variable inside vehicle and utilized a foreign key to link the company and vehicle.

c) The main difference between the drives and operates relationship is that that operates has
a much stricter constraint. Where for the drives relationship it's many to many meaning that
a car can be driven by any number of non-professional drivers and non-professional driver can
drive any number of cars. However, operates has a many to one relationship meaning that a
truck can only be operated by at MOST one professional driver and that one professional driver
can drive any number of trucks. Now because a truck can only have one operator, it's pretty
easy to showcase the operator relationship in the truck table by adding the professional driver's
ssn. However, because as stated above the drives relationship is many to many, I decided to
represent that using it's own table.
*/