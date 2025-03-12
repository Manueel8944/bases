DROP DATABASE  if exists Empresa;
CREATE DATABASE if not exists Empresa;
USE Empresa;

CREATE TABLE if not exists TCENTR(
	numce int not null unique,
    nomce varchar(50) not null,
    senhas varchar(50) not null,
    primary key (numce)
);

CREATE TABLE if not exists TEMPLE(
	numem int not null unique,
    numde int,
    extel int not null,
    fecna datetime not null,
    fecin datetime not null,
    salar float not null,
    comis float,
    numhi smallint not null,
    nomem varchar(50) not null,
    primary key (numem)
);

CREATE TABLE if not exists TDEPTO(
	numde int not null unique,
    numce int not null,
    direc int,
    tidir varchar(50) not null,
    presu float not null,
    depde int,
    nomde varchar(50) not null,
    primary key (numde)
);

alter table TEMPLE add foreign key (numde) references TDEPTO(numde);
alter table TDEPTO add foreign key (numce) references TCENTR(numce);
alter table TDEPTO add foreign key (depde) references TDEPTO(numde);

insert into TCENTR(numce,nomce,senhas)
values (10,"SEDE CENTRAL","C. ALCALA, 820, MADRID");
insert into TCENTR(numce,nomce,senhas)
values (20,"RELACION CON CLIENTES","C. ATOCHA, 405, MADRID");

insert into TDEPTO(numde,numce,direc,tidir,presu,depde,nomde)
values(100, 10, 260, "P", 720000, null, "DIRECCION GENERAL"),
	(110, 20, 180, "P", 90000, 100, "DIRECCION COMERCIAL"),
	(111, 20, 180, "F", 66000, 110, "SECTOR INDUSTRIAL"),
	(112, 20, 270, "P", 54000, 110, "SECTOR SERVICIOS"),
	(120, 10, 150, "F", 18000, 100, "ORGANIZACION"),
	(121, 10, 150, "P", 12000, 120, "PERSONAL"),
	(122, 10, 350, "P", 36000, 120, "PROCESO DE DATOS"),
	(130, 10, 310, "P", 12000, 100, "FINANZAS");
    
insert into TEMPLE(numem, numde, extel, fecna, fecin, salar, comis, numhi, nomem)
values
	(110, 121, 350, "2029/11/10", "1950/02/15", 1800, null, 3, "PONS, CESAR"),
	(120, 112, 840, "1935/06/09", "1968/10/01", 2100, 1100, 1, "LASA, MARIO"),
    (130, 112, 810, "1945/09/09", "1969/02/01", 2900, null, 2, "TEROL, LUCIANO"),
    (140, 121, 340, "1948/03/10", "1968/03/14", 1800, null, 0, "PEREZ, JULIO"),
    (160, 112, 740, "1939/07/09", "1968/11/11", 3400, 1100, 0, "AGUIRRE, AUREO"),
    (180, 110, 508, "1934/10/18", "1956/03/18", 4800, 500, 2, "PEREZ, MARCOS"),
    (190, 121, 350, "1939/07/15", "1964/03/15", 3000, null, 4, "VEIGA, JULIANA"),
    (210, 100, 200, "1942/09/28", "1959/01/22", 3800, null, 2, "GALVEZ, PILAR"),
    (240, 111, 760, "1942/02/26", "1968/02/24", 2800, null, 3, "SANZ, LAVINIA"),
    (250, 100, 250, "1949/10/27", "1972/03/12", 4500, null, 6, "OLABA, ADRIANA"),
    (260, 111, 510, "1943/07/25", "1963/07/12", 3800, 800, 3, "LOPEZ, ANTONIO"),
    (270, 112, 300, "1945/05/21", "1968/06/10", 3800, 800, 3, "GARCIA, OCTAVIO"),
    (280, 130, 410, "1943/01/11", "1971/10/08", 2900, null, 5, "FLOR, DOROTEA"),
    (290, 130, 510, "1947/11/30", "1968/02/14", 2700, null, 0, "POLO, OTILIA"),
    (300, 130, 320, "1948/01/31", "1967/02/15", 4200, null, 0, "GIL, GLORIA"),
    (310, 130, 480, "1945/04/12", "1971/03/16", 5000, null, 0, "GARCIA, AUGUSTO"),
    (320, 121, 600, "1950/10/28", "1978/03/15", 2800, 900, 2, "SANZ, CORNELIO"),
    (330, 122, 610, "1949/04/13", "1968/04/10", 2300, null, 1, "DIEZ, AMELIA"),
    (350, 122, 630, "1949/04/13", "1968/04/10", 2500, null, 1, "CAMPS, AURELIO"),
    (360, 111, 750, "1958/10/29", "1978/10/10", 2500, 1000, 2, "LARA, DORINDA"),
    (370, 121, 360, "1967/06/22", "1987/01/20", 1900, NULL, 1, "RUIZ, FABIOLA"),
    (380, 112, 880, "1968/03/30", "1988/01/01", 1800, NULL, 0, "MARTIN, MICAELA"),
    (390, 110, 500, "1966/09/12", "1986/10/08", 2150, NULL, 1, "MORAN, CARMEN"),
    (400, 111, 780, "1969/08/18", "1987/11/11", 1850, NULL, 0, "LARA, LUCRECIA"),
    (410, 112, 660, "1968/07/14", "1986/10/13", 1750, NULL, 0, "MUÑOZ, AZUCENA"),
    (420, 130, 450, "1966/10/22", "1988/11/19", 4000, NULL, 0, "FIERRO, CLAUDIA"),
    (430, 112, 650, "1967/02/20", "1988/11/19", 2100, NULL, 1, "MORA, VALERIANA"),
    (440, 111, 760, "1966/09/26", "1986/02/28", 2100, 1000, 0, "DURAN, LIVIA"),
    (450, 112, 880, "1966/10/21", "1986/02/28", 2100, 1000, 0, "PEREZ, SABINA"),
    (480, 111, 760, "1965/04/04", "1986/02/28", 2100, NULL, 1, "PINO, DIANA"),
    (490, 112, 880, "1964/06/06", "1988/01/01", 1800, NULL, 0, "TORRES, HORACIO"),
    (500, 111, 750, "1965/10/08", "1987/01/01", 2000, NULL, 0, "VAZQUEZ, HONORIA"),
    (510, 110, 550, "1966/05/04", "1996/11/01", 2000, NULL, 1, "CAMPOS, ROMULO"),
	(511, null, 550, "1966/05/04", "1996/11/01", 2000, NULL, 1, "MANUEL, ANEL"),
    (550, 111, 780, "1970/01/10", "1988/01/21", 1000, 1200, 0, "SANTOS, SANCHO");
