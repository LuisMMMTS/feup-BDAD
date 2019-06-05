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
    where exists 
    (
        select *
        from servidor S 
            join aplicacaoservidor Ap 
            on Ap.idservidor = S.idservidor 
            join aplicacao A 
            on A.idaplicacao = AP.idaplicacao 
            join Bug B 
            on B.idaplicacao = A.idaplicacao
            where S.vulneravel = 'nao' and new.idaplicacao = A.idaplicacao
    );
end;
