 
drop database if exists nota_alumnos;
create database nota_alumno;
use nota_alumno;


drop table if exists alumno;
create table alumno (
    ident int,
    nombre varchar(30),
    nota float NOT NULL,
    nota_final varchar(30),
    CONSTRAINT dir_id_pk PRIMARY KEY (ident)
);

INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (101,'Fernando Alvárez',4,null);
INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (102,'Roberto Moreno',6.1,null);
INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (103,'Cristina Ávila',7.5,null);
INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (104,'Lorena Valdivia',5,null);
INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (105,'Cristian López',9.3,null);
INSERT INTO alumno (ident,nombre,nota,nota_final) VALUES (106,'Inma Cabello',10,null);
