select nome 
from estudante e ´
join amizade a on a.id2 = e.id 
group by(nome) 
having count(*) > 3
order by e.id;