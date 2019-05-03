SELECT <attributes>
FROM <tabela>

[WHERE <expressao boleana>]
;

UNION 
INTERSECT
EXCEPT


1)
SELECT nr FROM Aluno

2)
SELECT cod, Design FROM CADEIRA WHERE curso = 'AC'

3)
SELECT Nome FROM ALUNO INTERSECT SELECT Nome FROM PROF

4)
SELECT Nome FROM ALUNO INTERSECT SELECT Nome FROM PROF

5)
SELECT Nome FROM ALUNO NATURAL JOIN SELECT Nome FROM PROF

6)
SELECT Nome FROM
SELECT nr FROM PROVA WHERE cod = 'TS1' NATURAL JOIN SELECT nr,Nome FROM ALUNO)
	
SELECT distinct nome FROM Aluno, Prova
WHERE Aluno.nr=Prova.nr AND Prova.cod=Cadeira.cod
AND Cadeira.curso = 'IS'
	
7)



8)

9)
SELECT max(nota) FROM Prova

11)
SELECT 	count(*) FROM Aluno

14)
SELECT nr,count(*) FROM Prova GROUP BY nr
