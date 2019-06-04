.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

select S.hostname
from Servidor S JOIN Pessoa P ON P.idPessoa = S.idResponsavel
                JOIN bug B on B.idResponsavel = P.idPessoa
where S.hostname like '%alu%' AND P.mail = 'joao.almeida@cica.pt'
group by B.idBug
order by S.hostname asc;

-- como garantir que numero de bugs e pelo menos um?