-- Exenplo de TOP
SELECT TOP 50 PERCENT
     *
FROM 
    Alunos
ORDER BY
    Id;

-- Paginação
SELECT *
FROM 
    Alunos
ORDER BY
    Id
OFFSET 2 ROWS -- Pula duas linhas e pega o restante
FETCH FIRST 2 ROWS ONLY -- Pula duas linhas e pega os dois primeiros registros