-- i) Encontre os nomes dos empregados do Banco do Brasil que ganham
-- mais que o seu gerente;

SELECT nome_empregado
FROM gerencia as g
NATURAL JOIN (SELECT nome_empregado, salario as salario_empregado
              FROM trabalha_para
              WHERE nome_companhia = 'Banco do Brasil') as emp
NATURAL JOIN (SELECT nome_empregado as nome_gerente, salario as salario_gerente
              FROM trabalha_para
              WHERE nome_companhia = 'Banco do Brasil') as ger
WHERE salario_empregado > salario_gerente;
