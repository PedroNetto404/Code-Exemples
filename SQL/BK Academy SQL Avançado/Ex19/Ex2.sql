USE EXERCICIO_12;

SELECT * FROM tb_empregado

SELECT
    e.nome [Empregado],
    e.data_admissao [Empregado Data Admissão],
    g.nome [Gerente],
    g.data_admissao [Gerente Data Admissão]
FROM tb_empregado e
INNER JOIN tb_empregado g
ON e.id_gerente = g.id_empregado
WHERE e.data_admissao < g.data_admissao