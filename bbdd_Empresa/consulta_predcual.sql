-- Consultas con predicados Cuantificados -> ALL, SOME, ANY


--1
select nomem
from Empleados
where salar > all (select salar from Empleados where numde = 122)
order by nomem asc;

--2
select nomem
from Empleados
where salar > all (select salar from Empleados where numde = 150)
order by nomem asc;