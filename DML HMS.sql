/*

					SQL Project Name : Hospital Management System
							    Trainee Name : Mofijul Islam 
						    	  Trainee ID : 1285417       
							Batch ID : ESAD-CS/PNTL-A/62/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/


/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/
USE HMS
GO
INSERT INTO Department VALUES
('Cardiology','Azman Ali'),
('Neurology','Mofijul Islam'),
('Oncology','Nazmus Sakib'),
('Radiology','MD Tawhid'),
('Urology','Sunny Khan')
GO
SELECT * FROM Department
GO

INSERT INTO Employee VALUES
('Ahsan Habib','2020-05-10',12000.00,1),
('Jakir Hossain','2023-06-12',9500.00,2),
('Sadek Hossain','2024-03-15',9500.00,1),
('Abdul Khalek','2018-01-02',25000.00,3),
('Amit Hasan','2023-08-21',18000.00,4),
('Nur Hasan','2021-04-10',18000.00,5),
('Sheikh Abdullah','2020-04-19',20000.00,5),
('Nasrin AKter','2023-06-13',8000.00,2),
('Shima Begum','2022-12-10',20000.00,4),
('Sumaiya Jolly','2023-11-18',25000.00,5),
('Anika Tasnim','2021-12-13',23000.00,2)
GO
SELECT * FROM Employee
GO

INSERT INTO Doctor(DoctorId,DoctorName,Dep_Id) VALUES
(1285417,'Dr.Shahin Atif',1),
(1285418,'Dr.Bibi Amana',2),
(1285419,'Dr.Sarah Sultana',3),
(1285420,'Dr.Huamyun Kabir',4),
(1285421,'Dr.Jasmin Khatun',5)
go
SELECT * FROM Doctor
GO

--============== Insert data by specifying column name ============--
INSERT INTO Patient(Pat_Name,email,phone,[Blood Group],Gender,Address,Disease,[Arrival Date],[Discharge Date],DoctorId)
VALUES
('Amir Hasan','amir322@gmail.com','01948273651','AB+','Male','Sahzadpur,Sirajganj','Asthma','2024-01-12','2024-01-15',1285417),
('Jahid Hasan','jahid52@4gmail.com','01650394728','B+','Male','Chatmohor,Pabna','Bladder Cancer','2023-02-13','2023-02-25',1285418),
('Kamal Hasan','k12@gmail.com','01467829510','B-','Male','Belkuchi,Sirajganj','Ehrlichiosis','2022-10-21','2022-11-01',1285419),
('Abir Sajal','AbirSa445@gmail.com','01375824916','A+','Male','Baufol,Barisal','Kidney Cancer','2024-08-13','2024-08-28',1285420),
('Fatema Begum','Fatema02@gmail.com','01193648257','A-','Female','Mirpur,Dhaka','Leukemia','2022-01-12','2022-01-15',1285421),
('Chuppu Shah','ChuppuShah45@gmail.com','01820475639','O+','Male','Sadarghat,Dhaka','Liver Cancer','2021-02-18','2021-02-25',1285417),
('Sabrina Safa','Safa78@gmail.com','01738596204','AB-','Female','Mirpur,Dhaka','Asthma','2024-03-12','2024-03-13',1285417),
('Sumaiya Islam','Sumaiya45@gmail.com','01569382741','O-','Female','Karwan Bazar,Dhaka','Meningitis','2024-05-12','2024-05-17',1285418),
('Piyali Saha','Piyali74@gmail.com','01390547286','B+','Female','Kandirpar,Cumilla','Rabies','2023-01-12','2023-01-12',1285418)
GO
SELECT * FROM Patient
GO

INSERT INTO Medicine(Med_Name,Quantity,Cost,[Patient Id]) VALUES
('Dapagliflozin',30,220,1),
('Adderall',120,2800,2),
('Lyrica',30,2520,3),
('Meloxicam',60,1500,4),
('Tepezza',220,820,5),
('Mounjaro',15,750,6),
('Imbruvica',40,1220,8),
('Farxiga',55,1050,9)
GO
SELECT * FROM Medicine
go
INSERT INTO Bill(PaymentDate,Amount,[Patient Id]) VALUES
('2024-01-15',15000,1),
('2023-02-25',65000,2),
('2022-11-01',85000,3),
('2024-08-28',22500,4),
('2022-01-15',17855,5),
('2021-02-25',10200,6),
('2024-03-13',89600,7),
('2024-05-17',55000,8),
('2023-01-12',2250,9)
GO
SELECT * FROM Bill
GO

SELECT * FROM Nurse
INSERT INTO Nurse([Patient Id],nurseName) VALUES
(1,'Taslima Islam'),
(2,'Zannat Ara'),
(3,'Nafisa Islam'),
(4,'Nirjona Akter'),
(5,'Tamanna Tabassum'),
(6,'Tasmia Tabassum'),
(7,'Maya jahan'),
(8,'Nur Jahan'),
(9,'Konika Khan')
GO
SELECT * FROM Nurse
GO

INSERT INTO Test(TestName,TestCost,[Patient Id]) VALUES
('X-Ray Chest',1200,1),
('CBC and ESR',1500,2),
('Liver Function Test',2500,3),
('Serum PSA',2500,4),
('Renal Function Test',890,5),
('TSH',5500,6),
('ECG',6000,7),
('Urine R/E',1900,8),
('Ultrasonogram',2500,9)
GO
SELECT * FROM Test
GO

INSERT INTO relatives(reletiveId,relativeName,[Patient Id],BgOfRelative,relationWithPatient)
VALUES
(1,'Jamal Uddin',1,'B+','Brother'),
(2,'Akilam Akter',2,'AB+','Sister'),
(3,'Suraiya Islam',3,'B-','Cousin'),
(4,'Babul Bhuiya',4,'O+','Auncle'),
(5,'Abdul Kader',5,'A+','Brother'),
(6,'Amir Hamza',6,'O-','Brother'),
(7,'Sadia Rahman',7,'B+','Sister'),
(8,'Nafisa Kamal',8,'B+','Sister'),
(9,'Didar Mia',9,'AB-','Auncle')
GO
SELECT * FROM relatives
go

INSERT INTO doctorWithPatient(DoctorId,[Patient Id])
values
(1285417,1),
(1285418,2),
(1285419,3),
(1285420,4),
(1285421,5),
(1285417,6),
(1285418,7),
(1285419,8),
(1285420,9)
GO
SELECT * FROM doctorWithPatient
GO

/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/

exec spInsertEmployee 'Kalim Uddin','2024-08-12',12500,1
exec spInsertEmployee 'Joshim Uddin','2024-08-12',13000,2
exec spInsertEmployee 'Selim Uddin','2024-08-12',14500,2
exec spInsertEmployee 'Adam Saleh','2024-08-12',10000,4
exec spInsertEmployee 'Layla Khatun','2024-08-12',15500,5
go
select * from Employee
go

--INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER--

DECLARE @relativeId INT
exec spInsertRelative 'Sayem Sagir','2',@relativeId output
print 'The new Realative ID is : '+ str(@relativeId)
go

/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/

--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

exec spUpdateEmploye 16,'Lailatun Nahar','2024-07-13','16000',5
go
select * from Employee
go

--============== DELETE DATA THROUGH STORED PROCEDURE ============--
exec spDeleteEmployee 16
go

--============== STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR ============--

exec spRaisError
go

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--

select * from vDepartment
go

insert into vDepartment(Dep_Name,Dep_Head) values
('Pharmacology','Abdus Sabur')
go

--============== UPDATE DATA through view ============--
update vDepartment
SET Dep_Head = 'Kamal Hossain'
WHERE Dep_Id = 6
go

--============== DELETE DATA through view ============--
delete from vDepartment
where Dep_Id=6
go

/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A Scalar Function to get total salary to be paid in a year for a Employeee:
select dbo.fnCurrentYearSalar(2) As Current_Year_Salary
go

-- A Inline Table Valued Function to get test wise Patient Information
select * from dbo.fntestWisePatientInfo('X-Ray Chest')
go

--Multistatement table valued function to get blood group wise patient information
select * from dbo.fnBloodGrWisePatientInfo('B+')
go

/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/

-------FOR/AFTER TRIGGER ON TABLE-------
--Ex01: Restriction on Update
SELECT * FROM Doctor
GO
UPDATE Doctor SET DoctorName='Amal Khan' WHERE DoctorId=1285417
GO

--Ex02: Restriction on Delete
DELETE Doctor WHERE DoctorId=1285418
GO


------- INSTEAD OF TRIGGER ON TABLE-----
--Data inserting Restriction on DEPARTMENT table:
SELECT * FROM Department
GO
INSERT INTO Doctor VALUES(6,'Pharmacology','Abib Hasan')
GO





/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/


--============== 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ============--
select * from  Employee
go

--======== 7.02 A SELECT STATEMENT TO GET information FROM A VIEW ==---
select * from v_BillAmount
go

--========= 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ========--
select * into #department
FROM Department
go

select * from #department
go

--========== 7.04 IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE ==========--
select * from Patient where [Blood Group]='B+ ' order by [Patient Id] 
go

--============== 7.05 INNER JOIN WITH GROUP BY CLAUSE ============--
--Inner join to retrive patients under doctors:

select [Patient Id],Pat_Name,DoctorName from Patient p 
inner join Doctor d on p.DoctorId=d.DoctorId
go

--============== 7.06 OUTER JOIN ============--
select * from Patient p
left join Doctor d on p.DoctorId=d.DoctorId
right join Employee emp on d.Dep_Id=emp.Dep_Id
full join Department dep on dep.Dep_Id=emp.Dep_Id
go

--============== 7.07 CROSS JOIN ============--
select * from Patient
cross join Doctor
go

--============= 7.08 TOP CLAUSE WITH TIES ============--
select top 5 with ties p.[Patient Id],p.Pat_Name,d.DoctorName from Patient p 
inner join Doctor d on p.DoctorId=d.DoctorId
order by [Patient Id]
go

--============== 7.09 DISTINCT ============--

select COUNT(Distinct Dep_Id) 'Number of Department' from Employee
go
select * from Patient
--========= 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ========--
select * from Patient 
where [Discharge Date] between '2022-01-01' and '2024-11-17' 
and not Address='Mirpur,Dhaka'
and [Blood Group]='B+ '
or Gender='Male'
go

--============== 7.11 LIKE, IN, NOT IN=============------
select * from Patient where email like '%@%' and Address not in ('Mirpur,Dhaka')
go

--============== 7.12 OFFSET FETCH ============--
select * from Employee order by Salary 
offset 3 rows fetch next 8 rows only

--============== 7.13 UNION ============--
select * from Department where Dep_Id in (1,2,3)
union
select * from Department where Dep_Id in (4,5)
go

--============== 7.14 EXCEPT INTERSECT ============--
---EXCEPT
select * from Patient
except
select * from Patient where Gender='Male'
go

---INTERSECT
select * from Employee where Salary>10000
intersect
select * from Employee where Salary>15000
go

--============== 7.15 AGGREGATE FUNCTION ============--

select Count(*) 'Total Number of Employee', 
	   SUM(Salary) 'Total Salary to Pay',
	   AVG(Salary) 'Average Salary',
	   MIN(Salary) 'Lowest salary',
	   MAX(Salary) 'Highest Salry'
from Employee

--============== 7.17 ROLLUP & CUBE OPERATOR ============--
--ROLLUP
select Emp_Id,SUM(Salary) as Salary from Employee 
GROUP BY ROLLUP (Emp_Id)
go

--CUBE
select Emp_Id,SUM(Salary) as Salary from Employee 
GROUP BY CUBE (Emp_Id)
go

--============== 7.18 GROUPING SETS ============--

select Bil_Id,SUM(Amount) as Total from Bill b
inner join
Patient p on b.[Patient Id]=p.[Patient Id]
GROUP BY GROUPING SETS (Bil_Id)
go

--============== 7.19 SUB-QUERIES============--

--A Sub-Query to find out patient's relatives with blood group:

select p.Pat_Name,r.relativeName,p.[Blood Group],r.BgOfRelative from Patient p
inner join
relatives r on p.[Patient Id]=r.[Patient Id]
go

--============== 7.20 EXISTS ============--

select * from Patient where not exists (select * from Test)
go

--============== 7.21 CTE ============--

WITH EmployeeCTE 
AS 
(
    SELECT empId, EmpName, Salary
    FROM Employee
)
SELECT * 
FROM EmployeeCTE

--============== 7.22 MERGE ============--

SELECT * FROM Employee
SELECT * FROM dep
GO

MERGE empInfo AS SOURCE
USING Employee AS TARGET
ON SOURCE.empId = TARGET.Dep_Id
WHEN MATCHED THEN
				UPDATE SET
				empId = SOURCE.Dep_Id,
				Dep_Id = SOURCE.Dep_Id;
GO


--============== 7.23 BUILT IN FUNCTION ============--
-- Get current date and time:

select GETDATE()
go

-- GET STRING LENGTH
select Emp_Id, LEN(Emp_Name) 'Name Length' FROM Employee
GO

-- CONVERT DATA USING CAST():
select CAST(25.65 as int)
go

-- CONVERT DATA USING CONVERT():
select CONVERT(varchar, '2017-08-25', 101)
go

-- CONVERT DATA USING TRY_CONVERT():
select TRY_CONVERT(float, 'World', 1) as ReturnNull
go

-- GET DIFFERENCE OF DATES
select DATEDIFF(DAY, '2023-01-01', '2024-01-01') 'Days in a Year'
go

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
go

--============== 7.24 CASE ============--

select Emp_Id,Emp_Name,Salary, 
case
when (Salary<13000) then 'Lower Salary'
when (Salary>13000) then 'Good Salary'
when (Salary>18000) then 'Better Salary' 
when (Salary>22000) then 'Great Salary' 
end as 'Status'
from Employee order by Salary

--============== 7.25 IIF ============--
SELECT Emp_Id,Emp_Name,Salary,
IIF((Salary>15000), 'Good Salary','Lower Salary') AS Statuss
FROM Employee
GO

--============== 7.27 WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO Employee(Emp_Id, Emp_Name) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM Employee

--============== 7.29 RANKING FUNCTION ============--
SELECT 
RANK() OVER(ORDER BY Emp_Id) AS 'Rank',
DENSE_RANK() OVER(ORDER BY Emp_Id ) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY Emp_Id) AS 'NTILE',
Emp_Id,
Emp_Name
FROM Employee
GO

--============== 7.30 IF ELSE & PRINT ============--

DECLARE @TotalSalary MONEY
SELECT @TotalSalary = SUM((Salary))
FROM Employee

IF @TotalSalary > 20000
	BEGIN
		PRINT 'Handsome Salary Paid'
	END
ELSE
	BEGIN
		PRINT 'Poor Salary Paid'
	END
GO

--============== 7.31 TRY CATCH ============--
BEGIN TRY
	DELETE FROM Patient
	PRINT 'Patient Information Deleted'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.32 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--============== 7.33 WAITFOR ============--

PRINT 'Hey there'
WAITFOR DELAY '00:00:03'
PRINT 'Whats up?'
GO

--============== 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdateEmploye
GO

--============== 7.35 TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #Employee
FROM Employee
GO
SELECT * FROM #Employee
GO

BEGIN TRANSACTION
	DELETE FROM #Employee WHERE Emp_Id = 5
	SAVE TRANSACTION tran1
		DELETE FROM #Employee WHERE Emp_Id = 6
		SAVE TRANSACTION tran2
			DELETE FROM #Employee WHERE Emp_Id = 7
			SAVE TRANSACTION tran3

			SELECT * FROM #Employee

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #Employee
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #Employee
COMMIT TRANSACTION
GO
--------------------------------------------------------------------------------
