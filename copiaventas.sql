-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: gestventas
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (101,'Cameron','2017-09-13','España'),(102,'Allen','2018-03-10','Tonga'),(103,'Kathleen','2019-01-14','Japón'),(104,'Hadley','2019-07-24','Belarus'),(105,'Charissa','2019-10-20','Italia'),(106,'Basil','2019-05-02','Haití'),(107,'Sonya','2018-09-04','Mauritania'),(108,'Elena','2018-11-18','España'),(109,'Orson','2017-01-13','España'),(110,'Althea','2019-05-01','Tuvalu'),(111,'Fran','2019-05-01','España');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (201,'Vajilla','Menaje',125.40),(202,'Olla','Menaje',120.20),(203,'Batería de cocina','Menaje',136.20),(204,'Pack Jarras decoradoras','Menaje',10.20),(205,'Instrumentación electrónica','Electrónica',39.90),(206,'Electrónica aplicada','Electrónica',34.20),(207,'Monitor HP 19','Informática',99.99),(208,'Teclado Inalámbrico - Negro','Informática',30.73),(209,'SCRUM para no informáticos','Informática',10.93),(210,'Ciberseguridad y transformación digital','Informática',23.70),(211,'HP Inc. 11 G5 - Celeron 1.1 GHz','Informática',852.38),(212,'Belkin Wireless Charging Dock','Electrónica',149.99);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `dnicliente` int(11) NOT NULL,
  `codigoproducto` int(11) NOT NULL,
  `fechaventa` date NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`dnicliente`,`codigoproducto`,`fechaventa`),
  KEY `codigoproducto` (`codigoproducto`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`dnicliente`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`codigoproducto`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (101,202,'2019-02-11',3),(101,202,'2019-02-14',3),(101,203,'2019-02-13',2),(101,204,'2019-02-05',1),(101,204,'2019-02-13',2),(101,205,'2019-02-04',4),(101,205,'2019-02-09',3),(101,206,'2019-02-03',3),(101,206,'2019-02-06',5),(101,206,'2019-02-07',1),(101,208,'2019-02-05',5),(101,208,'2019-02-07',1),(101,209,'2019-02-05',3),(101,210,'2019-02-01',1),(101,210,'2019-02-05',1),(102,202,'2019-02-02',4),(102,203,'2019-02-01',5),(102,204,'2019-02-05',4),(102,204,'2019-02-10',3),(102,205,'2019-02-01',1),(102,205,'2019-02-13',1),(102,206,'2019-02-01',4),(102,206,'2019-02-10',1),(102,208,'2019-02-02',1),(102,209,'2019-02-12',2),(103,201,'2019-02-02',2),(103,201,'2019-02-04',5),(103,201,'2019-02-12',1),(103,202,'2019-02-10',3),(103,203,'2019-02-14',3),(103,204,'2019-02-08',2),(103,207,'2019-02-02',5),(103,207,'2019-02-04',4),(103,209,'2019-02-08',1),(103,210,'2019-02-05',2),(103,210,'2019-02-09',5),(104,203,'2019-02-01',1),(104,203,'2019-02-06',1),(104,203,'2019-02-08',2),(104,206,'2019-02-08',3),(104,207,'2019-02-07',2),(104,208,'2019-02-05',4),(104,210,'2019-02-02',3),(104,210,'2019-02-03',5),(105,201,'2019-02-08',5),(105,202,'2019-02-04',5),(105,202,'2019-02-06',4),(105,202,'2019-02-09',2),(105,204,'2019-02-09',1),(105,205,'2019-02-04',4),(105,207,'2019-02-03',2),(105,208,'2019-02-03',4),(106,201,'2019-02-07',2),(106,201,'2019-02-11',1),(106,201,'2019-02-14',4),(106,202,'2019-02-14',4),(106,203,'2019-02-04',3),(106,203,'2019-02-09',1),(106,206,'2019-02-07',5),(106,207,'2019-02-10',3),(106,208,'2019-02-07',5),(107,201,'2019-02-07',1),(107,202,'2019-02-12',5),(107,204,'2019-02-13',1),(107,205,'2019-02-10',5),(107,206,'2019-02-02',1),(107,206,'2019-02-10',3),(107,207,'2019-02-05',2),(107,207,'2019-02-13',4),(107,209,'2019-02-06',3),(107,209,'2019-02-10',3),(108,203,'2019-02-04',4),(108,203,'2019-02-13',3),(108,206,'2019-02-06',5),(108,207,'2019-02-11',3),(108,209,'2019-02-05',5),(108,210,'2019-02-08',4),(109,201,'2019-02-06',1),(109,202,'2019-02-08',4),(109,204,'2019-02-14',3),(109,205,'2019-02-09',3),(109,208,'2019-02-11',4),(109,209,'2019-02-03',4),(109,210,'2019-02-03',3),(109,210,'2019-02-11',5),(109,210,'2019-02-13',5),(110,201,'2019-02-08',3),(110,202,'2019-02-10',2),(110,202,'2019-02-11',4),(110,204,'2019-02-10',1),(110,204,'2019-02-14',1),(110,205,'2019-02-09',1),(110,208,'2019-02-07',5),(110,210,'2019-02-01',4),(110,210,'2019-02-14',3);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-13 19:54:07
