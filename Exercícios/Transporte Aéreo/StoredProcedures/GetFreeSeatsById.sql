DELIMITER //

CREATE PROCEDURE GetFreeSeatsById
(IN Id int)
BEGIN
	SELECT
		id_voo,
		id_assento,
		lado,
		posicao,
		linha
	FROM
		assentos as ass,
		assentos_passageiros_voos as apv
	WHERE
		apv.id_voo = Id AND
		apv.id_passageiro IS NULL AND
		apv.id_assento = ass.id;
	SELECT
	num_assentos_livres
	FROM
		voos
	WHERE
		voos.id = Id;
END //

DELIMITER ;