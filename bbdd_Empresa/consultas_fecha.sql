-- Consultas con fechas
--1
select nomem, fecna from Empleados where MONTH(fecna) = 11 order by nomem;
--2
select nomem from Empleados where fecna = sysdate();
--3
select nomem, fecna from Empleados where YEAR(fecna) < 1950;
--4
select nomem, fecin from Empleados where YEAR(fecin) < 1970;
--5
select nomem, fecna, fecin from Empleados where timestampdiff(year, fecna, fecin) < 30;
--6
select nomem, dayname(fecna) from Empleados where dayname(fecna) = 'Monday';
--7
select nomem, dayname(fecna) as Viernes_para_nac_e_incorp from Empleados where dayname(fecna) = 'Friday' and dayname(fecna) = dayname(fecin);
--8
select nomem, dayname(fecna) as mismo_dia_de_nac_e_incorp from Empleados where dayname(fecna) = dayname(fecin);
--9
select nomem, monthname(fecin) as 'mes_incorporacion' from Empleados where month(fecin) between 1 and 6;
--10
select nomem, monthname(fecin) as mes_incorporacion_y_nac from Empleados where month(fecin) between 1 and 6 and month(fecna) = month(fecin);

