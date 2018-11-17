DROP SCHEMA IF EXISTS lista04;

CREATE SCHEMA lista04;

USE lista04;

DROP TABLE IF EXISTS empregado;
CREATE TABLE empregado (
       nome_empregado VARCHAR(45) NOT NULL,
       rua VARCHAR(45) NOT NULL,
       cidade VARCHAR(30) NOT NULL,
       PRIMARY KEY (nome_empregado)
);

DROP TABLE IF EXISTS companhia;
CREATE TABLE companhia (
       nome_companhia VARCHAR(45) NOT NULL,
       cidade VARCHAR(30) NOT NULL,
       PRIMARY KEY (nome_companhia)
);

-- Tabela de Relacionamento N para N: empregado <-> companhia
DROP TABLE IF EXISTS trabalha_para;
CREATE TABLE trabalha_para (
       nome_empregado VARCHAR(45) NOT NULL,
       nome_companhia VARCHAR(45) NOT NULL,
       salario decimal(7,2) NOT NULL,
       CONSTRAINT FK_empregado_trabalha_para
                  FOREIGN KEY (nome_empregado)
                  REFERENCES empregado(nome_empregado),
       CONSTRAINT FK_companhia_trabalha_para
                  FOREIGN KEY (nome_companhia)
                  REFERENCES companhia(nome_companhia),
       PRIMARY KEY (nome_empregado, nome_companhia)
);

-- Tabela de Auto-Relacionamento 1 para 1: empregado <-> empregado
DROP TABLE IF EXISTS gerencia;
CREATE TABLE gerencia (
       nome_empregado VARCHAR(45) NOT NULL,
       nome_gerente VARCHAR(45) NOT NULL,
       CONSTRAINT FK_empregado_gerenciado
                  FOREIGN KEY (nome_empregado)
                  REFERENCES empregado(nome_empregado),
       CONSTRAINT FK_empregado_gerente
                  FOREIGN KEY (nome_gerente)
                  REFERENCES empregado(nome_empregado),
       PRIMARY KEY (nome_empregado, nome_gerente)
);


-- INSERTS

-- empregado
INSERT INTO empregado VALUES
       ('João', 'Rua dos Joãos', 'Sobral'),
       ('Fernando', 'Rua dos Fernandos', 'Fortaleza'),
       ('Lucas', 'Rua dos Lucas', 'Eusébio'),
       ('Pedro', 'Rua Floriano Peixoto', 'Forquilha'),
       ('Manoel', 'Rua Itacorubi', 'Florianópolis'),
       ('Gabriel', 'Rua Itacorubi', 'Florianópolis'),
       ('Antônio', 'Rua Floriano Peixoto', 'Fortaleza');


-- companhia
INSERT INTO companhia VALUES
       ('Banco do Brasil', 'Fortaleza'),
       ('Banco Safra', 'Sobral'),
       ('UFC', 'Sobral'),
       ('Neoway', 'Florianópolis');


-- trabalha_para
INSERT INTO trabalha_para VALUES
       ('João', 'Banco do Brasil', 5000.00),
       ('Lucas', 'Banco do Brasil', 15000.00),
       ('Antônio', 'Banco do Brasil', 6000.00),
       ('Fernando', 'UFC', 9000.00),
       ('Pedro', 'Banco Safra', 10000.00),
       ('Manoel', 'Neoway', 5000.00),
       ('Gabriel', 'Neoway', 8000.00),
       ('Pedro', 'UFC', 400.00);


INSERT INTO gerencia VALUES
       ('Manoel', 'Gabriel'),
       ('João', 'Lucas'),
       ('Pedro', 'Fernando'),
       ('Antônio', 'João');
