DROP DATABASE IF EXISTS sistema_ventas;
CREATE DATABASE sistema_ventas;
USE sistema_ventas;

DROP TABLE IF EXISTS LineaCompra;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Suministra;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Estanteria;
DROP TABLE IF EXISTS Almacen;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Persona;



CREATE TABLE Persona (
    dni VARCHAR(10),
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    fecha_n DATE,
    tipo VARCHAR(10) NOT NULL,

    constraint PK_dni PRIMARY KEY (dni),
    constraint U_telefono UNIQUE (telefono),
    constraint CK_tipo CHECK (tipo IN ('Cliente', 'Proveedor', 'Empleado'))
    );

CREATE TABLE Proveedor(
    dni VARCHAR(10),
    web VARCHAR(20) NOT NULL,
    constraint PK_dni PRIMARY KEY (dni),
    constraint FK_dni_prov FOREIGN KEY (dni) REFERENCES Persona(dni) ON DELETE CASCADE
    );

CREATE TABLE Cliente(
    dni VARCHAR(10),
    saldo DECIMAL(8,2),
    constraint PK_dni PRIMARY KEY (dni),
    constraint FK_dni_cl FOREIGN KEY (dni) REFERENCES Persona(dni) ON DELETE CASCADE
    );

CREATE TABLE Empleado(
    dni VARCHAR(10),
    salario DECIMAL(8,2),
    constraint PK_dni PRIMARY KEY (dni),
    constraint FK_dni_em FOREIGN KEY (dni) REFERENCES Persona(dni) ON DELETE CASCADE
    );

CREATE TABLE Categoria(
    idcat INT AUTO_INCREMENT,
    nombre VARCHAR(20) UNIQUE NOT NULL,
    descripcion VARCHAR(200) NOT NULL,

    constraint PK_idcat PRIMARY KEY (idcat)
    );

CREATE TABLE Almacen(
    codalmacen INT AUTO_INCREMENT,
    direccion VARCHAR(50) NOT NULL,

    constraint PK_codalmacen PRIMARY KEY (codalmacen)
    );


CREATE TABLE Estanteria(
    codalmacen INT NOT NULL AUTO_INCREMENT,
    codestanteria INT,
    descripcion VARCHAR(200),

    constraint FK_codalmacen FOREIGN KEY (codalmacen) REFERENCES Almacen(codalmacen) ON DELETE CASCADE,
    constraint PK_codalmacen_codestanteria PRIMARY KEY (codalmacen, codestanteria)
    );


CREATE TABLE Producto(
    idProd INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    stock DECIMAL(4) NOT NULL,
    idcat INT,
    codalmacen INT,
    codestanteria INT,
    constraint FK_idcat FOREIGN KEY (idcat) REFERENCES Categoria(idcat) ON DELETE SET NULL,
    constraint FK_codalmacen_codestanteria FOREIGN KEY (codalmacen, codestanteria) REFERENCES Estanteria(codalmacen, codestanteria) ON DELETE SET NULL,
    constraint PK_idProd PRIMARY KEY (idProd)
    );

CREATE TABLE Suministra(
    idProd INT,
    dni VARCHAR(10),
    fecha DATE,
    cantidad INT,
    constraint FK_idProd FOREIGN KEY (idProd) REFERENCES Producto(idProd),
    constraint FK_dni_prov_sum FOREIGN KEY (dni) REFERENCES Proveedor(dni),
    constraint PK_idProd_dni_fecha PRIMARY KEY (idProd, dni, fecha)
    );

CREATE TABLE Compra(
    idCompra INT AUTO_INCREMENT,
    fecha DATE,
    descuento VARCHAR(100) DEFAULT 0,
    subtotal DECIMAL(6,2) DEFAULT 0,
    impuesto DECIMAL(6,2),
    total DECIMAL(6,2),
    dnic VARCHAR(10),
    dnie VARCHAR(10),
    constraint FK_dnic FOREIGN KEY (dnic) REFERENCES Cliente(dni),
    constraint FK_dnie FOREIGN KEY (dnie) REFERENCES Empleado(dni),
    constraint PK_idCompra PRIMARY KEY (idCompra)
    );

CREATE TABLE LineaCompra(
    idCompra INT,
    idLinea INT,
    cantidad INT,
    descuento_l DECIMAL(6,2) DEFAULT 0,
    total_l DECIMAL(6,2),
    idProd INT,
    constraint FK_idCompra FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    constraint FK_idProd_producto FOREIGN KEY (idProd) REFERENCES Producto(idProd),
    constraint PK_idCompra_idLinea PRIMARY KEY (idCompra, idLinea)
    );

ALTER TABLE Categoria AUTO_INCREMENT = 100;
ALTER TABLE Almacen AUTO_INCREMENT = 200;
ALTER TABLE Producto AUTO_INCREMENT = 300;
ALTER TABLE Compra AUTO_INCREMENT = 400;
