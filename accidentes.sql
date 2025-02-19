DROP DATABASE  if exists Accidentes;
CREATE DATABASE if not exists Accidentes;
USE Accidentes;
CREATE TABLE if not exists Accidente(
	Cod_accidente int not null unique auto_increment,
    nombre varchar(20) not null,
    posicionvertical varchar(20) not null,
    posicionhorizontal varchar(20) not null,
    primary key (Cod_accidente)
);
CREATE TABLE if not exists Pais(
    nombre varchar(20) not null unique,
    extension varchar(20) not null,
    poblacion varchar(20) not null,
    primary key (nombre)
);
CREATE TABLE if not exists Localidad(
	Cod_localidad int not null unique auto_increment,
    nombrepais varchar(20) not null,
    nombre varchar(20) not null,
	foreign key (nombrepais)
		references Pais(nombre)
        on delete no action,
    primary key (Cod_localidad)
);
CREATE TABLE if not exists Rios(
	Cod_accidente int not null unique auto_increment,
    longitud varchar(20) not null,
	foreign key (Cod_accidente)
		references Accidente(Cod_accidente)
        on delete no action,
    primary key (Cod_accidente)
);
CREATE TABLE if not exists Lagos(
	Cod_accidente int not null unique auto_increment,
    extension varchar(20) not null,
	foreign key (Cod_accidente)
		references Accidente(Cod_accidente)
        on delete no action,
    primary key (Cod_accidente)
);
CREATE TABLE if not exists Montanhas(
	Cod_accidente int not null unique auto_increment,
    altura varchar(20) not null,
	foreign key (Cod_accidente)
		references Accidente(Cod_accidente)
        on delete no action,
    primary key (Cod_accidente)
);
CREATE TABLE if not exists Accidentepais(
	Cod_accidentepais int not null unique auto_increment,
    nombrepais varchar(20) not null unique,
    Cod_accidente int not null unique,
	foreign key (nombrepais)
		references Pais(nombre)
        on delete no action,
	foreign key (Cod_accidente)
		references Accidente(Cod_accidente)
        on delete no action,
    primary key (Cod_accidentepais)
);
CREATE TABLE if not exists Localidadrios(
	Cod_Localidadrios int not null unique auto_increment,
    Cod_localidad int not null unique,
    Cod_accidente int not null unique,
	foreign key (Cod_localidad)
		references Localidad(Cod_localidad)
        on delete no action,
	foreign key (Cod_accidente)
		references Accidente(Cod_accidente)
        on delete no action,
    primary key (Cod_Localidadrios)
);

alter table Accidente change column nombre nombre varchar(150) not null;
alter table Accidente add column descubridor varchar(30) not null;
alter table Pais drop column Poblacion;
alter table Pais add column idioma varchar(30) not null;
alter table Rios add column nacimiento varchar(100);
alter table Rios add column desembocadura varchar(100);
alter table Lagos add column volumen varchar(50);
alter table Montanhas add column cordilleras varchar(50);
