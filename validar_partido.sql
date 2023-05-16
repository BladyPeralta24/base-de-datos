delimiter $$
create trigger validar_partido before insert on partidos
for each row
begin
	if new.codequipolocal = new.codequipovisitante then
		signal sqlstate '45000' 
        set message_text = "No se puede insertar un partido donde el quipo local y visitante es el mismo equipo";
	end if;
end $$