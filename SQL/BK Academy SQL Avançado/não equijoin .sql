SELECT 
	e.nm_empregado AS NOME, 
	e.iniciais_empregado AS INICIAIS,
	e.salario * 12 AS SALARIO
FROM 
	tb_empregados e
	INNER JOIN
		tb_grades_salarios g
	ON
		(e.salario BETWEEN g.limite_inferior AND g.limite_superior)