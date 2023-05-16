drop table partidos;
drop table equipos;


commit;

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

commit;

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




















commit;
