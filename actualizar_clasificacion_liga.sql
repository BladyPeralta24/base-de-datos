create trigger actualizar_clasificacion_liga after insert on partidos
for each row
begin
	-- Equipo local
	update clasificacion_lifa
    set
		pj = pj + 1,
        pg = pg + if(new.gol_local > new.gol_visitante, 1, 0),
        pe = pe + if(new.gol_local = new.gol_visitante, 1, 0),
        pp = pp + if(new.gol_local < new.gol_visitante, 1, 0),
        gf = gf + new.gol_local,
        gc = gc + new.gol_visitante,
        puntos = puntos + if(new.gol_local > new.gol_visitante, 3, if(new.gol_local = new.gol_visitante, 1, 0))
	where codequipo = new.codequipolocal;
    
    -- Equipo visitante
    update clasificacion_liga
    set
		pj = pj + 1,
        pg = pg + if(new.gol_local < new.gol_visitante, 1, 0),
        pe = pe + if(new.gol_local = new.gol_visitante, 1, 0),
        pp = pp + if(new.gol_local > new.gol_visitante, 1, 0),
        gf = gf + new.gol_visitante,
        gc = gc + new.gol_local,
        puntos = puntos + if(new.gol_local < new.gol_visitante, 3, if(new.gol_local = new.gol_visitante, 1, 0))
	where codequipo = new.codequipovisitante
    
end;
