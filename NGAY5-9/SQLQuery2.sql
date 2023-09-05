CREATE DATABASE Lab11
GO
USE Lab11
GO
CREATE VIEW ProductList
AS
	SELECT ProductID, Name  From AdventureWorks2022.Production.Product
	GO
	SELECT*FROM ProductList
	GO
	CREATE VIEW SalesOrderDetail
AS
 SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
od.UnitPrice*od.OrderQty as [Total Price]
 FROM AdventureWorks2022.Sales.SalesOrderDetail od
 JOIN AdventureWorks2022.Production.Product pr
 ON od.ProductID=pr.ProductID
 go
 SELECT * FROM SalesOrderDetail
 GO
 -- T?O KHUNG NHÌN L?Y RA THÔNG TIN C? B?N TRONG B?NG PERSON.CONTACT
 CREATE VIEW V_Contact_Info AS
 SELECT FirstName, MiddleName, LastName
 FROM AdventureWorks2022.Person.Person
 GO
--T?O KHUNG NHÌN L?Y RA THÔNG TIN V? NHÂN VIÊN
 CREATE VIEW V_Employee_Contact AS
 SELECT p.FirstName, p.LastName, e.BusinessEntityID,e.HireDate
 FROM AdventureWorks2022.HumanResources.Employee e
 JOIN AdventureWorks2022.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;
 GO
 --XEM M?T KHUNG NHÌN
 SELECT*FROM V_Employee_Contact
 GO
--THAY ?ÔI KHUNG NHÌN V_EMPLOYEE_CONTACT B?NG VI?T THÊM BIRTHDATE
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate, e.Birthdate
FROM AdventureWorks2022.HumanResources.Employee e
JOIN AdventureWorks2022.Person.Person AS p ON e.BusinessEntityID= p.BusinessEntityID
WHERE p.FirstName like '%B%';
GO
--XÓA M?T KHUNG NHÌN
DROP VIEW V_Contact_Info
GO
--XEM ??NH NGH?A KHUNG NHÌN V_EMPLOYEE_CONTACT
EXECUTE sp_helptext 'V_Employee_Contact'
--xem các thành ph?n mà khung nhìn ph? thu?c
EXECUTE sp_depends 'V_Employee_Contact'
GO
USE AdventureWorks2022;  
GO
EXEC sp_depends @objname = N'Sales.Customer' ;