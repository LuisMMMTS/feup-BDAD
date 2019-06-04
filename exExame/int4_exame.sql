.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

select M.nome 
from
(
    select N.nome, max(N.count)
    from
    (
        select A.nome as nome, count(*) as count
        from Aplicacao A JOIN Bug B ON B.idAplicacao = A.idAplicacao
        group by A.idAplicacao
    ) N
)M;
