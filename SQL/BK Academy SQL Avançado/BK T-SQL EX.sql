-- 1

SELECT
	e.nm_empregado + ', ' + e.iniciais_empregado
FROM
	tb_empregados e

-- 2

SELECT
	e.nm_empregado AS Nome, 
	CONCAT
	(
		DATEPART(DD, e.dt_nascimento),' de ',
		DATENAME(MM, e.dt_nascimento), ' de ', 
		DATEPART(YYYY, e.dt_nascimento)
	) AS "Data por extenso"
FROM	
	tb_empregados e

-- 3

SELECT DATEADD(DAY, 10000,'29-08-2000')

-- 4

SELECT DATENAME(WEEKDAY, (DATEADD(DAY, 10000,'29-08-2000')))

-- 5

SELECT
	c.ds_curso, 
	co.dt_inicio, 
	c.duracao, 
	e.nm_empregado
FROM
	tb_cursos c
	INNER JOIN
		tb_cursos_oferecidos co
	ON 
		c.id_curso = co.id_curso
	INNER JOIN
		tb_empregados e
	ON
		e.id_empregado = co.id_instrutor

-- 6

SELECT
	c.ds_curso, 
	co.dt_inicio, 
	c.duracao, 
	COALESCE(e.nm_empregado, 'Instrutor desconhecido')
FROM
	tb_cursos c
	INNER JOIN
		tb_cursos_oferecidos co
	ON 
		c.id_curso = co.id_curso
	LEFT JOIN
		tb_empregados e
	ON
		e.id_empregado = co.id_instrutor

---- 6 : Exemplo sem junção externa

-- 7

SELECT 
	e.nm_empregado AS "Participante", 
	inst.nm_empregado AS "Instrutor"
FROM
	tb_cursos_oferecidos co
	INNER JOIN 
		tb_matriculas m
	ON 
		(co.id_curso = m.id_curso AND co.dt_inicio = m.dt_inicio)
	INNER JOIN 
		tb_empregados e
	ON 
		e.id_empregado = m.id_participante 
	INNER JOIN
		tb_empregados inst
	ON
		inst.id_empregado = co.id_instrutor
WHERE
	co.id_curso = 'SQL'

-- 8

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

-- 9

SELECT 
	co.id_curso AS "COD CURSO", 
	co.dt_inicio AS "DATA INICIO", 
	COUNT(m.id_curso) AS "ALUNOS MATRICULADOS"
FROM
	tb_cursos_oferecidos co
	LEFT JOIN
		tb_matriculas m
	ON 
		m.id_curso = co.id_curso
GROUP BY
	co.id_curso, 
	co.dt_inicio

-- Resolução

SELECT 
	m.id_curso, m.dt_inicio, 
	COUNT(m.id_participante) AS Nr_matriculas
FROM
	tb_cursos_oferecidos co
	INNER JOIN 
		tb_matriculas m
	ON
		co.id_curso = m.id_curso AND co.dt_inicio = m.dt_inicio
GROUP BY 
	m.id_curso, m.dt_inicio
ORDER BY 
	Nr_matriculas ASC

-- 10

SELECT
	co.id_curso,
	co.dt_inicio, 
	COUNT(m.id_curso) AS nrParticipantes
FROM 
	tb_cursos_oferecidos co
	INNER JOIN 
		tb_matriculas m
	ON 
		(co.id_curso = m.id_curso AND co.dt_inicio = m.dt_inicio)
WHERE
	DATEPART(YYYY, co.dt_inicio) = 1999
GROUP BY 
	co.id_curso, co.dt_inicio
HAVING COUNT(m.id_curso) >= 3


-- 11

-- id dos instrutores

SELECT
	inst.id_empregado
FROM 
	tb_empregados inst
	INNER JOIN 
		tb_cursos_oferecidos co
	ON 
		inst.id_empregado = co.id_instrutor

-- id dos participantes
SELECT
	emp.id_empregado
FROM 
	tb_empregados emp
	INNER JOIN 
		tb_matriculas m
	ON 
		m.id_participante = emp.id_empregado

SELECT 
	distinct inst.id_empregado
FROM
	(
		SELECT
			inst.id_empregado
		FROM 
			tb_empregados inst
		INNER JOIN 
			tb_cursos_oferecidos co
		ON 
			inst.id_empregado = co.id_instrutor
	) AS inst
WHERE
	inst.id_empregado NOT IN 
	(
		SELECT
			emp.id_empregado
		FROM 
			tb_empregados emp
			INNER JOIN 
				tb_matriculas m
		ON 
			m.id_participante = emp.id_empregado
	)

-- Exemplo de resolução

SELECT
	id_instrutor
FROM 
	tb_cursos_oferecidos
WHERE
	id_instrutor IS NOT NULL
EXCEPT
	SELECT
		id_participante
	FROM
		tb_matriculas

-- 12

SELECT 
	id_participante, id_curso
FROM 
	tb_matriculas
GROUP BY 
	id_participante, id_curso
HAVING
	COUNT(id_participante) > 1

-- 13

SELECT
	e.iniciais_empregado, 
	e.nm_empregado, 
	COUNT(DISTINCT(m.dt_inicio)) AS "Cursos", 
	COUNT(*) AS "Participantes", 
	ROUND(AVG(avaliacao), 1) AS "Avaliação"
FROM
(
	tb_matriculas m 
	INNER JOIN 
		tb_cursos_oferecidos co
	ON	
		co.id_curso = m.id_curso AND co.dt_inicio = m.dt_inicio
	INNER JOIN 
		tb_empregados e
	ON 
		e.id_empregado = co.id_instrutor
)
GROUP BY
	e.iniciais_empregado, e.nm_empregado

-- 14
SELECT DISTINCT
	e.nm_empregado, 
	e.iniciais_empregado
FROM	
	tb_cursos_oferecidos co
	INNER JOIN tb_matriculas m ON co.dt_inicio = m.dt_inicio AND co.id_curso = m.id_curso
	INNER JOIN tb_cursos c ON c.id_curso = co.id_curso
	INNER JOIN tb_empregados e ON e.id_empregado = co.id_instrutor AND e.id_gerente = m.id_participante
WHERE
	c.categoria = 'GEN'

-- 15

SELECT
FROM 
	tb_cursos_oferecidos co
	INNER JOIN tb_cursos c  ON c.id_curso = co.id_curso
