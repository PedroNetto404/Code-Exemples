USE EXERCICIO_12;

CREATE OR ALTER FUNCTION ShowFunc()
RETURNS TABLE  AS
    RETURN
        SELECT
            id_funcao,
            CAST(salario as NUMERIC(7,2)) [Salario]
            FROM tb_empregado
        WHERE
            salario > 9550.34


SELECT * FROM  ShowFunc()