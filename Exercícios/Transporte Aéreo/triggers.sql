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

CREATE TRIGGER tr_assentos_ocupadosI BEFORE UPDATE
ON assentos_passageiros_voos
FOR EACH ROW
BEGIN
	IF NEW.id_passageiro IS NOT NULL THEN
		UPDATE voos 
		SET num_assentos_ocupados = num_assentos_ocupados + 1
		WHERE NEW.ID_VOO = voos.ID;
	END IF;
END$$

CREATE TRIGGER tr_assentos_livres BEFORE INSERT
ON assentos_passageiros_voos
FOR EACH ROW FOLLOWS tr_assentos_ocupados
BEGIN
	UPDATE voos
	SET num_assentos_livres = (SELECT a.num_assentos FROM aeronaves as a WHERE a.ID = voos.id_aeronave) - num_assentos_ocupados
	WHERE NEW.ID_VOO = voos.ID;
END$$

CREATE TRIGGER tr_assentos_livresI BEFORE UPDATE
ON assentos_passageiros_voos
FOR EACH ROW FOLLOWS tr_assentos_ocupadosI
BEGIN
	UPDATE voos
	SET num_assentos_livres = (SELECT a.num_assentos FROM aeronaves as a WHERE a.ID = voos.id_aeronave) - num_assentos_ocupados
	WHERE NEW.ID_VOO = voos.ID;
END$$

DELIMITER ;