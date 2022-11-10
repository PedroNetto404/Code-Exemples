-- Filtro aplicado a um agrupamento
SELECT Cidade, Estado, COUNT(*) Total
FROM 
    Alunos
GROUP BY
    Cidade, Estado
HAVING COUNT(*) > 1