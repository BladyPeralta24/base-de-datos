--Ejercicio 1

create view equipos_partidos as
select p.codpartido, e_local.nombre as equipo_local, e_visitante.nombre as equipo_visitante, p.fecha, p.jornada, p.gol_local, p.gol_visitante
from partidos p, equipos e_local, equipos e_visitante
where p.codequipolocal = e_local.codequipo and p.codequipovisitante = e_visitante.codequipo;

select * from equipos_partidos;

-- Ejercicio 2

CREATE DEFINER=`bladimir`@`localhost` PROCEDURE `goles_equipos`(IN codigo_equipo INTEGER)
BEGIN
    DECLARE nombre_equipo VARCHAR(30);
    DECLARE goles_a_favor INTEGER;
    DECLARE goles_en_contra INTEGER;
    DECLARE mensaje VARCHAR(100);


    SELECT nombre INTO nombre_equipo FROM equipos WHERE codequipo = codigo_equipo;

	-- comprobar si el codigo no existe
    IF nombre_equipo IS NULL THEN
        set mensaje = 'el codigo del equipo no existe';
        select mensaje;
    END IF;

    -- Obtener el total de goles a favor
    SELECT SUM(gol_local) INTO goles_a_favor FROM partidos WHERE codequipolocal = codigo_equipo;

    -- Obtener el total de goles en contra
    SELECT SUM(gol_visitante) INTO goles_en_contra FROM partidos WHERE codequipovisitante = codigo_equipo;

    -- Mostrar los resultados
    SELECT nombre_equipo AS equipo, goles_a_favor AS goles_a_favor, goles_en_contra AS goles_en_contra;

END

call goles_equipos(1);

-- Ejercicio 3
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

call goles_partidos(13);


-- Ejercicio 4
DELIMITER $$

CREATE TRIGGER validar_partido BEFORE INSERT ON partidos
FOR EACH ROW
BEGIN
    IF NEW.codequipolocal = NEW.codequipovisitante THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede insertar un partido donde el quipo local y visitante es el mismo equipo';
    END IF;
END $$

insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(1,1,'2019-08-16',1,1,0);


-- Ejercicio 5
create table clasificacion_liga (
	codequipo integer NOT NULL AUTO_INCREMENT,
	pj integer,
	pg integer,
	pe integer,
	pp integer,
	gf integer,
	gc integer,
	puntos integer,
	PRIMARY KEY (codequipo)
);


CREATE TRIGGER actualizar_clasificacion_liga AFTER INSERT ON partidos
FOR EACH ROW
BEGIN
    -- Actualizar los datos del equipo local
    UPDATE clasificacion_liga
    SET
        pj = pj + 1,
        pg = pg + IF(NEW.gol_local > NEW.gol_visitante, 1, 0),
        pe = pe + IF(NEW.gol_local = NEW.gol_visitante, 1, 0),
        pp = pp + IF(NEW.gol_local < NEW.gol_visitante, 1, 0),
        gf = gf + NEW.gol_local,
        gc = gc + NEW.gol_visitante,
        puntos = puntos + IF(NEW.gol_local > NEW.gol_visitante, 3, IF(NEW.gol_local = NEW.gol_visitante, 1, 0))
    WHERE codequipo = NEW.codequipolocal;

    -- Actualizar los datos del equipo visitante
    UPDATE clasificacion_liga
    SET
        pj = pj + 1,
        pg = pg + IF(NEW.gol_local < NEW.gol_visitante, 1, 0),
        pe = pe + IF(NEW.gol_local = NEW.gol_visitante, 1, 0),
        pp = pp + IF(NEW.gol_local > NEW.gol_visitante, 1, 0),
        gf = gf + NEW.gol_visitante,
        gc = gc + NEW.gol_local,
        puntos = puntos + IF(NEW.gol_local < NEW.gol_visitante, 3, IF(NEW.gol_local = NEW.gol_visitante, 1, 0))
    WHERE codequipo = NEW.codequipovisitante;
END;

select e.nombre as equipo, c.pj, c.pg, c.pe, c.pp, c.gf, c.gc, c.puntos
from clasificacion_liga c, equipos e
where e.codequipo = c.codequipo
order by c.puntos desc;



