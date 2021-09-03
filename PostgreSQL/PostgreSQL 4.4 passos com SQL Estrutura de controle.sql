

-- retornando uma linha do tipo instrutor 

create function criainstrutorfalsopl() returns instrutor as 
$$
begin
	return row(22,'Nome falso',200::decimal)::instrutor;
end 
$$ language plpgsql;


select  criainstrutorfalsopl()

-- declarando uma variavel do tipo instrutor
-- usando o into para a acao de insercao no typo instrutor

create function criainstrutorfalsopl2() returns instrutor as $$

declare 
	retorno instrutor; 
begin
	select 22,'Nome falso',200::decimal into retorno;
	return retorno;
end 

$$ language plpgsql;

select criainstrutorfalsopl2()
 
 
 
 
 
-- caso queira retornar uma query inteira  pode usar um return query
drop function instrutores_bem_pagospl
create function instrutores_bem_pagospl (valor_Salario decimal) returns setof instrutor as 
$$
begin
	return query select * from instrutor where salario>valor_Salario;
end 


$$ language plpgsql;
 
 
 select * from instrutores_bem_pagospl (300)
 
 
 
 
 
 
 
 