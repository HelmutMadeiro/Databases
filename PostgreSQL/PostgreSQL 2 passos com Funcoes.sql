-- Funcoes 


-- Concatenar strings simples 
select primeiro_nome||' '|| ultimo_nome from aluno

-- Concatenar strings mantendo os nullos

select concat(primeiro_nome,' ',ultimo_nome) from aluno

-- upper
select upper(concat(primeiro_nome,' ',ultimo_nome)) from aluno

