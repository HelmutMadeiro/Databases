
create function primeiro_funcao() returns integer as ' 
select (5-3)*2
' language sql;

select primeiro_funcao();


-- passando ou recebendo um parametro campo nomeado

create function  soma_dois_numeros (numero_1 integer, numero_2 integer) returns integer  as '
select numero_1+ numero_2;
' language sql;

select soma_dois_numeros (2,5)

-- passando ou recebendo um parametro sem nome de campo
-- $ + 1 é a posição na hora de declarar 

create function  soma_dois_numerossn (integer, integer) returns integer  as '
select $1+ $2;
' language sql;


select soma_dois_numerossn (2,4);


create table teste (nome varchar(255)not null);

create or replace function criateste(nome varchar) returns varchar as '
insert into teste (nome) values (criateste.nome);
select nome;'
language sql;

select criateste('Helmut');
select criateste('Debora');
select criateste('Giovana');
select criateste('Luana');

select  * from teste

-- sem retorno
create or replace function criateste2(nome varchar) returns void as '
insert into teste (nome) values (criateste2.nome);'
language sql;

select criateste2('Debora');
select criateste2('Giovana');
select criateste2('Luana');

select  * from teste

-- substituindo aspas pelo dolar
create or replace function criateste3(nome varchar) returns void as 
$$
insert into teste (nome) values ('Cassio');
$$
language sql;

select criateste3('');

select  * from teste

