select M.nome as nome, M.anocurricular as anoCurricular 
from 
(
    select e1.nome, e1.anocurricular as anocurricular, count(*) as count 
    from estudante e1 join amizade a on e1.id = a.id1 join estudante e2 on e2.id = a.id2 
    group by(e1.id) 
    order by count desc
)M 
limit 1;