use TRANSPORTE_AEREO;

/* INSERINDO AEROPORTOS */
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto de Guarulhos', 'São Paulo', 'São Paulo', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional de Recife/Guararapes - Gilberto Freyre', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional de Congonhas', 'São Paulo', 'São Paulo', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional de Brasília', 'Brasília', 'Distrito Federal', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional do Rio de Janeiro/Galeão - Antônio Carlos Jobim', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional Afonso Pena', 'São José dos Pinhais', 'Paraná', 'Brasil');
INSERT INTO aeroportos(NOME_AEROPORTO, CIDADE, ESTADO, PAIS) 
VALUES ('Aeroporto Internacional de Salvador - Deputado Luís Eduardo Magalhães', 'Salvador', 'Bahia', 'Brasil');

/* INSERINDO ESCALAS */
INSERT INTO escalas(ID_AEROPORTO) VALUES(5), (3), (7), (2), (4), (1), (6);

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