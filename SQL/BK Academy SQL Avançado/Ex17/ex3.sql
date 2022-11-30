USE EXERCICIO_12;

SELECT * FROM tb_departamento;

CREATE OR ALTER FUNCTION CopyDataDptoToNewTable()
RETURNS @tb_dpto_new TABLE (Id INT, Id_loc INT, nm_dpto VARCHAR(100))
AS
BEGIN
    INSERT INTO @tb_dpto_new (Id, Id_loc, nm_dpto)
        SELECT * FROM tb_departamento;

    RETURN;
END

SELECT * FROM CopyDataDptoToNewTable();
