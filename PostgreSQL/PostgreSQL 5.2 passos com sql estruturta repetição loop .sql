
create or replace function tabuada(numero integer ) returns setof varchar As
$$
	declare 
		Multiplicador integer default 1;
	begin
		loop
			return next  numero || ' x '|| Multiplicador || ' = ' ||numero * Multiplicador;
			
			Multiplicador:= Multiplicador +1;
			
			exit when  Multiplicador = 10;
		end loop;
	end;
$$ language plpgsql;

select tabuada (2 )
