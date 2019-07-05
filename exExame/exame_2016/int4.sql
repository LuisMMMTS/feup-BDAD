

select distinct id2 as id 
from amizade 
where id1 
in 
(   --amigos dos amigos do miguel
    select id2 
    from amizade where id1 in 
    (   -- amigos do miguel
        select amizade.id2 
        from amizade join estudante on amizade.id1=estudante.id
        where estudante.nome = 'Miguel Sampaio'
    )
);