SELECT TOP(10)
    SalesOrderNumber,
    totalDue,
    CAST(TotalDue AS DECIMAL(10,2)) AS TotalDueCast,
    OrderDate,
    CAST(OrderDate AS DATE) AS OrderDateCast
FROM Sales.SalesOrderHeader;

SELECT
    CONVERT(VARCHAR(20), GETDATE()) AS [Default],
    CONVERT(VARCHAR(20), GETDATE(), 100) AS DefaultWithStyle,
    CONVERT(VARCHAR(10), GETDATE(), 103) AS BritishFrenchStyle,
    CONVERT(VARCHAR(8), GETDATE(), 105) AS ItalianStyle,
    CONVERT(VARCHAR(8), GETDATE(), 112) AS ISOStyle,
    CONVERT(VARCHAR(15), CAST('111111.22' AS MONEY), 1) AS MoneyWithCommas

SELECT
    TRY_CAST('José da Silva' AS INT) TryCast,
    TRY_CONVERT(DATETIME, '13/2/2999', 112) AS TryConvert,
    PARSE('Saturday, 26 May 2012' AS DATETIME USING 'en-US') AS Parse,
    TRY_PARSE('José da Silva BirthDay' AS DATETIME USING 'en-US') AS TryParse

SELECT
    'LEBLANC ' + ', ' + ' PATRICK' RawValues,
    RTRIM('LEBLANC ') + ', ' + LTRIM(' PATRICK') TrimValue,
    LEFT('PatrickDTomorr', 7) [Left],
    RIGHT('DTomorrLeBlanc', 7) [Right],
    SUBSTRING('DTomorrPatrick', 8, LEN('DTomorrPatrick')) [SubString],
    '12/' + CAST(1 AS VARCHAR) + '/2012' WithoutConcat,
    CONCAT('12/', 1, '/2012') WithConcat