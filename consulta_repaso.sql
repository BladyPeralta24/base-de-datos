-- 1
select nomem, salar + 0.01 * salar from Empleados where numde = 100 order by nomem desc;

-- 2
select numce, avg(presu) from Departamentos  group by numce;

-- 3
select e.nomem, YEAR(CURDATE())- YEAR(e.fecna) as 'Edad'from Empleados e, Departamentos d where e.numde = d.numde and d.nomde = 'Personal';

-- 4
select c.dirce, d.nomde from Centros c, Departamentos d, Empleados e where c.numce = d.numce and e.numde = d.numde and e.numhi > 3;

-- 5
select c.dirce, d.nomde from Centros c, Departamentos d, Empleados e  where c.numce = d.numce and d.numde = e.numde and exists(select * from Empleados e where e.numhi > 3) group by d.nomde, c.dirce;

-- 6
select numhi, count(nomem) as 'NªEmpleados' from Empleados group by numhi;

-- 7
create view Sin_comision as select nomem, YEAR(CURDATE())- YEAR(fecna) as 'EDAD_ACTUAL', salar as 'SALARIO' from Empleados where comis IS NOT NULL;

select * from Sin_comision;

-- 8
select avg(SALARIO) as 'MEDIASALARIOS' from Sin_comision;

-- 9
select d.nomde, max(e.salar) from Departamentos d, Empleados e where e.numde = d.numde group by d.nomde, e.nomem having max(e.salar) < 2000;

-- 10
create view Jubilacion as select e.nomem, d.nomde, YEAR(CURDATE())- YEAR(e.fecna) as 'Edad', e.salar from Empleados e, Departamentos d where e.numde = d.numde;

select * from Jubilacion where Edad >= 60;

-- 11
select * from Jubilacion where Edad = 60;

-- 12
select c.dirce, e.nomem, d.nomde, d.direc from Centros c, Empleados e, Departamentos d where e.numde = d.numde and c.numce = d.numce and e.nomem like 'J%';
