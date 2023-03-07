-- Consultas con funciones colectivas
--1
select avg(salar) as salario_medio, min(salar) as salario_minimo, max(salar) as salario_maximo from Empleados;

--2
select salar, nomem from Empleados where salar * 1.4 > (select max(salar) from Empleados) order by nomem;

--3
select max(timestampdiff(year, fecna, now())) as Edad from Empleados where numde = 110;

--4 falta por corregir
select nomem, timestampdiff(YEAR, fecna, now()) as Edad 
from Empleados 
where numde = 110 
and Edad = (select max(timestampdiff(YEAR, fecna, now())) from Empleados);