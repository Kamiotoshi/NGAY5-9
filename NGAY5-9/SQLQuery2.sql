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
 -- T?O KHUNG NH�N L?Y RA TH�NG TIN C? B?N TRONG B?NG PERSON.CONTACT
 CREATE VIEW V_Contact_Info AS
 SELECT FirstName, MiddleName, LastName
 FROM AdventureWorks2022.Person.Person
 GO
--T?O KHUNG NH�N L?Y RA TH�NG TIN V? NH�N VI�N
 CREATE VIEW V_Employee_Contact AS
 SELECT p.FirstName, p.LastName, e.BusinessEntityID,e.HireDate
 FROM AdventureWorks2022.HumanResources.Employee e
 JOIN AdventureWorks2022.Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;
 GO
 --XEM M?T KHUNG NH�N
 SELECT*FROM V_Employee_Contact
 GO
--THAY ?�I KHUNG NH�N V_EMPLOYEE_CONTACT B?NG VI?T TH�M BIRTHDATE
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate, e.Birthdate
FROM AdventureWorks2022.HumanResources.Employee e
JOIN AdventureWorks2022.Person.Person AS p ON e.BusinessEntityID= p.BusinessEntityID
WHERE p.FirstName like '%B%';
GO
--X�A M?T KHUNG NH�N
DROP VIEW V_Contact_Info
GO
--XEM ??NH NGH?A KHUNG NH�N V_EMPLOYEE_CONTACT
EXECUTE sp_helptext 'V_Employee_Contact'
--xem c�c th�nh ph?n m� khung nh�n ph? thu?c
EXECUTE sp_depends 'V_Employee_Contact'
GO
USE AdventureWorks2022;  
GO
EXEC sp_depends @objname = N'Sales.Customer' ;