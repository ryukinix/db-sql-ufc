-- j) Encontre os nomes e salários de todos os empregados do Banco do
-- Brasil que moram em Fortaleza.

SELECT nome_empregado, salario, e.cidade
FROM trabalha_para
NATURAL JOIN empregado as e
WHERE nome_companhia = 'Banco do Brasil' AND e.cidade = 'Fortaleza';
