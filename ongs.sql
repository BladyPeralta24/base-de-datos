drop database if exists ong;
create database ong;
use ong;

drop table if exists proyecto;
drop table if exists tiene;
drop table if exists socio;
drop table if exists asalariado;
drop table if exists voluntario;
drop table if exists trabajador;
drop table if exists participante;
drop table if exists asociacion;


create table participante(
    dni varchar(10),
    nombre varchar(20) not null,
    direccion varchar(50) not null,
    tipo varchar(20) not null,

    constraint ck_tipo check (tipo in ('trabajador', 'socio')),
    constraint pk_dni primary key (dni)
);

create table trabajador(
    dni varchar(10),
    nombre varchar(20) not null,
    fecha_ingreso DATE,
    tipo varchar(20) not null,

    constraint fk_dni foreign key (dni) references participante(dni) ON DELETE CASCADE,
    constraint ck_tipo_trabajador check(tipo in ('voluntariado', 'asalariado')),
    constraint pk_dni primary key (dni)
);

create table voluntario(
    dni varchar(10),
    edad int,
    profesion varchar(50) not null,
    horas int,

    constraint fk_dni_voluntario foreign key (dni) references trabajador(dni) ON DELETE CASCADE,
    constraint pk_dni primary key (dni)
);

create table asalariado(
    dni varchar(10),
    irpf decimal(4,2),
    sueldo decimal (8,2),
    cargo varchar(20) not null,

    constraint fk_dni_asalariado FOREIGN KEY (dni) REFERENCES trabajador(dni) ON DELETE CASCADE,
    constraint pk_dni PRIMARY KEY (dni)
);

create table socio(
    dni VARCHAR(10),
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,

    constraint fk_dni_socio FOREIGN KEY (dni) REFERENCES participante(dni) ON DELETE CASCADE,
    constraint pk_dni PRIMARY KEY (dni)
);

CREATE TABLE asociacion(
    cif VARCHAR(10),
    denominacion VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    provincia VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    utilidad_publica BOOLEAN NOT NULL,

    constraint pk_cif PRIMARY KEY (cif) 
);

CREATE TABLE tiene(
    cif VARCHAR(10),
    dni_soc VARCHAR(10),
    fecha_alta DATE,
    cuota decimal(8,2) DEFAULT 0,
    aportacion VARCHAR(50) NOT NULL,

    constraint fk_cif FOREIGN KEY (cif) REFERENCES asociacion(cif) ON DELETE CASCADE,
    constraint fk_dni_soc FOREIGN KEY (dni_soc) REFERENCES socio(dni) ON DELETE CASCADE,
    constraint pk_cif_dnisoc PRIMARY KEY (cif, dni_soc)
);

CREATE TABLE proyecto(
    cif VARCHAR(10),
    id_proyecto VARCHAR(10),
    pais VARCHAR(20) NOT NULL,
    objetivo VARCHAR(50) NOT NULL,
    beneficiario VARCHAR(20) NOT NULL,
    zona VARCHAR(20) NOT NULL,
    cif_padre VARCHAR(10),
    id_padre VARCHAR(10),

    constraint fk_cif_proyecto FOREIGN KEY (cif) REFERENCES asociacion(cif) ON DELETE CASCADE,
    constraint fk_cif_padre FOREIGN KEY (cif_padre) REFERENCES proyecto(cif) ON DELETE CASCADE,
    constraint fk_cif_id_padre FOREIGN KEY (cif_padre, id_padre) REFERENCES proyecto(cif, id_proyecto) ON DELETE CASCADE,
    constraint pk_cif_id PRIMARY KEY (cif, id_proyecto)
);


insert into participante (dni, nombre, direccion, tipo) values ('878454895', 'Manolo', 'Calle virgen de los dolores, 24', 'Socio');

insert into participante (dni, nombre, direccion, tipo) values ('6515151', 'Luis', 'Calle Barbieri, 10', 'Trabajador');

insert into participante (dni, nombre, direccion, tipo) values ('569865424', 'Laura', 'Calle Jose Mariano Rajoy, 13', 'Trabajador');

insert into trabajador (dni, nombre, fecha_ingreso, tipo) values ('569865424', 'Laura', str_to_date('29/01/2005', '%d/%m/%Y'), 'asalariado');

insert into trabajador (dni, nombre, fecha_ingreso, tipo) values ('6515151', 'Luis', str_to_date('13/04/2012', '%d/%m/%Y'), 'voluntariado');

insert into voluntario (dni, edad, profesion, horas) values ('6515151', 35, 'Director', 8);

insert into asalariado (dni, irpf, sueldo, cargo) values ('569865424', 12.5, 1300, 'Mapeador');

insert into socio (dni, nombre, direccion) values ('878454895', 'Manolo', 'Calle virgen de los dolores, 24');

insert into asociacion (cif, denominacion, direccion, provincia, tipo, utilidad_publica) values ('12345678', '', 'Calle Hortaleza, 23', 'Madrid', 'Minorista', 1);

insert into proyecto (cif, id_proyecto, pais, objetivo, beneficiario, zona, cif_padre, id_padre) values ('12345678', '1', 'España', '', '', 'Centrica', '12345678', '1');

insert into tiene (cif, dni_soc, fecha_alta, cuota, aportacion) values ('12345678', '878454895', str_to_date('25/12/2012', '%d/%m/%Y'), 23000, 'Ninguna');



