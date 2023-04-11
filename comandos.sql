--Banco Inicial -- aula 1

CREATE DATABASE alura2;

DROP TABLE aluno, curso, categoria, aluno_curso;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Augusto','Mendes','1996-06-29');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('João','Silva','1990-02-02');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('José','Godofredo','1980-01-04');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Rafael','Reis','2000-12-01');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Gabriel','Santos','1993-10-25');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Julio','César','1978-09-05');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Daniel','Lima','1982-04-20');

--Categoria
INSERT INTO categoria (nome) values ('SQL');
INSERT INTO categoria (nome) values ('AGILE');

--Curso
INSERT INTO curso (nome, categoria_id) values ('Oracle', '1');
INSERT INTO curso (nome, categoria_id) values ('PostgreSQL', '1');
INSERT INTO curso (nome, categoria_id) values ('Times Ágeis', '2');
INSERT INTO curso (nome, categoria_id) values ('Scrum', '2');

--Aluno_Curso
INSERT INTO aluno_curso (aluno_id, curso_id) values (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) values (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) values (3,2);
INSERT INTO aluno_curso (aluno_id, curso_id) values (4,3);
INSERT INTO aluno_curso (aluno_id, curso_id) values (5,3);
INSERT INTO aluno_curso (aluno_id, curso_id) values (6,4);
INSERT INTO aluno_curso (aluno_id, curso_id) values (7,4);

-- aula 2

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
    'Vinicius', 'Dias', '1997-10-15'
), (
    'Patrícia', 'Freitas', '1996-10-25'
), (
    'Diogo', 'Oliveira', '1994-08-27'
), (
    'Maria', 'Rosa', '1985-01-01'
);


INSERT INTO categoria (nome) VALUES ('Front-End'), ('Programação'), ('Banco de dados'), ('Data Science');


INSERT INTO curso (nome, categoria_id) VALUES
    ('HTML',1),
    ('CSS',1),
    ('JS',1),
    ('PHP',2),
    ('Java',2),
    ('C++',2),
    ('PostgreSQL',3),
    ('MySQL',3),
    ('Oracle',3),
    ('SQL Server',3),
    ('SQLite',3),
    ('Pandas',4),
    ('Machine Learning',4),
    ('Power BI',4);


INSERT INTO aluno_curso VALUES (1,4), (1,11), (2,1), (2,2), (3,4), (3,3),(4,4), (4,6),(4,5);

select * from categoria;
update categoria set nome = 'Ciência de Dados' where id = 4;

select aluno.primeiro_nome,
	   aluno.ultimo_nome,
	   count (aluno_curso.curso_id) numero_cursos
	from aluno
	join aluno_curso on aluno_curso.aluno_id = aluno.id
group by 1,2
order by numero_cursos desc
	limit 1;


select curso.nome,
	   count (aluno_curso.aluno_id) numero_alunos
	from curso
	join aluno_curso on aluno_curso.curso_id = curso.id
group by 1
order by numero_alunos desc
limit 1;







