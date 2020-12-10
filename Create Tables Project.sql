use Project_For_DB
DROP TABLE Retrieved, LiveLanguages, OnlineLanguages, Reviews, Services,  LiveExperiences, OnlineExperiences, [Security-Measures], PlacedOrders, Orders, [Search's], Properties, Locations, Cities, Countries, Products, Customers

CREATE TABLE Customers(
	Email varchar(50) PRIMARY KEY NOT NULL,
	Password varchar(20) NOT NULL,
	[Name-first] varchar(20) NOT NULL,
	[Name-last] varchar(20) NOT NULL,
	Birthdate date 
)
ALTER TABLE Customers 
ADD CONSTRAINT CK_Email CHECK (Email like '%@%.%'),
CONSTRAINT Password_Check CHECK (Password LIKE '%[0-9]%' AND PASSWORD LIKE '%[A-Z]%' AND len(password) >= 8 and len(password) <=20),
CONSTRAINT Birthdate_Check CHECK ((YEAR(GETdate()) - YEAR(Birthdate)) >= 15) 


CREATE TABLE Locations (
	LocationID int PRIMARY KEY NOT NULL,
	Country varchar(30),
	City varchar(30),
	Street varchar(30),
	houseNum int,
	ZipCode varchar(30)
)


CREATE TABLE cities( 
		city VARCHAR(30) PRIMARY KEY NOT NULL
	)

ALTER TABLE Locations 	
		ADD  CONSTRAINT FK_City FOREIGN KEY (city) 
		REFERENCES 	cities (city)

CREATE TABLE Countries( 
		Country VARCHAR(30) PRIMARY KEY NOT NULL
	)


ALTER TABLE Locations 	
		ADD  CONSTRAINT FK_Country FOREIGN KEY (Country) 
		REFERENCES 	Countries (Country)

CREATE TABLE Products (
	ProductID int PRIMARY KEY NOT NULL,
	Price money,
	HostEmail varchar(50) FOREIGN KEY REFERENCES Customers(Email)
)


ALTER TABLE Products ADD CONSTRAINT Ck_Price
	CHECK (Price > 0)

CREATE TABLE Reviews (
	Email varchar(50) NOT NULL,
	[DT-review] date NOT NULL,
	Rating real,
	Description varchar(150),
	PRIMARY KEY (Email, [DT-review]),
	CONSTRAINT 	FK_Email_Reviews FOREIGN KEY (Email)
					REFERENCES 	Customers (Email)
)

ALTER TABLE Reviews ADD CONSTRAINT Ck_Rating
	CHECK (Rating >= 0 and Rating <=5)


CREATE TABLE [Search's] (
	IPAdress int NOT NULL,
	Email varchar(50) FOREIGN KEY REFERENCES Customers (Email) NOT NULL,
	[DT-search] datetime NOT NULL,
	[DT-start] date,
	[DT-end] date,
	PRIMARY KEY (IPAdress, [DT-search]),
	CONSTRAINT FK_Email_Search FOREIGN KEY (Email)
					REFERENCES Customers (Email)
)
ALTER TABLE  [Search's] ADD CONSTRAINT Ck_dates_search
	CHECK ([DT-start] < [DT-end])


CREATE TABLE Properties(
	PropertyID int PRIMARY KEY NOT NULL,
	Style varchar(30),
	NumOfBedrooms int,
	NumOfBathrooms int,
	GuestCapacity int,
	CONSTRAINT FK_ProductID_Properties FOREIGN KEY (PropertyID)
						REFERENCES Products (ProductID)
)

ALTER TABLE Properties ADD CONSTRAINT Ck_Properties
	CHECK (NumOfBedrooms >= 0 and NumOfBathrooms >= 0 and GuestCapacity > 0)

CREATE TABLE Services (
	PropertyID int PRIMARY KEY NOT NULL,
	Service varchar(100),
	CONSTRAINT FK_PropertyID_Services FOREIGN KEY (PropertyID)
						REFERENCES Properties (PropertyID)
)

CREATE TABLE [Security-Measures](
	PropertyID int PRIMARY KEY NOT NULL,
	Measure varchar(100),
	CONSTRAINT FK_PropertyID_Securities FOREIGN KEY (PropertyID)
						REFERENCES Properties (PropertyID)
)

CREATE TABLE Orders(
	OrderID int PRIMARY KEY NOT NULL,
	ProductID int FOREIGN KEY REFERENCES Products(ProductID) NOT NULL,
	TotalPrice money,
	[DT-buy] datetime,
	IPAdress int NOT NULL,
	[DT-Search] datetime NOT NULL,
	CONSTRAINT FK_IP_AND_DT_Orders FOREIGN KEY (IPAdress, [DT-Search])
									REFERENCES [Search's] (IPAdress, [DT-Search])
)
ALTER TABLE Orders ADD CONSTRAINT Ck_TotalPrice
	CHECK (TotalPrice > 0)

CREATE TABLE Retrieved (
	IPAdress int NOT NULL,
	[DT-Search] datetime NOT NULL,
	ProductID int NOT NULL,
	PRIMARY KEY (IPAdress, [DT-Search], ProductID),
	CONSTRAINT FK_IP_AND_DT_Retrieved FOREIGN KEY (IPAdress, [DT-Search])
								REFERENCES [Search's] (IPAdress, [DT-Search]),
	CONSTRAINT FK_ProductID_Retrieve FOREIGN KEY (ProductID)
								REFERENCES Products(ProductID)		
)

CREATE TABLE PlacedOrders (
	ProductID int NOT NULL,
	OrderID int NOT NULL,
	PRIMARY KEY (ProductID, OrderID),

	CONSTRAINT FK_ProductID_Placed FOREIGN KEY (ProductID)
							REFERENCES Products(ProductID),	
	CONSTRAINT FK_OrderID_Placed FOREIGN KEY (OrderID)
							REFERENCES Orders(OrderID)	
)


CREATE TABLE LiveExperiences(
	LiveExperienceID int PRIMARY KEY NOT NULL,
	Description varchar(150),
	[Duration(min.)] int,
	Location int FOREIGN KEY REFERENCES Locations(LocationID),
	CONSTRAINT FK_ProductID_Live FOREIGN KEY (LiveExperienceID)
						REFERENCES Products(ProductID)
)
ALTER TABLE LiveExperiences ADD CONSTRAINT Ck_LiveExperience
	CHECK ([Duration(min.)] > 0)

CREATE TABLE OnlineExperiences(
	OnlineExperienceID int PRIMARY KEY NOT NULL,
	Tonnage int,
	MaxCapacity int,
	Location int FOREIGN KEY REFERENCES Locations(LocationID),
	CONSTRAINT FK_ProductID_Online FOREIGN KEY (OnlineExperienceID)
						REFERENCES Products(ProductID)
)
ALTER TABLE OnlineExperiences ADD CONSTRAINT Ck_OnlineExperience
	CHECK (Tonnage >= 0 and MaxCapacity > 0)

CREATE TABLE LiveLanguages (
	LiveExperienceID int PRIMARY KEY,
	Language varchar(30)
	CONSTRAINT FK_Live FOREIGN KEY (LiveExperienceID)
					REFERENCES LiveExperiences(LiveExperienceID)
)

CREATE TABLE OnlineLanguages (
	OnlineExperienceID int PRIMARY KEY,
	Language varchar(30)
	CONSTRAINT FK_Online FOREIGN KEY (OnlineExperienceID)
					REFERENCES OnlineExperiences(OnlineExperienceID)
)


