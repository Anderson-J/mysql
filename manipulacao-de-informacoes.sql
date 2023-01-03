-- Id, Nome, Data de Nascimento, Logradouro
/*
CREATE TABLE cli_clientes
(
	cli_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_nome VARCHAR(50) NOT NULL,
    cli_data_nascimento DATE,
    cli_logradouro VARCHAR(100)
);

DROP TABLE cli_clientes;
*/

CREATE TABLE cli_clientes
(
	cli_id SERIAL PRIMARY KEY, -- BIGINT NOT NULL AUTO_INCREMENT UNSIGNED UNIQUE
    cli_nome VARCHAR(50) NOT NULL,
	cli_data_nascimento DATE,
    cli_logradouro VARCHAR(200)
);

INSERT INTO cli_clientes
(cli_nome, cli_data_nascimento, cli_logradouro)
VALUES
('Anderson Oliveira', '2006-01-01', 'Rua legal');

INSERT INTO cli_clientes
(cli_nome)
VALUES
('Anderson Junior');

SELECT * FROM cli_clientes;

SELECT cli_id, cli_nome, cli_data_nascimento, cli_logradouro
FROM cli_clientes;

SELECT cli_id, cli_nome
FROM cli_clientes;

SELECT *
FROM cli_clientes
WHERE cli_id = 1;

SELECT *
FROM cli_clientes
WHERE cli_data_nascimento IS NULL;

ALTER TABLE cli_clientes
ADD COLUMN cli_cpf CHAR(14) NOT NULL DEFAULT '-' AFTER cli_nome;

ALTER TABLE cli_clientes
DROP COLUMN cli_cpf;

INSERT INTO cli_clientes
(cli_nome, cli_cpf,  cli_data_nascimento, cli_logradouro)
VALUES
('Joao da Silva', '123.456.789-01', '2010-01-01', 'Rua Teste');

INSERT INTO cli_clientes
(cli_nome, cli_data_nascimento, cli_logradouro)
VALUES
('Maria da Silva', '2012-01-01', 'Rua Novo Teste');

UPDATE cli_clientes
SET cli_cpf = '234.567.890-12'
WHERE cli_id = 4;

UPDATE cli_clientes
SET cli_cpf = '345.567.890-12', cli_logradouro = 'Avenida Teste'
WHERE cli_id = 4;

ALTER TABLE cli_clientes
ADD CONSTRAINT UN_CLI_CLIENTES__CLI_CPF

SELECT * FROM cli_clientes;