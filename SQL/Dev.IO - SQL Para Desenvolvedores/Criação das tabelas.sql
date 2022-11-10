CREATE DATABASE CursoDevIO;

USE CursoDevIO; 

CREATE TABLE Alunos
(
    Id INT PRIMARY KEY IDENTITY, 
    Nome VARCHAR(80) NOT NULL, 
    CPF CHAR(11) NOT NULL, 
    Cidade VARCHAR(60) NOT NULL, 
    Estado  CHAR(2) NOT NULL, 
    Data_Nascimento DATE,
    Ativo BIT DEFAULT 1
); 

CREATE TABLE Categorias
(
    Id INT PRIMARY KEY IDENTITY, 
    Descricao VARCHAR(80) NOT NULL, 
    Cadastrado_em DATETIME DEFAULT GETDATE()
); 

CREATE TABLE Cursos
(
    Id INT PRIMARY KEY IDENTITY, 
    Categoria_id INT NOT NULL, 
    Descricao VARCHAR(80) NOT NULL, 
    Total_horas INT NOT NULL, 
    Valor DECIMAL(12,2) NOT NULL DEFAULT 0,
    Cadastrado_em DATETIME DEFAULT GETDATE(), 
    Ativo BIT DEFAULT 1, 
    CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES Categorias(Id) 
); 

CREATE TABLE Alunos_cursos
(
    Aluno_Id    INT NOT NULL, 
    Curso_id    INT NOT NULL, 
    Cadastro_em DATETIME DEFAULT GETDATE(), 

    CONSTRAINT pk_alunos_cursos PRIMARY KEY(Aluno_id, Curso_Id), 
    CONSTRAINT fk_Aluno_Id FOREIGN KEY (Aluno_Id) REFERENCES Alunos(Id), 
    CONSTRAINT fk_Curso_Id FOREIGN KEY (Curso_Id) REFERENCES Cursos(Id)
);