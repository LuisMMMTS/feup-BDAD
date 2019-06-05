.mode columns
.headers on

select S.hostname, B.descricao, P.nome 

from aplicacaoservidor AP join aplicacao A 
    on A.idaplicacao=AP.idaplicacao 
                          join servidor S 
    on S.idservidor = AP.idservidor 
                          join Bug B 
    on B.idaplicacao = A.idaplicacao 
                          join Pessoa P 
    on P.idpessoa = S.idresponsavel 

where B.vulnerabilidade = 'sim' 
order by S.hostname asc;