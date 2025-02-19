DROP DATABASE  if exists Futbol;
CREATE DATABASE if not exists Futbol;
USE Futbol;
CREATE TABLE if not exists Estadio(
	Cod_estadio int not null unique auto_increment,
    nombre varchar(20) not null,
    primary key (Cod_estadio)
);
CREATE TABLE if not exists Arbitro(
	Cod_arbitro int not null unique auto_increment,
    nombre varchar(20) not null,
    primary key (Cod_arbitro)
);
CREATE TABLE if not exists Equipo(
	Cod_equipo int not null unique auto_increment,
    presidente varchar(20) not null,
    nombre varchar(20) not null,
    Cod_estadio int not null,
	foreign key (Cod_estadio)
		references Estadio(Cod_estadio)
        on delete no action,
    primary key (Cod_equipo)
);
CREATE TABLE if not exists Jugador(
	Cod_jugador int not null unique auto_increment,
    edad int not null,
    nombre varchar(20) not null,
    Cod_equipo int not null,
	foreign key (Cod_equipo)
		references Equipo(Cod_equipo)
        on delete no action,
    primary key (Cod_jugador)
);
CREATE TABLE if not exists Partido(
	Cod_partido int not null unique auto_increment,
    goleslocal int not null,
    golesvisitante int not null,
    Cod_equipolocal int not null,
    Cod_equipovisitante int not null,
    Cod_estadio int not null,
    Cod_arbitroprincipal int not null,
    Cod_linier1 int not null,
    Cod_linier2 int not null,
    Cod_arbitro4 int not null,
	foreign key (Cod_equipolocal)
		references Equipo(Cod_equipo)
        on delete no action,
	foreign key (Cod_equipovisitante)
		references Equipo(Cod_equipo)
        on delete no action,
	foreign key (Cod_estadio)
		references Estadio(Cod_estadio)
        on delete no action,
	foreign key (Cod_arbitroprincipal)
		references Arbitro(Cod_arbitro)
        on delete no action,
	foreign key (Cod_linier1)
		references Arbitro(Cod_arbitro)
        on delete no action,
	foreign key (Cod_linier2)
		references Arbitro(Cod_arbitro)
        on delete no action,
	foreign key (Cod_arbitro4)
		references Arbitro(Cod_arbitro)
        on delete no action,
    primary key (Cod_partido)
);
CREATE TABLE if not exists JugadorTitular(
	Cod_jugadortitular int not null unique auto_increment,
    minutos int not null,
    Cod_jugador int not null,
    Cod_partido int not null,
	foreign key (Cod_jugador)
		references Jugador(Cod_jugador)
        on delete no action,
	foreign key (Cod_partido)
		references Partido(Cod_partido)
        on delete no action,
    primary key (Cod_jugadortitular)
);
CREATE TABLE if not exists JugadorSuplente(
	Cod_jugadorsuplente int not null unique auto_increment,
    minuto int not null,
    Cod_jugador int not null,
    Cod_partido int not null,
	foreign key (Cod_jugador)
		references Jugador(Cod_jugador)
        on delete no action,
	foreign key (Cod_partido)
		references Partido(Cod_partido)
        on delete no action,
    primary key (Cod_jugadorsuplente)
);
CREATE TABLE if not exists Incidencia(
	Cod_incidencia int not null unique auto_increment,
    minuto int not null,
    descripcion varchar(200) not null,
    Cod_partido int not null,
	foreign key (Cod_partido)
		references Partido(Cod_partido)
        on delete no action,
    primary key (Cod_incidencia)
);
CREATE TABLE if not exists IncidenciaJugador(
	Cod_incidenciajugador int not null unique auto_increment,
    Cod_jugador int not null,
    Cod_incidencia int not null,
	foreign key (Cod_jugador)
		references Jugador(Cod_jugador)
        on delete no action,
	foreign key (Cod_incidencia)
		references Incidencia(Cod_incidencia)
        on delete no action,
    primary key (Cod_incidenciajugador)
);

alter table Jugador add column (golescarrera int,nacionalidad varchar(20),extranjero boolean);
alter table Equipo add column (fechafundacion date not null,ciudad varchar(20));
alter table Estadio add column (capacidad int,fechaconstruccion date,fecharemodelacion date);
alter table Arbitro add column (nevera varchar(20),especialidad varchar(20));
alter table Jugador modify extranjero varchar(2);
alter table Arbitro modify nevera varchar(2);
alter table Incidencia add column tipo varchar(20);
