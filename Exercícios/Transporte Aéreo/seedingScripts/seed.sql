use TRANSPORTE_AEREO;

select * from aeroportos;
select * from pessoas;
select * from pilotos;
select * from passageiros;
select * from assentos;
select * from aeronaves;
select * from voos;
select * from escalas;
select * from voos_escalas;
select * from assentos_passageiros_voos;

/* INSERINDO VÔOS */
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (1, 5, 2, 7, '2024-06-01 09:00:00', '2024-06-01 14:30:00');
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (1, 3, 4, 1, '2024-06-05 15:00:00', '2024-06-05 19:30:00');
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (2, 7, 1, 3, '2024-06-15 16:00:00', '2024-06-15 21:30:00');
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (3, 4, 3, 10, '2024-05-01 18:00:00', '2024-07-01 02:30:00');
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (4, 3, 5, 15, '2024-05-25 15:00:00', '2024-05-25 19:30:00');
INSERT INTO voos(ID_AEROPORTO_ORIGEM, ID_AEROPORTO_DESTINO, ID_AERONAVE, ID_PILOTO, HORARIO_SAIDA, HORARIO_CHEGADA) VALUES (5, 6, 6, 4, '2024-05-28 13:00:00', '2024-05-28 18:30:00');

/* INSERINDO RELAÇÕES DE VÔOS E ESCALAS */
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(1, 3, '2024-06-01 12:00:00', '2024-06-01 13:00:00');
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(2, 3, '2024-06-05 16:45:00', '2024-06-05 17:45:00');
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(3, 2, '2024-06-15 18:00:00', '2024-06-15 19:00:00');
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(4, 4, '2024-05-01 19:30:00', '2024-05-01 20:45:00');
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(4, 3, '2024-05-01 22:45:00', '2024-05-01 23:45:00');
INSERT INTO voos_escalas(ID_VOO, ID_ESCALA, HORARIO_CHEGADA, HORARIO_SAIDA)
VALUES(5, 4, '2024-05-25 17:00:00', '2024-05-25 17:45:00');