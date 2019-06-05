.mode columns
.headers on

select s.hostname

from servidor S join Pessoa P 
            on P.idpessoa=S.idresponsavel 
            join aplicacaoservidor Ap 
            on Ap.idservidor = S.idservidor 
            join aplicacao A 
            on A.idaplicacao = AP.idaplicacao 
            join Bug B 
            on B.idaplicacao = a.idaplicacao 

where S.hostname like'alu%' 
      and P.mail = 'joao.almeida@cica.pt' 

group by s.idservidor 

having count(*)>0;