USE EXERCICIO_12;

CREATE OR ALTER FUNCTION fn_exibirInfoDepartamento(@DptoId INTEGER)
RETURNS VARCHAR(100) 
AS 
BEGIN
    DECLARE @Mensagem VARCHAR(100)

    IF EXISTS (SELECT * FROM tb_departamento WHERE id_departamento = @DptoId) 
        SELECT @Mensagem = CONCAT('Id: ' ,id_departamento, '; Id_Localizacao: ', id_localizacao,'; Nome_depto: ', nm_departamento)
        FROM tb_departamento
        WHERE id_departamento = @DptoID
    ELSE
        SET @Mensagem = 'Departamento não encontrado';

    RETURN @Mensagem
END

SELECT  dbo.fn_exibirInfoDepartamento(1)

SELECT * FROM tb_departamento