DELIMITER $$

CREATE PROCEDURE GetProductById(
	IN pProductId INT, 
    OUT pProductLevel VARCHAR(20)
)
BEGIN
	DECLARE valor DECIMAL(10,2) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO valor
    FROM PRODUTO AS P
    WHERE P.COD_PRODUTO = pProductId;
    
    IF( valor >= 5 AND valor <= 10 ) THEN
		SET pProductLevel = 'CRIÍTICO';
	ELSEIF( valor > 10 and valor <= 20 ) THEN
		SET pProductLevel = 'PREOCUPANTE';
	ELSEIF( valor > 20 ) THEN
		SET pProductLevel = 'TÁ SUAVE';
	ELSE
		SET pProductLevel = 'FUJA';
	END IF;
END$$

DELIMITER ;