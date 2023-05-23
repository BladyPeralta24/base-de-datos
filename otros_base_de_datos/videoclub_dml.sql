insert into director (nombre, pais) values ('Christopher Nolan', 'Gran Bretaña');
insert into director (nombre, pais) values ('Ridley Scoot', 'Gran Bretaña');


insert into actor (nombre, pais, sexo) values('Christian Bale', 'Gran Bretaña', 'Hombre');
insert into actor (nombre, pais, sexo) values('Sigourney Weaver', 'Estados Unidos', 'Mujer');
insert into actor (nombre, pais, sexo) values('Cillian Murphy', 'Irlanda', 'Hombre');


insert into pelicula(titulo, pais, produccion, estreno, director) values('El caballero oscuro', 'Estados Unidos', 'Warner bros', str_to_date('13/08/2008','%d/%m/%Y'), 101);
insert into pelicula(titulo, pais, produccion, estreno, director) values('Alien', 'Estados Unidos', 'Brandywine', str_to_date('25/09/1979','%d/%m/%Y'), 102);


insert into participa (id_peli, id_actor, personaje) values (301, 201, 'Bruce Wayne'); 
insert into participa (id_peli, id_actor, personaje) values (302, 202, 'Ellen Ripley'); 
insert into participa (id_peli, id_actor, personaje) values (301, 203, 'El Espantapájaros');  

SET FOREIGN_KEY_CHECKS = 0;

insert into socio (dni, nombre, direccion, telefono, dni_avalador) values ('11111111', 'Fernando', 'Calle uno', '611111111', '');
insert into socio (dni, nombre, direccion, telefono, dni_avalador) values ('11111112', 'Javier', 'Calle dos', '622111111', '11111111');
insert into socio (dni, nombre, direccion, telefono, dni_avalador) values ('11111113', 'Luis', 'Calle tres', '633111111', '11111111');


insert into ejemplar (id_pelicula, id_ejemplar, conservacion) values (301, 1, 'Bueno');
insert into ejemplar (id_pelicula, id_ejemplar, conservacion) values (301, 2, 'Malo');
insert into ejemplar (id_pelicula, id_ejemplar, conservacion) values (302, 1, 'Bueno');
insert into ejemplar (id_pelicula, id_ejemplar, conservacion) values (302, 2, 'Regular');


insert into alquilado (id_peli, id_ejemplar, dni_socio, fecha_inicio, fecha_devolu) values (301, 1, '11111111', str_to_date('22/04/2022','%d/%m/%Y'), str_to_date('24/04/2022','%d/%m/%Y'));
insert into alquilado (id_peli, id_ejemplar, dni_socio, fecha_inicio, fecha_devolu) values (301, 2, '11111112', str_to_date('12/05/2022','%d/%m/%Y'), str_to_date('14/05/2022','%d/%m/%Y'));
insert into alquilado (id_peli, id_ejemplar, dni_socio, fecha_inicio, fecha_devolu) values (302, 2, '11111111', str_to_date('01/06/2022','%d/%m/%Y'), str_to_date('05/06/2022','%d/%m/%Y'));