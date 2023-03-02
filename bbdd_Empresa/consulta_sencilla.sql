-- Consultas Sencillas

--1
select nomde, tidir from Departamentos where tidir = 'F' order by nomde asc;

--2
select nomem, numem, extel from Empleados where numde = 121 order by nomem asc;

--3
select nomem as Nombre, extel as Extension_Telefonica from Empleados where numde = 110 order by extel asc;

--4
select comis, nomem, salar from Empleados where numhi = 3 order by comis desc, nomem asc;

--5
select comis, nomem, salar from Empleados where numhi = 3 and comis is NOT NULL order by comis asc;

--6
select salar, nomem from Empleados where salar > 1200 and salar < 1500 and numhi = 0 order by salar desc, nomem;

--7
select numde from Empleados where salar < 1500 group by numde;

--8
select distinct comis from Empleados where numde = 110 and comis is not null;