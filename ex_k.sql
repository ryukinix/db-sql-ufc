-- k) Encontre os nomes de todos os empregados que trabalham para,
-- pelo menos, duas companhias.


SELECT nome_empregado
FROM trabalha_para
GROUP BY nome_empregado
HAVING count(nome_companhia) >= 2;
