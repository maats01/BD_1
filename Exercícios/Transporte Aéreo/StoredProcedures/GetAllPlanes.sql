DELIMITER //

CREATE PROCEDURE GetAllPlanes()
BEGIN
	SELECT 
	MODELO,
    FABRICANTE,
    TIPO
FROM
	aeronaves as aero,
    fabricantes as fab,
    tipos_aeronaves as tipos
WHERE
	aero.id_fabricante = fab.id AND
    tipos.id = aero.id_tipo
ORDER BY
	tipos.TIPO;
END //

DELIMITER ;