-- g) Encontre os nomes de todos os empregados que ganham mais de que
-- todos os empregados do Banco Safra;

SELECT nome_empregado
FROM trabalha_para
WHERE salario > ALL(SELECT salario
                    FROM trabalha_para
                    WHERE nome_companhia = 'Banco Safra')
