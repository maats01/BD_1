/* SELECIONANDO AERONAVES E ORDENANDO POR TIPO */
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
    
/* LISTAGEM DE VÔOS POR PERÍODO */
CALL GetFlightsBetweenDates('2024-06-01', '2024-06-30');

/* LISTAGEM DE VÔOS QUE FAZEM ESCALA EM UM DETERMINADO LOCAL */
CALL GetFlightsByScales(4);

/* EXIBINDO ASSENTOS LIVRES EM UM DETERMINADO VOO */
CALL GetFreeSeatsById(6);
