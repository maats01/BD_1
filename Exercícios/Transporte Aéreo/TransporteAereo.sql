create schema TRANSPORTE_AEREO;
use TRANSPORTE_AEREO;

create table AEROPORTOS
(
	ID int auto_increment primary key,
    NOME varchar(255) not null,
    CIDADE varchar(255) not null,
    ESTADO varchar(255) not null,
    PAIS varchar(255) not null
);

create table PESSOAS
(
	ID int auto_increment primary key,
    NOME varchar(255)
);

create table TIPOS_AERONAVES
(
	ID int auto_increment primary key,
    TIPO_DESC varchar(255)
);

create table ASSENTOS
(
	ID int auto_increment primary key,
    LADO varchar(10),
    POSICAO varchar(20),
    LINHA int not null
);

create table AERONAVES
(
	ID int auto_increment primary key,
    ID_TIPO int not null,
    NUM_ASSENTOS int not null,
    foreign key (ID_TIPO) references TIPOS_AERONAVES(ID)
);

create table PILOTOS
(
	ID int auto_increment primary key,
    ID_PESSOA int not null,
    foreign key (ID_PESSOA) references PESSOAS(ID)
);

create table VOOS
(
	ID int auto_increment primary key,
    ID_AEROPORTO_ORIGEM int not null,
    ID_AEROPORTO_DESTINO int not null,
    ID_AERONAVE int not null,
    ID_PILOTO int not null,
    NUM_ASSENTOS_OCUPADOS int not null,
    HORARIO_SAIDA datetime not null,
    HORARIO_CHEGADA datetime not null,
    foreign key (ID_AEROPORTO_ORIGEM) references AEROPORTOS(ID),
    foreign key (ID_AEROPORTO_DESTINO) references AEROPORTOS(ID),
    foreign key (ID_AERONAVE) references AERONAVES(ID),
    foreign key (ID_PILOTO) references PILOTOS(ID)
);

create table PASSAGEIROS
(
	ID int auto_increment primary key,
    ID_PESSOA int not null,
    foreign key (ID_PESSOA) references PESSOAS(ID)
);

create table ASSENTOS_PASSAGEIROS_VOOS
(
	ID int auto_increment primary key,
    ID_VOO int not null,
    ID_ASSENTO int not null,
    ID_PASSAGEIRO int,
    foreign key (ID_VOO) references VOOS(ID),
    foreign key (ID_ASSENTO) references ASSENTOS(ID),
    foreign key (ID_PASSAGEIRO) references PASSAGEIROS(ID)
);

create table ESCALAS
(
	ID int auto_increment primary key,
    ID_AEROPORTO int not null,
    foreign key (ID_AEROPORTO) references AEROPORTOS(ID)
);

create table VOOS_ESCALAS
(
	ID int auto_increment primary key,
    ID_VOO int not null,
    ID_ESCALA int not null,
    HORARIO_CHEGADA datetime not null,
    HORARIO_SAIDA datetime not null,
    foreign key (ID_VOO) references VOOS(ID),
    foreign key (ID_ESCALA) references ESCALAS(ID)
);