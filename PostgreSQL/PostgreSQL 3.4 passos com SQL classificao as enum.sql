https://www.postgresql.org/docs/current/sql-createtype.html

create temporary  table filme 

(
	id serial PRIMARY key,
	nome varchar(255) not null,
	classificacao varchar(255) check (classificacao in ('LIVRE','12_ANOS','14_ANOS','16_ANOS','18_ANOS'))
)
 

create type classificao as enum  ('LIVRE','12_ANOS','14_ANOS','16_ANOS','18_ANOS')


-- pequisar mais sobre types , eles basicamente funcionam como check

create temporary  table filme2 

(
	id serial PRIMARY key,
	nome varchar(255) not null,
	classificacao classificao
)
 

insert into filme2 (nome, classificacao ) values ('qualquer filme', 'teste ')

insert into filme2 (nome, classificacao ) values ('qualquer filme', '14_ANOS')

select * from filme2
