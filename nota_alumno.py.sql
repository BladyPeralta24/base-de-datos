CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `nota_alumno`()
BEGIN
	DECLARE vacio INT default FALSE;
	DECLARE nota float;
	DECLARE nota_final_calculada varchar(30);
    DECLARE notas_globales cursor for
		select nota from alumno where nota_final is null;
        
	DECLARE continue handler for not found set vacio = TRUE;
    
    open notas_globales;
    
    read_loop: LOOP
		FETCH notas_globales into nota;
        
        if vacio then
			leave read_loop;
		end if;
        
        case
			when nota >= 9 then 
				set nota_final_calculada = "Sobresaliente";
            when nota >= 7 and nota < 9 then 
				set nota_final_calculada = 'Notable';
            when nota >= 6 and nota < 7 then 
				set nota_final_calculada = 'Bien';
            when nota >= 5 and nota < 6 then 
				set nota_final_calculada = 'Aprobado';
            else 
				set nota_final_calculada = "Suspenso";
		end case;
        
        update alumno set nota_final = nota_final_calculada where nota = nota and nota_final is null;
        
	END LOOP;
    
    close notas_globales;
END