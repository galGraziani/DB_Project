USE Create Tables
INSERT INTO Customers (Email, Password, [Name-first], [Name-last], Birthdate)
VALUES
    ('babagaga@gmail.com', 'B123321123', 'Baba', 'Gaga', '12122009'),
    ('craig52@gmail.com', 'Df21233333', 'Craig', 'Gaga', '201020000'),
	('michael@gmail.com', 'mimiC1232', 'Michael', 'Jackson', '190119994'),
	('salamandrac@gmail.com', 'siSIcoco12', 'Salamandra', 'Cohen', '02031960'),
	('abc@gmail.com', 'Guyguyg12', 'Guy', 'Fried', '18081992'),
	('david_levi@yahoo.co.il', 'ABC123abc', 'David', 'Levi', '15042012'),
	('eyal.golan@walla.co.il', 'LEVlevlev123', 'Eyal', 'Golan', '02041980'),
	('israelisrali@gmail.com', 'KolOdbalevav12', 'Israel', 'Israeli', '01081948'),
	('noa_kile@noakile.domain.com', 'Noakilla10', 'Noa', 'Kirl', '02011999')


INSERT INTO Locations(LocationID, Country, City, Street, houseNum, ZipCode)
VALUES
    (0, 'Russia', 'Moscow', 'idisuda', 7, '9923232'),
	(1, 'U.S.A', 'Los Angeles', 'Magezlanes', 10, '100310)'),
	(2, 'U.S,A', 'Chicago', 'generic road', 11, '49492001'),
	(3, 'Israel', 'Tel-Aviv', 'Rotchild', 13, '2377532'),
	(4, 'Spain', 'Madrid', 'blablablabla', 7, '9923232'),
	(5, 'Japan', 'Tokyo', 'Konichiwa', 205, '100029'),
	(6, 'France', 'Paris', 'Chans allise', 12, '32423333'),
	(7, 'Russia', 'Moscow', 'DevaiDevai', 121, '39549443'),
	(8, 'Israel', 'Tel-Aviv', 'Daniel', 17, '2395843'),
	(9, 'France', 'Paris', 'zemapelbar', 102, '3211232')

INSERT INTO cities(city)
VALUES
	('Moscow'),
	('Tel-Aviv'),
	('Chicago'),
	('Los Angeles'),
	('Madrid'),
	('Tokyo'),
	('Paris')


INSERT INTO Countries(Country)
	VALUES
		('Russia'),
		('Israel'),
		('U.S.A'),
		('Spain'),
		('Japan'),
		('France')

INSERT INTO Products
VALUES
    (0, 50.3, 'babagaga@gmail.com'),
    (1,20.3, 'craig52@gmail.com'),
	(2,32.3, 'michael@gmail.com'),
	(3,30, 'salamandrac@gmail.com'),
	(4,20, 'abc@gmail.com'),
	(5,45, 'david_levi@yahoo.co.il'),
	(6,46, 'eyal.golan@walla.co.il'),
	(7,353, 'israelisrali@gmail.com'),
	(8,23.5, 'noa_kile@noakile.domain.com')

INSERT INTO Reviews
VALUES
    ('babagaga@gmail.com', 20112020, 4.0, 'The host was amazing'),
	('craig52@gmail.com', 15102019, 3.2, 'beinoni beinoni beinoni'),
	('israelisrali@gmail.com', 19092008, 2.0, 'I did not have fun at all'),
	('eyal.golan@walla.co.il', 01022018, 5.0, 'Best night ever'),
	('noa_kile@noakile.domain.com', 20102020, 4.0, 'Million dollar'),
	('babagaga@gmail.com', 20112020, 4.0, 'The host was amazing')


INSERT INTO [Search's]
VALUES
    (120002234, 'babagaga@gmail.com', '20200717 08:42:21', '20210503', '20210703'),
    (123666432, 'craig52@gmail.com', '20201030 01:07:51', '20210328', '20210329'),
	(234231132, 'michael@gmail.com', '20201015 19:00:32', '20210303', '20210308'),
	(128478923, 'salamandrac@gmail.com', '20200203 01:07:51', '20210410', '20210415'),
	(235432495, 'abc@gmail.com', '20200308 13:16:18', '20210210', '20210211'),
	(354934898, 'david_levi@yahoo.co.il', '20200921 07:59:16', '20211209', '20211222'),
	(958372723, 'eyal.golan@walla.co.il', '20200906 22:01:02', '20210602', '20210608'),
	(494958862, 'israelisrali@gmail.com', '20200221 23:31:37', '20210616', '20210626'),
	(324520068, 'noa_kile@noakile.domain.com', '20191221 23:31:37', '20210729', '20210730')


INSERT INTO Properties
VALUES
	(4,'dorms',2,1,4),
	(5,'cottage',3,1,5),
	(6,'penthouse',3,1,4),
	(7,'basement',2,1,3)

INSERT INTO Services
VALUES
	(4, 'wifi'),
	(4, 'pool'),
	(6, 'hot water'),
	(5,'billiards'),
	(4,'room service'),
	(5, 'TV'),
	(6, 'air conditioner'),
	(7, 'hair drayer'),
	(7, 'pool')

INSERT INTO [Security-Measures]
VALUES
	(4, 'Fire Extinguisher'),
	(4, 'Smoke Detector'),
	(5, 'Smoke Detector'),
	(6,'Fire Extinguisher'),
	(5, 'Fire Extinguisher'),
	(6, 'WIFI'),
	(7, 'Fire Extinguisher'),
	(4, 'WIFI')

INSERT INTO LiveExperiences
VALUES
	(0,'walking tour', 40, 0), 
	(1, 'jeep tour',30,1),
	(2,'farm tour',25,2),
	(3,'picking strawberries',30,3)



INSERT INTO OnlineExperiences
VALUES
	(8,20,21,0),
	(7,11,20,1)


INSERT INTO OnlineLanguages
VALUES
	(7,'English'),
	(8,'Russian'),
	(8,'Arabic'),
	(7,'Polish'),
	(7, 'Italian'),
	(7, 'Indian'),
	(8,'German')

INSERT INTO LiveLanguages
VALUES
	(0, 'English'), 
	(1,'English'),
	(2,'Franch'),
	(3,'Russian'),
	(0,'Arabic'),
	(1,'Polish'),
	(2, 'Romanian'),
	(3, 'Indian'),
	(1,'Hebrew')


INSERT INTO Orders
VALUES
	(100,0,1200,'20200717 08:50:27',120002234,'20200717 08:42:21'),
	(101,1,990,'20201030 01:27:51',123666432, '20201030 01:07:51'),
	(102,2,1250,'20201015 19:25:37',234231132, '20201015 19:00:32'),
	(103,3,1700,'20200203 01:17:56',128478923, '20200203 01:07:51'),
	(104,4,1060,'20200308 13:41:18',235432495, '20200308 13:16:18'),
	(105,5,1430,'20200921 08:13:16',354934898,'20200921 07:59:16'),
	(106,6,1345,'20200906 22:11:23',958372723, '20200906 22:01:02'),
	(107,7,1200,'20200221 23:39:23',494958862, '20200221 23:31:37'),
	(108,8,1590,'20191221 23:54:31',324520068, '20191221 23:31:37')

INSERT INTO PlacedOrders
VALUES
	(0,100),
	(1,101),
	(2,102),
	(3,103),
	(4,104),
	(5,105),
	(6,106),
	(7,107),
	(8,108)

INSERT INTO Retrieved
VALUES
	(120002234,'20200717 08:42:21',0),
	(123666432, '20201030 01:07:51',1),
	(234231132, '20201015 19:00:32',2),
	(128478923, '20200203 01:07:51',3),
	(235432495, '20200308 13:16:18',4),
	(354934898,'20200921 07:59:16',5),
	(958372723, '20200906 22:01:02',6),
	(494958862, '20200221 23:31:37',7),
	(324520068, '20191221 23:31:37',8)



