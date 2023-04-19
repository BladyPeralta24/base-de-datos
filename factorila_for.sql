CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `factorial_for`(numero int)
BEGIN
    declare resultado int;
    declare i int;
    
    if numero = 0 or numero = 1 then
		select resultado = 1;
	elseif numero > 1 then
		set i = 1;
        repeat
			set resultado = i * numero;
            set numero = resultado;
            set i = i + 1;
		until i = numero
        end repeat;
        select resultado;
	end if;
END