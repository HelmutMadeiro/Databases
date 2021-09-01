
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