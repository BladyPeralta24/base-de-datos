/*1*/
select nombre from Empleado order by nombre desc;

/*2*/
select Empleado.nombre, Empleado.oficio, Departamento.localizacion from Empleado, Departamento 
where Empleado.depto_no = Departamento.depto_no and oficio = 'Vendedor';

/*3*/
select Empleado.nombre, Empleado.salario, Departamento.localizacion from Empleado, Departamento 
where Empleado.depto_no = Departamento.depto_no and salario between 10000 and 13000 order by salario asc;

/*4*/
select Departamento.nombre_depto, count(Empleado.depto_no) as num_empleados from Departamento, Empleado 
where Empleado.depto_no =Departamento.depto_no group by Departamento.depto_no having num_empleados >= 5;

/*5*/
select Empleado.nombre, Empleado.salario, Departamento.nombre_depto from Empleado, Departamento 
where Empleado.depto_no = Departamento.depto_no and oficio = (select Empleado.oficio from Empleado where Empleado.nombre = 'Esquivel Leonel Alfonso');

/*6*/
select Empleado.nombre, Empleado.salario, Departamento.nombre_depto from Empleado, Departamento 
where Empleado.depto_no = Departamento.depto_no and oficio = (select Empleado.oficio from Empleado where Empleado.nombre = 'Castillo Montes Luis') and Empleado.comision = 0;

/*7*/
select Empleado.codigo_c, Empleado.nombre, Empleado.edad, Empleado.oficio, Empleado.dir, Empleado.fecha_alt, Empleado.salario, Empleado.comision, Empleado.depto_no from Empleado, Departamento 
where Empleado.depto_no = Departamento.depto_no and Departamento.nombre_depto ='Contabilidad';

/*8*/
select nombre from Empleado where dir = 'León' and (oficio = 'Analista' or oficio = 'Empleado');

/*9*/
select Departamento.nombre_depto, avg(salario) from Departamento, Empleado where Empleado.depto_no = Departamento.depto_no and Departamento.nombre_depto = 'Contabilidad';

/*10*/
select Departamento.nombre_depto, count(Empleado.nombre) from Empleado, Departamento where Departamento.depto_no = Empleado.depto_no and Departamento.nombre_depto = 'Ventas';

/*11*/
select Departamento.nombre_depto, count(Empleado.nombre) from Empleado, Departamento where Departamento.depto_no = Empleado.depto_no group by Departamento.nombre_depto;
/*12*/
create view Empleado_ventas as select Departamento.nombre_depto, Empleado.codigo_c, Empleado.nombre, Empleado.edad, Empleado.oficio, Empleado.dir, Empleado.fecha_alt, Empleado.salario, Empleado.comision, 
Empleado.depto_no from Empleado, Departamento where Departamento.depto_no = Empleado.depto_no and Departamento.nombre_depto = 'Ventas';

select * from Empleado_ventas where salario = (select max(salario) from Empleado_ventas);
/*13*/
create view Departamento_con_mas_Empleados as select Departamento.nombre_depto, count(Empleado.nombre) as 'num_empleados' 
from Empleado, Departamento where Departamento.depto_no = Empleado.depto_no group by Departamento.nombre_depto;

select * from Departamento_con_mas_Empleados where num_empleados =(select max(num_empleados) from Departamento_con_mas_Empleados);
/*14*/
create view Departamento_oficio as select nombre_depto, Empleado.oficio from Empleado, Departamento where Departamento.depto_no = Empleado.depto_no;

select nombre_depto, count(oficio) from Departamento_oficio where oficio = 'Empleado' group by nombre_depto;
/*15*/
create view empoficio as select distinct Departamento.nombre_depto, Empleado.oficio from Empleado, Departamento where Empleado.depto_no = Departamento.depto_no;

select nombre_depto, count(oficio) from empoficio group by nombre_depto;

-- otra opcion
select Departamento.nombre_depto, count(distinct Empleado.oficio) from Empleado, Departamento where Empleado.depto_no = Departamento.depto_no group by Departamento.nombre_depto;



/*16*/
select Departamento.nombre_depto, count(Empleado.oficio) from Departamento, Empleado
where Departamento.depto_no = Empleado.depto_no group by Departamento.nombre_depto having count(Empleado.oficio) >= 2;
