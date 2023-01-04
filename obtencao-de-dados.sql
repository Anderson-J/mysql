SELECT cli.cli_nome,
       COALESCE(SUM(cmp.cmp_valor_pago), 0),
       COUNT(cmp.cmp_id) cmp_quantidade_compras
  FROM cli_clientes cli
LEFT JOIN cmp_compras cmp
  ON cli.cli_id = cmp.cli_id
GROUP BY cli.cli_id;