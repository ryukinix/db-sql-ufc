-- h) Assuma que as companhias podem estar localizadas em várias
-- cidades: Companhia(Nome_Companhia, Cidade). Encontre todas as
-- companhias que têm sedes em todas as cidades que o Banco Safra tem
-- sede;

-- Cria uma cópia da tabela companhia_2
DROP TABLE IF EXISTS companhia_2;
CREATE TABLE companhia_2 (
       nome_companhia VARCHAR(45) NOT NULL,
       cidade VARCHAR(45) NOT NULL,
       PRIMARY KEY (nome_companhia, cidade)
);

-- Insere os valores de companhia em companhia2
INSERT INTO companhia_2
SELECT * FROM companhia;

-- Insere novos valores
INSERT INTO companhia_2 VALUES
   ('Banco do Brasil', 'Sobral'),
   ('UFC', 'Santos'),
   ('Banco Safra', 'Fortaleza');

-- Consulta... Resultado esperado: Banco do Brasil
-- Banco do Brasil está em TODAS as cidades que Banco Safrá está.
WITH
    outros AS (SELECT nome_companhia, cidade FROM companhia_2 WHERE nome_companhia <> 'Banco Safra'),
    banco_safra AS (SELECT cidade FROM companhia_2 WHERE nome_companhia = 'Banco Safra')
SELECT nome_companhia
FROM outros
WHERE cidade in (select cidade from banco_safra)
GROUP BY nome_companhia
HAVING COUNT(DISTINCT cidade) = (select COUNT(*) from banco_safra);
-- ^ Verifica se a companhia que deu match, tem o número de cidades esperado do banco_safra
-- Seria bem mais fácil se tivesse uma claúsula `IN ALL`


DROP TABLE companhia_2;
