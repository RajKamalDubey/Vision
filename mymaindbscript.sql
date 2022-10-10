--USE [master]
--GO
--IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = N'TravelAwayDB' OR name = N'TravelAwayDB')))
--DROP DATABASE TravelAwayDB


--Create Database TravelAwayDB
--Go
--USE TravelAwayDB
--Go

----Table For choosing Roles

--Create Table Roles(
--RoleId TINYINT CONSTRAINT pk_RoleId PRIMARY KEY IDENTITY,
--RoleName VARCHAR(20) CONSTRAINT uq_RoleName UNIQUE);

--SET IDENTITY_INSERT Roles ON
--INSERT INTO Roles(RoleId,RoleName) VALUES (1,'Customer')
--INSERT INTO Roles(RoleId,RoleName) VALUES (2,'Employee')
--SET IDENTITY_INSERT Roles OFF

--CREATE TABLE Customer(
--[EmailId] VARCHAR(50) CONSTRAINT pk_EmailId PRIMARY KEY,
--[RoleId] TINYINT CONSTRAINT fk_RoleId REFERENCES Roles(RoleId),
--[FirstName] VARCHAR(50) CONSTRAINT chk_FirstName CHECK(NOT [FirstName] LIKE '% %') NOT NULL,
--[LastName] VARCHAR(50) CONSTRAINT chk_LastName CHECK(NOT [LastName] LIKE '% %') NOT NULL,
--[UserPassword] VARCHAR(15) CONSTRAINT chk_UserPassword CHECK(len([UserPassword])>=8 AND len([UserPassword])<=16) NOT NULL,
--[Gender] CHAR CONSTRAINT chk_Gender CHECK(Gender='M' OR Gender='F') NOT NULL,
--[ContactNumber] NUMERIC(10) CONSTRAINT chk_ContactNumber check([ContactNumber] NOT LIKE '0%' AND len([ContactNumber])=10) 
--NOT NULL,
--[DateOfBirth] DATE CONSTRAINT chk_DateOfBirth CHECK(DateOfBirth<GETDATE()) NOT NULL,
--[Address] VARCHAR(250) NOT NULL
--);

--INSERT INTO Customer(EmailId,UserPassword,RoleId,Gender,FirstName,LastName,ContactNumber,DateOfBirth,[Address]) 
--Values('raj@gmail.com','raj@1234',1,'M','Raj','Kamal',8953273464,'1997-08-02','Gorakhpur');
--INSERT INTO Customer(EmailId,UserPassword,RoleId,Gender,FirstName,LastName,ContactNumber,DateOfBirth,[Address]) 
--Values('adarsh@gmail.com','adarsh@1234',1,'M','Adarsh','V',9090909005,'1998-08-02','Delhi');
--INSERT INTO Customer(EmailId,UserPassword,RoleId,Gender,FirstName,LastName,ContactNumber,DateOfBirth,[Address]) 
--Values('rashid@gmail.com','rashid@1234',1,'M','Rashid','Ali',8908509388,'1997-10-26','ECC2');
--INSERT INTO Customer(EmailId,UserPassword,RoleId,Gender,FirstName,LastName,ContactNumber,DateOfBirth,[Address]) 
--Values('kush@gmail.com','kush@1234',1,'M','Kush','Jyoti',8900000388,'1999-10-26','ECC2');
--INSERT INTO Customer(EmailId,UserPassword,RoleId,Gender,FirstName,LastName,ContactNumber,DateOfBirth,[Address]) 
--Values('chandhini@gmail.com','chandhini@1234',1,'F','Chandhini','V',8900000388,'1999-10-26','ECC2');

---------Table For Employee---------------

--CREATE TABLE Employee(
--[EmpId] INT CONSTRAINT pk_EMPID PRIMARY KEY IDENTITY,
--[FirstName] VARCHAR(50) CONSTRAINT chk_FName CHECK(NOT[FirstName] LIKE '% %') NOT NULL,
--[LastName] VARCHAR(50) CONSTRAINT chk_LName CHECK(NOT[LastName] LIKE '% %') NOT NULL,
--[Password] VARCHAR(15) CONSTRAINT chk_Password CHECK(len([Password])>=8 AND len([Password])<=16) NOT NULL,
--[RoleId] TINYINT CONSTRAINT fk_RId REFERENCES Roles(RoleId),
--[EmailId] VARCHAR(50)
--)
--INSERT INTO Employee(FirstName,LastName,[Password],RoleId,EmailId) VALUES('Admin','Raj','Araj@1234',2,'adminraj@gmail.com')
--INSERT INTO Employee(FirstName,LastName,[Password],RoleId,EmailId) VALUES('Admin','Dubey','Arajkd@1234',2,'adminrajkd@gmail.com')


----------Error Occurred--------
----Drop Table Employee
-----------------Packages Category---------------
--CREATE TABLE PackageCategory(
--[PackageCategoryId] INT CONSTRAINT pk_PackageCategoryId PRIMARY KEY IDENTITY(100,1),
--[PackageCategoryName] VARCHAR(20) UNIQUE NOT NULL
--);
--INSERT INTO PackageCategory(PackageCategoryName)
--Values ('Adventure'),('Nature'),('Religious'),('Village'),('Wildlife')

-----------------Packages---------------

--CREATE TABLE Package(
--[PackageId] INT CONSTRAINT pk_PackageId PRIMARY KEY IDENTITY(2000,1),
--[PackageName] VARCHAR(30) UNIQUE NOT NULL,
--[PackageCategoryId] INT CONSTRAINT fk_PackageCategoryId REFERENCES PackageCategory(PackageCategoryId),
--[TypeOfPackage] VARCHAR(15) CONSTRAINT chk_TypeOfPackage CHECK(TypeOfPackage IN ('International','Domestic'))
--);

--SET IDENTITY_INSERT Package OFF
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Love To North India',100,'Domestic')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Los Angeles',101,'International')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Switzerland',102,'International')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Dubai',103,'International')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Maldives',104,'International')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Kashmir',101,'Domestic')
--INSERT INTO Package(PackageName,PackageCategoryId,TypeOfPackage) VALUES('Beauty of South',102,'Domestic')



---------------Hotels---------------
--CREATE TABLE Hotel(
--[HotelId] INT CONSTRAINT pk_HotelId PRIMARY KEY IDENTITY(1000,1),
--[HotelName] VARCHAR(20),
--[HotelRating] INT NOT NULL CONSTRAINT chk_HotelRating CHECK(HotelRating>=2 AND HotelRating<=5),
--[SingleRoomPrice] MONEY,
--[DoubleRoomPrice] MONEY,
--[DeluxeeRoomPrice] MONEY,
--[SuitePrice] MONEY,
--[City] VARCHAR(20)
--);

--SET IDENTITY_INSERT Hotel ON
--INSERT INTO Hotel(HotelId,HotelName,HotelRating,SingleRoomPrice,DoubleRoomPrice,DeluxeeRoomPrice,City) VALUES(1002,'Hotel Taj',4, 700,1400,2100,'Ooty')
--INSERT INTO Hotel(HotelId,HotelName,HotelRating,SingleRoomPrice,DoubleRoomPrice,DeluxeeRoomPrice,City) VALUES(1003,'Hotel Raj',3, 1400,2900,4800,'Jaipur')
--INSERT INTO Hotel(HotelId,HotelName,HotelRating,SingleRoomPrice,DoubleRoomPrice,DeluxeeRoomPrice,City) VALUES(1004,'Radisson Blu',3, 2800,4000,8800,'America')
--INSERT INTO Hotel(HotelId,HotelName,HotelRating,SingleRoomPrice,DoubleRoomPrice,DeluxeeRoomPrice,City) VALUES(1005,'5 Star Hotel',4,3200,5500,7800,'Australia')

---------------Package Details---------------

--CREATE TABLE PackageDetails(
--[PackageDetailId] INT CONSTRAINT pk_PackageDetailId PRIMARY KEY IDENTITY(900,1),
--[PackageId] INT CONSTRAINT fk_PackageId REFERENCES Package(PackageId),
--[PlacesToVisit] VARCHAR(500) NOT NULL,
--[Description] VARCHAR(500) NOT NULL,
--[NoOfDays] INT NOT NULL,
--[NoOfNights] INT NOT NULL,
--[Accomodation] VARCHAR(10) CONSTRAINT chk_Accomodation CHECK(Accomodation IN ('Available','Unavailable')),
--[PricePerAdult] DECIMAL
--);
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2000,'Kashmir','Universally acknowledged as “heaven of earth”, Kashmir is resplendent with Chinar trees that turn the entire valley yellow and red as
--autumn arrives, silver lakes that turn gold in the light of dawn, and the jewel-blue river that are souls of the ice-cold mountains.',2,2,'Available',2000)
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2001,'Jaipur','Jaipur is a historic city in India with famous nickname Pink City',3,2,'Available',2200)
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2002,'Maldives','Love beaches? Check this out This Place!!',4,3,'Available',15000)
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2003,'Switzerland','Best for trips with your Partner!',4,3,'Available',11000)
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2004,'Dehradun To Rishikesh','Religious-Family Place to Visit!',3,2,'Available',1800)
--INSERT INTO PackageDetails(PackageId,PlacesToVisit,Description,NoOfDays,NoOfNights,Accomodation,PricePerAdult) VALUES(2005,'Delhi-Capital of India','Great Place to Visit!',2,2,'Available',2000)







---------------Package Bookings---------------

--CREATE TABLE BookPackage(
--[EmailId] VARCHAR(50) CONSTRAINT fk_EmailId REFERENCES Customer(EmailId),
--[BookingId] INT CONSTRAINT pk_BookingId PRIMARY KEY IDENTITY(4000,1),
--[ContactNumber] NUMERIC(10) NOT NULL,
--[Address] VARCHAR(100) NOT NULL,
--[DateOfTravel] DATE NOT NULL CONSTRAINT chk_DateOfTravel CHECK(DateOfTravel>=GETDATE()),
--[NumOfAdults] INT NOT NULL,
--[NumOfChildren] INT,
--[Status] VARCHAR(10) NOT NULL CONSTRAINT chk_Status CHECK([Status] IN ('Booked','Confirmed')),
--[PackageId] INT CONSTRAINT fk_packId REFERENCES PackageDetails(PackageDetailId)
--);
-------Added PackageId to BookPackage-----
--INSERT INTO BookPackage(EmailId,ContactNumber,[Address],DateOfTravel,NumOfAdults,NumOfChildren,[Status],PackageId) VALUES('raj@gmail.com',8953273464,'273000-Gorakhpur','2022-12-20',2,0,'Booked',900)
--INSERT INTO BookPackage(EmailId,ContactNumber,[Address],DateOfTravel,NumOfAdults,NumOfChildren,[Status],PackageId) VALUES('rashid@gmail.com',892345678,'253000-Gorakhpur City','2022-11-12',3,0,'Booked',903)
--INSERT INTO BookPackage(EmailId,ContactNumber,[Address],DateOfTravel,NumOfAdults,NumOfChildren,[Status],PackageId) VALUES('adarsh@gmail.com',9022022020,'310-Kerala','2022-12-09',2,1,'Booked',901)
--INSERT INTO BookPackage(EmailId,ContactNumber,[Address],DateOfTravel,NumOfAdults,NumOfChildren,[Status],PackageId) VALUES('chandhini@gmail.com',9898900000,'310-Kerala','2022-11-07',2,0,'Booked',902)

----Drop Table BookPackage




--go
--Create PROCEDURE usp_RegisterCustomer
--(
--@EmailId VARCHAR(30),
--@FirstName VARCHAR(20),
--@LastName VARCHAR(20),
--@Password VARCHAR(16),
--@Gender CHAR,
--@Contact NUMERIC(10),
--@DOB DATE,
--@Address VARCHAR(50)
--)
--AS BEGIN
--	DECLARE @RoleId CHAR(2),
--		@retval INT
--	BEGIN TRY
--		IF(LEN(@EmailId)<4 OR LEN(@EmailId) IS NULL)
--		SET @retval=-1
--		ELSE IF(LEN(@Password)<8 OR LEN(@Password)>16 OR (@Password IS NULL))
--		SET @retval=-2
--		ELSE IF(@DOB>=CAST(GETDATE() AS DATE) OR (@DOB IS NULL))
--		SET @retval=-3
--		ELSE IF (DATEDIFF(day,@DOB,GETDATE())<6570)
--		SET @retval=-4
--		ELSE IF(@FirstName LIKE('%[^a-zA-Z]%') OR LEN(@FirstName)=0)
--		SET @retval=-5
--		ELSE IF(@LastName LIKE ('%[^a-zA-Z]%') OR LEN(@LastName)=0)
--		SET @retval=-5
--		ELSE
--			BEGIN
--				SELECT @RoleId=RoleId FROM dbo.Roles WHERE RoleName='Customer'
--				INSERT INTO Customer VALUES
--				(@EmailId,@RoleId,@FirstName,@LastName,@Password,@Gender,@Contact,@DOB,@Address)
--				SET @retval=1
--			END
--		SELECT @retval
--	END TRY
--	BEGIN CATCH
--		SET @retval=-99
--		SELECT @retval, ERROR_LINE(),ERROR_MESSAGE()
--	END CATCH
--END 
--GO
----DECLARE @ReturnResult INT
----EXEC usp_RegisterCustomer 'somin@gmail.com','Somin','Sharma','Somin@1234','M',8911111113,'1998-09-10','23234-Luthiana'
----SELECT @ReturnResult as ReturnResult
----GO


--CREATE PROCEDURE usp_EditProfile
--(
--@EmailId VARCHAR(50),
--@FirstName VARCHAR(50),
--@LastName VARCHAR(50),
--@Gender CHAR,
--@ContactNumber NUMERIC(10),
--@DateOfBirth DATE,
--@Address VARCHAR(300)
--)
--AS
--	BEGIN
--		DECLARE @retval INT
--		BEGIN TRY
--			IF(@EmailId IS NULL)
--				SET @retval=-1
--			ELSE IF(@FirstName IS NULL)
--				SET @retval=-2
--			ELSE IF(@LastName IS NULL)
--				SET @retval=-3
--			ELSE IF(@Gender IS NULL)
--				SET @retval=-4
--			ELSE IF(@ContactNumber IS NULL)
--				SET @retval=-5
--			ELSE IF(@DateOfBirth IS NULL)
--				SET @retval=-6
--			ELSE IF(@Address IS NULL)
--				SET @retval=-7
--			ELSE IF NOT EXISTS(SELECT EmailId FROM Customer WHERE EmailId=@EmailId)
--				SET @retval=-8
--			ELSE IF(LEN(@EmailId)<5 OR LEN(@EmailId)>50)
--				SET @retval=-9
--			ELSE IF(@Gender<>'F' AND @Gender<>'M')
--				SET @retval=-10
--			ELSE IF(@DateOfBirth>= CAST(GETDATE() AS DATE))
--				SET @retval=-11
--			ELSE IF(@FirstName LIKE '%^[a-zA-Z]%')
--				SET @retval=-12
--			ELSE IF(@LastName LIKE '%^[a-zA-Z]%')
--				SET @retval=-13
--			ELSE IF(LEN(@ContactNumber)<>10)
--				SET @retval=-14
--			ELSE IF(@ContactNumber LIKE '%^[0-9]%')
--				SET @retval=-15
--			ELSE IF(@ContactNumber LIKE '^0%')
--				SET @retval=-16
--			ELSE
--				BEGIN
--					UPDATE Customer SET FirstName=@FirstName,Lastname=@LastName,Gender=@Gender, ContactNumber=@ContactNumber,
--					DateOfBirth=@DateOfBirth,[Address]=@Address WHERE EmailId=@EmailId
--					SET @retval=1
--				END
--			RETURN @retval
--		END TRY
--		BEGIN CATCH
--			SET @retval=-99
--			SELECT ERROR_MESSAGE(), ERROR_LINE()
--			RETURN @retval
--		END CATCH
--	END
--GO

