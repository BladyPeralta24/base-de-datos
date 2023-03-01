SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Persona (dni,nombre,direccion,telefono,fecha_n,tipo) VALUES ('01','Brian Granado','2057 Ipsum ','923228274',STR_TO_DATE('21/12/1985','%d/%m/%Y'),'Cliente');
INSERT INTO Persona (dni,nombre,direccion,telefono,fecha_n,tipo) VALUES ('02','Eduardo González','Apdo.:710-2872 Sollicitudin Avenida','05 06 88 82 84',STR_TO_DATE('21/12/1985','%d/%m/%Y'),'Proveedor');
INSERT INTO Persona (dni,nombre,direccion,telefono,fecha_n,tipo) VALUES ('03','David Castillo','688-9936 At, C.','967775543',STR_TO_DATE('01/01/1995','%d/%m/%Y'),'Empleado');
INSERT INTO Persona (dni,nombre,direccion,telefono,fecha_n,tipo) VALUES ('04','Lorena Alonso','Apdo.:951-3705 Et ','699104395',STR_TO_DATE('21/12/90','%d/%m/%Y'),'Empleado');
INSERT INTO Persona (dni,nombre,direccion,telefono,fecha_n,tipo) VALUES ('05','Ana Pérez','Apdo.:649-7252 Tellus Avda.','300521792',STR_TO_DATE('02/02/1980','%d/%m/%Y'),'Cliente');
INSERT INTO Persona (dni,nombre,direccion,telefono,tipo) VALUES ('06','Antonio Alonso','Apartado núm.: 942, 1876 Odio C/','723293197','Proveedor');
INSERT INTO Persona (dni,nombre,direccion,telefono,tipo) VALUES ('07','Margarita Moreno','530-7277 Nec Avda.','813617131','Proveedor');
INSERT INTO Persona (dni,nombre,direccion,telefono,tipo) VALUES ('08','Fernando Brito','Apdo.:649-1432 Nunc. Ctra.','877069142','Cliente');
INSERT INTO Persona (dni,nombre,direccion,telefono,tipo) VALUES ('09','Scott Calvin','Apartado núm.: 646, 5643 Penatibus C.','104218855','Proveedor');
INSERT INTO Persona (dni,nombre,direccion,telefono,tipo) VALUES ('10','Lysandra Smith','Apdo.:483-2551 Amet C.','940888859','Empleado');

INSERT INTO Cliente (dni,saldo) VALUES ('01',20.45);
INSERT INTO Cliente (dni,saldo) VALUES ('08',10.23);
INSERT INTO Cliente (dni,saldo) VALUES ('05',0.0);

INSERT INTO Empleado (dni,salario) VALUES ('03', 1000.50);
INSERT INTO Empleado (dni,salario) VALUES ('04',1300.25);
INSERT INTO Empleado (dni,salario) VALUES ('10',1240.32);

INSERT INTO Proveedor (dni,web) VALUES ('02','sitio web');
INSERT INTO Proveedor (dni,web) VALUES ('06','sitio web');
INSERT INTO Proveedor (dni,web) VALUES ('07','sitio web');
INSERT INTO Proveedor (dni,web) VALUES ('09','sitio web');

INSERT INTO Almacen (direccion) VALUES ('Apdo.:710-2872 Sollicitudin Avenida');
INSERT INTO Almacen (direccion) VALUES ('Apdo.:951-3705 Et');
INSERT INTO Almacen (direccion) VALUES ('Apartado núm.: 646, 5643 Penatibus C.');
INSERT INTO Almacen (direccion) VALUES ('688-9936 At, C.');

-- SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (200, 1,'Estante superior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (200, 2,'Estante central');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (200, 3,'Estante inferior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (201, 4,'Estante superior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (201, 5,'Estante central');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (201, 6,'Estante inferior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (202, 7,'Estante superior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (202, 8,'Estante central');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (202, 9,'Estante inferior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (203, 10,'Estante superior');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (203, 11,'Estante central');
INSERT INTO Estanteria (codalmacen, codestanteria, descripcion) VALUES (203, 12,'Estante inferior');


INSERT INTO Categoria (nombre, descripcion) VALUES ('Ordenadores', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PcCom', 500.00, 12, 1000, 200, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PC HP', 600.00, 5, 1000, 200, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PC Lenovo', 475.50, 4, 1000, 200, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PC Acer', 450.00, 6, 1000, 200, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PC DELL', 625.65, 9, 1000, 200, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PC MSI', 845.45, 2, 1000, 200, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('iMac', 1257.40, 3, 1000, 200, 1);

INSERT INTO Categoria (nombre, descripcion) VALUES ('Smartphones', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Samsung', 500.00, 8, 1001, 201, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Huawei', 290.10, 5, 1001, 201, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('iPhone', 1175.50, 4, 1001, 201, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Realme', 350.00, 6, 1001, 201, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Xiaomi', 259.25, 9, 1001, 201, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Oppo', 845.45, 2, 1001, 201, 3);

INSERT INTO Categoria (nombre, descripcion) VALUES ('Periféricos', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Monitor', 556.20, 10, 1002, 200, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Teclado', 25.25, 22, 1002, 200, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Ratones', 12.30, 30, 1002, 200, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Altavoces 5.1', 97.60, 5, 1002, 200, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Auriculares', 55.65, 9, 1002, 200, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Silla gaming', 123.45, 4, 1002, 200, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Mesa Gaming', 241.45, 3, 1002, 200, 3);

INSERT INTO Categoria (nombre, descripcion) VALUES ('Televisores', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tv Samsung', 500.00, 10, 1003, 202, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tv LG', 600.00, 5, 1003, 202, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tv Sony', 475.50, 4, 1003, 202, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tv TD System', 450.00, 6, 1003, 202, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tv Philips', 625.65, 9, 1003, 202, 2);

INSERT INTO Categoria (nombre, descripcion) VALUES ('Tablets', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tablet Samsung', 420.10, 10, 1004, 201, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tablet Huawei', 230.30, 5, 1004, 201, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Tablet Lenovo', 315.50, 4, 1004, 201, 3);

INSERT INTO Categoria (nombre, descripcion) VALUES ('Consolas', ' ');

INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PS5', 470.00, 10, 1005, 201, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Xbox Series X', 599.50, 5, 1005, 201, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Xbox Series S', 325.50, 4, 1005, 201, 3);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('PS4', 220.00, 6, 1005, 201, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Nes Switch', 279.35, 9, 1005, 201, 2);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Xbox One', 194.99, 6, 1005, 200, 1);
INSERT INTO Producto (nombre, precio, stock, idcat, codalmacen, codestanteria) VALUES ('Nintendo DS/3DS', 149.99, 9, 1005, 201, 2);

INSERT INTO Suministra VALUES (301, '02', STR_TO_DATE('10/01/2022','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (302, '02', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (303, '06', STR_TO_DATE('10/04/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (304, '07', STR_TO_DATE('08/01/2022','%d/%m/%Y'), 6);
INSERT INTO Suministra VALUES (305, '02', STR_TO_DATE('10/01/2022','%d/%m/%Y'), 5);
INSERT INTO Suministra VALUES (306, '06', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (307, '07', STR_TO_DATE('10/12/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (308, '09', STR_TO_DATE('18/01/2019','%d/%m/%Y'), 4);
INSERT INTO Suministra VALUES (309, '02', STR_TO_DATE('10/05/2021','%d/%m/%Y'), 5);
INSERT INTO Suministra VALUES (310, '02', STR_TO_DATE('30/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (311, '06', STR_TO_DATE('10/08/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (312, '07', STR_TO_DATE('08/01/2019','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (313, '02', STR_TO_DATE('26/09/2017','%d/%m/%Y'), 5);
INSERT INTO Suministra VALUES (314, '06', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (315, '07', STR_TO_DATE('10/12/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (316, '09', STR_TO_DATE('08/01/2017','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (317, '06', STR_TO_DATE('25/12/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (318, '07', STR_TO_DATE('08/01/2019','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (319, '02', STR_TO_DATE('10/01/2010','%d/%m/%Y'), 5);
INSERT INTO Suministra VALUES (320, '06', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (321, '07', STR_TO_DATE('25/09/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (322, '09', STR_TO_DATE('08/01/2020','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (323, '07', STR_TO_DATE('08/07/2020','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (324, '02', STR_TO_DATE('10/01/2018','%d/%m/%Y'), 5);
INSERT INTO Suministra VALUES (325, '06', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (326, '07', STR_TO_DATE('10/05/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (327, '09', STR_TO_DATE('08/01/2019','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (328, '06', STR_TO_DATE('20/12/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (329, '07', STR_TO_DATE('08/01/2020','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (330, '02', STR_TO_DATE('10/01/2020','%d/%m/%Y'), 4);
INSERT INTO Suministra VALUES (331, '06', STR_TO_DATE('10/03/2021','%d/%m/%Y'), 3);
INSERT INTO Suministra VALUES (332, '07', STR_TO_DATE('10/02/2021','%d/%m/%Y'), 2);
INSERT INTO Suministra VALUES (333, '09', STR_TO_DATE('08/01/2020','%d/%m/%Y'), 3);

INSERT INTO Compra (fecha, descuento, subtotal, impuesto, total, dnic, dnie) VALUES (STR_TO_DATE('10/01/2022','%d/%m/%Y'), 0.00, 3175.50, 222.28, 3397.78, '01', '03');
INSERT INTO Compra (fecha, descuento, subtotal, impuesto, total, dnic, dnie) VALUES (STR_TO_DATE('10/01/2022','%d/%m/%Y'), 0.00, 4410.25, 308.72, 4718.97, '05', '04');
INSERT INTO Compra (fecha, descuento, subtotal, impuesto, total, dnic, dnie) VALUES (STR_TO_DATE('10/01/2022','%d/%m/%Y'), 0.00, 5191.10, 363.38, 5554.48, '08', '10');
INSERT INTO Compra (fecha, descuento, subtotal, impuesto, total, dnic, dnie) VALUES (STR_TO_DATE('10/01/2022','%d/%m/%Y'), 0.00, 4361.10, 305.28, 4666.38, '01', '10');

INSERT INTO LineaCompra VALUES (400, 1, 3, 0.00, 1800.00, 301);
INSERT INTO LineaCompra VALUES (400, 2, 1, 0.00, 475.50, 302);
INSERT INTO LineaCompra VALUES (400, 3, 2, 0.00, 900.00, 303);

INSERT INTO LineaCompra VALUES (401, 1, 3, 0.00, 1050.00, 310);
INSERT INTO LineaCompra VALUES (401, 2, 1, 0.00, 845.45, 305);
INSERT INTO LineaCompra VALUES (401, 3, 2, 0.00, 2514.80, 306);

INSERT INTO LineaCompra VALUES (402, 1, 3, 0.00, 1500, 307);
INSERT INTO LineaCompra VALUES (402, 2, 1, 0.00, 290.10, 308);
INSERT INTO LineaCompra VALUES (402, 3, 2, 0.00, 2351.00, 309);
INSERT INTO LineaCompra VALUES (402, 4, 3, 0.00, 1050.00, 310);

INSERT INTO LineaCompra VALUES (403, 1, 2, 0.00, 700.00, 310);
INSERT INTO LineaCompra VALUES (403, 2, 1, 0.00, 475.50, 302);
INSERT INTO LineaCompra VALUES (403, 3, 1, 0.00, 450.00, 303);
INSERT INTO LineaCompra VALUES (403, 4, 3, 0.00, 777.75, 311);
INSERT INTO LineaCompra VALUES (403, 5, 1, 0.00, 845.45, 312);
INSERT INTO LineaCompra VALUES (403, 6, 2, 0.00, 1112.40, 313);
