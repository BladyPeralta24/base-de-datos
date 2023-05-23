DROP DATABASE IF EXISTS disenio_examen;
CREATE DATABASE disenio_examen;
USE disenio_examen;

DROP TABLE IF EXISTS Realiza_Examen;
DROP TABLE IF EXISTS Realiza_Practica;
DROP TABLE IF EXISTS Disenia;
DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS Practico;
DROP TABLE IF EXISTS Escrito;
DROP TABLE IF EXISTS Alumno;

CREATE TABLE Alumno(
    num_matricula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    grupo VARCHAR(10)
);

CREATE TABLE Escrito(
    num_examen INT PRIMARY KEY AUTO_INCREMENT,
    num_preguntas INT NOT NULL,
    fecha DATE
);

CREATE TABLE Practico(
    cod_practica INT PRIMARY KEY AUTO_INCREMENT,
    modalidad VARCHAR(10) NOT NULL,
    dificultad VARCHAR(10) NOT NULL CHECK(dificultad IN ('Alta', 'Media', 'Baja'))
);

CREATE TABLE Profesor(
    CI INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(10)
);

CREATE TABLE Disenia(
    CI INT,
    cod_practica INT,
    fecha_disenio DATE,
    FOREIGN KEY (CI) REFERENCES Profesor(CI) ON DELETE CASCADE,
    FOREIGN KEY (cod_practica) REFERENCES Practico(cod_practica) ON DELETE CASCADE,
    PRIMARY KEY (cod_practica, CI, fecha_disenio)
);

CREATE TABLE Realiza_Practico(
    num_matricula INT,
    cod_practica INT,
    fecha DATE,
    nota DECIMAL(4,2),
    FOREIGN KEY (num_matricula) REFERENCES Alumno(num_matricula) ON DELETE CASCADE,
    FOREIGN KEY (cod_practica) REFERENCES Practico(cod_practica) ON DELETE CASCADE,
    PRIMARY KEY (num_matricula ,cod_practica)
);

CREATE TABLE Realiza_Examen(
    num_matricula INT,
    num_examen INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (num_matricula) REFERENCES Alumno(num_matricula) ON DELETE CASCADE,
    FOREIGN KEY (num_examen) REFERENCES Escrito(num_examen) ON DELETE CASCADE,
    PRIMARY KEY (num_matricula , num_examen)
);

ALTER TABLE Alumno AUTO_INCREMENT = 100;
ALTER TABLE Escrito AUTO_INCREMENT = 200;
ALTER TABLE Practico AUTO_INCREMENT = 300;
ALTER TABLE Profesor AUTO_INCREMENT = 400;