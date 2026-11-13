SELECT a.nome, c.nome_curso
FROM alunos a
INNER JOIN cursos c ON c.id = a.curso_id
ORDER BY a.id;

SELECT a.nome, c.nome_curso
FROM alunos a
INNER JOIN cursos c ON c.id = a.curso_id
WHERE c.nome_curso = 'Desenvolvimento Web'
ORDER BY a.id;

UPDATE alunos
SET curso_id = (SELECT id FROM cursos WHERE nome_curso = 'Ciência de Dados')
WHERE nome = 'Maria Souza';

SELECT c.nome_curso
FROM cursos c
LEFT JOIN alunos a ON a.curso_id = c.id
WHERE a.id IS NULL;