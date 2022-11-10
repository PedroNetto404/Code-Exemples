BEGIN
    DECLARE @StartingHireDate DATETIME = '12/31/2001'
    
    SELECT
         e.BusinessEntityID, 
         p.FirstName, 
         p.LastName,
         e.HireDate
    FROM 
        HumanResources.Employee e
        INNER JOIN 
            Person.Person p
        ON
             (e.BusinessEntityID = p.BusinessEntityID)
    WHERE HireDate <= @StartingHireDate
END

-- IF

IF (DATENAME(M, GETDATE()) = 'December') BEGIN
    SELECT 'Chegando o Natal!!!' Results
END
ELSE BEGIN
    SELECT 'Não, ainda não é dezembro :(' Results
END

-- WHILE

DECLARE @count INT = 0

WHILE (@count < 10) BEGIN

    SET @count = @count + 1;
    
    IF (@count < 5) BEGIN
        SELECT @count AS Counter
        CONTINUE;
    END
    ELSE
        BREAK;
END