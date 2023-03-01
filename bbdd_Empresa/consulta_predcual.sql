-- Consultas con predicados Cuantificados -> ALL, SOME, ANY


--1
select nomem
from Empleados
where salar > (select max(salar) from Empleados where numde = 122)
order by nomem asc;