CREATE TABLE cursos (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_curso TEXT NOT NULL
);

CREATE TABLE alunos (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT,
    curso_id INTEGER REFERENCES cursos(id)
);

INSERT INTO cursos (nome_curso) VALUES
    ('Desenvolvimento Web'),
    ('Ciência de Dados'),
    ('Engenharia de Software');

INSERT INTO alunos (nome, email, curso_id) VALUES
    ('João Silva', 'joao@email.com', 1),
    ('Maria Souza', 'maria@email.com', 1),
    ('Carlos Lima', 'carlos@email.com', 2),
    ('Ana Costa', 'ana@email.com', 2);


SELECT * FROM alunos;

-- INSERT INTO alunos (nome, email, curso_id) VALUES ('Teste', 'teste@email.com', 99);





