DROP DATABASE IF EXISTS Notas;
CREATE DATABASE IF NOT EXISTS Notas;
USE Notas;

create table alumnos(
documento char(8) not null,
nombre varchar(30),
nota float(4,2)
constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
primary key(documento)
);
create table aprobados(
documento char(8) not null,
nota float(4.2)
constraint CK_aprobados_nota_valores check (nota>=0 and nota <=10),
primary key(documento)
);

insert into alumnos values('30000000','Ana Acosta',8);
insert into alumnos values('30111111','Betina Bustos',9);
insert into alumnos values('30222222','Carlos Caseros',2.5);
insert into alumnos values('30333333','Daniel Duarte',7.7);
insert into alumnos values('30444444','Estela Esper',3.4);

-- Ingresamos registros en la tabla &quot;aprobados&quot; seleccionando registros de la tabla &quot;alumnos&quot;:

insert into aprobados select documento, nota from alumnos where nota >= 5;
select * from aprobados

