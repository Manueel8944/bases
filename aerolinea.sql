DROP DATABASE  if exists Aerolinea;
CREATE DATABASE if not exists Aerolinea;
USE Aerolinea;
CREATE TABLE if not exists Clientes(
	Cod_cliente int not null unique auto_increment,
    dni varchar(9) not null unique,
    nombre varchar(20) not null,
    apellidos varchar(20),
    email varchar(30),
    telefono varchar(11) unique,
    primary key (Cod_cliente)
);
CREATE TABLE if not exists Reservas(
	Cod_reserva int not null unique auto_increment,
    plazas int not null,
    Cod_tarjetac int not null unique,
    primary key (Cod_reserva)
);
CREATE TABLE if not exists Tarjetascredito(
	Cod_tarjetac int not null unique auto_increment,
    numero int not null,
    primary key (Cod_tarjetac)
);
CREATE TABLE if not exists Vuelos(
	Cod_vuelo int not null unique auto_increment,
    fecha date not null,
    horasalida time not null,
    horallegada time not null,
    aeropuertosalida varchar(20) not null,
    aeropuertollegada varchar(20) not null,
    primary key (Cod_vuelo)
);
CREATE TABLE if not exists Tarjetasembarque(
	Cod_embarque int not null unique auto_increment,
    cliente_dni varchar(9) not null,
    cliente_nombre varchar(20) not null,
    cliente_apellidos varchar(20) not null,
    cliente_telefono varchar(11) not null,
    primary key (Cod_embarque)
);
CREATE TABLE if not exists Avion(
	Cod_avion int not null unique auto_increment,
    nplazas int not null,
    primary key (Cod_avion)
);
CREATE TABLE if not exists Asiento(
	Cod_asiento int not null unique auto_increment,
    fila varchar(10) not null,
    columna varchar(10) not null,
    planta varchar(10) not null,
    Cod_avion int not null unique,
    primary key (Cod_asiento)
);
CREATE TABLE if not exists Aeropuerto(
	Cod_aeropuerto int not null unique auto_increment,
    nombre varchar(20) not null,
    localidad varchar(20) not null,
    pais varchar(20) not null,
    primary key (Cod_aeropuerto)
);

CREATE TABLE if not exists ClienteReservaVuelo(
	Cod_clientereservavuelo int not null unique auto_increment,
	Cod_cliente int not null,
    Cod_reserva int not null,
    Cod_vuelo int not null,
    foreign key (Cod_cliente)
		references Clientes(Cod_cliente)
        on delete no action,
	foreign key (Cod_reserva)
		references Reservas(Cod_reserva)
        on delete no action,
	foreign key (Cod_vuelo)
		references Vuelos(Cod_vuelo)
        on delete no action,
    primary key (Cod_clientereservavuelo)
);

alter table Reservas add foreign key (Cod_tarjetac) references Tarjetascredito(Cod_tarjetac);
alter table Asiento add foreign key (Cod_avion) references Avion(Cod_avion);