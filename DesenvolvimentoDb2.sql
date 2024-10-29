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

CREATE TRIGGER validar_matricula_duplicada
BEFORE INSERT ON Matriculas
FOR EACH ROW
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM Matriculas
    WHERE aluno_id = NEW.aluno_id AND curso_id = NEW.curso_id;

    IF total > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Este aluno já está matriculado neste curso.';
    END IF;
END 

CREATE TABLE Vendas (
    venda_id INT PRIMARY KEY,
    produto_id INT,
    data_venda DATE,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

CREATE PROCEDURE relatorio_diario_vendas (IN data_consulta DATE)
BEGIN
    SELECT 
        produto_id,
        SUM(quantidade) AS total_vendido
    FROM 
        Vendas
    WHERE 
        data_venda = data_consulta
    GROUP BY 
        produto_id;
END //

CALL relatorio_diario_vendas('2024-10-01');

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro DATE
);
CREATE FUNCTION total_clientes_cadastrados_dia (data_consulta DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    -- Conta o número de clientes cadastrados na data informada
    SELECT COUNT(*) INTO total
    FROM Clientes
    WHERE data_cadastro = data_consulta;

    RETURN total;
END 


SELECT total_clientes_cadastrados_dia('2024-10-15') AS total_clientes;



