.mode columns
.headers on

drop trigger if exists insertBug;
create trigger insertBug
after insert on Bug
for each row
when new.vulnerabilidade = 'sim'

begin
    update Bug
    set prioridade = 1
    where new.idBug = Bug.idBug;

    update Servidor
    set vulneravel = 'sim'
    where Servidor.idservidor in
    (
         select idServidor --aplicacao.idaplicacao, servidor.idservidor, servidor.vulneravel, bug.vulnerabilidade 
         from aplicacao join bug on bug.idaplicacao = aplicacao.idaplicacao 
         join aplicacaoservidor on aplicacaoservidor.idaplicacao = aplicacao.idaplicacao 
         natural join servidor
         where servidor.vulneravel = 'nao' and new.idBug = idBug--new.idaplicacao = aplicacao.idaplicacao 
    );
end;
