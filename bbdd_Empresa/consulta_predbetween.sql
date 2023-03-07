-- Consultas con predicados BETWEEN

--1
select nomem 
from Empleados 
where salar between 1500 and 1600 
order by nomem;

--2
select nomem, salar
from Empleados
where comis and numhi and((salar/numhi < 720) or ((salar / numhi) > comis * 50)
order by nomem;

