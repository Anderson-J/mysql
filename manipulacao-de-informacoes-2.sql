USE tw_nfe;

ALTER TABLE cli_clientes
ADD CONSTRAINT UN_CLI_CLIENTES__CLI_CPF UNIQUE(cli_cpf);

UPDATE cli_clientes
SET cli_cpf = '012.345.678-90'
WHERE cli_id = 1;

INSERT INTO cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
VALUES
('Pedro Pedroso', '111.111.111-11', '1870-12-16', 'Rua das Pedras');

INSERT INTO cli_clientes
(cli_nome, cli_data_nascimento, cli_logradouro)
VALUES
('Pedro Pedroso', '1870-12-16', 'Rua das Pedras');

UPDATE cli_clientes
SET cli_nome = 'Pedro Pedroca', cli_cpf = '222.222.222-22', cli_logradouro = 'Rua das Pedronas'
WHERE cli_id = 6;

UPDATE cli_clientes
SET cli_nome = 'Maria Marilene', cli_cpf = '333.333.333-33', cli_logradouro = 'Rua das Marianas'
WHERE cli_id = 7;

ALTER TABLE cli_clientes DROP INDEX UN_CLI_CLIENTES__CLI_CPF;

SELECT *
FROM cli_clientes
WHERE cli_data_nascimento IS NULL OR cli_logradouro IS NULL;

SELECT *
FROM cli_clientes
WHERE cli_data_nascimento IS NULL AND cli_logradouro IS NULL;

SELECT *
FROM cli_clientes
WHERE cli_data_nascimento IS NULL AND cli_logradouro IS NOT NULL;

UPDATE cli_clientes
SET cli_data_nascimento = NULL
WHERE cli_id = 4;

SELECT *
FROM cli_clientes
WHERE cli_nome LIKE 'P%';

SELECT *
FROM cli_clientes
WHERE cli_nome LIKE '%a';

SELECT *
FROM cli_clientes
WHERE cli_nome LIKE 'a%';

SELECT UPPER(cli_nome) FROM cli_clientes;

SELECT *
FROM cli_clientes
WHERE LOWER(cli_nome) LIKE '%p%';

SELECT *
FROM cli_clientes;

INSERT INTO	cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
VALUES
('Marcos', '444.444.444-44', '2015-01-01', 'Rua 1');

INSERT INTO cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
VALUES
('Marcus', '555.555.555-55', '2000-01-01', 'Rua2');

INSERT INTO cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
VALUES
('Markos', '666.666.666-66', '1985-01-01', 'Rua 3');

SELECT *
FROM cli_clientes
WHERE cli_nome = 'Marcos' OR cli_nome = 'Markos' OR cli_nome = 'Markus';

SELECT *
FROM cli_clientes
WHERE SOUNDEX(cli_nome) = SOUNDEX('Marcos');
