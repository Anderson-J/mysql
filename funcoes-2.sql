DESC cmp_prd_compras_produtos;

DELIMITER $$

CREATE FUNCTION fn_calcular_valor_compra(p_id_compra BIGINT)
RETURNS DECIMAL(8,2)
BEGIN
	DECLARE v_valor_compra DECIMAL(8,2);
	SELECT SUM(cmp_prd_compras_produtos * cmp_prd_preco)
		INTO v_valor_compra
    FROM cmp_prd_compras_produtos
		WHERE cmp_id = p_id_compra;
    RETURN v_valor_compra;
END $$

DELIMITER ;

SELECT * FROM cmp_prd_compras_produtos;

SELECT DISTINCT fn_calcular_valor_compra(cmp_id)
FROM cmp_prd_compras_produtos;