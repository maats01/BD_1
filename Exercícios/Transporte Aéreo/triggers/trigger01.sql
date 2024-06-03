DELIMITER $$

CREATE TRIGGER tr_assentos_ocupados BEFORE INSERT
ON assentos_passageiros_voos
FOR EACH ROW
BEGIN
	IF NEW.id_passageiro IS NOT NULL THEN
		UPDATE voos 
		SET num_assentos_ocupados = num_assentos_ocupados + 1
		WHERE NEW.ID_VOO = voos.ID;
	END IF;
END$$

DELIMITER ;