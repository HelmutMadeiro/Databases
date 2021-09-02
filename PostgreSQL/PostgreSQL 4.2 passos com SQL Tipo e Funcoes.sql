create table instrutor (
id serial PRIMARY KEY,
nome varchar(255) not null,
salario decimal(10,2)
);


insert into instrutor (nome,salario) values('Helmut',100);
insert into instrutor (nome,salario) values('Debora',200);
insert into instrutor (nome,salario) values('Cassio',300);
insert into instrutor (nome,salario) values('Camila',400);
insert into instrutor (nome,salario) values('Murilo',500);

create function dobroSalario (nome varchar) returns numeric as
$$
select Salario *2 from instrutor where nome = (dobroSalario.nome)
$$
language sql;


select dobroSalario('Helmut')


--Entendemos como retornar mais de um dado por vez em nossas funções através do SETOF
--Conhecemos um dos possíveis usos para o tipo RECORD.

-- funcao com paramentro composto

create function dobroSalario2 (instrutor) returns numeric as
$$
select $1.Salario * 2 as Dobro;
$$
language sql;

select nome, dobroSalario2(instrutor.*) as desejo from instrutor;

-- retorno composto

create function criainstrutorfalso() returns instrutor as 
$$
	select 22,'Nome falso',200::decimal;
$$ language sql;


select criainstrutorfalso();

select * from  criainstrutorfalso();

-- retornando conjuntos 
create function instrutores_bem_pagos(valor_Salario decimal) returns setof instrutor as 
$$
select * from instrutor where salario>valor_Salario;

$$ language sql;

select * from instrutores_bem_pagos(200);


-- parametros de saida

create function somaProduto(in num1 integer ,in num2 integer, out soma integer,out prod integer ) as 
$$

select num1 + num2 as soma , num1 * num2 as produto ;

$$ language sql;


select * from somaProduto (3,3);


--criando um type de retorno 
create type dois_valores as (soma integer, produto integer);

-- usando o type 
create function somaProduto2 (num1 integer ,num2 integer ) returns dois_valores as
$$

select num1 + num2 as soma , num1 * num2 as produto ;

$$ language sql;


select * from somaProduto2 (3,7);


-- saida de mais valores com uma unica entrada sem usar o instrutores

create function instrutores_bem_pagos3 (valor_Salario decimal, out nome varchar, out salario decimal) returns setof record as 
$$
select nome, salario from instrutor where salario>valor_Salario;

$$ language sql;

select * from instrutores_bem_pagos3(200);