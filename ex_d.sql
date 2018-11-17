-- d) Encontre os nomes de todos os empregados neste banco de dados
-- que moram na mesma cidade da companhia para a qual eles trabalham;

SELECT e.nome_empregado
FROM empregado as e
NATURAL JOIN trabalha_para as t
NATURAL JOIN companhia as c
WHERE e.cidade = c.cidade;
