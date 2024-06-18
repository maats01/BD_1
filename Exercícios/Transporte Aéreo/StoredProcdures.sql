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

CREATE PROCEDURE GetFlightsBetweenDates
(IN pDateStart date, IN pDateEnd date)
BEGIN
	SELECT *
    FROM
		voos as v
	WHERE
		v.HORARIO_SAIDA BETWEEN pDateStart AND pDateEnd;
END //

CREATE PROCEDURE GetFlightsByScales
(IN pCityOrState varchar(255), IN bTrueOrFalse bool)
BEGIN
	IF bTrueOrFalse THEN
		/* pesquisa por cidade */
		SELECT 
			v.ID AS VOO_ID,
			aero_origem.NOME_AEROPORTO AS ORIGEM,
			aero_origem.ESTADO AS ESTADO_ORIGEM,
			aero_destino.NOME_AEROPORTO AS DESTINO,
			aero_destino.ESTADO AS ESTADO_DESTINO,
			v.ID_AERONAVE,
			v.ID_PILOTO AS PILOTO,
			v.NUM_ASSENTOS_OCUPADOS,
			v.NUM_ASSENTOS_LIVRES,
			v.HORARIO_SAIDA,
			v.HORARIO_CHEGADA
		FROM
			VOOS AS v
		INNER JOIN 
			VOOS_ESCALAS AS ves
		ON 
			v.ID = ves.ID_VOO
		INNER JOIN 
			ESCALAS AS esc
		ON 
			ves.ID_ESCALA = esc.ID
		INNER JOIN 
			AEROPORTOS AS aero
		ON 
			esc.ID_AEROPORTO = aero.ID
		INNER JOIN 
			AEROPORTOS AS aero_origem
		ON 
			v.ID_AEROPORTO_ORIGEM = aero_origem.ID
		INNER JOIN 
			AEROPORTOS AS aero_destino
		ON 
			v.ID_AEROPORTO_DESTINO = aero_destino.ID
		WHERE 
			aero.CIDADE = pCityOrState;
		SELECT
			*
		FROM
			AEROPORTOS
		WHERE
			AEROPORTOS.CIDADE = pCityOrState;
	ELSE
		/* pesquisa por estado */
		SELECT 
			v.ID AS VOO_ID,
			aero_origem.NOME_AEROPORTO AS ORIGEM,
			aero_origem.ESTADO AS ESTADO_ORIGEM,
			aero_destino.NOME_AEROPORTO AS DESTINO,
			aero_destino.ESTADO AS ESTADO_DESTINO,
			v.ID_AERONAVE,
			v.ID_PILOTO AS PILOTO,
			v.NUM_ASSENTOS_OCUPADOS,
			v.NUM_ASSENTOS_LIVRES,
			v.HORARIO_SAIDA,
			v.HORARIO_CHEGADA
		FROM
			VOOS AS v
		INNER JOIN 
			VOOS_ESCALAS AS ves
		ON 
			v.ID = ves.ID_VOO
		INNER JOIN 
			ESCALAS AS esc
		ON 
			ves.ID_ESCALA = esc.ID
		INNER JOIN 
			AEROPORTOS AS aero
		ON 
			esc.ID_AEROPORTO = aero.ID
		INNER JOIN 
			AEROPORTOS AS aero_origem
		ON 
			v.ID_AEROPORTO_ORIGEM = aero_origem.ID
		INNER JOIN 
			AEROPORTOS AS aero_destino
		ON 
			v.ID_AEROPORTO_DESTINO = aero_destino.ID
		WHERE 
			aero.ESTADO = pCityOrState;
		SELECT
			*
		FROM
			AEROPORTOS
		WHERE
			AEROPORTOS.ESTADO = pCityOrState;
	END IF;
END //

CREATE PROCEDURE GetFreeSeatsByFlightId
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

CREATE PROCEDURE GetAllFlights()
BEGIN
	SELECT 
		v.ID AS VOO_ID,
        aero_origem.NOME_AEROPORTO AS ORIGEM,
        aero_origem.ESTADO AS ESTADO_ORIGEM,
        aero_destino.NOME_AEROPORTO AS DESTINO,
        aero_destino.ESTADO AS ESTADO_DESTINO,
        v.ID_AERONAVE,
        v.ID_PILOTO AS PILOTO,
        v.NUM_ASSENTOS_OCUPADOS,
        v.NUM_ASSENTOS_LIVRES,
        v.HORARIO_SAIDA,
        v.HORARIO_CHEGADA
	FROM
        VOOS as v
	INNER JOIN 
		AEROPORTOS AS aero_origem
	ON
		v.ID_AEROPORTO_ORIGEM = aero_origem.ID
	INNER JOIN
		AEROPORTOS AS aero_destino
	ON
		v.ID_AEROPORTO_DESTINO = aero_destino.ID;
END //

DELIMITER ;