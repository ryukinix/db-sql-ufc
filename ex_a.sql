-- A) Encontre o nome de todos os funcionários que trabalham para o Banco do Brasil;

SELECT nome_empregado
FROM trabalha_para
WHERE nome_companhia = 'Banco do Brasil';
