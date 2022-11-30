USE EXERCICIO_12USE

SELECT * FROM tb_empregado;

    SELECT
        id_empregado,
        CAST(percentual_comissao * salario AS VARCHAR(30)) AS Comissao
    FROM tb_empregado WHERE percentual_comissao IS NOT NULL
UNION ALL
    SELECT
        id_empregado,
        'Nenhuma comissão'
    FROM tb_empregado WHERE percentual_comissao IS NULL
