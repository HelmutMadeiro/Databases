

-- Criando algumas viwes 

create view vw_cursos_por_categoria 
as  
select 
	 ca.nome as NomeCategoria
	,count(*) as Quan
from curso c
join categoria ca on c.categoria_id = ca.id
group by ca.nome

select * from vw_cursos_por_categoria 


create view vw_cursos_programacao as
select nome from curso where categoria_id = 2 

select * from vw_cursos_programacao







