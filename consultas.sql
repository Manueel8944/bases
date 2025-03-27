use Empresa;
select * from tdepto;
select distinct extel from temple;
select nomce, senhas from tcentr;

#1
select nomem from temple where numde=121;
#2
select * from tdepto where numde=121;
#3
select nomem, salar from temple where numhi>3;
#6
select distinct numde from temple where salar<2500;
#7
select distinct comis from temple where numde=110;

# Ejercicio predicado 4
select nomem, (salar / numhi) as cociente_sueldo_hijos
	from temple
    where comis is null and numhi>0
    order by nomem;

# Ejercicio predicado 8
select nomem, salar 
from temple
where salar>=2500 and salar<=3000
order by nomem;

# Ejercicio predicado 8 otra forma, la idonea
select nomem, salar 
from temple
where salar between 2500 and 3000
order by nomem;

# Ejercicio predicado 9
select nomem, salar
from temple 
where (salar/numhi)<1200 or (salar/numhi)>(comis*2);

# Ejercicio predicado 10
select nomem, (numhi + 2) as invitaciones, numhi as regalos
	from temple
    where nomem like "A%" or nomem like "B%" or nomem like "C%" or nomem like "D%" or nomem like "E%" or nomem like "F%" or nomem like "G%" or nomem like "H%" or nomem like "I%" or nomem like "J%" or nomem like "K%" or nomem like "L%"
    order by nomem;

# Ejercicio predicado 11
select nomem
	from temple
    where nomem like "Mora%"
    order by nomem;
    
# Ejercicio predicado 12
 select nomem
	from temple
    where nomem like "%, Valeriana%"
    order by nomem;
 
 # Ejercicio predicado 13
  select nomem
	from temple
    where nomem like "_______,%"
    order by nomem;

 # Ejercicio predicado 14
   select nomem
	from temple
    where nomem like "______%,%"
    order by nomem;

# Ejercicio predicado 15
select nomem
	from temple
	where nomem not like "____%,%"
	order by nomem;

# Ejercicio predicado 16
select nomem
	from temple
	where nomem like "___%,%" and nomem like "%ez,%o"
	order by nomem;
    
# Ejercicio predicado 17
select nomem, (salar/100) as regalo
	from temple
    where nomem like "%, Honorio" or nomem like "%, Honoria"
    order by nomem;

# Ejercicio predicado 23
select nomem, salar, fecin
	from temple
	where fecin<"1988-01-01" or salar<2000
    order by fecin, nomem;
    
# Ejercicio predicado 24
select nomde
	from tdepto
    where nomde not like "direccion %" and nomde not like "sector %"
    order by nomde;

# Ejercicio predicado 25
  select nomem, salar
	from temple
    where (numhi=0 and salar>2000) or (numhi>0 and salar<3000)
	order by nomem, salar;
    
# Ejercicio predicado 27
  select nomde, presu
	from tdepto
    where (tidir like "P" or tidir like "F") and (presu>50000 or depde is null)
    order by nomde;
    
# Ejercicio 10
select nomem
	from temple
    where salar>(select max(salar) from temple where numde=122)
    order by nomem;
    
# Ejercicio 11
select nomem
	from temple
    where salar>3.5*(select min(salar) from temple where numde=122)
	order by nomem;
    
# Ejercicio predicado 5
select nomem, salar
	from temple
    where salar in (select comis from temple)
    order by nomem;

# Ejercicio predicado 6
select nomem, salar
	from temple
    where salar < (select max(comis) from temple)
    order by nomem;
    
# Ejercicio predicado 7
select nomem, salar
	from temple
    where salar < (select (min(comis)*4) from temple)
    order by nomem;

# Ejercicio predicado 18
select nomem, numde
	from temple
    where numde in (select numde from temple where nomem = "Galvez, Pilar" or nomem = "Flor, Dorotea")
    order by nomem;

# Ejercicio predicado 19
select nomem, salar
	from temple
    where salar in (select salar from temple where numde = 100)
    order by nomem;

# Ejercicio predicado 20
select nomce
	from tcentr
    where exists (select senhas from tcentr where senhas like "%ATOCHA%")
    order by nomce;

# Ejercicio predicado 21
select nomem, salar
	from temple
    where numde = 111 and comis is not null and exists (select comis from temple where comis > (salar*15)/100)
	order by nomem;
    
# Ejercicio predicado 22
select nomem, comis
	from temple
    where numde = 110 and exists (select comis from temple where comis is not null)
	order by nomem;

# Ejercicio predicado 26
select nomem
	from salar 
	where exists (select numde from temple where numde in (111, 112) and (comis = 0 or comis is null) and numde in (110, 111) and (numhi = 0 or numhi is null) or ((numhi/salar)>1000))
    order by nomem;
    
select titulo, nombre
	from autores
    inner join libros
    on autores.id_autor = libros.id_autor;

select titulo, nombre
	from autores, libros
    where autores.id_autor = libros.id_autor;
    
select doctores.*, pacientes.*
	from pacientes
    inner join doctores
    on doctores.nombre = pacientes.nombre;
    
select doctores.*, pacientes.*
	from pacientes, doctores
    where doctores.nombre = pacientes.nombre;

select id_persona, precio
	from apartamentos, personas
    where personas.precio_max >= apartamentos.precio;

select id_persona, precio
	from presonas
    inner join apartamentos
    on personas.precio_max >= apartamentos.precio;

select continentes.nombre, paises.nombre, ciudades.nombre
	from continentes, paises, ciudades
    where continentes.continente_id = paises.continente_id and paises.pais_id = ciudades.pais_id;
    
select continentes.nombre, paises.nombre, ciudades.nombre
	from ciudades
    inner join paises 
    on paises.pais_id = ciudades.pais_id
		inner join continentes
        on continentes.continente_id = paises.continente_id;

#CONSULTAS 2

#1
select nomde, nomce, presu
	from tdepto
    inner join tcentr
    on tdepto.numce = tcentr.numce
    where presu < 100000;

#2
select salar, nomem, numde
	from temple
    where numde = (select numde from tdepto where nomde ="finanzas")
    order by salar desc
	limit 1;

#3
select salar, numem, nomde
	from temple, tdepto
    where temple.numde = tdepto.numde and salar > 0.6*(select max(salar) from temple);

#4
select count(nomem) , count(distinct extel) 
	from temple
    inner join tdepto
    on tdepto.numde = temple.numde
    where nomde like "%personal%";

# Quiero obtener todos los empleados con que departamento trabajan (todos los empleados)
select numem, nomem, temple.numde, nomde
	from temple
    left join tdepto
    on temple.numde = tdepto.numde;

#5
select count(nomem) , count(comis) , sum(comis), avg(comis)
	from temple
    inner join tdepto
    on tdepto.numde = temple.numde
    where nomde like "%personal%";

#6
select avg(numhi) as "media de numero de hijos"
	from temple
    inner join tdepto
    on tdepto.numde = temple.numde
    where nomde like "%proceso de datos%";

#7
select numde, presu, (select avg(presu) as "media de presupuesto" from tdepto)
	from tdepto
    where depde = (select numde from tdepto where nomde like "%direccion comercial%")
    order by numde;

#8
select nomde, nomem, (salar+comis) as "salartotal"
	from temple
    inner join tdepto
    on temple.numde = tdepto.numde
    where (salar+comis) > (1000+(select min(salar) from temple))
    order by temple.numde;
    
#9
select numce
	from tcentr
    where senhas like "%alcala%";

select nomem 
	from temple
    where numde=122 and salar>(select avg(salar) from temple where numde =122) and exists(select * from tdepto where numde = 122 and numce = (select numce from tcentr where senhas like "%alcala%"))
	order by nomem;

#10
select nomde, nomce, max(salar)
	from temple
    inner join tdepto on temple.numde = tdepto.numde
    inner join tcentr on tdepto.numce = tcentr.numce
    where presu < 60000
    group by nomde, nomce
    having max(salar) > 2000
    order by nomde;

#11
select nomde
	from tdepto
    where depde in (select numde from tdepto where presu < 50000)
    order by nomde;

#12
select count(numem)/count(distinct extel)
	from tdepto
    inner join temple
    on temple.numde = tdepto.numde
    where presu > 60000
    group by extel;

#13
select nomem
	from temple
    inner join tdepto on temple.numde = tdepto.numde
    inner join tcentr on tdepto.numce = tcentr.numce
    where nomem like "G%" and senhas like "%Alcala%"
    order by nomem;

#14 
select nomem
	from temple
    inner join tdepto on tdepto.direc = temple.numem
    where tidir = "F"
    order by nomem;

#15
select temple.numde, extel, nomde
	from temple
    inner join tdepto
    on temple.numde = tdepto.numde
    where nomde not like "%direccion%" and nomde not like "%sector%"
    order by numde, extel;

#16
select nomem, numem, (salar*5)/100 as "gratificacion", tidir
	from temple 
    inner join tdepto
    on temple.numem = tdepto.direc
    where tidir = 'F'
    order by nomem;

select nomem, numem, (salar*5)/100 as "gratificacion"
from temple
where numem in (select direc from tdepto where tidir = 'F')
order by nomem;

#17
select nomem 
	from temple
    inner join tdepto 
    on temple.numde = tdepto.numde
    where direc in (select numde from temple where nomem like '%perez, marcos%') and tidir = 'p' or tidir = 'f'
    order by nomem;

#18
select nomem, temple.numde, count(numem)
	from temple
    inner join tdepto
    on temple.numem = tdepto.direc
    where tdepto.numde in (select depde from tdepto where depde is not null)
    group by numem
    order by nomem;

select jefes.nomem, count(empleados.numem)
	from temple jefes, temple empleados, tdepto departamentos, tdepto dependientes
    where dependientes.depde = departamentos.numde
    and dependientes.depde is not null
    and empleados.numde = dependientes.numde
    and jefes.numem = departamentos.direc
    group by jefes.nomem
    order by jefes.nomem;

select jefes.nomem, count(empleados.numem)
	from temple jefes
    inner join tdepto departamentos on jefes.numem = departamentos.direc
    inner join tdepto dependientes on departamentos.numde = dependientes.depde and dependientes.depde is not null
    inner join temple empleados on empleados.numde = dependientes.numde 
    group by jefes.numem
    order by jefes.nomem;

# EJERCICIOS DE AGREGACIÓN Y AGRUPAMIENTO

#1
select max(salar)
	from temple
    where numde = 100;

#2
select nomem, salar
	from temple
    where salar > (select max(salar)*0.4 from temple);

#3
select count(numem)
	from temple;

#4
select count(numem), count(distinct extel)
	from temple
    where numde = 112;

#5
select count(numem)
	from temple
	where fecna > '1974-01-01';

#21
select count(numem) as 'numero de empleados'
	from temple 
    where numde = 100 or numde = 110;	

#22
select numde, numhi, count(numem) as 'numero de empleados'
	from temple 
    group by numde, numhi
    having numde = 100 or numde = 110;

#23
select numde, count(numem), sum(salar), sum(comis), sum(numhi)
	from temple
    where comis is not null
    group by numde
    having numde in (select numde from temple where salar>4000);

#24
select numhi, avg((salar+comis)/numhi)
from temple
where numhi > 0 and comis is not null and salar is not null
group by numhi;

#28
select numde, max(extel)
	from temple
    group by numde;

#29
select extel, count(distinct numde)
	from temple
    group by extel;

#30
select count(numem)/count(distinct extel), numde
	from temple 
    group by numde
    having numde in (select numde from temple where comis > 0);

#6
select count(numem), count(comis), sum(comis), avg(comis)
	from temple
    where numde = 112;

#7
select count(distinct comis), avg(distinct comis)
	from temple;

#8
select avg(numhi)
	from temple
    where numde = 112;

#9
select numde, presu, (select avg(presu) from tdepto) as 'media de comisiones'
	from tdepto
    where depde = 100;

#13
select count(numde), avg(presu)
from tdepto;

#14
select count(numde), avg(presu)
from tdepto
where tidir != 'P';

#15
select nomem, (salar+comis) as 'salario total'
	from temple
    where (salar+comis)>(select min(salar)+3000 from temple)
    order by numem;

#16
select (sum(salar)+sum(comis))*14 as 'masa salarial anual'
	from temple;

#17
select avg(salar) as 'salario medio'
	from temple
    where salar < (select min(salar)+(min(salar)*0.2) from temple where numhi > 0 and (salar/numhi) > 1000);

#18
select max(salar)-min(salar) as 'diferencia'
	from temple;

#19
select avg(presu)
	from tdepto
    where presu > (select avg(presu) from tdepto);

#20
select nomem, avg(numhi)
	from temple
    where numhi <= 2
    group by nomem;

#25
select numde, avg(comis), (select avg(comis) from temple)
	from temple
    where comis > 0
    group by numde;

#26
select extel, count(numem), avg(salar)
	from temple
    group by extel;

#27
select extel, numde, count(numem), avg(salar)
	from temple
    group by extel, numde

