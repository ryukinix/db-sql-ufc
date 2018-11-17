-- o) Ordenando pelo nome da companhia, mostre o nome e o salário de
-- cada empregado, mostrando o salário total pago por cada companhia
-- e, ao final, o salário total pago por todas as companhias.

SELECT nome_empregado, salario, salario_total_companhia
FROM trabalha_para
NATURAL JOIN (SELECT nome_companhia, sum(salario) as salario_total_companhia
              FROM trabalha_para
              GROUP BY nome_companhia) as companhia_por_salario_total
ORDER BY nome_companhia;

SELECT sum(salario) as salario_total_por_todas_companhias
FROM trabalha_para;
