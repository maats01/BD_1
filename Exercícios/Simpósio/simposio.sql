create database simposio;
use simposio;

<<<<<<< HEAD
create table APRESENTADORES(
=======
create table SIMPOSIOS(
	ID int not null auto_increment primary key,
    DATA_INICIO datetime not null,
    DATA_FIM datetime not null
);

create table PESSOAS(
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
	ID int not null auto_increment primary key,
    NOME varchar(255) not null
);

<<<<<<< HEAD
=======
create table ORGANIZADORES(
	ID int not null auto_increment primary key,
    ID_PESSOA int,
    foreign key (ID_PESSOA) references PESSOAS(ID)
);

create table APRESENTADORES(
	ID int not null auto_increment primary key,
    ID_PESSOA int,
    foreign key (ID_PESSOA) references PESSOAS(ID)
);

>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
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
<<<<<<< HEAD
	NOME_AUTOR varchar(255) not null,
    ID_ARTIGO int,
    foreign key (ID_ARTIGO) references ARTIGOS(ID)
=======
    ID_PESSOA int,
    foreign key (ID_PESSOA) references PESSOAS(ID)
);

create table ARTIGOS_AUTORES(
	ID int not null auto_increment primary key,
	ID_AUTOR int,
    ID_ARTIGO int,
    foreign key (ID_ARTIGO) references ARTIGOS(ID),
    foreign key (ID_AUTOR) references AUTORES(ID)
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
);

create table PALESTRANTES(
	ID int not null auto_increment primary key,
<<<<<<< HEAD
    NOME varchar(255) not null
=======
    ID_PESSOA int,
    foreign key (ID_PESSOA) references PESSOAS(ID)
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
);

create table INSCRITOS(
	ID int not null auto_increment primary key,
<<<<<<< HEAD
    NOME varchar(255) not null
=======
    ID_PESSOA int,
    foreign key (ID_PESSOA) references PESSOAS(ID)
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
);

create table MINICURSOS(
	ID int not null auto_increment primary key,
<<<<<<< HEAD
=======
    ID_SIMPOSIO int,
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
    ID_APRESENTADOR int,
    ID_TEMA int,
    NOME_CURSO varchar(255),
    HORARIO_INICIO datetime not null,
    HORARIO_FIM datetime not null,
    foreign key (ID_APRESENTADOR) references APRESENTADORES(ID),
    foreign key (ID_TEMA) references TEMAS(ID),
<<<<<<< HEAD
=======
    foreign key (ID_SIMPOSIO) references SIMPOSIOS(ID),
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
    unique (ID_APRESENTADOR, HORARIO_INICIO)
);

create table PALESTRAS(
	ID int not null auto_increment primary key,
<<<<<<< HEAD
=======
    ID_SIMPOSIO int,
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
    ID_PALESTRANTE int,
    ID_TEMA int,
    TITULO varchar(255),
    HORARIO_INICIO datetime not null,
    HORARIO_FIM datetime not null,
    foreign key (ID_PALESTRANTE) references PALESTRANTES(ID),
    foreign key (ID_TEMA) references TEMAS(ID),
<<<<<<< HEAD
    unique (ID_PALESTRANTE, HORARIO_INICIO)
);

=======
    foreign key (ID_SIMPOSIO) references SIMPOSIOS(ID),
    unique (ID_PALESTRANTE, HORARIO_INICIO)
);

create table SIMPOSIOS_ORGANIZADORES(
	ID int not null auto_increment primary key,
    ID_SIMPOSIO int,
    ID_ORGANIZADOR int,
    foreign key (ID_SIMPOSIO) references SIMPOSIOS(ID),
    foreign key (ID_ORGANIZADOR) references ORGANIZADORES(ID)
);

>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
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
<<<<<<< HEAD
    PARECER varchar(255),
=======
    PARECER text,
>>>>>>> 3449e6d2a8f8f32b899bd9c5e69e2ce096bb76c8
    foreign key (ID_COMISS_CIENTIFICA) references COMISSOES_CIENTIFICAS(ID),
    foreign key (ID_ARTIGO) references ARTIGOS(ID),
    unique (ID_ARTIGO)
);
