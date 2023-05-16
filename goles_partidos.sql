CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `goles_partidos`(in codigo_equipo int)
BEGIN
	declare nombre_equipo varchar(30);
    declare partidos_ganados int;
    declare partidos_perdidos int;
    declare partidos_empatados int;
    declare mensaje varchar(100);
    
    select nombre into nombre_equipo 
    from equipos
    where codequipo = codigo_equipo;
    
    if nombre_equipo is null then
		set mensaje = 'El codigo de equipo no existe';
        select mensaje;
	end if;
    
    -- numero de partidos ganados
    select count(*) into partidos_ganados from partidos where codequipolocal = codigo_equipo and gol_local > gol_visitante;
    select count(*) into partidos_ganados from partidos where codequipovisitante = codigo_equipo and gol_visitante > gol_local;
    -- numero de partidos perdidos
    select count(*) into partidos_perdidos from partidos where codequipolocal = codigo_equipo and gol_local < gol_visitante;
    select count(*) into partidos_perdidos from partidos where codequipovisitante = codigo_equipo and gol_visitante < gol_local;
    -- numero de partidos empatados
    select count(*) into partidos_empatados from partidos where codequipolocal = codigo_equipo and gol_local = gol_visitante;
    select count(*) into partidos_empatados from partidos where codequipovisitante = codigo_equipo and gol_visitante = gol_local;
    
    -- resultado
	select nombre_equipo as equipo, partidos_ganados as ganados, partidos_perdidos as perdidos, partidos_empatados as empatados;
END