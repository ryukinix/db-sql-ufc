-- f) Encontre os nomes de todos os empregados neste banco de dados
-- que NÃO trabalham para o Banco do Brasil;

SELECT nome_empregado
FROM trabalha_para
WHERE nome_empregado not in (SELECT nome_empregado
                             FROM trabalha_para
                             WHERE nome_companhia = 'Banco do Brasil');
