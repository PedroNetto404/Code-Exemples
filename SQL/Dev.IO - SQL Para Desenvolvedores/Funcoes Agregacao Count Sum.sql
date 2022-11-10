-- Contar registros em uma tabela com base em uma expressão passada na query
SELECT COUNT(*) FROM Cursos -- Conta quantos registros a tabela cursos possui

SELECT COUNT(*), SUM(Total_horas), SUM(Valor) FROM Cursos; 