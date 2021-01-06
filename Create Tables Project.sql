use AirBNB


DROP TABLE Retrieved, LiveLanguages, OnlineLanguages, Reviews, Services, Favorites, 
			LiveExperiences, OnlineExperiences, [SecurityMeasures],
			Orders,[PaymentMethods], [Searchs], Properties, Locations, Cities, Countries, Products, Customers

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
	Country varchar(30) NOT NULL,
	City varchar(30) NOT NULL,
	Street varchar(30) NOT NULL,
	houseNum int NOT NULL,
	ZipCode varchar(30) NOT NULL
)


CREATE TABLE cities( 
		city VARCHAR(30) PRIMARY KEY NOT NULL
	)

--ALTER TABLE Locations 	
--		ADD  CONSTRAINT FK_City FOREIGN KEY (city) 
--		REFERENCES 	cities (city)


CREATE TABLE Countries( 
		Country VARCHAR(30) PRIMARY KEY NOT NULL
	)


--ALTER TABLE Locations 	
--		ADD  CONSTRAINT FK_Country FOREIGN KEY (Country) 
--		REFERENCES 	Countries (Country)

CREATE TABLE Products (
	ProductID int PRIMARY KEY NOT NULL,
	Price money,
	HostEmail varchar(50) FOREIGN KEY REFERENCES Customers(Email) NOT NULL,
	AverageRating real null
)

ALTER TABLE Products ADD CONSTRAINT Ck_Price
	CHECK (Price > 0)
	

CREATE TABLE [Searchs] (
	IPAddress varchar(20) NOT NULL,
	Email varchar(50) FOREIGN KEY REFERENCES Customers (Email) ,
	[DT-search] datetime NOT NULL,
	type varchar(20),
	Guests int,
	[DT-start] date,
	[DT-end] date,
	PRIMARY KEY (IPAddress, [DT-search]),
	CONSTRAINT FK_Email_Search FOREIGN KEY (Email)
					REFERENCES Customers (Email)
)
ALTER TABLE  [Searchs] ADD CONSTRAINT Ck_dates_search
	CHECK ([DT-start] < [DT-end])


CREATE TABLE Properties(
	PropertyID int PRIMARY KEY NOT NULL,
	Style varchar(30),
	NumOfBedrooms int,
	NumOfBathrooms int,
	GuestCapacity int,
	Location int FOREIGN KEY REFERENCES Locations(LocationID),
	CONSTRAINT FK_ProductID_Properties FOREIGN KEY (PropertyID)
						REFERENCES Products (ProductID)

)

ALTER TABLE Properties ADD CONSTRAINT Ck_Properties
	CHECK (NumOfBedrooms >= 0 and NumOfBathrooms >= 0 and GuestCapacity > 0)
	
CREATE TABLE Services (
	PropertyID int NOT NULL,
	Service varchar(100) NOT NULL,
	PRIMARY KEY (PropertyID, Service) ,
	CONSTRAINT FK_PropertyID_Services FOREIGN KEY (PropertyID)
						REFERENCES Properties (PropertyID)
)

CREATE TABLE [SecurityMeasures](
	PropertyID int  NOT NULL,
	Measure varchar(100) NOT NULL,
	PRIMARY KEY (PropertyID, Measure) ,
	CONSTRAINT FK_PropertyID_Securities FOREIGN KEY (PropertyID)
						REFERENCES Properties (PropertyID)
)

CREATE TABLE [PaymentMethods](
	CardNumber varchar(20) PRIMARY KEY NOT NULL,
	ExperationDate varchar(5) NOT NULL,
	CardProvidor varchar(20),
	IPAddress varchar(20) NOT NULL,
	[DT-Search] datetime NOT NULL,
	CONSTRAINT FK_IP_AND_DT_Payment FOREIGN KEY (IPAddress, [DT-Search])
									REFERENCES [Searchs] (IPAddress, [DT-Search])
)



CREATE TABLE Orders(
	OrderID int PRIMARY KEY NOT NULL,
	ProductID int FOREIGN KEY REFERENCES Products(ProductID) NOT NULL,
	[DT-buy] datetime,
	CreditCardNumber varchar(20),
	CONSTRAINT FK_Card_Num_Orders FOREIGN KEY (CreditCardNumber)
								REFERENCES PaymentMethods (CardNumber)
)

CREATE TABLE Reviews (
	Email varchar(50) NOT NULL,
	[DT-review] date NOT NULL,
	Rating int NOT NULL,
	Description varchar(150),
	orderID int not null,
	PRIMARY KEY (Email, [DT-review]),
	CONSTRAINT 	FK_Email_Reviews FOREIGN KEY (Email)
					REFERENCES 	Customers (Email),
	CONSTRAINT FK_orderID_Review FOREIGN KEY(orderID)
					REFERENCES Orders(orderID)
)

ALTER TABLE Reviews ADD CONSTRAINT Ck_Rating
	CHECK (Rating >= 0 and Rating <=5)

CREATE TABLE Retrieved (
	IPAddress varchar(20) NOT NULL,
	[DT-Search] datetime NOT NULL,
	ProductID int NOT NULL,
	PRIMARY KEY (IPAddress, [DT-Search], ProductID),
	CONSTRAINT FK_IP_AND_DT_Retrieved FOREIGN KEY (IPAddress, [DT-Search])
								REFERENCES [Searchs] (IPAddress, [DT-Search]),
	CONSTRAINT FK_ProductID_Retrieve FOREIGN KEY (ProductID)
								REFERENCES Products(ProductID)		
)


CREATE TABLE LiveExperiences(
	LiveExperienceID int PRIMARY KEY NOT NULL,
	Description varchar(150),
	[Duration(min.)] int,
	Tonnage int,
	MaxCapacity int,
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
	CONSTRAINT FK_ProductID_Online FOREIGN KEY (OnlineExperienceID)
						REFERENCES Products(ProductID)
)

ALTER TABLE OnlineExperiences ADD CONSTRAINT Ck_OnlineExperience
	CHECK (Tonnage >= 0 and MaxCapacity > 0)
	
CREATE TABLE LiveLanguages (
	LiveExperienceID int NOT NULL,
	Language varchar(30) NOT NULL,
	PRIMARY KEY (LiveExperienceID,Language),
	CONSTRAINT FK_Live FOREIGN KEY (LiveExperienceID)
					REFERENCES LiveExperiences(LiveExperienceID)
)

CREATE TABLE OnlineLanguages (
	OnlineExperienceID int NOT NULL,
	Language varchar(30) NOT NULL,
	PRIMARY KEY (OnlineExperienceID,Language),
	CONSTRAINT FK_Online FOREIGN KEY (OnlineExperienceID)
					REFERENCES OnlineExperiences(OnlineExperienceID)
)

CREATE TABLE Favorites (
	CustomerEmail varchar(50) NOT NULL,
	ProductID int NOT NULL,
	[DT-add] datetime NOT NULL,
	PRIMARY KEY (CustomerEmail, ProductID),
	CONSTRAINT FK_Favorites_Email FOREIGN KEY (CustomerEmail)
					REFERENCES Customers(Email),
	CONSTRAINT FK_Favorites_Product FOREIGN KEY (ProductID)
					REFERENCES Products(ProductID)
)

