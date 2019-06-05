.mode columns
.headers on

drop trigger if exists addApptoServer;
create trigger addApptoServer
after insert on AplicacaoServidor
FOR EACH ROW
begin
    update Servidor
    Set vulneravel = 'sim'
    where exists
    (
        select * 
        from Aplicacao A join Bug B on B.idaplicacao=A.idaplicacao
        where b.vulnerabilidade = 'sim' and new.idaplicacao = A.idaplicacao
    )
    and new.idservidor = idservidor;
end;