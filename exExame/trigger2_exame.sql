.mode columns
.headers on
.nullvalue nullvalue
PRAGMA foreign_keys = on;

create trigger afterInsertBug
after insert on Bug
FOR EACH ROW 
when vulnerabilidade = "sim"

begin

    update Bug
    set prioridade = 1
    where new.idBug = Bug.idBug 

    update Servidor
    Set vulneravel = 
    (
        select B.vulnerabilidade
        from Bug B      Natural Join Aplicacao A 
                        Natural Join AplicacaoServidor AP
                        Natural Join Servidor S 
        where B.idBug = new.idBug;
    )

end;
