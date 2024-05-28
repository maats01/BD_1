create database simposio;
use simposio;

create table APRESENTADORES(
	ID int not null auto_increment primary key,
    NOME varchar(255) not null
);

create table TEMAS(
	ID int not null auto_increment primary key,
    TEMA varchar(255) not null,
    unique (TEMA)
);

create table COMISSOES_CIENTIFICAS(
	ID int not null auto_increment primary key,
    ID_TEMA int,
    foreign key (ID_TEMA) references TEMAS(ID),
    unique (ID_TEMA)
);

create table ARTIGOS(
	ID int not null auto_increment primary key,
    TITULO varchar(255) not null,
    ID_TEMA int,
    foreign key (ID_TEMA) references TEMAS(ID)
);

create table AUTORES(
	ID int not null auto_increment primary key,
	NOME_AUTOR varchar(255) not null,
    ID_ARTIGO int,
    foreign key (ID_ARTIGO) references ARTIGOS(ID)
);

create table PALESTRANTES(
	ID int not null auto_increment primary key,
    NOME varchar(255) not null
);

create table INSCRITOS(
	ID int not null auto_increment primary key,
    NOME varchar(255) not null
);

create table MINICURSOS(
	ID int not null auto_increment primary key,
    ID_APRESENTADOR int,
    ID_TEMA int,
    NOME_CURSO varchar(255),
    HORARIO_INICIO datetime not null,
    HORARIO_FIM datetime not null,
    foreign key (ID_APRESENTADOR) references APRESENTADORES(ID),
    foreign key (ID_TEMA) references TEMAS(ID),
    unique (ID_APRESENTADOR, HORARIO_INICIO)
);

create table PALESTRAS(
	ID int not null auto_increment primary key,
    ID_PALESTRANTE int,
    ID_TEMA int,
    TITULO varchar(255),
    HORARIO_INICIO datetime not null,
    HORARIO_FIM datetime not null,
    foreign key (ID_PALESTRANTE) references PALESTRANTES(ID),
    foreign key (ID_TEMA) references TEMAS(ID),
    unique (ID_PALESTRANTE, HORARIO_INICIO)
);

create table INSCRITOS_PALESTRAS(
	ID int not null auto_increment primary key,
    ID_INSCRITO int,
    ID_PALESTRA int,
    foreign key (ID_INSCRITO) references INSCRITOS(ID),
    foreign key (ID_PALESTRA) references PALESTRAS(ID),
    unique (ID_INSCRITO, ID_PALESTRA)
);

create table INSCRITOS_MINICURSOS(
	ID int not null auto_increment primary key,
    ID_INSCRITO int,
    ID_MINICURSO int,
    foreign key (ID_INSCRITO) references INSCRITOS(ID),
    foreign key (ID_MINICURSO) references MINICURSOS(ID),
    unique (ID_INSCRITO, ID_MINICURSO)
);

create table ARTIGOS_COMISSOES_CIENTIFICAS(
	ID int not null auto_increment primary key,
    ID_COMISS_CIENTIFICA int,
    ID_ARTIGO int,
    PARECER varchar(255),
    foreign key (ID_COMISS_CIENTIFICA) references COMISSOES_CIENTIFICAS(ID),
    foreign key (ID_ARTIGO) references ARTIGOS(ID),
    unique (ID_ARTIGO)
);
