Create Database Lab11
Go 
Use Lab11

Create view ProductList 
AS 
Select ProductID, Name From AdventureWorks2022.Production.Product
Select *  from ProductList
GO 

Create view SalesOrderDetail
AS 
Select pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
From AdventureWorks2022.Sales.SalesOrderDetail od
Join AdventureWorks2022.Production.Product pr 
On od.ProductID=pr.ProductID
Select * from SalesOrderDetail
Go 

Create view v_Contact_Info 
AS 
Select FirstName, MiddleName, LastName 
From Person.Person
GO 

Create view V_Employee_Contact 
AS 
Select p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
From HumanResources.Employee e 
Join Person.Person as p on e.BusinessEntityID = p.BusinessEntityID;
GO



Select* from V_Employee_Contact
GO

Alter view V_Employee_Contact 
AS 
Select p.FirstName,
p.LastName, 
e.BusinessEntityID, 
e.HireDate,
e.BirthDate
From HumanResources.Employee e 
Join Person.Person as p on e.BusinessEntityID = p.BusinessEntityID
Where p.FirstName like '%B%';
Go 
Select top 10 * from  V_Employee_Contact

Drop view v_Contact_Info
GO
Select * from v_Contact_Info

--Xem định nghĩa khung hình 
EXECUTE sp_helptext 'V_Employee_Contact'

--xem các thành phần mà khung hình phụ thuộc
EXECUTE sp_depends V_Employee_Contact
GO 

--Tạo khung hình ổn mà định nghĩa bị ẩn đi(không xem được định nghĩa khung hình )
Create view OrderRejects 
With ENCRYPTION 
AS 
SELECT PurchaseOrderID, ReceivedQty, RejectedQty,
RejectedQty / ReceivedQty As RejectRatio, DueDate 
From Purchasing.PurchaseOrderDetail 
Where RejectedQty/ReceivedQty>0
AND DueDate > Convert (DATETIME, '20010630', 101);


--Không xem được định nghĩa khung OrderReject
execute sp_helptext 'OrderRejects'
Go

Alter view V_Employee_Contact AS 
SELECT p.FirstName,
p.LastName, 
e.BusinessEntityID, 
e.HireDate
From HumanResources.Employee e 
Join Person.Person AS p On e.BusinessEntityID = p.BusinessEntityID
Where p.FirstName Like 'A%'
With Check option 

Select * from V_Employee_Contact
UPDATE V_Employee_Contact set FirstName='Atest' where LastName='Amy'
UPDATE V_Employee_Contact set FirstName='BCD' where LastName='Atest'
GO

Drop view V_Contact_Info 
Go 

Create view V_Contact_Info with SCHEMABINDING AS 
Select FisrtName, MiddleName, LastName, EmailAddress
From Person.Contact
GO 

Select *from [Person].[Person]
GO

Create unique CLUSTERED INDEX IX_Contact_Email
On V_Contact_Info
GO 

exec sp_rename V_Contact_Info, V_Contact_Infomation 

select * from V_Contact_Infomation 
Insert into V_Contact_Infomation values ('ABC','DEF','GHI','abc@gmail.com')

Delete from  V_Contact_Infomation where LastName='Gilbert' and FirstName='Guy'

