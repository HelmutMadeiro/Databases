
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
