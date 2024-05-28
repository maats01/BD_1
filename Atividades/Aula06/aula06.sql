CREATE DATABASE NOTA_FISCAL_NORMALIZADA;

USE NOTA_FISCAL_NORMALIZADA;

CREATE TABLE NOTA_FISCAL (
	NRO_NOTA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(255) NOT NULL,
    END_CLIENTE VARCHAR(255) NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
    DT_EMISSAO DATETIME DEFAULT CURRENT_TIMESTAMP,
    VL_TOTAL_NOTA FLOAT NOT NULL
);

CREATE TABLE PRODUTO (
	COD_PRODUTO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DESC_PRODUTO VARCHAR(255) NOT NULL,
    UN_MEDIDA VARCHAR(2) NOT NULL,
    VL_PRODUTO FLOAT NOT NULL
);

CREATE TABLE ITEM_NOTA_FISCAL (
	NRO_NOTA INT NOT NULL,
    COD_PRODUTO INT NOT NULL,
    QTD_PRODUTO INT NOT NULL,
    VL_PRODUTO FLOAT NOT NULL,
    VL_TOTAL FLOAT NOT NULL,
    PRIMARY KEY (NRO_NOTA, COD_PRODUTO),
    CONSTRAINT FK_NRO_NOTA_NOTA_FISCAL FOREIGN KEY (NRO_NOTA) REFERENCES NOTA_FISCAL(NRO_NOTA),
    CONSTRAINT FK_COD_PRODUTO_PRODUTO FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)
);

-- PRODUTOS

INSERT INTO PRODUTO (DESC_PRODUTO, UN_MEDIDA, VL_PRODUTO)
VALUES ('Leite', 'LT', 4.50);

INSERT INTO PRODUTO (DESC_PRODUTO, UN_MEDIDA, VL_PRODUTO)
VALUES ('Desodorante', 'UN', 8.00);

INSERT INTO PRODUTO (DESC_PRODUTO, UN_MEDIDA, VL_PRODUTO)
VALUES ('Salame', 'KG', 40.00);

-- NOTA FISCAL

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VL_TOTAL_NOTA)
VALUES ('Aragorn', 'Terra Média', 'Bilbo', 100.00);

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VL_TOTAL_NOTA)
VALUES ('Gandalf', 'Terra Média', 'Frodo', 100.00);

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VL_TOTAL_NOTA)
VALUES ('Boromir', 'Mordor', 'Sam', 100.00);

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VL_TOTAL_NOTA)
VALUES ('Galadriel', 'Valinor', 'Saruman', 100.00);

-- ITENS DA NOTA

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (1, 1, 1, 4.50, 4.50);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (1, 2, 1, 80.00, 80.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (1, 3, 10, 100.00, 1000.00);

--
INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (2, 1, 1, 9.00, 9.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (2, 2, 1, 80.00, 160.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (2, 3, 10, 200.00, 2000.00);

--
INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (3, 1, 1, 18.00, 18.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (3, 2, 1, 160.00, 320.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (3, 3, 10, 400.00, 4000.00);

--
INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (4, 1, 1, 36.00, 36.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (4, 2, 1, 420.00, 840.00);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRODUTO, VL_TOTAL)
VALUES (4, 3, 10, 800.00, 8000.00);

SELECT * FROM NOTA_FISCAL;
SELECT * FROM ITEM_NOTA_FISCAL;
