CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `factorial_for`(numero int)
BEGIN
    declare resultado int;
    declare i int;
    declare aux int;
    if numero = 0 or numero = 1 then
		select resultado = 1;
	elseif numero > 1 then
		set i = 1;
        set aux = numero;
        repeat
			set aux = i * aux;
            set resultado = aux;
            set i = i + 1;
		until i >= numero
        end repeat;
        select resultado;
	end if;
END