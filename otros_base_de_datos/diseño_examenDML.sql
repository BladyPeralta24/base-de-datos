use disenio_examen;
delete from Escrito;
delete from Alumno;

insert into Alumno (nombre, grupo) values ('Jesus Niño', '2ºA');
insert into Alumno (nombre, grupo) values ('Santos Lusardo', '3ºB2');
insert into Alumno (nombre, grupo) values ('Maximiliano Alegri', '1ºC');
insert into Alumno (nombre, grupo) values ('Esperanza Aguirre', '3ºA');



insert into Escrito (num_preguntas, fecha) values ('10', STR_TO_DATE('01/01/2023','%d/%m/%Y'));
insert into Escrito (num_preguntas, fecha) values ('20', STR_TO_DATE('12/11/2022','%d/%m/%Y'));
insert into Escrito (num_preguntas, fecha) values ('5', STR_TO_DATE('05/04/2023','%d/%m/%Y'));