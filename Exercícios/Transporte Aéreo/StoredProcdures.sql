DELIMITER //

CREATE PROCEDURE GetAllPlanes()
BEGIN
	SELECT 
		MODELO,
		FABRICANTE,
		TIPO,
		NUM_ASSENTOS
	FROM
		AERONAVES AS aero,
		FABRICANTES AS fab,
		TIPOS_AERONAVES AS tipos
	WHERE
		aero.ID_FABRICANTE = fab.ID AND
		tipos.ID = aero.ID_TIPO
	ORDER BY
		tipos.TIPO;
END //

CREATE PROCEDURE GetFlightsBetweenDates
(IN pDateStart date, IN pDateEnd date)
BEGIN
	SELECT 
		v.ID AS VOO_ID,
        aero_origem.NOME_AEROPORTO AS ORIGEM,
        aero_origem.ESTADO AS ESTADO_ORIGEM,
        aero_destino.NOME_AEROPORTO AS DESTINO,
        aero_destino.ESTADO AS ESTADO_DESTINO,
        v.ID_AERONAVE,
        v.ID_PILOTO,
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
		v.ID_AEROPORTO_DESTINO = aero_destino.ID
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
			v.ID_PILOTO,
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
		ID_VOO,
		ID_ASSENTO,
		LADO,
		POSICAO,
		LINHA
	FROM
		ASSENTOS AS ass,
		ASSENTOS_PASSAGEIROS_VOOS AS apv
	WHERE
		apv.ID_VOO = Id AND
		apv.ID_PASSAGEIRO IS NULL AND
		apv.ID_ASSENTO = ass.ID;
	SELECT
		NUM_ASSENTOS_LIVRES
	FROM
		VOOS
	WHERE
		voos.ID = Id;
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
        v.ID_PILOTO,
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

CREATE PROCEDURE GetFlightById
(IN pId int)
BEGIN
	SELECT 
		v.ID AS VOO_ID,
        aero_origem.NOME_AEROPORTO AS ORIGEM,
        aero_origem.ESTADO AS ESTADO_ORIGEM,
        aero_destino.NOME_AEROPORTO AS DESTINO,
        aero_destino.ESTADO AS ESTADO_DESTINO,
        v.ID_AERONAVE,
        v.ID_PILOTO,
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
		v.ID_AEROPORTO_DESTINO = aero_destino.ID
	WHERE
		v.ID = pId;
END //

CREATE PROCEDURE GetValuableCostumers
(IN pLimit int)
BEGIN
	SELECT DISTINCT 
		COUNT(ID_VOO) AS TOTAL_VOO, P.NOME_COMPLETO
	FROM 
		assentos_passageiros_voos AS APV
	JOIN 
		PESSOAS AS P 
	ON 
		APV.ID_PASSAGEIRO = P.ID
	GROUP BY P.NOME_COMPLETO
	ORDER BY TOTAL_VOO DESC
	LIMIT pLimit;
END //
DELIMITER ;