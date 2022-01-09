
create or replace function tabuada(numero integer ) returns setof varchar As
$$
	declare 
		Multiplicador integer default 1;
	begin
		for Multiplicador in 1..9 loop
			return next  numero || ' x '|| Multiplicador || ' = ' ||numero * Multiplicador;
		end loop;
	end;
$$ language plpgsql;

select tabuada (2 )



create or replace function instrutor_com_salario (out nome varchar,out salario_ok varchar  ) returns setof record As
$$
	declare 
		instrutor instrutor;
	begin
		for instrutor in select * from instrutor loop
			nome := instrutor.nome;
			salario_ok := salario_ok (instrutor.id);
			return next;
		end loop;
	end; 
$$ language plpgsql;

select * from instrutor_com_salario ()
