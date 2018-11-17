-- l) Encontre os nomes e as cidades de todos os empregados cujo
-- salário total é maior de que o maior salário de, pelo menos, uma
-- das empresas onde o mesmo trabalha.

SELECT nome_empregado, cidade
FROM trabalha_para as t
NATURAL JOIN empregado
NATURAL JOIN (SELECT nome_companhia, max(salario) as salario_maximo
              FROM trabalha_para
              GROUP BY nome_companhia) as companhia_salario_maximo
GROUP BY nome_empregado
HAVING sum(salario) > min(salario_maximo);
