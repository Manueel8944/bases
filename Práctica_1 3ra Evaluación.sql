DROP DATABASE  if exists Hotel;
CREATE DATABASE if not exists Hotel;
USE Hotel;

# 2. Creación de tablas
CREATE TABLE if not exists Cliente(
    dni varchar(9) not null,
    nombre varchar(10),
    apellidos varchar(30),
    domicilio varchar(30),
    telefono varchar(9)
);

CREATE TABLE if not exists Habitacion(
    numero int not null,
    superficie int,
    bar varchar(2) check (bar in ('Si', 'No')),
    terraza varchar(2) check (terraza in ('Si', 'No')),
    puedesupletoria varchar(2) check (puedesupletoria in ('Si', 'No')),
    tipo varchar(10) check (tipo in ("Individual", "Doble")) not null
);

CREATE TABLE if not exists Precio(
    tipo varchar(10) check (tipo in ("Individual", "Doble")) not null,
    precio int
);

CREATE TABLE if not exists Factura(
    codigof int not null,
    entrada date,
    salida date,
    dni varchar(9),
    numero int not null,
    supletoria int,
    forma varchar(8) check (forma in ("Efectivo", "Tarjeta", "Talón"))
);

CREATE TABLE if not exists Servicio(
    cods int not null,
    descripcion varchar(11) check (descripcion in ("Tintorería", "Plancha", "Lavandería", "Bar", "Restaurante", "Floristería")),
    costeinterno int,
    numreg int not null
);

CREATE TABLE if not exists FormaPago(
    forma varchar(8) check (forma in ("Efectivo", "Tarjeta", "Talón")),
    comision int
);

CREATE TABLE if not exists Empleado(
    numreg int not null,
    nombre varchar(30),
    incorporacion date,
    sueldo int,
    cods int,
    `code` int,
    coste int
);

CREATE TABLE if not exists Proveedor(
    nif varchar(10) not null,
    nombre varchar(16),
    direccion varchar(30),
    numreg int not null
);

CREATE TABLE if not exists Factura_Prov(
    codfp int not null,
    fecha date,
    importe int,
    nif varchar(10) not null,
    numreg int not null
);

CREATE TABLE if not exists Empresa(
    `code` int,
	nombre varchar(20),
	direccion varchar(30)
);

CREATE TABLE if not exists Reserva(
    dni varchar(9) not null,
    numero int not null,
    entrada date,
    salida date
);

CREATE TABLE if not exists Incluye(
	codigof int not null,
    cods int not null,
    coste int,
    fecha date not null
);

CREATE TABLE if not exists Usa(
    cods int not null,
	servicio_cods int not null,
    fecha date not null    
);

CREATE TABLE if not exists Limpieza(
	numreg int not null,
    numero int not null,
    fecha date not null    
);

# 3. Modificación de tablas (creacion de claves primarias)

alter table Cliente add primary key (dni);
alter table Habitacion add primary key (numero);
alter table Precio add primary key (tipo);
alter table Factura add primary key (codigof);
alter table Servicio add primary key (cods);
alter table FormaPago add primary key (forma);
alter table Empleado add primary key (numreg);
alter table Proveedor add primary key (nif);
alter table Factura_Prov add primary key (codfp);
alter table Empresa add primary key (`code`);
alter table Reserva add primary key (dni, numero);
alter table Incluye add primary key (codigof, cods, fecha);
alter table Usa add primary key (cods, servicio_cods, fecha);
alter table Limpieza add primary key (numreg, numero, fecha);

# 4. Modificación de tablas (creacion de claves foraneas e integridad referencial)

alter table Habitacion add foreign key (tipo) references Precio(tipo) on delete no action; 
alter table Factura add foreign key (dni) references Cliente(dni) on delete no action; 
alter table Factura add foreign key (numero) references Habitacion(numero) on delete no action; 
alter table Factura add foreign key (forma) references FormaPago(forma) on delete no action; 
alter table Servicio add foreign key (numreg) references Empleado(numreg) on delete no action on update cascade; 
alter table Empleado add foreign key (cods) references Servicio(cods) on delete no action on update cascade; 
alter table Empleado add foreign key (`code`) references Empresa(`code`) on delete no action on update cascade; 
alter table Proveedor add foreign key (numreg) references Empleado(numreg) on delete no action on update cascade; 
alter table Factura_Prov add foreign key (nif) references Proveedor(nif) on delete no action on update cascade; 
alter table Factura_Prov add foreign key (numreg) references Empleado(numreg) on delete no action on update cascade; 
alter table Reserva add foreign key (dni) references Cliente(dni) on delete no action on update cascade; 
alter table Reserva add foreign key (numero) references Habitacion(numero) on delete no action on update cascade; 
alter table Incluye add foreign key (codigof) references Factura(codigof) on delete no action on update cascade; 
alter table Incluye add foreign key (cods) references Servicio(cods) on delete no action on update cascade; 
alter table Usa add foreign key (cods) references Servicio(cods) on delete no action on update cascade; 
alter table Usa add foreign key (servicio_cods) references Servicio(cods) on delete no action on update cascade; 
alter table Limpieza add foreign key (numreg) references Empleado(numreg) on delete no action on update cascade; 
alter table Limpieza add foreign key (numero) references Habitacion(numero) on delete no action on update cascade;

# 5. Inserción de datos

insert into Cliente(dni, nombre, apellidos, domicilio, telefono)
values 
    ("111111", "Antonio", "Aguirre", "Pez 20, 19A", "999418768"),
    ("222222", "Jorge", "Anguiano López", "Churruca 2, 69D", "999876737"),
    ("333333", "Pilar", "Méndez Alonso", "Gran vía 167", "999345343"),
    ("444444", "Azucena", "Rubio del Val", "Brasil 63 2ºA", "999456765"),
    ("555555", "Raúl", "Gutiérrez González", "Literatos 3, 5º", "999876234"),
    ("666666", "Santiago", "Rivera Romero", "Avda de la Paz 30", "999112332"),
    ("777777", "Pedro", "González Hernando", "Castellana 290, 99B", "999232222"),
    ("888888", "Antonio", "Díaz Martín", "Cuba 1", "999444554"),
    ("999999", "Virginia", "Fernández Fernández", "Brasil 65, 3º", "999090009"),
    ("000000", "Francisco", "Vilansó Rodríguez", "General Rodrigos, 24", "999667788");

insert into Precio(tipo, precio)
values
	("Individual", 75),
	("Doble", 90);

INSERT INTO Habitacion(numero, superficie, bar, terraza, puedesupletoria, tipo)
VALUES 
    (100, 17, "Si", "Si", "Si", "Doble"),
    (101, 17, "Si", "Si", "Si", "Doble"),
    (102, 17, "Si", "Si", "Si", "Individual"),
    (200, 17, "Si", "Si", "Si", "Doble"),
    (201, 17, "Si", "Si", "No", "Doble"),
    (202, 15, "Si", "Si", "No", "Individual"),
    (203, 17, "No", "Si", "Si", "Individual"),
    (204, 17, "Si", "Si", "Si", "Doble"),
    (300, 17, "No", "Si", "Si", "Doble"),
    (301, 17, "Si", "Si", "Si", "Doble");

insert into FormaPago(forma, comision)
values
	("Efectivo", 0),
	("Tarjeta", 2),
    ("Talón", 5);
    
insert into Empresa(`code`, nombre, direccion)
values
	("1", "Resources Consulting", "Avd. de los Recursos, 101"),
	("2", "Personal Servicing", "Plaza de Alquiler, 65");

insert into Empleado(numreg, nombre, incorporacion, sueldo, cods, `code`, coste)
values 
    (1, "Luisa Blanco Baroja", "1996-10-23", 1000, NULL, NULL, NULL),
    (2, "Fernando Serrano Vázquez", "1996-10-23", 1000, NULL, NULL, NULL),
    (3, "Manuel Pérez Calo", "2000-01-01", 900, NULL, NULL, NULL),
    (4, "Ana Troncoso Calvo", "2000-01-01", 900, NULL, NULL, NULL),
    (5, "Alba Troncoso Calvo", "2002-09-13", NULL, NULL, 1, 1100),
    (6, "Jorge Alonso Alonso", "2002-09-13", NULL, NULL, 1, 1100),
    (7, "Fernando Soaje Álvarez", "2003-01-01", NULL, NULL, 2, 1200),
    (8, "Rosa Luigi Paz", "2003-01-01", 1000, NULL, NULL, NULL),
    (9, "Rafael Fuertes Cabrera", "2003-01-01", 1100, NULL, NULL, NULL),
    (10, "Antonio Sancho Sancho", "2003-01-01", 1000, NULL, NULL, NULL),
    (11, "María Gonzalo Fuentes", "2003-01-01", 1000, NULL, NULL, NULL),
    (12, "Juana Peláez Trasto", "2003-01-01", 900, NULL, NULL, NULL),
    (13, "Gonzalo Cabezas Muiño", "2003-01-01", 1500, NULL, NULL, NULL);

insert into Servicio(cods, descripcion, costeinterno, numreg)
values
    ("1", "Tintorería", "50", "1"),
    ("2", "Plancha", "30", "2"),
    ("3", "Lavandería", "60", "3"),
    ("4", "Bar", "15", "4"),
    ("5", "Restaurante", "50", "8"),
    ("6", "Floristería", "25", "9");

insert into Usa(cods, servicio_cods, fecha)
values
    (5, 1, "2024-11-25"),
    (5, 1, "2024-11-30"),
    (5, 1, "2024-12-24"),
    (5, 2, "2024-11-18"),
    (5, 2, "2024-12-01"),
    (5, 3, "2024-12-05"),
    (5, 4, "2024-12-20"),
    (5, 4, "2024-12-29"),
    (5, 6, "2024-12-25"),
    (4, 2, "2024-11-17"),
    (4, 2, "2024-11-29"),
    (4, 3, "2024-12-01"),
    (4, 3, "2024-12-05"),
    (4, 3, "2024-12-19");

insert into Limpieza(numreg, numero, fecha)
values
    (10, 101, "2024-10-20"),
    (10, 101, "2024-10-21"),
    (10, 101, "2024-10-22"),
    (10, 101, "2024-10-23"),
    (10, 102, "2024-10-24"),
    (10, 202, "2024-11-23"),
    (10, 203, "2024-11-23"),
    (10, 204, "2024-11-30"),
    (10, 301, "2024-12-30"),
    (10, 300, "2024-12-23"),
    (12, 100, "2024-11-10"),
    (12, 101, "2024-11-10"),
    (12, 102, "2024-11-10"),
    (12, 200, "2024-11-10"),
    (12, 201, "2024-11-11"),
    (12, 202, "2024-11-11"),
    (12, 203, "2024-11-11"),
    (12, 204, "2024-11-11"),
    (12, 300, "2024-11-12"),
    (12, 301, "2024-11-12"),
    (11, 100, "2024-10-01"),
    (11, 100, "2024-11-01"),
    (11, 100, "2024-12-01"),
    (11, 100, "2024-12-02"),
    (11, 101, "2024-10-10"),
    (11, 101, "2024-11-10"),
    (11, 101, "2024-10-14"),
    (11, 102, "2024-10-15"),
    (11, 200, "2024-10-10"),
    (11, 201, "2024-11-10"),
    (11, 202, "2024-11-10"),
    (11, 203, "2024-01-10"),
    (11, 204, "2024-01-10"),
    (11, 301, "2024-01-10"),
    (11, 301, "2024-01-01"),
    (11, 301, "2024-01-17");

insert into Proveedor(nif, nombre, direccion, numreg)
values
    ("121212T", "Carnes SA", "Plaza de los Acá 20", 8),
    ("343434L", "Logística Pérez", "Calle del Pueblo 30, 1°", 1),
    ("545454Q", "Prd. Químicos SA", "Colombiana 34", 12);

insert into Factura_prov(codfp, fecha, importe, nif, numreg)
values
    (1, "2024-03-21", 1500, "121212T", 8),
    (2, "2024-04-21", 1000, "121212T", 8),
    (3, "2024-05-21", 500, "121212T", 8),
    (4, "2024-06-21", 976, "121212T", 8),
    (5, "2024-03-21", 345, "343434L", 1),
    (6, "2024-03-21", 235, "343434L", 1),
    (7, "2024-07-21", 1000, "343434L", 1),
    (8, "2024-08-21", 765, "343434L", 1),
    (9, "2024-03-21", 1235, "545454Q", 12),
    (10, "2024-04-11", 2342, "545454Q", 12),
    (11, "2024-06-15", 2567, "545454Q", 12);

insert into Reserva(dni, numero, entrada, salida)
values
    (111111, 101, "2025-02-01", NULL),
    (111111, 102, "2025-03-01", "2025-03-04"),
    (222222, 300, "2025-02-02", "2025-02-04"),
    (777777, 203, "2025-02-17", "2025-02-19"),
    (777777, 204, "2025-03-25", "2025-03-27"),
    (999999, 200, "2025-03-11", "2025-03-15");

insert into Factura(codigof, entrada, salida, dni, numero, supletoria, forma)
values
    (0, "2024-01-01", "2019-05-01", 999999, 300, 0, "Tarjeta"),
    (1, "2024-01-01", "2019-03-01", 111111, 100, 30, "Efectivo"),
    (2, "2024-01-06", "2019-03-06", 111111, 100, 30, "Efectivo"),
    (3, "2024-01-09", "2019-03-09", 111111, 100, 30, "Efectivo"),
    (4, "2025-01-19", NULL, 555555, 300, 0, "Efectivo"),
    (5, "2025-01-17", NULL, 333333, 200, 0, "Tarjeta"),
    (6, "2025-01-17", NULL, 999999, 204, 30, "Talón"),
    (7, "2025-01-17", NULL, 555555, 300, 0, "Efectivo"),
    (8, "2025-01-22", NULL, 777777, 301, 30, "Tarjeta"),
    (9, "2024-05-15", "2019-05-17", 999999, 301, 0, "Tarjeta"),
    (10, "2024-08-10", "2019-08-13", 333333, 300, 0, "Efectivo"),
    (11, "2024-08-15", "2019-08-22", 888888, 102, 0, "Tarjeta"),
    (12, "2024-12-23", "2019-12-24", 444444, 201, 0, "Talón"),
    (13, "2024-05-01", "2019-05-05", 999999, 300, 0, "Efectivo"),
    (14, "2024-06-11", "2019-06-06", 555555, 203, 0, "Tarjeta"),
    (15, "2024-08-15", "2019-08-19", 555555, 203, 0, "Tarjeta"),
    (16, "2024-08-15", "2019-08-19", 666666, 203, 0, "Efectivo"),
    (17, "2024-08-15", "2019-08-19", 666666, 203, 0, "Tarjeta");

insert into Incluye(codigof, cods, coste, fecha)
values
    (1, 1, 25, "2024-01-01"),
    (1, 2, 15, "2024-01-01"),
    (3, 3, 25, "2024-09-01"),
    (3, 3, 25, "2024-09-02"),
    (3, 3, 25, "2024-09-03"),
    (3, 2, 10, "2024-09-01"),
    (3, 2, 20, "2024-09-03"),
    (3, 1, 10, "2024-09-01"),
    (3, 5, 43, "2024-09-02"),
    (5, 5, 25, "2025-01-15"),
    (5, 5, 28, "2025-01-16"),
    (5, 5, 33, "2025-01-17"),
    (5, 5, 24, "2025-01-18"),
    (5, 3, 13, "2025-01-16"),
    (7, 6, 20, "2025-01-20"),
    (9, 4, 6, "2024-05-15"),
    (9, 4, 8, "2024-05-16"),
    (9, 5, 24, "2024-05-16"),
    (13, 2, 10, "2024-05-03"),
    (13, 2, 10, "2024-05-04"),
    (15, 5, 45, "2024-08-15"),
    (15, 4, 5, "2024-08-15"),
    (15, 2, 13, "2024-08-15"),
    (16, 5, 32, "2024-08-15"),
    (17, 1, 10, "2024-08-15"),
    (17, 5, 30, "2024-08-16");

UPDATE Empleado SET CodS = 1 WHERE NumReg = 1;
UPDATE Empleado SET CodS = 2 WHERE NumReg = 2;
UPDATE Empleado SET CodS = 3 WHERE NumReg = 3;
UPDATE Empleado SET CodS = 4 WHERE NumReg = 4;
UPDATE Empleado SET CodS = 1 WHERE NumReg = 5;
UPDATE Empleado SET CodS = 5 WHERE NumReg = 6;
UPDATE Empleado SET CodS = 5 WHERE NumReg = 7;
UPDATE Empleado SET CodS = 5 WHERE NumReg = 8;
UPDATE Empleado SET CodS = 6 WHERE NumReg = 9;

-- 1. Se necesita una nueva tabla llamada "habitaciones_con_extras" que contenga las
-- habitaciones que disponen de todos los servicios extra. (0,5 puntos)

create table if not exists habitaciones_con_extras as (select * from habitacion where bar like 'Si' and terraza like 'Si' and puedesupletoria like 'Si');
select * from habitaciones_con_extras;

-- 2. El hotel necesita una tabla llamada "clientes_preferentes" en la cual quiere almacenar
-- el nombre, domicilio y teléfono de aquellos clientes que se han alojado más de tres

CREATE TABLE if not exists clientes_preferentes(
    nombre varchar(10),
    domicilio varchar(30),
    telefono varchar(9)
);

insert into clientes_preferentes (select nombre, domicilio, telefono from Cliente where dni in (select dni from Factura group by dni having count(*) > 3));
select * from clientes_preferentes;