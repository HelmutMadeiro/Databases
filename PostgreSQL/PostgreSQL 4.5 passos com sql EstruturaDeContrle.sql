



drop function salario_ok;

create function salario_ok (instrutor instrutor) returns varchar as 
$$
	begin 
		if instrutor.salario >200 then 
			return 'Salario esta ok';
		else 
			return 'Salario pode aumentar';
		end if;
end;
$$ language plpgsql;

drop function salario_ok;

create or replace function salario_ok (id_instrutor integer ) returns varchar as 
$$
	declare
		instrutor instrutor;
	begin 
		select * from instrutor where id = id_instrutor into instrutor;
		if instrutor.salario >300 then 
			return 'Salario esta ok';
		else 
			 if instrutor.salario = 300 then
				return 'Salario pode aumentar';
			 else
			 	return 'Salario esta defasado';
			 end if;
		end if;
	end;
$$ language plpgsql;

select nome, salario_ok(instrutor.id) from instrutor;



create or replace function salario_ok (id_instrutor integer ) returns varchar as 
$$
	declare
		instrutor instrutor;
	begin 
		select * from instrutor where id = id_instrutor into instrutor;
		if instrutor.salario >300 then 
			return 'Salario esta ok';
		elseif instrutor.salario = 300 then
				return 'Salario pode aumentar';
			 else
			 	return 'Salario esta defasado';
			 end if;
		end if;
	end;
$$ language plpgsql;

select nome, salario_ok(instrutor.id) from instrutor;





create or replace function salario_ok (id_instrutor integer ) returns varchar as 
$$
	declare
		instrutor instrutor;
	begin 
		select * from instrutor where id = id_instrutor into instrutor;
		
		/*if instrutor.salario >300 then 
			return 'Salario esta ok';
		elseif instrutor.salario = 300 then
				return 'Salario pode aumentar';
			 else
			 	return 'Salario esta defasado';
			 end if;
		end if;*/
		
		case 
			when instrutor.salario = 100 then
				return 'Salário muito baixo';
			when instrutor.salario = 200 then
				return 'Salário baixo';
			when instrutor.salario = 300 then
				return 'Salário ok';
			else 
				return 'Salário Otimo';

		end case;
	end;
$$ language plpgsql;

select nome, salario_ok(instrutor.id) from instrutor;






create or replace function salario_ok (id_instrutor integer ) returns varchar as 
$$
	declare
		instrutor instrutor;
	begin 
		select * from instrutor where id = id_instrutor into instrutor;
		
		/*if instrutor.salario >300 then 
			return 'Salario esta ok';
		elseif instrutor.salario = 300 then
				return 'Salario pode aumentar';
			 else
			 	return 'Salario esta defasado';
			 end if;
		end if;*/
		
		case instrutor.salario 
			when 100 then
				return 'Salário muito baixo';
			when  200 then
				return 'Salário baixo';
			when 300 then
				return 'Salário ok';
			else 
				return 'Salário Otimo';

		end case;
	end;
$$ language plpgsql;

select nome, salario_ok(instrutor.id) from instrutor;



