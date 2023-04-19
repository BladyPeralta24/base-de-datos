CREATE DEFINER=`bladimir`@`%` PROCEDURE `convertidor_segundo`()
BEGIN
	set @dia = 11, @hora = 14, @min = 56, @seg = 32;
    set @resultado = (@dia * 24 * 3600) + (@hora * 3600) + (@min * 60) + @seg;
    select concat("El resultado del dia: ", @dia," hora: " ,@hora," minuto: ",@min," segundo: ",@seg, " es: ", @resultado, " segundos.");
END