DROP DATABASE IF EXISTS ventasbd;
CREATE DATABASE ventasbd;

USE ventasbd;

CREATE TABLE ventas (
  CodVenta INT,
  Fecha    DATE,
  Cantidad INT,
  Subtotal DECIMAL(6,2),
  IGIC     DECIMAL(6,2),
  Total    DECIMAL(6,2),
  PRIMARY KEY (CodVenta)
);

CREATE TABLE LineaVenta (
  CodVenta INT,
  CodLinea INT,
  Nombre   VARCHAR(50),
  Cantidad INT,
  Importe  DECIMAL(6,2),
  PRIMARY KEY (CodVenta, CodLinea),
  FOREIGN KEY (CodVenta) REFERENCES ventas(CodVenta)
);

-- Insertar en la tabla ventas
INSERT INTO ventas (CodVenta, Fecha, Cantidad, Subtotal, IGIC, Total)
VALUES (101, '2018-12-20', 0, 0, 0, 0);

INSERT INTO ventas (CodVenta, Fecha, Cantidad, Subtotal, IGIC, Total)
VALUES (102, '2019-01-13', 0, 0, 0, 0);

INSERT INTO ventas (CodVenta, Fecha, Cantidad, Subtotal, IGIC, Total)
VALUES (103, '2019-04-15', 0, 0, 0, 0);

-- Insertar en la tabla LineaVenta
INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (101, 201, 'Memoria 16 GB'   , 1, 98.40);

INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (101, 202, 'Placa Base ASUS' , 1, 30.20);

INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (101, 203, 'Core i7'         , 1, 101.10);

INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (102, 201, 'Core i5'         , 1, 90.15);

INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (102, 202, 'Torre Tracens'   , 1, 28.40);

INSERT INTO LineaVenta (CodVenta, CodLinea, Nombre, Cantidad, Importe)
VALUES (103, 201, 'Monitor HP 19' , 2, 97.40);
