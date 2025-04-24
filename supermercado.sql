DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE IF NOT EXISTS supermercado;
USE supermercado;

Create table if not exists sucursales(
codigo integer(4),
ciudad varchar(30) not null,
primary key(codigo)
);

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
seccion varchar(20),
sueldo float(6,2),
codigosucursal integer(4),
primary key(documento),

constraint FK_empleados_sucursal
foreign key (codigosucursal)
references sucursales(codigo)
);

insert into sucursales values(1,'Cordoba');
insert into sucursales values(2,'Villa Maria');
insert into sucursales values(3,'Carlos Paz');
insert into sucursales values(4,'Cruz del Eje');

insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

-- 6- Cree una tabla llamada secciones que contenga las secciones de la
-- empresa (primero elimínela).

drop table secciones;

create table if not exists secciones as (select distinct seccion from empleados);

-- 7- Recupere la información de &quot;secciones&quot;

select * from secciones;

-- 8- Se necesita una nueva tabla llamada &quot;sueldosxseccion&quot; que contenga la
-- suma de los sueldos de los empleados por sección (de todas las sucursales).
-- Primero elimine la tabla

create table if not exists sueldosxseccion as (select seccion, sum(sueldo) from empleados group by seccion);

-- 9- Recupere los registros de la nueva tabla

select * from sueldosxseccion;