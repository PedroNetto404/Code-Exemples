-- Forma de agruparmos registros em nossas consultas

SELECT Cidade, Estado, COUNT(*) -- O Count dessa forma irá contar quantas vezes agrupamos as tuplas
FROM Alunos
GROUP BY
    Cidade, Estado
