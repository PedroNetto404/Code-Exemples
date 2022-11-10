USE MyAdventureWorks;

SELECT
    SUM(poh.TotalDue) AS TotalDue
FROM 
    Purchasing.PurchaseOrderHeader poh;
--------------------------------------------------
SELECT
    SUM(poh.TotalDue) AS [TotalDue],
    AVG(poh.TotalDue) AS [Average TotalDue],
    COUNT(poh.EmployeeID) [NumberOfEmployees],
    COUNT(DISTINCT(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM 
    Purchasing.PurchaseOrderHeader poh;
--------------------------------------------------
SELECT
    sm.Name AS ShippingMethod,
    SUM(poh.TotalDue) AS [TotalDue],
    AVG(poh.TotalDue) AS [Average TotalDue],
    COUNT(poh.EmployeeID) [NumberOfEmployees],
    COUNT(DISTINCT(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM 
    Purchasing.PurchaseOrderHeader poh
    INNER JOIN 
        Purchasing.ShipMethod sm
    ON 
        (poh.ShipMethodID = sm.ShipMethodID)
GROUP BY sm.Name;
--------------------------------------------------
SELECT
    sm.Name AS ShippingMethod,
    YEAR(poh.OrderDate) AS OrderYear,
    SUM(poh.TotalDue) AS [TotalDue],
    AVG(poh.TotalDue) AS [Average TotalDue],
    COUNT(poh.EmployeeID) [NumberOfEmployees],
    COUNT(DISTINCT(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM 
    Purchasing.PurchaseOrderHeader poh
    INNER JOIN Purchasing.ShipMethod sm

ON(poh.ShipMethodID = sm.ShipMethodID)

GROUP BY sm.Name, YEAR(poh.OrderDate);

-----------------------
WITH ProductQty AS
(
SELECT TOP(10)
p.ProductID,
SUM(OrderQty) AS OrderQty
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
ON(sod.ProductID = p.ProductID)
GROUP BY p.ProductID
) --continua...
SELECT
p.Name AS ProductionName,
pq.OrderQty,
ROW_NUMBER() OVER(ORDER BY pq.OrderQty DESC) RowNumber,
RANK() OVER(ORDER BY pq.OrderQty DESC) [Rank],
DENSE_RANK() OVER(ORDER BY pq.OrderQty DESC) [DenseRank]
FROM ProductQty AS pq
INNER JOIN Production.Product AS p
ON(pq.ProductID = p.ProductID);

------
SELECT
sm.Name AS ShippingMethod,
YEAR(poh.OrderDate) AS OrderYear,
SUM(poh.TotalDue) AS [TotalDue],
AVG(poh.TotalDue) AS [Average TotalDue],
COUNT(poh.EmployeeID) [NumberOfEmployees],
COUNT(DISTINCT(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM Purchasing.PurchaseOrderHeader poh
INNER JOIN Purchasing.ShipMethod sm

ON(poh.ShipMethodID = sm.ShipMethodID)

GROUP BY sm.Name, YEAR(poh.OrderDate)
HAVING SUM(poh.TotalDue) > 5000000;

--------------------------------------------------