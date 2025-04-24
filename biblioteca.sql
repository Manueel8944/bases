DROP DATABASE  if exists Biblioteca;
CREATE DATABASE if not exists Biblioteca;
USE Biblioteca;

create table libros(
codigo int(5),
titulo varchar(40) not null,
autor varchar(30),
editorial varchar(20),
precio float(5.2),
primary key(codigo)
);
insert into libros values(1,'Uno','Richard Bach','Planeta',15);
insert into libros values(2,'El aleph',';Borges','Emece',25);
insert into libros values(3,'Matematica estas ahi','Paenza','Nuevo siglo',18);
insert into libros values(4,'Aprenda PHP','Mario Molina','Nuevo siglo',45);
insert into libros values(5,'Ilusiones','Richard Bach','Planeta',14);
insert into libros values(6,'Java en 10 minutos','Mario Molina','Nuevo siglo',50);

-- Creamos una tabla llamada &quot;editoriales&quot; que contenga los nombres de las editoriales
-- obteniendo tales nombres de la tabla &quot;libros&quot;:

create table if not exists editoriales as (select distinct editorial from libros);

-- Necesitamos una nueva tabla llamada &quot;librosporeditorial&quot; que contenga la cantidad
-- de libros de cada editorial. Primero eliminamos la tabla:

create table if not exists librosxed as (select editorial, count(codigo) from libros group by editorial);

-- Queremos una tabla llamada &quot;ofertas20&quot; que contenga los mismos campos que &quot;libros&quot;
-- y guarde los libros con un precio menor o igual a 20. Primero eliminamos la tabla &quot;ofertas20&quot;:

create table if not exists ofertas as (select * from libros where precio <= 20);

-- Agregamos una columna a la tabla &quot;editoriales&quot; que contiene la ciudad
-- en la cual está la casa central de cada editorial:

alter table editoriales add ciudad varchar(30);

update editoriales set ciudad='Cordoba' where editorial='Planeta';
update editoriales set ciudad='Cordoba' where editorial='Emece';
update editoriales set ciudad='Buenos Aires' where editorial='Nuevo siglo';

-- Queremos una nueva tabla llamada &quot;librosdecordoba&quot; que contenga los títulos
-- y autores de los libros de editoriales de Cordoba. En primer lugar, la eliminamos:

create table if not exists librosdecordoba as (select titulo, autor from libros inner join editoriales on libros.editorial = editoriales.editorial where ciudad = 'Cordoba');