CREATE FUNCTION `FUN_DEPTO_SALARIO` (depto_codigo int)
RETURNS int
BEGIN
	declare salario_total int;
    
    select sum(salario) into salario_total
    from empleado
    where depto_no = depto_codigo;
    
	RETURN salario_total;
END;