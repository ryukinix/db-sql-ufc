-- m) Encontre os nomes, ruas e as cidades de todos os empregados cujo
-- salário total é maior de que o maior salário de todas as empresas
-- onde o mesmo trabalha.

SELECT nome_empregado, cidade
FROM trabalha_para as t
NATURAL JOIN empregado
NATURAL JOIN (SELECT nome_companhia, max(salario) as salario_maximo
              FROM trabalha_para
              GROUP BY nome_companhia) as companhia_salario_maximo
GROUP BY nome_empregado
HAVING sum(salario) > max(salario_maximo);
