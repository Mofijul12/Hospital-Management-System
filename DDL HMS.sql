/*
							SQL Project Name : Hospital Management System(HMS)
										Trainee Name : Mofijul Islam  
						    			  Trainee ID : 1285417      
									  Batch ID : ESAD-CS/PNTL-A/62/01 

             --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [TCMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
		CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/

USE master
GO

IF DB_ID('HMS') IS NOT NULL
DROP DATABASE HMS
GO

CREATE DATABASE HMS
ON
(
	name = 'HMS_Data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HMS_Data.mdf',
	size = 10MB,
	maxsize = 100MB,
	filegrowth = 10%
)
LOG ON
(
	name = 'HMS_Log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HMS_Log.ldf',
	size = 8MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO

USE HMS
GO

/*
==============================  SECTION 02  ==============================
					CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

---Table with CONSTRAINT:

CREATE TABLE Department
(
	Dep_Id INT IDENTITY PRIMARY KEY,
	Dep_Name VARCHAR(30) NOT NULL,
	Dep_Head VARCHAR(30) NOT NULL
)
GO
CREATE TABLE Employee
(
	Emp_Id INT IDENTITY PRIMARY KEY,
	Emp_Name VARCHAR(30) NOT NULL,
	JoiningDate DATE NOT NULL,
	Salary MONEY NOT NULL,
	Dep_Id INT REFERENCES Department(Dep_Id)
)
GO
Create table Doctor
(
	DoctorId int primary key,
	DoctorName varchar(30),
	Dep_Id int references Department(Dep_Id)
)
go

create table Patient 
(
	[Patient Id] int identity primary key,
	Pat_Name varchar(30) not null,
	email varchar(40) unique constraint ck_emailCheck check (email like '%@%' ),
	phone char(20) unique check(phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[Blood Group] char (3) not null,
	Gender char(6) not null,
	[Address] varchar(70) default 'Dhaka,Bangladesh',
	Disease varchar(30) not null,
	[Arrival Date] date not null,
	[Discharge Date] date not null,
	DoctorId int references Doctor(DoctorId)
)


create table Medicine
(
	Med_Id UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	Med_Name varchar(30) not null,
	Quantity int not null,
	Cost money not null,
	[Patient Id] int references Patient([Patient Id])
)
go

Create table Bill
(
	Bil_Id int identity primary key,
	PaymentDate date not null,
	Amount money not null,
    [Patient Id] int references Patient([Patient Id])
)
go



Create table Nurse
(
	NurseId int identity primary key,
	[Patient Id] int references Patient([Patient Id]),
	nurseName nvarchar(30)
)

Create table Test
(
	TestId int identity primary key,
	TestName varchar(30) not null,
	TestCost money not null,
	[Patient Id] int references Patient([Patient Id])
)
go

create table relatives
(
	reletiveId int primary key nonclustered,
	relativeName varchar(30) not null,
	[Patient Id] int references Patient([Patient Id]),
	BgOfRelative char(3),
	relationWithPatient varchar(20)
)

---Table with composite PRIMARY KEY:

create table doctorWithPatient
(
	DoctorId int references Doctor(DoctorId),
	[Patient Id] int references Patient([Patient Id]),
	primary key(DoctorId,[Patient Id])
)
go

---CREATE A SCHEMA:

create schema sr
go
--USE SCHEMA IN A TABLE:

create table sr.serviceRating
(
	ratingId int not null,
	rating int default 10,
	comment nvarchar(50) null
)
go

/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


--ALTER TABLE SCHEMA AND TRANSFER TO [DBO]:

alter schema dbo transfer sr.serviceRating
go

---Update column definition:

alter table serviceRating
alter column comment nvarchar(100) NULL
go

---ADD column with DEFAULT CONSTRAINT:

alter table serviceRating
add [Name] varchar(30) default 'Patient'
go

---DROP COLUMN:

alter table serviceRating
drop column comment
go
---DROP TABLE:

drop table serviceRating
go

---DROP SCHEMA:

drop schema sr
go

/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/
-- Clustered Index:

create clustered index Ix_Realtives
on relatives
(
	reletiveId
)
go

-- Nonclustered Index:

create nonclustered index Ix_Department
on Department
(
	Dep_Id
)
go

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/
CREATE SEQUENCE seqNum
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
GO

--============== ALTER SEQUENCE ============--

ALTER SEQUENCE seqNum
	MAXVALUE 200
	CYCLE
	CACHE 9
GO


/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/
create view vDepartment
as
select Dep_Id,Dep_Name,Dep_Head from Department
go

--============== ALTER VIEW ============--
alter view vDepartment
as
select Dep_Name,Dep_Head from Department
go

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
create view v_BillAmount
with schemabinding,encryption
as
select Bil_Id,Amount from dbo.Bill
where Amount>0
with check option
go

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/

--============== STORED PROCEDURE for insert data using parameter ============--
create proc spInsertEmployee		
								@Name varchar(30),
								@Joining date,
								@Salary money,
								@DepId int
as
begin
		insert into Employee(Emp_Name,JoiningDate,Salary,Dep_Id) 
		values (@Name,@Joining,@Salary,@DepId)
end
go

--============== STORED PROCEDURE for insert data with OUTPUT parameter ============--
create proc spInsertRelative	@name varchar(30),
								@patientId int,
								@id int output
								

as
begin
		insert into relatives(relativeName,[Patient Id])
		values(@name,@patientId)
		select @id= IDENT_CURRENT('relatives')
end
go

--============== STORED PROCEDURE for UPDATE data ============--
create proc spUpdateEmploye		@Id int,
								@Name varchar(30),
								@Joining date,
								@Salary money,
								@DepId int
as
begin
		update Employee set Emp_Name=@Name,JoiningDate=@Joining,Salary=@Salary
		where Dep_Id=@DepId
end
go

--============== STORED PROCEDURE for DELETE Table data ============--
create proc spDeleteEmployee @id int
as
begin
		delete from Employee where Emp_Id=@id
end
go

--============== ALTER STORED PROCEDURE ============--
alter proc spUpdateEmploye		@Id int,
								@Name varchar(30),
								@Salary money,
								@DepId int
as
begin
		update Employee set Emp_Name=@Name,Salary=@Salary
		where Dep_Id=@DepId
end
go

--TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE---

create proc spRaisError
AS
begin
	begin try
		delete from relatives
	end try
	begin catch
		declare @Error varchar(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	end catch
end
go

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

---SCALAR FUNCTION---
-- A Scalar Function for total salary to be paid in a year

create function fnCurrentYearSalar(@id int)
returns money
as
begin
	declare @totalSalary MONEY
	select @totalSalary= Salary*12 from Employee
	where Emp_Id=@id
	return @totalSalary
end
go

--Inline Table Valued Function--
-- A Inline Table Valued Function to get test wise Patient Information

create function fntestWisePatientInfo(@TName varchar(30))
returns table
as
return
(
	select * from Test 
	where TestName=@TName
)
go

--A MULTISTATEMENT TABLE VALUED FUNCTION--
--Multistatement table valued function to get blood group wise patient information

CREATE FUNCTION fnBloodGrWisePatientInfo(@Blood_Group char(3))
RETURNS @bloodGrWisePatientInfo TABLE
(
	patId INT,
	PatName VARCHAR(30),
	disease VARCHAR(30),
	Addresss VARCHAR(70)
)
AS
BEGIN
	INSERT INTO @bloodGrWisePatientInfo
	SELECT [Patient Id],Pat_Name,Disease,Address FROM Patient
	WHERE [Blood Group]=@Blood_Group
	RETURN
END
GO

/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

CREATE TRIGGER trUpdateDeleteDoctor
ON Doctor
AFTER UPDATE,DELETE
AS
BEGIN
	PRINT 'Upadte or Delete not Possible'
	ROLLBACK TRANSACTION
END
GO

/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/

CREATE TRIGGER trCheckInsertDepartment
ON Department
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Dep_Id INT
	DECLARE @Dep_Name VARCHAR(30)
	DECLARE @Dep_Head VARCHAR(30)
	SElECT  @Dep_Id=Dep_Id,@Dep_Name=Dep_Name,@Dep_Head=Dep_Head from inserted
	SELECT @Dep_Id= COUNT(Dep_Id) from Department
	IF @Dep_Id<5
		BEGIN
			INSERT INTO Department(Dep_Id,Dep_Name,Dep_Head)
			SELECT (Dep_Id,Dep_Name,Dep_Head) FROM inserted
		END
	ELSE
		BEGIN
			RAISERROR ('Already 5 Doctors Available',10,1)
			ROLLBACK TRANSACTION
		END

END
GO