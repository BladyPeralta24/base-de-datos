create database if not exists escuela;

use escuela;

drop table if EXISTS recibe;
drop table if EXISTS asignatura;
drop table if EXISTS profesor;
drop table if EXISTS alumno;

create table alumno(
    NumMatricula INT,
    nombre VARCHAR(20) not null,
    FechaNacimiento DATE,
    telefono VARCHAR(10) not null,

    constraint PK_NumMatricula PRIMARY KEY (NumMatricula)
);

create table profesor(
    IdProfesor INT,
    nif_p VARCHAR(10),
    nombre VARCHAR(20) not null,
    especialidad VARCHAR(20) not null,
    telefono VARCHAR(10) not null,

    constraint PK_IdProfesor PRIMARY KEY (IdProfesor),
    constraint UQ_nif_p UNIQUE (nif_p)
);

create table asignatura(
    CodAsignatura INT,
    nombre VARCHAR(20) not null,
    IdProfesor INT,

    constraint PK_CodAsignatura PRIMARY KEY (CodAsignatura),
    constraint FK_IdProfesor FOREIGN KEY (IdProfesor) REFERENCES profesor(IdProfesor) on delete cascade
);

create table recibe(
    NumMatricula INT,
    CodAsignatura INT,
    CursoEscolar INT,

    constraint PK_NumMatricula_CodAsignatura_CursoEscolar PRIMARY KEY (NumMatricula, CodAsignatura, CursoEscolar),
    constraint FK_NumMatricula FOREIGN KEY (NumMatricula) REFERENCES alumno(NumMatricula) on delete cascade,
    constraint FK_CodAsignatura FOREIGN KEY (CodAsignatura) REFERENCES asignatura(CodAsignatura) on delete cascade
);