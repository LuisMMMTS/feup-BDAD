.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;


create trigger addApptoServer
after insert on AplicacaoServidor
FOR EACH ROW
begin

    update Servidor
    Set vulneravel = 
    (
        select A.vulneravel
        from Bug B      Natural Join Aplicacao A
        where A.idAplicacao = new.idAplicacao and B.vulnerabilidade <> "nao"
        group by A.idAplicacao
    )
    where Servidor.idServidor = New.idServidor;

end;