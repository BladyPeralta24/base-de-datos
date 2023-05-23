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
    SELECT SUM(gol_visitante) INTO goles_a_favor FROM partidos WHERE codequipovisitante = codigo_equipo;


    -- Obtener el total de goles en contra
    SELECT SUM(gol_visitante) INTO goles_en_contra FROM partidos WHERE codequipovisitante = codigo_equipo;
    SELECT SUM(gol_local) INTO goles_en_contra FROM partidos WHERE codequipovisitante = codigo_equipo;

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






-- Examen de dani de base de datos

drop database if exists santander;
create database santander;
use santander;

drop table if exists partidos;
drop table if exists equipos;

create table equipos (
	codequipo integer NOT NULL AUTO_INCREMENT,
	nombre varchar(30),
	localidad varchar(15),
	PRIMARY KEY (codequipo)
);

create table partidos (
	codpartido integer NOT NULL AUTO_INCREMENT,
	codequipolocal integer NOT NULL,
	codequipovisitante integer NOT NULL,
	fecha date,
	jornada integer,
	gol_local integer,
	gol_visitante integer,
	FOREIGN KEY (codequipolocal) REFERENCES equipos(codequipo),
	FOREIGN KEY (codequipovisitante) REFERENCES equipos(codequipo),
	PRIMARY KEY (codpartido)
);

insert into equipos(nombre, localidad) values('Barcelona','Barcelona');
insert into equipos(nombre, localidad) values('Real Madrid','Madrid');
insert into equipos(nombre, localidad) values('Sevilla','Sevilla');
insert into equipos(nombre, localidad) values('Getafe','Getafe');
insert into equipos(nombre, localidad) values('Atlético','Madrid');
insert into equipos(nombre, localidad) values('Real Sociedad','San Sebastián');
insert into equipos(nombre, localidad) values('Valencia','Valencia');
insert into equipos(nombre, localidad) values('Villarreal','Villarreal');
insert into equipos(nombre, localidad) values('Atletic','Bilbao');
insert into equipos(nombre, localidad) values('Granada','Granada');
insert into equipos(nombre, localidad) values('Osasuna','Pamplona');
insert into equipos(nombre, localidad) values('Alavés','Vitoria');
insert into equipos(nombre, localidad) values('Levante','Valencia');
insert into equipos(nombre, localidad) values('Betis','Sevilla');
insert into equipos(nombre, localidad) values('Valladolid','Valladolid');
insert into equipos(nombre, localidad) values('Eibar','Éibar');
insert into equipos(nombre, localidad) values('Celta','Vigo');
insert into equipos(nombre, localidad) values('Mallorca','Mallorca');
insert into equipos(nombre, localidad) values('Leganés','Leganés');
insert into equipos(nombre, localidad) values('Espanyol','Barcelona');

insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(9,1,'2019-08-16',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(17,2,'2019-08-17',1,1,3);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(7,6,'2019-08-17',1,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(18,16,'2019-08-17',1,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(19,11,'2019-08-17',1,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(8,10,'2019-08-17',1,4,4);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(12,13,'2019-08-18',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(20,3,'2019-08-18',1,0,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(14,15,'2019-08-18',1,1,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(5,4,'2019-08-18',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(10,3,'2019-08-23',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(13,8,'2019-08-23',2,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(11,16,'2019-08-24',2,0,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(2,15,'2019-08-24',2,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(17,7,'2019-08-24',2,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(4,9,'2019-08-24',2,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(12,20,'2019-08-25',2,0,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(18,6,'2019-08-25',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(19,5,'2019-08-25',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(1,14,'2019-08-25',2,5,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(3,17,'2019-08-30',3,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(9,6,'2019-08-30',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(11,1,'2019-08-31',3,2,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(13,15,'2019-08-31',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(4,12,'2019-08-31',3,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(14,19,'2019-08-31',3,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(7,18,'2019-09-01',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(20,10,'2019-09-01',3,0,3);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(5,16,'2019-09-01',3,3,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(8,2,'2019-09-01',3,2,2);


-- 1. (1 punto) Crear una vista denoninada “equipos_partidos” que muestre la tabla partidos
-- sustituyendo “CodEquipoLocal” y “CodEquipoVisitante” por sus correspondientes nombres de
-- equipos.

drop view if exists equipos_partidos;
CREATE VIEW equipos_partidos AS

SELECT
eq1.nombre AS "equipo local",
eq2.nombre AS "equipo visitante",
fecha, jornada, gol_local, gol_visitante

FROM partidos
INNER JOIN equipos eq1
    ON partidos.codequipolocal = eq1.codequipo
INNER JOIN equipos eq2
    ON partidos.codequipovisitante = eq2.codequipo;



select * from equipos_partidos;




-- 2. (1,5 puntos) Crear un procedimiento denominado “goles_equipos” que reciba el código de un
-- equipo y devuelva el total de goles a favor y total de goles en contra. Si el código del equipo no
-- existe, se deberá advertir al usuario de esta situación mediante el correspondiente mensaje y dar por
-- finalizado el programa.

drop procedure if exists goles_equipos;
DELIMITER $$
CREATE PROCEDURE goles_equipos(cod_equipo INT)
BEGIN
    DECLARE goles_a_favor, goles_en_encontra INT default 0;

    IF cod_equipo NOT IN (SELECT codequipo FROM equipos)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe este equipo';
    END IF;

    set goles_a_favor = goles_a_favor + (select sum(gol_Local) From partidos where codEquipoLocal = cod_equipo GROUP by CodEquipoLocal);
    set goles_a_favor = goles_a_favor + (select sum(gol_Visitante) From partidos where codEquipoVisitante = cod_equipo GROUP by codEquipoVisitante);

    set goles_en_encontra = goles_en_encontra + (select sum(gol_Local) From partidos where codEquipoVisitante = cod_equipo GROUP by codEquipoVisitante);
    set goles_en_encontra = goles_en_encontra + (select sum(gol_Visitante) From partidos where codEquipoLocal = cod_equipo GROUP by CodEquipoLocal);

    select goles_a_favor as "goles a favor", goles_en_encontra as "goles en contra";
END $$
DELIMITER ;


call goles_equipos(19);





-- 3. (1,5 puntos) Crear un procedimiento denominado “goles_partidos” que reciba el código de un
-- equipo y devuelva el número de partidos que ha ganado, el número de partidos que ha perdido y el
-- número de partidos que ha empatado. Si el código del equipo no existe, se deberá advertir al
-- usuario de esta situación mediante el correspondiente mensaje y dar por finalizado el programa.

drop procedure if exists goles_partidos;
DELIMITER $$
CREATE PROCEDURE goles_partidos(cod_equipo INT)
BEGIN
    DECLARE victorias, empates, derrotas INT default 0;

    IF cod_equipo NOT IN (SELECT Codequipo FROM equipos)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo no existe';
    END IF;

    set victorias = victorias + (SELECT count(*) from partidos where CodEquipoLocal = cod_equipo  and Gol_Local > Gol_Visitante);
    set victorias = victorias + (SELECT count(*) from partidos where CodEquipoVisitante = cod_equipo  and Gol_Visitante > Gol_Local);

    set empates = empates + (SELECT count(*) from partidos where CodEquipoLocal = cod_equipo  and Gol_Local = Gol_Visitante);
    set empates = empates + (SELECT count(*) from partidos where CodEquipoVisitante = cod_equipo  and Gol_Visitante = Gol_Local);

    set derrotas = derrotas + (SELECT count(*) from partidos where CodEquipoLocal = cod_equipo  and Gol_Local < Gol_Visitante);
    set derrotas = derrotas + (SELECT count(*) from partidos where CodEquipoVisitante = cod_equipo  and Gol_Visitante < Gol_Local);

    SELECT victorias as "victorias", empates as "empates", derrotas as "derrotas";

END $$
DELIMITER ;

call goles_partidos(1);




-- 4. (1,5 puntos) Crear un disparador que impida que se pueda insertar un registro en la tabla
-- partidos cuando el código del equipo local es el mismo que el código del equipo visitante. En
-- definitiva, un equipo no puede jugar un partido contra sí mismo

DELIMITER $$
CREATE TRIGGER no_repetidos BEFORE INSERT on partidos for each ROW
BEGIN
    IF new.codequipolocal = new.codequipovisitante
    THEN
        SIGNAL sqlstate '45000' SET message_text = 'No se puede jugar contra uno mismo';
    END IF;
END $$
DELIMITER ;

-- insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(9,9,'2019-08-16',1,1,0);




-- 5. (3,5 puntos) Crea la tabla “clasificacion_liga” con la siguiente estructura:
-- CLASIFICACION_LIGA
-- CodEquipo INTEGER Clave primaria
-- PJ INTEGER Partidos jugados
-- PG INTEGER Partidos ganados
-- PE INTEGER Partidos empatados
-- PP INTEGER Partidos perdidos
-- GF INTEGER Goles a favor
-- GC INTEGER Goles en contra
-- Puntos INTEGER Puntos
-- Realiza un disparador denominado “actualizar_clasificacion_liga” que se ejecute cada vez que se
-- inserte un registro en la tabla “partidos” y que actualice los datos de la tabla “clasificación_liga”
-- (partidos jugados, partidos ganados, partidos empatados, partidos perdidos, goles a favor y goles en
-- contra) para los dos equipos que intervienen (CodEquipoLocal y CodEquipoVisitante). Para
-- calcular los puntos debes considerar 3 puntos para las victorias y 1 punto para los empates.
-- Finalmente, muestra la clasificación de los equipos ordenados por puntos y mostrando el nombre
-- del equipo en vez del código.

drop table if exists clasificacion_liga;
CREATE TABLE clasificacion_liga(
    codequipo INT PRIMARY KEY,
    Pj INT,PG INT,PE INT,PP INT,GF INT,GC INT,Puntos INT,
    FOREIGN KEY (codequipo) REFERENCES equipos(codequipo) ON DELETE CASCADE
);

drop trigger if exists actualizar_clasificacion_liga;
delimiter $$
CREATE TRIGGER actualizar_clasificacion_liga AFTER INSERT ON partidos for each ROW
begin

	/* iniciar lineas */
	if (not exists(select * from clasificacion_liga where codequipo = new.codequipolocal))
    then
		insert into clasificacion_liga values(new.codequipolocal, 0,0,0,0,0,0,0);
    end if;

	if (not(exists(select * from clasificacion_liga where codequipo = new.codequipovisitante)))
    then
		insert into clasificacion_liga values(new.codequipovisitante, 0,0,0,0,0,0,0);
    end if;

    /*actualizar clasificacion*/

    -- PJ partidos jugados
    update clasificacion_liga set PJ = PJ + 1 where codequipo in (new.codequipolocal,new.codequipovisitante);

    -- PG partidos ganados
    if (new.gol_local > new.gol_visitante)
    then
		update clasificacion_liga set PG = PG + 1 where codequipo = new.codequipolocal;
    elseif (new.gol_visitante > new.gol_local)
    then
		update clasificacion_liga set PG = PG + 1 where codequipo = new.codequipovisitante;
    end if;

    -- PE partidos empatados
    if (new.gol_local = new.gol_visitante)
    then
		update clasificacion_liga set PE = PE + 1 where codequipo in (new.codequipolocal,new.codequipovisitante);
    end if;

	-- PP partidos perdidos
    if (new.gol_local < new.gol_visitante)
    then
		update clasificacion_liga set PP = PP + 1 where codequipo = new.codequipolocal;
    elseif (new.gol_visitante < new.gol_local)
    then
		update clasificacion_liga set PP = PP + 1 where codequipo = new.codequipovisitante;
    end if;

    -- GF Goles a favor
    update clasificacion_liga set GF = GF + new.gol_local where codequipo = new.codequipolocal;
	update clasificacion_liga set GF = GF + new.gol_visitante where codequipo = new.codequipovisitante;

    -- GC Goles a favor
    update clasificacion_liga set GC = GC + new.gol_visitante where codequipo = new.codequipolocal;
	update clasificacion_liga set GC = GC + new.gol_local where codequipo = new.codequipovisitante;

	-- Puntos
    if (new.gol_local > new.gol_visitante)
    then
		update clasificacion_liga set Puntos = Puntos + 3 where codequipo = new.codequipolocal;

	elseif (new.gol_local < new.gol_visitante)
    then
		update clasificacion_liga set Puntos = Puntos + 3 where codequipo = new.codequipovisitante;

	elseif (new.gol_local = new.gol_visitante)
    then
		update clasificacion_liga set Puntos = Puntos + 1 where codequipo in (new.codequipolocal,new.codequipovisitante);
    end if;

end$$
delimiter ;




truncate partidos;

insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(9,1,'2019-08-16',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(17,2,'2019-08-17',1,1,3);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(7,6,'2019-08-17',1,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(18,16,'2019-08-17',1,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(19,11,'2019-08-17',1,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(8,10,'2019-08-17',1,4,4);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(12,13,'2019-08-18',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(20,3,'2019-08-18',1,0,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(14,15,'2019-08-18',1,1,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(5,4,'2019-08-18',1,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(10,3,'2019-08-23',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(13,8,'2019-08-23',2,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(11,16,'2019-08-24',2,0,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(2,15,'2019-08-24',2,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(17,7,'2019-08-24',2,1,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(4,9,'2019-08-24',2,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(12,20,'2019-08-25',2,0,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(18,6,'2019-08-25',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(19,5,'2019-08-25',2,0,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(1,14,'2019-08-25',2,5,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(3,17,'2019-08-30',3,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(9,6,'2019-08-30',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(11,1,'2019-08-31',3,2,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(13,15,'2019-08-31',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(4,12,'2019-08-31',3,1,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(14,19,'2019-08-31',3,2,1);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(7,18,'2019-09-01',3,2,0);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(20,10,'2019-09-01',3,0,3);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(5,16,'2019-09-01',3,3,2);
insert into partidos(codequipolocal, codequipovisitante, fecha, jornada, gol_local, gol_visitante) values(8,2,'2019-09-01',3,2,2);

select * from clasificacion_liga;

select Nombre, puntos from clasificacion_liga inner join equipos on clasificacion_liga.codequipo = equipos.codequipo
order by Puntos desc;





-- 6. (1 punto) Crea una función que reciba un código de equipo y devuelva su clasificación (1º, 2º, 3º,
-- 4º, etc...) a partir de la tabla anterior. Si el equipo no existe, devuelve la cadena “Error en código”.
-- Para calcular la posición, debemos contar todos aquellos registros (equipos) cuya puntuación este
-- por encima de la obtenida por el equipo buscado.

drop function if exists posicion;
delimiter $$
create function posicion(cod_equipo int)
returns varchar(4) deterministic
begin
	declare puntos_equipo, resultado int;

    if (cod_equipo not in (select codequipo from equipos))
    THEN
        SIGNAL sqlstate '45000' SET message_text = 'No existe el equipo';
    END IF;

	select Puntos into puntos_equipo from clasificacion_liga where codequipo = cod_equipo;
    select count(*) into resultado from clasificacion_liga where puntos > puntos_equipo;
    return Concat(resultado + 1, "º");

end$$
delimiter ;

-- select posicion(19);



