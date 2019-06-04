.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

select S.hostname, B.descricao, P.nome as nome
from Servidor S JOIN Pessoa P ON P.idPessoa = S.idResponsavel
                JOIN bug B on B.idResponsavel = P.idPessoa
                JOIN Aplicacao A on A.idAplicacao = B.idAplicacao
where B.vulnerabilidade = "sim"
order by S.hostname asc;