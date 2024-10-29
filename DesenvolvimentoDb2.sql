CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE
);

CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    descricao TEXT
);

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2023-01-15'),
(1, 2, '2023-01-16'),
(2, 3, '2023-01-17'),
(3, 1, '2023-01-18');

INSERT INTO Cursos (nome_curso, descricao) VALUES
('Matemática', 'Curso de Matemática Avançada'),
('História', 'Curso de História Contemporânea'),
('Biologia', 'Curso de Biologia Geral');

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2023-01-15'),
(1, 2, '2023-01-16'),
(2, 3, '2023-01-17'),
(3, 1, '2023-01-18');

SELECT Alunos.nome AS Nome_Aluno, Cursos.nome_curso AS Curso
FROM Matriculas
INNER JOIN Alunos ON Matriculas.aluno_id = Alunos.aluno_id
INNER JOIN Cursos ON Matriculas.curso_id = Cursos.curso_id;

SELECT Alunos.nome AS Nome_Aluno, Cursos.nome_curso AS Curso
FROM Alunos
LEFT JOIN Matriculas ON Alunos.aluno_id = Matriculas.aluno_id
LEFT JOIN Cursos ON Matriculas.curso_id = Cursos.curso_id;

SELECT Cursos.nome_curso AS Curso
FROM Cursos
LEFT JOIN Matriculas ON Cursos.curso_id = Matriculas.curso_id
WHERE Matriculas.curso_id IS NULL;
