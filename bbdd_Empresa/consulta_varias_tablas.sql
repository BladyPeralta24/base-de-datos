-- Consultas sobre varias tablas

--1
select Departamentos.nomde, Centros.nomce, max(Empleados.salar) from Departamentos, Centros, Empleados
where Empleado.numde = Departamentos.numde and Departamentos.numce = Centros.numce
and Departamentos.presu < 35 
group by Departamentos.numde 
having max(salar) > 1500 
order by Departamentos.numde;
--2

--3

--4

--5

--6

--7

--8

--9

--10

--11
select Departamentos.nomde 
from Departamentos 
left join Empleados on Empleados.numde = Departamentos.numde 
where Empleados.numde is null;
--12
select Departamentos.nomde 
from Empleados 
right join Departamentos on Empleados.numde = Departamentos.numde 
where Empleados.numde is null;
--13
select e.nomem from Empleados e 
left join Departamentos d on e.numde = d.numde 
where e.numde is null;
--14
select e.nomem 
from Departamentos d 
right join Empleados e on e.numde= d.numde 
where e.numde is null;
--15
select d.nomde, e.nomem
from Departamentos d
left join Empleados e on d.numde = e.numde 
where e.numde is null
union 
select d.nomde, e.nomem
from Departamentos d 
right join Empleados e on e.numde= d.numde 
where d.numde is null;
--16

--17

--18

--19

--20