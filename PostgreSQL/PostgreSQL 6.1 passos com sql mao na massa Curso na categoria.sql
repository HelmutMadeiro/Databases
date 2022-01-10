

create or replace function criar_curso (nome_curso varchar,nome_categoria varchar) returns void As
$$
	declare 
		id_categoria integer;
	begin
		select id into id_categoria from academico.categoria where nome = nome_categoria;
		
		if not found then
			insert into academico.categoria(nome) values (nome_categoria) returning id into id_categoria;
		end if;
		
		insert into academico.curso (nome, categoria_id ) values (nome_curso,id_categoria);
	end ;	
$$ language plpgsql;

						   
select criar_curso ('R','Data Science')


select * from academico.curso