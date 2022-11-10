--- WITH <nome_da_expressão> [(nome_da_coluna [,...n])]
--- AS
--- (definição_da_query_CTE)
---

WITH EmployeePOs (EmployeeID, [Total Due])
AS
(
    SELECT 
        poh.EmployeeID,
        CONVERT(VARCHAR(20), SUM(poh.TotalDue), 1)
    FROM
         Purchasing.PurchaseOrderHeader poh
    GROUP BY
         poh.EmployeeID
)
SELECT *
FROM EmployeePOs;

-- Variáveis de tabela
-- DECLARE @variavel_local [AS] tabela
-- (
--   [(definição_da_coluna) [,...n]]
-- )

DECLARE @EmployeePOs AS TABLE
(
    EmployeeID INT,
    TotalDue MONEY
)
INSERT INTO @EmployeePOs
SELECT
    poh.EmployeeID,
    CONVERT(VARCHAR(20), SUM(poh.TotalDue), 1)
FROM
     Purchasing.PurchaseOrderHeader poh
GROUP BY
     poh.EmployeeID;

SELECT 
    ep.EmployeeID,
    p.FirstName,
    p.LastName,
    ep.[TotalDue]
FROM 
    @EmployeePOs ep
    INNER JOIN 
        Person.Person p
    ON 
        (ep.EmployeeID = p.BusinessEntityID);

-- Tabelas temporária

CREATE TABLE #EmployeePOs
(
    EmployeeID INT,
    TotalDue MONEY
);

INSERT INTO #EmployeePOs
SELECT
    poh.EmployeeID,
    CONVERT(VARCHAR(20), SUM(poh.TotalDue), 1)
FROM 
    Purchasing.PurchaseOrderHeader poh
GROUP BY
     poh.EmployeeID;

SELECT
    ep.EmployeeID,
    p.FirstName,
    p.LastName,
    ep.[TotalDue]
FROM 
    #EmployeePOs ep
    INNER JOIN 
        Person.Person p
    ON (ep.EmployeeID = p.BusinessEntityID);