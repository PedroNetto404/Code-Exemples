USE AdventureWorks2012;

CREATE VIEW dbo.vwEmpployeeInformation
AS
SELECT
    p.Title,
    p.FirstName,
    p.MiddleName, 
    p.LastName,
    e.JobTitle,
    e.BirthDate,
    e.Gender
FROM Person.Person p 
INNER JOIN HumanResources.Employee Employee
ON (p.BusinessEntityID = e.BusinessEntityID); 

SELECT *
FROM dbo.vwEmpployeeInformation