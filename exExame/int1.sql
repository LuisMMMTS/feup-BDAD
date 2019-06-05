.mode columns
.headers on

select servidor.hostname, pessoa.nome 
from servidor join pessoa on pessoa.idPessoa = servidor.idResponsavel 
where servidor.vulneravel = 'sim';