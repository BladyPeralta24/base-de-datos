drop database if exists departamento;
create database departamento;

use departamento;



DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Departamentos;
DROP TABLE IF EXISTS Centros;

CREATE TABLE Centros (
	numce INT PRIMARY KEY NOT NULL,
	nomce VARCHAR(25),
	dirce VARCHAR(25)
);

CREATE TABLE Departamentos (
	numde INT PRIMARY KEY NOT NULL,
	numce INT,
	direc INT,
	tidir CHAR(1) CHECK(tidir IN('P', 'F')),
	presu NUMERIC(3,1),
	depde INT,
	nomde VARCHAR(20),
	FOREIGN KEY (numce) REFERENCES Centros(numce),
	FOREIGN KEY (depde) REFERENCES Departamentos(numde)
);

CREATE TABLE Empleados (
	numem INT PRIMARY KEY NOT NULL,
	extel INT,
	fecna DATE,
	fecin DATE,
	salar NUMERIC(5),
	comis NUMERIC(3),
	numhi INT,
	nomem VARCHAR(10),
	numde INT,
	FOREIGN KEY (numde) REFERENCES Departamentos(numde)
);



insert into Centros (numce, nomce, dirce) values(10,'Sede central','C/Atocha, 820, Madrid');
insert into Centros (numce, nomce, dirce) values(20,'Relación con clientes','C/Atocha, 405, Madrid');

insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(100,10,260,'P',72,null,'direccion General');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(110,20,180,'P',90,100,'direcc Comercial');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(111,20,180,'F',66,110,'Sector Industrial');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(112,20,270,'P',54,110,'Sector Servicios');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(120,10,150,'F',18,100,'Organización');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(121,10,150,'P',12,120,'Personal');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(122,10,350,'P',36,120,'Proceso de datos');
insert INTO Departamentos (numde, numce, direc, tidir, presu, depde, nomde) values(130,10,310,'P',12,100,'Finanzas'); 


insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(110, 350, str_to_date('10/11/1970', '%d/%m/%Y'), str_to_date('15/02/1985', '%d/%m/%Y'), 1800, NULL, 3, 'CESAR', 121);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(120,840,STR_TO_DATE('09/06/1968', '%d/%m/%Y'),STR_TO_DATE('01/10/1988','%d/%m/%Y'),1900,110,1,'MARIO',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(130,810,STR_TO_DATE('09/09/1965', '%d/%m/%Y'),STR_TO_DATE('01/02/1981','%d/%m/%Y'),1500,110,2,'LUCIANO',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(150,340,STR_TO_DATE('10/08/1972', '%d/%m/%Y'),STR_TO_DATE('15/01/1997','%d/%m/%Y'),2600,NULL,0,'JULIO',121);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(160,740,STR_TO_DATE('09/07/1980', '%d/%m/%Y'),STR_TO_DATE('11/11/2005','%d/%m/%Y'),1800,110,2,'AUREO',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(180,508,STR_TO_DATE('18/10/1974', '%d/%m/%Y'),STR_TO_DATE('18/03/1996','%d/%m/%Y'),2800,50,2,'MARCOS',110);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(190,350,STR_TO_DATE('12/05/1972', '%d/%m/%Y'),STR_TO_DATE('11/02/1992','%d/%m/%Y'),1750,NULL,4,'JULIANA',121);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(210,200,STR_TO_DATE('28/09/1970', '%d/%m/%Y'),STR_TO_DATE('22/01/1999','%d/%m/%Y'),1910,NULL,2,'PILAR',100);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(240,760,STR_TO_DATE('26/02/1967', '%d/%m/%Y'),STR_TO_DATE('24/02/1989','%d/%m/%Y'),1700,100,3,'LAVINIA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(250,250,STR_TO_DATE('27/10/1976', '%d/%m/%Y'),STR_TO_DATE('01/03/1997','%d/%m/%Y'),2700,NULL,0,'ADRIANA',100);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(260,220,STR_TO_DATE('03/12/1973', '%d/%m/%Y'),STR_TO_DATE('12/07/2001','%d/%m/%Y'),720,NULL,6,'ANTONIO',100);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(270,800,STR_TO_DATE('21/05/1975', '%d/%m/%Y'),STR_TO_DATE('10/09/2003','%d/%m/%Y'),1910,80,3,'OCTAVIO',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(280,410,STR_TO_DATE('10/01/1978', '%d/%m/%Y'),STR_TO_DATE('08/10/2010','%d/%m/%Y'),1500,NULL,5,'DOROTEA',130);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(285,620,STR_TO_DATE('25/10/1979', '%d/%m/%Y'),STR_TO_DATE('15/02/2011','%d/%m/%Y'),1910,NULL,0,'OTILIA',122);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(290,910,STR_TO_DATE('30/11/1967', '%d/%m/%Y'),STR_TO_DATE('14/02/1988','%d/%m/%Y'),1790,NULL,3,'GLORIA',120);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(310,480,STR_TO_DATE('21/11/1976', '%d/%m/%Y'),STR_TO_DATE('15/01/2001','%d/%m/%Y'),1950,NULL,0,'AUGUSTO',130);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(320,620,STR_TO_DATE('25/12/1977', '%d/%m/%Y'),STR_TO_DATE('05/02/2003','%d/%m/%Y'),2400,NULL,2,'CORNELIO',122);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(330,850,STR_TO_DATE('19/08/1958', '%d/%m/%Y'),STR_TO_DATE('01/03/1980','%d/%m/%Y'),1700,90,0,'AMELIA',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(350,610,STR_TO_DATE('13/04/1979', '%d/%m/%Y'),STR_TO_DATE('10/09/1999','%d/%m/%Y'),2700,NULL,1,'AURELIO',122);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(360,750,STR_TO_DATE('29/10/1978', '%d/%m/%Y'),STR_TO_DATE('10/10/1998','%d/%m/%Y'),1800,100,2,'DORINDA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(380,880,STR_TO_DATE('30/03/1978', '%d/%m/%Y'),STR_TO_DATE('01/01/1999','%d/%m/%Y'),1100,NULL,0,'MICAELA',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(390,500,STR_TO_DATE('19/02/1976', '%d/%m/%Y'),STR_TO_DATE('08/10/2010','%d/%m/%Y'),1290,NULL,1,'CARMEN',110);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(400,780,STR_TO_DATE('18/08/1979', '%d/%m/%Y'),STR_TO_DATE('01/11/2011','%d/%m/%Y'),1150,NULL,0,'LUCRECIA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(410,660,STR_TO_DATE('14/07/1968', '%d/%m/%Y'),STR_TO_DATE('13/10/1989','%d/%m/%Y'),1010,NULL,0,'AZUCENA',122);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(420,450,STR_TO_DATE('22/10/1966', '%d/%m/%Y'),STR_TO_DATE('19/11/1988','%d/%m/%Y'),2400,NULL,0,'CLAUDIA',130);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(430,650,STR_TO_DATE('26/10/1967', '%d/%m/%Y'),STR_TO_DATE('19/11/1988','%d/%m/%Y'),1260,NULL,1,'VALERIANA',122);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(440,760,STR_TO_DATE('26/09/1966', '%d/%m/%Y'),STR_TO_DATE('28/02/1986','%d/%m/%Y'),1260,100,0,'LIVIA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(450,880,STR_TO_DATE('21/10/1966', '%d/%m/%Y'),STR_TO_DATE('28/02/1986','%d/%m/%Y'),1260,100,0,'SABINA',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(480,760,STR_TO_DATE('04/04/1965', '%d/%m/%Y'),STR_TO_DATE('28/02/1986','%d/%m/%Y'),1260,100,1,'DIANA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(490,880,STR_TO_DATE('06/06/1964', '%d/%m/%Y'),STR_TO_DATE('01/01/1988','%d/%m/%Y'),1090,100,0,'HORACIO',112);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(500,750,STR_TO_DATE('08/10/1965', '%d/%m/%Y'),STR_TO_DATE('01/01/1987','%d/%m/%Y'),1200,100,0,'HONORIA',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(510,550,STR_TO_DATE('04/05/1966', '%d/%m/%Y'),STR_TO_DATE('01/11/1986','%d/%m/%Y'),1200,NULL,1,'ROMULO',110);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(550,780,STR_TO_DATE('10/01/1970', '%d/%m/%Y'),STR_TO_DATE('21/01/1998','%d/%m/%Y'),600,120,0,'SANCHO',111);
insert into Empleados (numem, extel, fecna, fecin, salar, comis, numhi, nomem, numde) values(370, 360, str_to_date('22/06/1977', '%d/%m/%Y'), str_to_date('20/01/2000', '%d/%m/%Y'), 1860, NULL, 1, 'FABIOLA', 121);



