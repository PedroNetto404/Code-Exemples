CREATE OR ALTER FUNCTION fn_exercicio_01()
RETURNS @tb_mensagens TABLE (resultado INT)
AS
BEGIN
    DECLARE @i INT = 1

    WHILE (@i <= 10)
    BEGIN
        IF(@i <> 6 AND @i <> 8)
        BEGIN
            INSERT INTO @tb_mensagens VALUES (@i)
        END
        SET @i = @i + 1
    END

    RETURN
END

SELECT * FROM fn_exercicio_01()