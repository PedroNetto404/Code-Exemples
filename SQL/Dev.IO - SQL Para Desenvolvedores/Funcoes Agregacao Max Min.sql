SELECT 
    MAX(Id)
FROM 
    Alunos; 

SELECT 
    MIN(Id)
FROM 
    Alunos; 

SELECT * FROM Alunos WHERE iD = (SELECT MAX(Id) FROM Alunos)