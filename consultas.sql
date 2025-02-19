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

  