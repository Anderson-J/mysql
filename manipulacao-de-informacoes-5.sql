SELECT *
FROM cli_clientes cli
LEFT JOIN cmp_compras cmp
ON cli.cli_id = cmp.cli_id;

SELECT * FROM cmp_compras;
SELECT * FROM prd_produtos;

DESC cmp_prd_compras_produtos;

INSERT INTO cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
VALUES
(1, 1, 2, 50);

INSERT INTO cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
VALUES
(4, 1, 1, 30.5);

INSERT INTO cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
VALUES
(1, 2, 1, 25);

UPDATE cmp_prd_compras_produtos
SET cmp_prd_preco = 3.5
WHERE prd_id = 4 AND cmp_id = 1;

SELECT * FROM cmp_prd_compras_produtos;

CREATE OR REPLACE VIEW vw_relatorio_clientes AS
SELECT cli.cli_nome,
COALESCE(SUM(DISTINCT(cmp.cmp_valor_pago)), 0) valor_pago,
COUNT(DISTINCT(cmp.cmp_id)) quantidade_compras,
AVG(cmp_prd.cmp_prd_quantidade * cmp_prd.cmp_prd_preco) media_preco_produto
FROM cli_clientes cli
LEFT JOIN cmp_compras cmp
ON cli.cli_id = cmp.cli_id
INNER JOIN cmp_prd_compras_produtos cmp_prd
ON cmp.cmp_id = cmp_prd.cmp_id
INNER JOIN prd_produtos prd
ON cmp_prd.prd_id = prd.prd_id
GROUP BY cli.cli_id
HAVING COUNT(cmp_prd.cmp_id) > 1;

SELECT * FROM vw_relatorio_clientes;

DROP VIEW vw_relatorio_clientes;

SELECT * FROM cmp_compras;
SELECT * FROM prd_produtos;

DESC cmp_prd_compras_produtos;