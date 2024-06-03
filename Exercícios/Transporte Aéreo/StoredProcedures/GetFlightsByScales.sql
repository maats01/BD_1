DELIMITER //

CREATE PROCEDURE GetFlightsByScales
(IN pScaleId int)
BEGIN
	SELECT
		v.*
	FROM
		voos as v,
		voos_escalas as ves
	WHERE
		ves.id_escala = pScaleId AND
		ves.id_voo = v.id;
END //

DELIMITER ;