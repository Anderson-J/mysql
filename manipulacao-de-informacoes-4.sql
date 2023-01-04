SELECT *
FROM cli_clientes;

SELECT *
FROM cmp_compras;

ALTER TABLE cmp_compras
RENAME COLUMN camp_valor_pago TO cmp_valor_pago;

INSERT INTO cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
VALUES
(NOW(), 150.00, 1);

INSERT INTO cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
VALUES
(NOW(), 75.00, 2);

SELECT *
FROM cli_clientes, cmp_compras;

SELECT cliente.cli_nome, cliente.cli_cpf, compra.cmp_data_hora, compra.cmp_valor_pago
FROM cli_clientes AS cliente, cmp_compras AS compra
WHERE cliente.cli_id = compra.cli_id;

SELECT cli.cli_nome, cli.cli_cpf, cmp.cmp_data_hora, cmp.cmp_valor_pago
  FROM cli_clientes AS cli
INNER JOIN cmp_compras AS cmp
  ON cli.cli_id = cmp.cli_id
WHERE cmp.cmp_valor_pago > 100;

SELECT cli.cli_nome,
       cli.cli_cpf,
       cmp.cmp_data_hora,
       COALESCE(cmp.cmp_valor_pago, 0) AS cmp_valor_pago
  FROM cli_clientes AS cli
LEFT JOIN cmp_compras AS cmp
  ON cli.cli_id = cmp.cli_id;
-- WHERE cmp.cmp_data_hora IS NULL;

SELECT cli.cli_nome,
       cli.cli_cpf,
       cmp.cmp_data_hora,
       COALESCE(cmp.cmp_valor_pago, 0) cmp_valor_pago
  FROM cmp_compras cmp
RIGHT JOIN cli_clientes cli
  ON cli.cli_id = cmp.cli_id;