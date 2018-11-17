-- c) Encontre os nomes, ruas e cidades de residência de todos os
--    empregados que trabalham para o Banco do Brasil e que ganham mais
--    de que R$ 10.000,00;

SELECT nome_empregado, rua, cidade
FROM empregado NATURAL JOIN trabalha_para
WHERE nome_companhia = 'Banco do Brasil' AND salario > 10000.00;
