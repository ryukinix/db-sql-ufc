-- n) Liste os nomes de todas as companhias com os seus respectivos
-- totais de empregados e o salário total, o salário médio, a média
-- salarial, o menor salário e o maior salário dos seus empregados.


SELECT nome_companhia,
       count(*) as totais_empregados,
       sum(salario) as salario_total,
       avg(salario) as salario_medio,
       avg(DISTINCT salario) as media_salarial,
       min(salario) as menor_salario,
       max(salario) as maior_salario
FROM trabalha_para
GROUP BY nome_companhia
ORDER BY nome_companhia
