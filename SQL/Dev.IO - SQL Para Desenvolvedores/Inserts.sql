INSERT INTO Alunos (Nome, CPF, Cidade, Estado, Data_Nascimento) VALUES 
('Rafael', '00000000001', 'Aracaju', 'SE', '2000-01-01'),
('Eduardo', '00000000002', 'São Paulo', 'SP', '2000-02-02'), 
('Bruno', '00000000003', 'São Paulo', 'SP', '2000-03-03'),
('Thiago', '00000000004', 'Rio de Janeiro', 'RJ', '2000-04-04'), 
('Heloysa', '00000000005', 'Aracaju', 'SE' , '2000-05-05')

INSERT INTO Categorias (Descricao) VALUES
('Acesso a dados'), ('Segurança'), ('Web')

INSERT INTO Cursos (Descricao, Categoria_id, Total_horas, Valor) VALUES
('EF Core', 1, 17, 300), 
('SQL Server', 1, 5, 200), 
('ASP.NET Core Enterprise', 3, 5, 200), 
('Fundamentos de IdentityServer4', 2, 5, 200); 

INSERT INTO Alunos_cursos (Aluno_Id, Curso_id) VALUES
(1,1), (1,2), (2,3), (3,1), (4,4), (5, 1), (5, 2), (5, 3)

