-- datos a tener en cuenta para crear las tablas

/*
-- Entrada (id_entrada{PK}, precio, id_horario{FK: Horario}, id_sala {FK: sala},
    id_pelicula{FK: Pelicula}, id_venta{FK: Venta}, id_descuento{FK: Descuento})

-- Pelicula (id_pelicula{PK}, título, duración, id_género(FK: Género))

-- Género (id_genero{PK}, nombre)

-- Horario (id_horario{PK}, hora_inicio, hora_fin)

-- Sala (id_sala{PK}, nombre, capacidad, tipo_sala)

-- Descuento (id_descuento{PK}, tipo,  cantidad)

-- Venta (id_venta{PK}, fecha, id_cliente)

-- Empleado (id_empleado{PK}, nombre, apellidos, puesto, salario)

-- Cliente (id_cliente{PK}, nombre, apellidos, email, telefono)
*/

drop database if exists cinepolis;
create database cinepolis;
use cinepolis;

drop table if exists Entrada;
drop table if exists Pelicula;
drop table if exists Genero;
drop table if exists Horario;
drop table if exists Sala;
drop table if exists Descuento;
drop table if exists Venta;
drop table if exists Empleado;
drop table if exists Cliente;

create table Cliente (
    id_cliente varchar(10),
    nombre varchar(20) not null,
    apellidos varchar(50) not null,
    email varchar(50) not null,
    telefono varchar (20),

    constraint PK_id_cliente PRIMARY KEY (id_cliente)
    );

create table Empleado (
    id_empleado varchar(10),
    nombre varchar(20) not null,
    apellidos varchar(50) not null,
    puesto varchar(20) not null,
    salario int,

    constraint PK_id_empleado PRIMARY KEY (id_empleado)
    );

create table Venta ();

create table Descuento ();

create table Sala ();

create table Horario ();

create table Genero ();

create table Pelicula ();

create table Entrada ();







