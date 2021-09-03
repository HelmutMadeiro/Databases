
 --linguagem procedural 
 
create function primeirapl() returns integer as $$

-- para fazer um comando em plpgsql, devemos sempre abrir pelo menos um bloco de instrução ( begin e end)
-- temos que declarar tbm um retorno para essa funcao com o retuns
begin
	return 1;
end 

$$ language plpgsql;



 
create function primeiraplvar() returns integer as $$

-- colcoando a variavel como interiro e deixando default
-- := sinal de atribuicao 

declare 
	primeiravar integer default 3;

begin
	primeiravar:=primeiravar*2;
return primeiravar;
end 

$$ language plpgsql;

select primeiraplvar(); 



