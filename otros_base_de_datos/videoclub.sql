DROP DATABASE IF EXISTS videoclub;
create database videoclub;
use videoclub;


drop table if exists alquilado;
drop table if exists ejemplar;
drop table if exists participa;
drop table if exists pelicula;
drop table if exists socio;
drop table if exists actor;
drop table if exists director;


create table director(
    id_dir INT,
    nombre VARCHAR(50),
    pais VARCHAR(20) NOT NULL,

    constraint uq_nombre_dir UNIQUE (nombre),
    constraint pk_id_dir PRIMARY KEY (id_dir)
);
alter table director AUTO_INCREMENT = 101;
create table actor(
    id_actor INT,
    nombre VARCHAR(50),
    pais VARCHAR(20) NOT NULL,
    sexo VARCHAR(20),

    constraint u_nombre_actor UNIQUE (nombre),
    constraint ck_sexo CHECK (sexo IN ('hombre', 'mujer', 'no binario')),
    constraint pk_id_actor PRIMARY KEY (id_actor) 
);
alter table actor AUTO_INCREMENT = 201;
create table socio(
    dni VARCHAR(10),
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    telefono VARCHAR(10),
    dni_avalador VARCHAR(10),

    constraint u_nombre_socio UNIQUE (nombre),
    constraint u_telefono UNIQUE (telefono),
    constraint fk_dni_avalador FOREIGN KEY (dni_avalador) REFERENCES socio(dni) ON DELETE SET NULL,
    constraint pk_dni PRIMARY KEY (dni)
);
create table pelicula(
    id_peli INT,
    titulo VARCHAR(50) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    produccion VARCHAR(20) NOT NULL,
    estreno DATE NOT NULL,
    director INT,

    constraint fk_director FOREIGN KEY (director) REFERENCES director(id_dir) ON DELETE CASCADE,
    constraint pk_id_peli PRIMARY KEY (id_peli)
);
alter table pelicula AUTO_INCREMENT = 301;
create table participa(
    id_peli INT,
    id_actor INT,
    personaje VARCHAR(20) NOT NULL,

    constraint fk_id_peli_participa FOREIGN KEY (id_peli) REFERENCES pelicula(id_peli) ON DELETE CASCADE,
    constraint fk_id_actor_participa FOREIGN KEY (id_actor) REFERENCES actor(id_actor) ON DELETE CASCADE,
    constraint pk_id_peli_actor PRIMARY KEY (id_peli, id_actor)
);
create table ejemplar(
    id_pelicula INT,
    id_ejemplar INT,
    conservacion VARCHAR(10) NOT NULL,

    constraint fk_id_pelicula FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_peli) ON DELETE CASCADE,
    constraint ck_conservacion CHECK (conservacion IN ('bueno', 'malo', 'regular')),
    constraint pk_id_pelicula_ejemplar PRIMARY KEY (id_pelicula, id_ejemplar)
);
create table alquilado(
    id_peli INT,
    id_ejemplar INT,
    dni_socio VARCHAR(10),
    fecha_inicio DATE NOT NULL,
    fecha_devolu DATE NOT NULL,

    constraint fk_id_peli_ejemplar_alquilado FOREIGN KEY (id_peli, id_ejemplar) REFERENCES ejemplar(id_pelicula, id_ejemplar) ON DELETE CASCADE,
    constraint fk_dni_socio FOREIGN KEY (dni_socio) REFERENCES socio(dni) ON DELETE CASCADE,
    constraint ck_fecha_devolu CHECK (fecha_devolu in (fecha_inicio < fecha_devolu)),
    constraint pk_id_peli_ejemplar_socio PRIMARY KEY (id_peli, id_ejemplar, dni_socio)
);



