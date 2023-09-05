Create view vwPerson 
AS
SELECT e1.BusinessEntityID, e1.BirthDate, e2.Rate, JobTitle
From HumanResources.Employee e1
JOIN HumanResources.EmployeePayHistory e2
ON e1.BusinessEntityID = e2.BusinessEntityID
select * from [HumanResources].[Employee]
select * from HumanResources.EmployeePayHistory
INSERT INTO vwPerson VALUES (2,'2000-10-12','150.50','Ăn chơi nhảy múa')