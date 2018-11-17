-- e) Encontre os nomes de todos os empregados que moram na mesma
-- cidade e na mesma rua que os gerentes deles;

SELECT nome_empregado
FROM gerencia
NATURAL JOIN (SELECT nome_empregado, rua as rua_empregado, cidade as cidade_empregado
              FROM empregado) as t1
NATURAL JOIN (SELECT nome_empregado as nome_gerente, rua as rua_gerente, cidade as cidade_gerente
              FROM empregado) as t2
WHERE cidade_empregado = cidade_gerente AND rua_empregado = rua_gerente;
