CREATE DEFINER=`bladimir`@`%` PROCEDURE `ordenar_numero`()
BEGIN
	set @numero1 = 2000, @numero2 = 1980, @numero3 = 2500;
    
    if @numero1 < @numero2 then
		if @numero2 < @numero3 then
			select @numero1, @numero2, @numero3;
		elseif @numero1 < numero3 then
			select @numero1, @numero3, @numero2;
		else
			select @numero3, @numero1, @numero2;
		end if;
	elseif @numero1 < @numero3 then
		select @numero2, @numero1, @numero3;
	elseif @numero2 > @numero3 then
		select @numero2, @numero3, @numero1;
	else
		select @numero3, @numero2, @numero1;
        
	end if;
    
END