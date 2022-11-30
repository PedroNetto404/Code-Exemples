USE EXERCICIO_12;

SELECT * FROM tb_empregado;

SELECT
    CAST(MAX(salario) AS INT) AS Máximo,
    CAST(MIN(salario) AS INT) AS Mínimo,
    CAST(AVG(salario) AS INT) AS Média,
    CAST(SUM(salario) AS INT) AS Somatório
FROM tb_empregado;