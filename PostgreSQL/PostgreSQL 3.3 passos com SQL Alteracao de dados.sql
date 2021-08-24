


create  table teste.curso_programacao (
id_curso integer PRIMARY key,
nome_curso varchar (255) not null  
);

insert into teste.curso_programacao
select  c.id
,c.nome
from academico.curso c
inner join academico.categoria ca ON ca.id = c.categoria_id
where ca.id = 2

select * from teste.curso_programacao 
create schema teste;

insert into teste.curso_programacao values (10,	'PHP Avançado'),

(20,	'Java Avançado'),
(30,'c++ Avançado'),
(40,	'C#'),
(50,	'C'),
(60,	'Cobol');


select * from teste.curso_programacao

update academico.curso set nome = 'C++ Basico' where id = 6

update teste.curso_programacao set nome_curso = nome
from academico.curso where teste.curso_programacao.id_curso = academico.curso.id;



select * from teste.curso_programacao

DELETE FROM curso
      USING categoria
      WHERE categoria.id = curso.categoria_id
        AND categoria.nome = 'Teste';

-- https://www.postgresql.org/docs/current/tutorial-transactions.html
-- Porque um dos conceitos do SQL, um dos conceitos de bancos de dados relacionais é de atomicidade. 
-- O que isso quer dizer? Que cada comando que eu executar é um átomo,
-- ele é indivisível, ou seja, ou eu executo como um todo ou não executo.

start transaction  -- ou 
begin; -- inicia uma transacaa

delete from teste.curso_programacao
select * from teste.curso_programacao

rollback -- desfaz o que vc fez 

commit -- confirma o que vc fez


