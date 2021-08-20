select * from curso;



-- Database: alura

-- DROP DATABASE alura;

-- criar um banco de dados 
CREATE DATABASE alura
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- criar uma table	 
create table aluno (
					id 				serial,
					Nome 			varchar(255),
					Cpf 			char(11),
					Observacao 		text,
					Idade 			integer,
					Dinheiro 		numeric(10,2),
					Altura 			real,
					Ativo 			boolean,
					Data_Nascimento date,
					Hora_Aula 		time,
					Matriculado_em 	timestamp
					);

-- select simples
select * from aluno;

-- insert dos dados na tabela Aluno
insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Helmut Madeiro','22222222222','estou aprendendo a usar esse banco de dados',35,100.00,1.93,true,'1989-09-10','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Debora Krelling','00000000000','esposa de quem está aprendendo a usar esse banco de dados',31,100.00,1.69,true,'1992-01-22','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Murilo Franca','33333333333','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');


insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Renan Sonoda','4444444444','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Cassio','55555555555','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Leo','66666666666','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Diogo','66666666666','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');

insert into Aluno (nome,Cpf,Observacao,Idade,Dinheiro,Altura,Ativo,Data_Nascimento,Hora_Aula,Matriculado_em) 
values ('Diego','66666666666','Amigo de quem está aprendendo a usar esse banco de dados',25,100.00,1.87,true,'1998-11-22','20:00:00','1985-09-10 18:53:00');

-- criando um filtro simples 
select * from aluno where id = 2;

-- vendo como faz o update, trocaremos o cpf da mesma 0000000000 por 9999999999 

update aluno set cpf ='999999999' where id = 2

-- vamos ver como funciona o delete , vamos deletar o murilo da base de dados 

select * from aluno;

delete from aluno where Nome = 'Murilo Franca'

-- alguns fltros de dados usando o select 

select * 
from aluno
where nome ='Cassio' ;

select * 
from aluno
where nome <>'Cassio' ;

select * 
from aluno
where nome like '_iego' ;

select * 
from aluno
where nome not like '_iego' ;

select * 
from aluno
where nome like 'Di_go' ;


select * 
from aluno
where nome like '%i%a%' ;


select * 
from aluno
where idade >3 ;

select * 
from aluno
where idade between 10 and 30  ;

select * 
from aluno
where  ativo != false ;


select * 
from aluno
where nome like '%i%a%' 
and nome like '%M%';

select * 
from aluno
where nome like '%i%a%' 
or nome like '%H%';


-- criando tabelas com chaves primárias 

drop table Curso;

-- table curso e colocando o campo id como chave primaria 
create table Curso(
id integer primary key,		 -- não pode ser null e o valor não se repete
nome varchar (255)not null 	 -- não pode ser null 
);

-- insert dos cursos na tabela curso 
insert into curso (id,nome) values (1,'HTML');
insert into curso (id,nome) values (2,'Javascript');

select * from Curso;

-- criando uma tabela aluno com o campo id como chave primaria e com autocremento 

drop table Aluno;

create table Aluno(
id serial primary key,
nome varchar (255) not null
);

-- inserindo valores na tabela Aluno
insert into Aluno (nome) values ('Helmut');
insert into Aluno (nome) values ('Debora');

-- drop table aluno_curso
drop table aluno_curso;

-- criar table aluno_curso usando o forening key : evitando inconsitencia de banco de dados 

create table aluno_curso (
							aluno_id integer,
							curso_id integer,
							primary key (aluno_id,curso_id),
							foreign key (aluno_id)
								references Aluno (id),
							foreign key (curso_id)
								references curso (id)
	
); 

--inserindo valores na tabela  aluno_curso
insert into aluno_curso (aluno_id,curso_id) values (1,1);
insert into aluno_curso (aluno_id,curso_id) values (2,1);
insert into aluno_curso (aluno_id,curso_id) values (2,2);


-- consultas relacionadas 

-- 1. inner join ou join 

	select a.nome as NomeAluno, c.nome as NomeCurso 
	from aluno 		 a
	join aluno_curso ac on a.id = ac.aluno_id
	join curso 		 c 	on c.id = ac.curso_id;
	
-- 2. left join 

-- inserindo valores na tabela Aluno

insert into Aluno (nome) values ('Murillo');

-- inserindo valores na tabela curso

insert into curso (id,nome) values (3,'CSS');

	select a.nome as NomeAluno, c.nome as NomeCurso 
	from aluno 		      a
	left join aluno_curso ac on a.id = ac.aluno_id
	left join curso 	  c  on c.id = ac.curso_id;

-- 3. right join 

	select a.nome as NomeAluno, c.nome as NomeCurso 
	from aluno 		      a
	right join aluno_curso ac on a.id = ac.aluno_id
	right join curso 	  c  on c.id = ac.curso_id;
	
-- 4. Full join 

	select a.nome as NomeAluno, c.nome as NomeCurso 
	from aluno 		      a
	full join aluno_curso ac on a.id = ac.aluno_id
	full join curso 	  c  on c.id = ac.curso_id;	
	
-- 4. cross join 

	select a.nome as NomeAluno, c.nome as NomeCurso 
	from aluno 		      a
	cross join curso 	  c
	
-- delete cascade 

	delete from aluno where id =1 --violates foreign key constraint
	

create table aluno_curso (
							aluno_id integer,
							curso_id integer,
							primary key (aluno_id,curso_id),
	
							foreign key (aluno_id)
							references Aluno (id)
							ON DELETE RESTRICT -- Por padrão temos o RESTRICT
							
	
	,
							foreign key (curso_id)
							references curso (id)
	
); 	

drop table aluno_curso;
create table aluno_curso (
							aluno_id integer,
							curso_id integer,
							primary key (aluno_id,curso_id),
	
							foreign key (aluno_id)
							references Aluno (id)
							ON delete cascade   -- o cascate permite que o id na tabela filho que foi deletado na tabela pai seja deletado tbm 							
							on update cascade   -- o cascate permite que o id na tabela filho que foi deletado na tabela pai seja deletado tbm 
	
	,
							foreign key (curso_id)
							references curso (id)
	
); 	


--inserindo valores na tabela  aluno_curso
insert into aluno_curso (aluno_id,curso_id) values (4,1);
insert into aluno_curso (aluno_id,curso_id) values (2,1);
insert into aluno_curso (aluno_id,curso_id) values (2,2);
insert into aluno_curso (aluno_id,curso_id) values (3,1);
insert into aluno_curso (aluno_id,curso_id) values (4,3);

SELECT * FROM aluno_curso


	select 
			a.id 	as id_aluno, 
			a.nome 	as NomeAluno,
			c.id 	as curso_id, 
			c.nome 	as NomeCurso 
	from aluno 		 a
	join aluno_curso ac on a.id = ac.aluno_id
	join curso 		 c 	on c.id = ac.curso_id
	--where a.id = 1;

delete from aluno where id = 1;


select * from aluno;
select * from curso;
select * from aluno_curso;

-- update cascate

update aluno set id = 10 where id = 3


-- criar tables funcionarios
create table  funcionarios (
id serial primary key,
matricula varchar (10),
nome varchar(255),
sobrenome varchar(255)
);

-- insert na tabela funcionario
insert into funcionarios (matricula,nome,sobrenome)values ('M001','Diogo','Mascarenhas');
insert into funcionarios (matricula,nome,sobrenome)values ('M002','Vinicius','Dias');
insert into funcionarios (matricula,nome,sobrenome)values ('M003','Nico','Steppat');
insert into funcionarios (matricula,nome,sobrenome)values ('M004','Joao','Roberto');
insert into funcionarios (matricula,nome,sobrenome)values ('M005','Diogo','Mascarenhas');
insert into funcionarios (matricula,nome,sobrenome)values ('M006','Alberto','Martins');

-- Ordenaçao 
select * 
from funcionarios
order by nome,matricula desc

-- limitando as colunas (limit 5) e paginação (offset 3)

select * 
from funcionarios order by id 
limit 5
offset 3;

-- Funções e Agregação 

select count(*),sum(id),max(id),min(id),round(avg(id),0) 
from funcionarios

select distinct nome
from funcionarios
order by nome
-- agrupando consultas 

select nome, count(*)
from funcionarios
group by nome order by nome

--filtros em consultas agrupandas

select c.nome, count(*)
from curso c 
left join aluno_curso ac on c.id = ac.curso_id
left join aluno a on ac.aluno_id = a.id
group by c.nome

having count(a.id) > 0

select nome, count(*) 
from funcionarios 
group by nome 
having count(nome)>1 
	