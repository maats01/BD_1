DELIMITER //

CREATE PROCEDURE GetFlightsBetweenDates
(IN pDateStart date, IN pDateEnd date)
BEGIN
	SELECT *
    FROM
		voos as v
	WHERE
		v.HORARIO_SAIDA BETWEEN pDateStart AND pDateEnd;
END //

DELIMITER ;