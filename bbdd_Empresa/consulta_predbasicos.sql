-- consultas de predicados básicos

--1

select concat('DEPARTAMENTO DE ' , nomde) as NOMBRE 
from Departamentos 
where presu < 30 
order by nomde asc;

--2
select concat(numde, '-' ,nomde) as Numero_nombre, tidir as T
from Departamentos 
where presu < 30;

--3
select nomem as Nombre, salar * 12 as Salario_2014, 
salar * 1.02 * 12 as Salario_2015, 
salar * 1.02 * 12 * 1.02 as 'Salario_2016' 
from Empleados 
where numhi > 4 
order by nomem asc;

--4
select nomem 
from Empleados 
where  numhi * 120 > salar * 0.2
order by nomem asc;

--5
select nomem, salar + comis as Salario_total 
from Empleados 
where numde = 112 
order by Salario_total desc, nomem asc;

--6
select nomem, salar + comis as Salario_total 
from Empleados 
where numde = 112 
and comis is not null 
order by Salario_total desc, nomem asc;

--7
select nomem, concat (salar + comis, ' €') as Salario_total 
from Empleados 
where numde = 112 
and comis is not null 
order by Salario_total desc, nomem asc;

--8
select nomem as nombre, concat(salar + ((numhi - 3) * 60) , ' €') as Salario_total 
from Empleados 
where numhi >= 4 
order by nomem asc;

--9
select nomem as nombre, concat(salar + ((numhi - 3) * 60) , ' €') as Salario_total 
from Empleados 
where numhi >= (select numhi from Empleados where nomem = 'Juliana') 
order by nomem asc;

--10
select nomem 
from Empleados 
where salar >= (select salar * 1.15 from Empleados where nomem = 'Claudia') 
order by nomem desc;

--11
select nomde from Departamentos where depde is null;