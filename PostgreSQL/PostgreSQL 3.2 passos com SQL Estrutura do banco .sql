-- Database: alura
-- https://www.postgresql.org/docs/12/sql-altertable.html
-- DROP DATABASE alura;

CREATE DATABASE alura -- nome do banco 
    WITH 
    OWNER = postgres -- quem é o dono do banco 
    ENCODING = 'UTF8' -- tipo do ecoding que está o bando
    LC_COLLATE = 'Portuguese_Brazil.1252' -- aonde esta alocado 
    LC_CTYPE = 'Portuguese_Brazil.1252' -- top daonde esta alocado 
    TABLESPACE = pg_default -- em qual tablespace esta esse banco de dados 
    CONNECTION LIMIT = -1;  -- total de conecções que o banco permite ter ao mesmo tempo ( - 1 não tem limite)
	
-- Table: academico.aluno

-- DROP TABLE academico.aluno;

-- if not exists só vai deixar criar se nao existir a table
--  NOT NUL nao pode ter valores nulos 
-- data_nascimento date NOT NULL default now():date , caso nao tenha valor ao inseir uma linha, por padrão será inserido a data atual.
-- primeiro_nome character varying(255) COLLATE pg_catalog."default" NOT NULL check (primeiro_nome <> ''), check verifica em tempo de insert que nao tenha apenas ''  no nome


CREATE TABLE if not exists academico.aluno
(
    id integer NOT NULL DEFAULT nextval('academico.aluno_id_seq'::regclass),
    primeiro_nome character varying(255) COLLATE pg_catalog."default" NOT NULL check (primeiro_nome <> ''),
    ultimo_nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento date NOT NULL default now():date ,
    CONSTRAINT aluno_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE academico.aluno
    OWNER to postgres;
	
	
-- criando uma table temporaria para testar os check e defoult	


create temporary table teste (
coluna varchar(255) not null check (coluna <>'') );

insert into teste values (''); -- ERROR:  new row for relation "teste" violates check constraint "teste_coluna_check"

create temporary table testeC (
colunaA varchar(255) not null check (colunaA <>'') ,
colunaB varchar(255) not null check (colunaB <>''),
unique(colunaA,colunaB) -- age como se fosse uma chave composta
);

insert into testeC values ('a','b');
insert into testeC values ('a','b'); -- ERROR:  duplicate key value violates unique constraint "testec_colunaa_colunab_key"
insert into testeC values ('a','c')


select * from  testeC
-- alterando a tabela

alter table testeC rename to testeA

select * from  testeA

alter table testeA rename colunaA to colunaAA;
alter table testeA rename colunaB to colunaBB;

select * from  testeA


--Vimos a diferença entre comandos DDL e DML.

		  	CREATE
		  	ALTER
	  		DROP
		DDL  -- serve para  
SQL   

	  	DML -- serve para manipular informações 
			insert
	  		update
			delete 
			select 
