DROP DATABASE  if exists Redsocial;
CREATE DATABASE if not exists Redsocial;
USE Redsocial;
CREATE TABLE if not exists Usuarios(
	Cod_usuario int not null unique auto_increment,
    contrasenha varchar(45) not null,
    primary key (Cod_usuario)
);
create table if not exists Normales(
	Cod_usuario int not null,
    Nombre varchar(20) not null,
    Apellidos varchar(40),
    Email varchar(20),
    Direccion varchar(45),
    Foto varchar(20),
    foreign key (Cod_usuario)
		references Usuarios(Cod_usuario)
        on delete no action,
	primary key (Cod_usuario)
);
create table if not exists Famosos(
	Cod_usuario int not null,
    Nombre varchar(20) not null,
    Apellidos varchar(40),
    Foto varchar(20),
    foreign key (Cod_usuario)
		references Usuarios(Cod_usuario)
        on delete no action,
	primary key (Cod_usuario)
);
create table if not exists Grupos(
	Cod_grupo int not null unique auto_increment,
    Cod_usuario int not null,
    Nombre_grupo varchar(30) not null,
    foreign key (Cod_usuario)
		references Usuarios(Cod_usuario)
        on delete no action,
	primary key (Cod_grupo)
);
create table if not exists Contactos(
	Cod_contacto int not null unique auto_increment,
    Cod_usuario int not null,
    Comentario varchar(255) not null,
    foreign key (Cod_usuario)
		references Usuarios(Cod_usuario)
        on delete no action,
	primary key (Cod_contacto)
);
create table if not exists Comentarios(
	Cod_comentario int not null unique auto_increment,
    Cod_usuario int not null,
    texto varchar(255) not null,
    foreign key (Cod_usuario)
		references Usuarios(Cod_usuario)
        on delete no action,
	primary key (Cod_comentario)
);
create table if not exists Comentarios_Grupos(
	Cod_comentarios_grupos int not null unique auto_increment,
    Cod_grupo int not null,
    Cod_comentario int not null,
    foreign key (Cod_grupo)
		references Grupos(Cod_grupo)
        on delete no action,
	foreign key (Cod_comentario)
		references Comentarios(Cod_comentario)
        on delete no action,
	primary key (Cod_comentarios_grupos)
);
create table if not exists Comentarios_Contactos(
	Cod_comentarios_contactos int not null unique auto_increment,
    Cod_contacto int not null,
    Cod_comentario int not null,
    foreign key (Cod_contacto)
		references Contactos(Cod_contacto)
        on delete no action,
	foreign key (Cod_comentario)
		references Comentarios(Cod_comentario)
        on delete no action,
	primary key (Cod_comentarios_contactos)
);
create table if not exists Contactos_Grupos(
	Cod_contactos_grupos int not null unique auto_increment,
    Cod_contacto int not null,
    Cod_grupo int not null,
    foreign key (Cod_contacto)
		references Contactos(Cod_contacto)
        on delete no action,
	foreign key (Cod_grupo)
		references Grupos(Cod_grupo)
        on delete no action,
	primary key (Cod_contactos_grupos)
);
alter table Famosos add column Telefono varchar(12);
alter table Comentarios add column Fecha datetime;
alter table Grupos add column Tematica varchar(20);
alter table Grupos change column Tematica Tema varchar(20);
alter table Contactos change column Comentario Descripcion varchar(255);
alter table Famosos drop column Telefono


    
    