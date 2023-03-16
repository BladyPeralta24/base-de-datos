drop table reserva;
drop table coche;
drop table cliente;

commit;

create table cliente (  
	codcliente integer NOT NULL,
	nombre varchar(50),
	fechalta date,
	credito integer default 0,
	PRIMARY KEY (codcliente)
);

create table coche (  
	codcoche integer NOT NULL,
	marca varchar(50),
	preciodia integer,
	PRIMARY KEY (codcoche)
);

create table reserva (  
	codcliente integer NOT NULL,
	codcoche integer NOT NULL,
	fechareserva date,
	dias int,
	FOREIGN KEY (codcliente) REFERENCES cliente(codcliente),
	FOREIGN KEY (codcoche) REFERENCES coche(codcoche),
	PRIMARY KEY (codcliente, codcoche, fechareserva)
);

commit;

INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (101,"Fernando","2017-09-13",1100);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (102,"Cristina","2018-03-10",2500);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (103,"Elena","2019-01-14",6500);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (104,"Enrique","2019-07-24",4000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (105,"Alejandro","2019-10-20",8000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (106,"Roberto","2019-05-02",1500);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (107,"Sonia","2018-09-04",1000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (108,"Maria","2018-11-18",2000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (109,"Miguel","2017-01-13",1000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (110,"Dafne","2019-05-01",3000);
INSERT INTO `cliente` (`codcliente`,`nombre`,`fechalta`,`credito`) VALUES (111,"Francisco","2019-05-01",5000);

insert into `coche` (`codcoche`, `marca`, `preciodia`) values(201, 'Mini', 90);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(202, 'Alfa Romeo', 100);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(203, 'Alpine', 120);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(204, 'Aston Martin', 200);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(205, 'Audi', 110);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(206, 'BMW', 110);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(207, 'Fiat', 85);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(208, 'Ferrari', 210);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(209, 'Dacia', 45);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(210, 'Ford', 65);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(211, 'Honda', 90);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(212, 'Jaguar', 120);
insert into `coche` (`codcoche`, `marca`, `preciodia`) values(213, 'Mazda', 80);

INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,208,"2019-02-02",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,204,"2019-02-05",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,204,"2019-02-10",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,202,"2019-02-02",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,201,"2019-02-07",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,209,"2019-02-08",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,202,"2019-02-08",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,205,"2019-02-04",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,205,"2019-02-09",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,210,"2019-02-01",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,201,"2019-02-12",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,204,"2019-02-13",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,202,"2019-02-10",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,205,"2019-02-01",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,202,"2019-02-14",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,205,"2019-02-10",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,203,"2019-02-04",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,207,"2019-02-07",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,203,"2019-02-04",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,202,"2019-02-10",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,207,"2019-02-02",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,202,"2019-02-11",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,207,"2019-02-11",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,204,"2019-02-05",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,203,"2019-02-01",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,202,"2019-02-12",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,206,"2019-02-10",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,210,"2019-02-01",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,205,"2019-02-09",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,203,"2019-02-06",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,202,"2019-02-04",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,201,"2019-02-04",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,206,"2019-02-08",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,201,"2019-02-07",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,206,"2019-02-03",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,202,"2019-02-06",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,203,"2019-02-13",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,201,"2019-02-02",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,205,"2019-02-09",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,207,"2019-02-04",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,209,"2019-02-05",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,201,"2019-02-08",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,207,"2019-02-05",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,206,"2019-02-07",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,201,"2019-02-06",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,204,"2019-02-09",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,206,"2019-02-02",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,209,"2019-02-05",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,201,"2019-02-11",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,207,"2019-02-03",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,210,"2019-02-05",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,203,"2019-02-09",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,206,"2019-02-06",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,208,"2019-02-07",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,203,"2019-02-08",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,204,"2019-02-14",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,208,"2019-02-03",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,205,"2019-02-04",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,209,"2019-02-06",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,210,"2019-02-05",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,210,"2019-02-03",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,203,"2019-02-01",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,210,"2019-02-08",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,208,"2019-02-05",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,210,"2019-02-03",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,202,"2019-02-09",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,206,"2019-02-07",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,209,"2019-02-03",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,208,"2019-02-07",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,208,"2019-02-07",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,204,"2019-02-13",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,208,"2019-02-05",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,201,"2019-02-14",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,207,"2019-02-13",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (105,201,"2019-02-08",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (104,210,"2019-02-02",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,204,"2019-02-08",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,203,"2019-02-13",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,210,"2019-02-09",2);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,205,"2019-02-13",1);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (110,202,"2019-02-11",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (106,207,"2019-02-10",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,210,"2019-02-13",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,209,"2019-02-10",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,210,"2019-02-11",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (103,203,"2019-02-14",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,208,"2019-02-11",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (108,206,"2019-02-06",5);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (101,202,"2019-02-14",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (109,204,"2019-02-14",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,204,"2019-02-10",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,206,"2019-02-01",4);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (107,206,"2019-02-10",3);
INSERT INTO `reserva` (`codcliente`,`codcoche`,`fechareserva`,`dias`) VALUES (102,209,"2019-02-12",2);

commit;
