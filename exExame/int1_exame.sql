.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

select hostname, P.nome as nome
from Servidor S JOIN Pessoa P ON P.idPessoa = S.idResponsavel
where S.vulneravel = "sim";