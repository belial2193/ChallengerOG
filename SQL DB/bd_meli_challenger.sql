-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_meli_challenger
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bdowners`
--

DROP TABLE IF EXISTS `bdowners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bdowners` (
  `bdname` varchar(30) DEFAULT NULL,
  `usercc` varchar(30) DEFAULT NULL,
  KEY `bdname` (`bdname`),
  KEY `usercc` (`usercc`),
  CONSTRAINT `bdowners_ibfk_1` FOREIGN KEY (`bdname`) REFERENCES `inventariobd` (`bdname`),
  CONSTRAINT `bdowners_ibfk_2` FOREIGN KEY (`usercc`) REFERENCES `nomina` (`usercc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdowners`
--

LOCK TABLES `bdowners` WRITE;
/*!40000 ALTER TABLE `bdowners` DISABLE KEYS */;
INSERT INTO `bdowners` VALUES ('DataBase1','32890499'),('DataBase2','1053826158'),('DataBase3','1053826158'),('DataBase4','72286444'),('DataBase5','1129572839'),('DataBase6','22479990'),('DataBase7','32668195'),('DataBase8','22516311'),('DataBase9','1129509728'),('DataBase10','55224208'),('DataBase11','72181696'),('DataBase12','80845402'),('DataBase13','32651141'),('DataBase14','1045668379'),('DataBase15','123456789'),('DataBase16','32890499'),('DataBase17','32789559'),('DataBase18','22528066'),('DataBase19','72286444'),('DataBase20','1129572839'),('DataBase21','22479990'),('DataBase22','32668195'),('DataBase23','22516311'),('DataBase24','1129509728'),('DataBase25','55224208'),('DataBase26','72181696'),('DataBase27','80845402'),('DataBase28','1045668379'),('DataBase29','1045668379'),('DataBase30','123456789');
/*!40000 ALTER TABLE `bdowners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventariobd`
--

DROP TABLE IF EXISTS `inventariobd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventariobd` (
  `bdname` varchar(30) NOT NULL,
  `bdclassification` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bdname`),
  KEY `idx_inventariobd_bdclassification` (`bdclassification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventariobd`
--

LOCK TABLES `inventariobd` WRITE;
/*!40000 ALTER TABLE `inventariobd` DISABLE KEYS */;
INSERT INTO `inventariobd` VALUES ('DataBase12','High'),('DataBase15','High'),('DataBase18','High'),('DataBase21','High'),('DataBase24','High'),('DataBase27','High'),('DataBase29','High'),('DataBase3','High'),('DataBase30','High'),('DataBase6','High'),('DataBase9','High'),('DataBase10','Low'),('DataBase13','Low'),('DataBase16','Low'),('DataBase19','Low'),('DataBase22','Low'),('DataBase25','Low'),('DataBase28','Low'),('DataBase4','Low'),('DataBase7','Low'),('DataBase11','Medium'),('DataBase14','Medium'),('DataBase17','Medium'),('DataBase20','Medium'),('DataBase23','Medium'),('DataBase26','Medium'),('DataBase5','Medium'),('DataBase8','Medium'),('DataBase1','Sin dato'),('DataBase2','Sin dato');
/*!40000 ALTER TABLE `inventariobd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefes`
--

DROP TABLE IF EXISTS `jefes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jefes` (
  `idowner` varchar(30) DEFAULT NULL,
  `idmanager` varchar(30) DEFAULT NULL,
  KEY `idowner` (`idowner`),
  KEY `idmanager` (`idmanager`),
  CONSTRAINT `jefes_ibfk_1` FOREIGN KEY (`idowner`) REFERENCES `nomina` (`usercc`),
  CONSTRAINT `jefes_ibfk_2` FOREIGN KEY (`idmanager`) REFERENCES `nomina` (`usercc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefes`
--

LOCK TABLES `jefes` WRITE;
/*!40000 ALTER TABLE `jefes` DISABLE KEYS */;
INSERT INTO `jefes` VALUES ('1053826158','123456789'),('32789559','22868777'),('22528066','22534105'),('1129572839','57292233'),('22479990','85453810'),('32668195','85453810'),('22516311','57292233'),('1129509728','85453810'),('123456789','85453810');
/*!40000 ALTER TABLE `jefes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `usercc` varchar(30) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `useremail` varchar(50) DEFAULT NULL,
  `userposition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usercc`),
  KEY `idx_nomina_useremail` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
INSERT INTO `nomina` VALUES ('1045668379','LERMA FRANCO DERIAN DAVID ','LERMA@yopmail.com','Analista 14'),('1053826158','ORLANDO GOMEZ SOTO','orlando.gomez.soto@gmail.com','Director TI'),('1129509728','CORDERO CORTES JOSIE DAVID','CORDE@yopmail.com','Analista 9'),('1129572839','CAMPO PEREZ ARMANDO MICHEL','CAMPO@yopmail.com','Analista 5'),('123456789','YURI ANDREASANCHEZ','YURI@yopmail.com','Analista 20'),('18777641','SANTOS PEREZ CESAR OLIMPO','SANTO@yopmail.com','Director 1'),('22479990','BARRIOS PEREZ ZULY MARGARITA','BARRI@yopmail.com','Analista 6'),('22516311','CASTRILLON IGLESIAS YAZMIN PATRICIA ','CASTR@yopmail.com','Analista 8'),('22528066','MOLINARES MEZA MARLENE ISABEL','MOLIN@yopmail.com','Analista 3'),('22534105','MARTINEZ VILLAREAL JOHANA CONCEPCION ','MARTI@yopmail.com','Director 3'),('22868777','QUIROZ ORTEGA SUGEIDY JANETH','QUIRO@yopmail.com','Director 2'),('32651141','LEONES RICO ELVIRA ISABEL ','LEONE@yopmail.com','Analista 13'),('32652944','PEREZ ALARCON LEDYS ','PEREZ@yopmail.com','Analista 15'),('32668195','RODRIGUEZ PEREZ FABIOLA BERNARDA','RODRI@yopmail.com','Analista 7'),('32789559','DE LA HOZ IBANNEZ CRISTINA B','DELA@yopmail.com','Analista 2'),('32890499','PEREZ GUTIERREZ MILENA DEL CARMEN','PEREZ@yopmail.com','Analista 1'),('37319194','CASADIEGOS DIAZ NORMA EDITH','CASAD@yopmail.com','Director 4'),('55224208','ALFONSO ACEVEDO HEYDI TATIANA','ALFON@yopmail.com','Analista 10'),('57292233','VILLAR DUICA ALINA MARGARITA','VILLA@yopmail.com','Director 5'),('65766460','RONCANCIO JACOME LUCERO','RONCA@yopmail.com','Analista 17'),('72181696','DUQUE LASCARRO FERNANDO CESAR','DUQUE@yopmail.com','Analista 11'),('72286444','VILLAREAL ARRIETA DIEGO MANUEL ','VILLA@yopmail.com','Analista 16'),('80845402','GONZALEZ ACOSTA DILFREDO MARIO','GONZA@yopmail.com','Analista 12'),('85453810','ECHEVERRIA CAMPO ELBER JESUS','ECHEV@yopmail.com','Director 6'),('92258819','GOMEZ SOLANO ROBERTO CARLOS','GOMEZ@yopmail.com','Analista 19'),('92504973','ORDONNEZ ANILLO ANTONIO FRANKLIN','ORDON@yopmail.com','Analista 18');
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revalida`
--

DROP TABLE IF EXISTS `revalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revalida` (
  `bdname` varchar(30) DEFAULT NULL,
  `owneremail` varchar(30) DEFAULT NULL,
  `manageremail` varchar(30) DEFAULT NULL,
  `bdclassification` varchar(200) DEFAULT NULL,
  KEY `bdname` (`bdname`),
  KEY `owneremail` (`owneremail`),
  KEY `manageremail` (`manageremail`),
  KEY `bdclassification` (`bdclassification`),
  CONSTRAINT `revalida_ibfk_1` FOREIGN KEY (`bdname`) REFERENCES `inventariobd` (`bdname`),
  CONSTRAINT `revalida_ibfk_2` FOREIGN KEY (`owneremail`) REFERENCES `nomina` (`useremail`),
  CONSTRAINT `revalida_ibfk_3` FOREIGN KEY (`manageremail`) REFERENCES `nomina` (`useremail`),
  CONSTRAINT `revalida_ibfk_4` FOREIGN KEY (`bdclassification`) REFERENCES `inventariobd` (`bdclassification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revalida`
--

LOCK TABLES `revalida` WRITE;
/*!40000 ALTER TABLE `revalida` DISABLE KEYS */;
INSERT INTO `revalida` VALUES ('DataBase1','PEREZ@yopmail.com','orlando.gomez.soto@gmail.com','Sin dato'),('DataBase2','orlando.gomez.soto@gmail.com','orlando.gomez.soto@gmail.com','Sin dato'),('DataBase3','orlando.gomez.soto@gmail.com','orlando.gomez.soto@gmail.com','High'),('DataBase4','VILLA@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase5','CAMPO@yopmail.com','VILLA@yopmail.com','Medium'),('DataBase6','BARRI@yopmail.com','ECHEV@yopmail.com','High'),('DataBase7','RODRI@yopmail.com','ECHEV@yopmail.com','Low'),('DataBase8','CASTR@yopmail.com','VILLA@yopmail.com','Medium'),('DataBase9','CORDE@yopmail.com','ECHEV@yopmail.com','High'),('DataBase10','ALFON@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase11','DUQUE@yopmail.com','orlando.gomez.soto@gmail.com','Medium'),('DataBase12','GONZA@yopmail.com','orlando.gomez.soto@gmail.com','High'),('DataBase13','LEONE@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase14','LERMA@yopmail.com','orlando.gomez.soto@gmail.com','Medium'),('DataBase15','YURI@yopmail.com','ECHEV@yopmail.com','High'),('DataBase16','PEREZ@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase17','DELA@yopmail.com','QUIRO@yopmail.com','Medium'),('DataBase18','MOLIN@yopmail.com','MARTI@yopmail.com','High'),('DataBase19','VILLA@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase20','CAMPO@yopmail.com','VILLA@yopmail.com','Medium'),('DataBase21','BARRI@yopmail.com','ECHEV@yopmail.com','High'),('DataBase22','RODRI@yopmail.com','ECHEV@yopmail.com','Low'),('DataBase23','CASTR@yopmail.com','VILLA@yopmail.com','Medium'),('DataBase24','CORDE@yopmail.com','ECHEV@yopmail.com','High'),('DataBase25','ALFON@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase26','DUQUE@yopmail.com','orlando.gomez.soto@gmail.com','Medium'),('DataBase27','GONZA@yopmail.com','orlando.gomez.soto@gmail.com','High'),('DataBase28','LERMA@yopmail.com','orlando.gomez.soto@gmail.com','Low'),('DataBase29','LERMA@yopmail.com','orlando.gomez.soto@gmail.com','High'),('DataBase30','YURI@yopmail.com','ECHEV@yopmail.com','High');
/*!40000 ALTER TABLE `revalida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-14 20:05:16
