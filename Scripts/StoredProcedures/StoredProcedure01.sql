DELIMITER $$
CREATE PROCEDURE GetAllProducts()
BEGIN
	/* Delaração de variáveis */
	DECLARE totalSale DEC(10,2) DEFAULT 0.0;
    DECLARE x, y, total, qtd INT DEFAULT 0;
    /*-----------------------------------------*/
    /* Atribuição de valores */
    SET total = 10;
    
    /* CCarregando valores de um select em uma variável */
    SELECT COUNT(*)
    INTO qtd
    FROM produto;
    
    SELECT qtd;
    
    SELECT * FROM PRODUTO;
    
END$$
DELIMITER ;