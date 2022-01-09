
create or replace function tabuada(numero integer ) returns setof varchar As
$$
	declare 
	begin
		return next numero * 1;
		return next numero * 2;
		return next numero * 3;
		return next numero * 4;
		return next numero * 5;
		return next numero * 6;
		return next numero * 7;
		return next numero * 8;
		return next numero * 9;
	end;
$$ language plpgsql;

select tabuada (2 )
