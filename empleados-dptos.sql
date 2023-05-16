DROP TABLE empleado;
DROP TABLE departamento;

CREATE TABLE departamento (
depto_no int NOT NULL,
nombre_depto VARCHAR(40) NOT NULL,
localizacion VARCHAR(30) NOT NULL,
PRIMARY KEY (depto_no)
);

CREATE TABLE empleado (
codigo_c VARCHAR(18) NOT NULL, 
nombre VARCHAR(50) NOT NULL,
edad int NOT NULL,
oficio VARCHAR(20) NOT NULL,
dir VARCHAR(20) NOT NULL,
fecha_alt DATE NOT NULL,
salario int,
comision int DEFAULT 0 NOT NULL,
depto_no int NOT NULL,
FOREIGN KEY (depto_no) REFERENCES departamento(depto_no) ON DELETE CASCADE,
PRIMARY KEY (codigo_c)
);

INSERT INTO departamento (depto_no, nombre_depto, localizacion) VALUES (10, 'Desarrollo Software', 'El Coyolar');
INSERT INTO departamento (depto_no, nombre_depto, localizacion) VALUES (20, 'Análisis Sistema', 'Guadalupe');
INSERT INTO departamento (depto_no, nombre_depto, localizacion) VALUES (30, 'Contabilidad', 'Subtiava');
INSERT INTO departamento (depto_no, nombre_depto, localizacion) VALUES (40, 'Ventas', 'San Felipe');

INSERT INTO empleado VALUES ('281-160483-0005F', 'Rocha Vargas Héctor', 27, 'Vendedor', 'León', '1983-05-12', 12000, 0, 40);
INSERT INTO empleado VALUES ('281-040483-0056P', 'López Hernández Julio', 27, 'Analista', 'Chinandega', '1982-07-14', 13000, 1500, 20);
INSERT INTO empleado VALUES ('081-130678-0004S', 'Esquivel José', 31, 'Director', 'Juigalpa', '1981-06-05', 16700, 1200, 30);
INSERT INTO empleado VALUES ('281-160473-0009Q', 'Delgado Carmen', 37, 'Vendedor', 'León', '1983-03-02', 13400, 0, 40);
INSERT INTO empleado VALUES ('281-160493-0005F', 'Castillo Montes Luis', 17, 'Vendedor', 'Masaya', '1982-08-12', 16309, 1000, 40);
INSERT INTO empleado VALUES ('281-240784-0004Y', 'Esquivel Leonel Alfonso', 26, 'Presidente', 'Nagarote', '1981-09-12', 15000, 0, 30);
INSERT INTO empleado VALUES ('281-161277-0008R', 'Pérez Luis', 32, 'Empleado', 'Managua', '1980-03-02', 16890, 0, 10);
