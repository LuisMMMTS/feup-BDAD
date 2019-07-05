select est.nome, est.anoCurricular
from estudante est 
where est.nome not in
(
    select M.nome 
    from 
    (
        select e.nome as nome, e.anoCurricular, e2.nome, e2.anoCurricular 
        from estudante e 
        join amizade a on e.id = a.id1 
        join estudante e2 on e2.id = a.id2 
        where e.anoCurricular<>e2.anoCurricular
    )M
) 

and est.nome in 
(
    select N.nome from 
    (
        select e.nome as nome, e.anoCurricular, e2.nome, e2.anoCurricular 
        from estudante e 
        join amizade a on e.id = a.id1 
        join estudante e2 on e2.id = a.id2 
        where e.anoCurricular=e2.anoCurricular
    )N
)

order by est.anoCurricular asc, est.nome asc;