DELIMITER $$

CREATE TRIGGER tr_assentos_livres BEFORE INSERT
ON assentos_passageiros_voos
FOR EACH ROW FOLLOWS tr_assentos_ocupados
BEGIN
	UPDATE voos
	SET num_assentos_livres = (SELECT a.num_assentos FROM aeronaves as a WHERE a.ID = voos.id_aeronave) - num_assentos_ocupados
	WHERE NEW.ID_VOO = voos.ID;
END$$

DELIMITER ;