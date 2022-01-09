
create or replace function tabuada(numero integer ) returns setof varchar As
$$
	declare 
		Multiplicador integer default 1;
	begin
		while  Multiplicador <10 loop
			return next  numero || ' x '|| Multiplicador || ' = ' ||numero * Multiplicador;
			Multiplicador:= Multiplicador +1;
		end loop;
	end;
$$ language plpgsql;

select tabuada (2 )
