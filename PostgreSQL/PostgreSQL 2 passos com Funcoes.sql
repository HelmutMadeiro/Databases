-- Funcoes 

https://www.postgresql.org/docs/current/functions.html

-- Concatenar strings simples 
select primeiro_nome||' '|| ultimo_nome from aluno

-- Concatenar strings mantendo os nullos

select concat(primeiro_nome,' ',ultimo_nome) from aluno

-- upper
select upper(concat(primeiro_nome,' ',ultimo_nome)) from aluno

-- date 

select 
upper(concat(primeiro_nome,' ',ultimo_nome)) as NomeCompleto
,now()::date -- converter para dia 
,(now()::date - data_nascimento)/ 365 as PossivelIdade 
,age(data_nascimento) -- funcao que tras idade real do aluno
,extract(year from age(data_nascimento) )-- funcao que tras a extração apenas do ano da idade real do aluno

from aluno

-- converter alguns tipos de dados 

select now() as dataagora
, to_char(now(),'DD/MM/YYYY') 		as DiaMesAno
, to_char(now(),'DD / MONTH/YYYY')	as DiaMesExtAno
, to_char(now(),'DD / MON/YYYY')	as DiaMesAbrvAno 
, to_char(128.3::real,'999D99')
;

-- colocando zeros para esquerda ou direita 
select  '1223' || repeat('0',char_length (repeat('0',10)) - char_length ('1223')) as ZeroEsquerda, 
		repeat('0',char_length (repeat('0',10)) - char_length ('1223'))||'1223'   as ZeroDireita













