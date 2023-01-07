DELIMITER $$

CREATE PROCEDURE sp_relatorio_clientes(OUT p_linhas_processadas INT)
BEGIN
	DECLARE v_nome_cliente VARCHAR(100);
    DECLARE v_valor_pago DECIMAL(8,2);
    DECLARE v_quantidade_compras INT;
    DECLARE v_media_preco_produto DECIMAL;
    DECLARE v_finalizado INTEGER DEFAULT 0;
    DECLARE cr_relatorio_clientes CURSOR FOR
		SELECT * FROM vw_relatorio_clientes;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finalizado = 1;
    SET p_linhas_processadas = 0;
    DELETE FROM dw_relatorio_clientes;
    OPEN cr_relatorio_clientes;
    loop_relatorio_clientes: LOOP
		FETCH cr_relatorio_clientes INTO v_nome_cliente, v_valor_pago, v_quantidade_compras, v_media_preco_produto;
        IF v_finalizado = 1 THEN
			LEAVE loop_relatorio_clientes;
		END IF;
        
        INSERT INTO dw_relatorio_clientes VALUES (v_nome_cliente, v_valor_pago, v_quantidade_compras, v_media_preco_produto);
        SET p_linhas_processadas = p_linhas_processadas + 1;
	END LOOP loop_relatorio_clientes;
    CLOSE cr_relatorio_clientes;
END $$

DELIMITER ;

CREATE TABLE dw_relatorio_clientes
(
	cli_nome VARCHAR(100) NOT NULL,
    valor_pago DECIMAL(8,2) NOT NULL,
    quantidade_compras INT,
    media_preco_produto DECIMAL NOT NULL
);

SELECT * FROM dw_relatorio_clientes;

CALL sp_relatorio_clientes(@v_linhas_processadas);