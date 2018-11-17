-- b) Encontre os nomes e cidades de residência de todos
--    os empregados que trabalham para o Banco do Brazil;

SELECT nome_empregado, cidade
FROM empregado NATURAL JOIN trabalha_para
WHERE nome_companhia = 'Banco do Brasil';
