.mode columns
.headers on

select M.nome as nome 
from 
(
    select count (*) as count, A.nome as nome 
    from aplicacao A join Bug B on B.idaplicacao = A.idaplicacao 
    group by A.idaplicacao
)M 

order by count desc 
limit 1;