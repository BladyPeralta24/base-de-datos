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