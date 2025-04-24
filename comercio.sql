DROP DATABASE IF EXISTS Comercio;
CREATE DATABASE IF NOT EXISTS Comercio;
USE Comercio;

create table if not exists clientes(
codigo integer(5),
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);
create table if not exists facturas(
numero integer(6) not null,
fecha date,
codigocliente integer(5) not null,
total float(6,2),
primary key(numero),
constraint FK_facturas_cliente
foreign key (codigocliente)
references clientes(codigo)
);

insert into clientes values(1,'Juan Lopez','Colon 123');
insert into clientes values(2,'Luis Torres','Sucre 987');
insert into clientes values(3,'Ana Garcia','Sarmiento 576');
insert into clientes values(4,'Susana Molina','San Martin 555');
insert into facturas values(1200,'2017-04-15',1,300);
insert into facturas values(1201,'2017-04-15',2,550);
insert into facturas values(1202,'2017-04-15',3,150);
insert into facturas values(1300,'2017-04-20',1,350);
insert into facturas values(1310,'2017-04-22',3,100);

-- 4- El comercio necesita una tabla llamada &quot;clientespref&quot; en la cual quiere
-- almacenar el nombre y domicilio de aquellos clientes que han comprado hasta
-- el momento más de 500 euros en mercaderías. Elimine la tabla y créela con
-- esos 2 campos:

create table if not exists clientespref(
nombre varchar(30),
domicilio varchar(30)
);

insert into clientespref (select nombre, domicilio from clientes where codigo in (select codigocliente from facturas group by codigocliente having sum(total) > 500));
select * from clientespref;
