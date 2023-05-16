
-- Ejercicio 1

CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `PROC_EMPLEADOS_FECHA`()
BEGIN
	declare empleado_antiguo varchar(50);
    declare empleado_joven varchar(50);
    declare fecha_antigua date;
    declare fecha_joven date;
    declare meses_antiguo int;
    declare meses_joven int;

    select nombre, timestampdiff(month, fecha_alt, now())
    from empleado
    order by fecha_alt desc;

    select nombre, fecha_alt into empleado_antiguo, fecha_antigua
    from empleado
    where fecha_alt = (select min(fecha_alt) from empleado);

    select nombre, fecha_alt into empleado_joven, fecha_joven
    from empleado
    where fecha_alt = (select max(fecha_alt) from empleado);


    set meses_antiguo = timestampdiff(month, fecha_antigua, now());
    set meses_joven = timestampdiff(month, fecha_joven, now());

    select concat('El empleado mas antiguo es: ', empleado_antiguo, ', y los meses durados son: ', meses_antiguo, ' meses') as mensaje;
    select concat('El empleado mas joven es: ', empleado_joven, ', y los meses durados son: ', meses_joven, ' meses') as mensaje;
END



call PROC_EMPLEADOS_FECHA();



-- Ejercicio 2

DELIMITER $$

create trigger salario_verificar
before insert on empleado
for each row
BEGIN
	DECLARE salario_presidente INT;

    select salario into salario_presidente
    from empleado
    where oficio = 'presidente'
    order by salario desc
    limit 1;

    IF NEW.salario > salario_presidente then
		signal sqlstate '45000'
        set message_text = 'El nuevo empleado no puede tener un salario mayor al del presidente';
	END IF;
END;
delimiter;


-- Ejemplo de un empleado que cobra mas que el presidente
INSERT INTO empleado VALUES ('281-160483-0005F', 'Juan Gabriel Jesus', 30, 'Vendedor', 'León', '1983-05-12', 16000, 0, 40);


-- Ejercicio 3

CREATE FUNCTION `FUN_DEPTO_SALARIO` (depto_codigo int)
RETURNS int
BEGIN
	declare salario_total int;

    select sum(salario) into salario_total
    from empleado
    where depto_no = depto_codigo;

	RETURN salario_total;
END;

select FUN_DEPTO_SALARIO(1);







