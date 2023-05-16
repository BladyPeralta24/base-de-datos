CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `PROC_EMPLEADOS_FECHA`()
BEGIN
	declare empleado_antiguo varchar(50);
    declare empleado_joven varchar(50);
    declare fecha_antigua date;
    declare fecha_joven date;
    declare meses_antiguo int;
    declare meses_joven int;
    
    select nombre, fecha_alt into empleado_antiguo, fecha_antigua
    from empleado
    where fecha_alt = (select min(fecha_alt) from empleado);
    
    select nombre, fecha_alt into empleado_joven, fecha_joven
    from empleado
    where fecha_alt = (select max(fecha_alt) from empleado);
    
    set meses_antiguo = period_diff(date_format(current_date(), '%Y%m'), date_format(fecha_antigua, '%Y%m'));
    set meses_joven = period_diff(date_format(current_date(), '%Y%m'), date_format(fecha_antigua, '%Y%m'));
    
    select concat('El empleado mas antiguo es: ', empleado_antiguo, ', lleva registrado: ', meses_antiguo, ' meses') as mensaje;
    select concat('El empleado mas joven es: ', empleado_joven, ', lleva registrado: ', meses_joven, ' meses') as mensaje;
    
END