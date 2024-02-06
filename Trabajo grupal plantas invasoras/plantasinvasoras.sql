-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plantasinvasoras
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `actuaciones`
--

DROP TABLE IF EXISTS `actuaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actuaciones` (
  `codactuacion` int NOT NULL AUTO_INCREMENT,
  `fechainicio` date NOT NULL,
  `fechafinalizacion` date NOT NULL,
  `presupuesto` float NOT NULL,
  `costefinal` float NOT NULL,
  `plantazona` int NOT NULL,
  `superficierradicada` float NOT NULL,
  PRIMARY KEY (`codactuacion`),
  KEY `plantazona` (`plantazona`),
  CONSTRAINT `actuaciones_ibfk_1` FOREIGN KEY (`plantazona`) REFERENCES `plantasyzonas` (`Idplantazona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuaciones`
--

LOCK TABLES `actuaciones` WRITE;
/*!40000 ALTER TABLE `actuaciones` DISABLE KEYS */;
INSERT INTO `actuaciones` VALUES (1,'2015-01-06','2015-02-01',2000,3400,1,1.2),(2,'2015-04-07','2015-12-16',340,350,16,0.8),(3,'2015-07-01','2015-07-11',570,500.5,11,2.1),(4,'2015-05-04','2015-06-01',120,110,8,3.5),(5,'2015-11-09','2015-11-30',34,33.5,14,2.7),(6,'2016-02-09','2016-02-19',450,567,1,3.2);
/*!40000 ALTER TABLE `actuaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ayuntamientos`
--

DROP TABLE IF EXISTS `ayuntamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayuntamientos` (
  `IdAyto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `comarca` int NOT NULL,
  PRIMARY KEY (`IdAyto`),
  KEY `comarca` (`comarca`),
  CONSTRAINT `ayuntamientos_ibfk_1` FOREIGN KEY (`comarca`) REFERENCES `comarcas` (`idcomarca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayuntamientos`
--

LOCK TABLES `ayuntamientos` WRITE;
/*!40000 ALTER TABLE `ayuntamientos` DISABLE KEYS */;
INSERT INTO `ayuntamientos` VALUES (1,'Cabezón de la Sal',8),(2,'Limpias',6),(3,'Campoo de Yuso',7),(4,'Reocín',8),(5,'Los Tojos',8),(6,'Hoz de Anero',10),(7,'Cillorigo de Liébana',9),(8,'Villacarriedo',2),(9,'Arenas de Iguña',1),(10,'Selaya',2),(11,'Torrelavega',1),(12,'Cartes',1),(13,'Santoña',10),(14,'Argoños',10),(15,'Valderredible',7),(16,'Miengo',3),(17,'Camargo',3),(18,'Valdeprado',7),(19,'Udias',5),(20,'Alfoz de LLoredo',5),(21,'Comillas',5),(22,'Ruiloba',5),(23,'San Felices de Buelna',1),(24,'Astillero',3);
/*!40000 ALTER TABLE `ayuntamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comarcas`
--

DROP TABLE IF EXISTS `comarcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comarcas` (
  `idcomarca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idcomarca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comarcas`
--

LOCK TABLES `comarcas` WRITE;
/*!40000 ALTER TABLE `comarcas` DISABLE KEYS */;
INSERT INTO `comarcas` VALUES (1,'Besaya'),(2,'Valles Pasiegos'),(3,'Santander'),(4,'Costa Oriental'),(5,'Costa Occidental'),(6,'Asón-Aguera'),(7,'Campoo-Los Valles'),(8,'Saja-Nansa'),(9,'Liebana'),(10,'Trasmiera');
/*!40000 ALTER TABLE `comarcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erradicaconherbicida`
--

DROP TABLE IF EXISTS `erradicaconherbicida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erradicaconherbicida` (
  `actuacion` int NOT NULL,
  `producto` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `mgporlitro` int NOT NULL,
  `litrosdisoprep` float NOT NULL,
  `litrosdisoutil` float NOT NULL,
  PRIMARY KEY (`actuacion`),
  CONSTRAINT `erradicaconherbicida_ibfk_1` FOREIGN KEY (`actuacion`) REFERENCES `actuaciones` (`codactuacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erradicaconherbicida`
--

LOCK TABLES `erradicaconherbicida` WRITE;
/*!40000 ALTER TABLE `erradicaconherbicida` DISABLE KEYS */;
INSERT INTO `erradicaconherbicida` VALUES (1,'glifosato',360,3450,2300),(2,'glifosato',240,1500,1300);
/*!40000 ALTER TABLE `erradicaconherbicida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erradicamanual`
--

DROP TABLE IF EXISTS `erradicamanual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erradicamanual` (
  `actuacion` int NOT NULL,
  `Kgretirados` float NOT NULL,
  PRIMARY KEY (`actuacion`),
  CONSTRAINT `erradicamanual_ibfk_1` FOREIGN KEY (`actuacion`) REFERENCES `actuaciones` (`codactuacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erradicamanual`
--

LOCK TABLES `erradicamanual` WRITE;
/*!40000 ALTER TABLE `erradicamanual` DISABLE KEYS */;
INSERT INTO `erradicamanual` VALUES (2,25000),(3,34560),(4,23900),(5,5680);
/*!40000 ALTER TABLE `erradicamanual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `codespecie` int NOT NULL AUTO_INCREMENT,
  `nomvulgar` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nomcientifico` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `origen` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ainvasora` year NOT NULL,
  `ritmoprop` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`codespecie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,'Plumero de la pampa','Cortaderia selloana','América del sur',1970,'Alto'),(2,'Chilca','Baccharius halimifolia','América del Norte',1990,'Medio'),(3,'Bambú japones','Fallopia japónica','Asia',1990,'Medio'),(4,'Uña de gato','Carpobrotus edulis','Sudafrica',1990,'Medio');
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especiesporzonas`
--

DROP TABLE IF EXISTS `especiesporzonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especiesporzonas` (
  `nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `kmt2` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especiesporzonas`
--

LOCK TABLES `especiesporzonas` WRITE;
/*!40000 ALTER TABLE `especiesporzonas` DISABLE KEYS */;
INSERT INTO `especiesporzonas` VALUES ('Plumero de la pampa',4.6),('Chilca',6.7),('Uña de gato',4.7);
/*!40000 ALTER TABLE `especiesporzonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_plantasyzonas`
--

DROP TABLE IF EXISTS `info_plantasyzonas`;
/*!50001 DROP VIEW IF EXISTS `info_plantasyzonas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_plantasyzonas` AS SELECT 
 1 AS `Idplantazona`,
 1 AS `planta`,
 1 AS `zona`,
 1 AS `SuperafectaKm2`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `plantasycomarcas`
--

DROP TABLE IF EXISTS `plantasycomarcas`;
/*!50001 DROP VIEW IF EXISTS `plantasycomarcas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plantasycomarcas` AS SELECT 
 1 AS `Idplantazona`,
 1 AS `planta`,
 1 AS `zona`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `plantasycomarcas2`
--

DROP TABLE IF EXISTS `plantasycomarcas2`;
/*!50001 DROP VIEW IF EXISTS `plantasycomarcas2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plantasycomarcas2` AS SELECT 
 1 AS `Idplantazona`,
 1 AS `planta`,
 1 AS `zona`,
 1 AS `SuperafectaKm2`,
 1 AS `comarcas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plantasyzonas`
--

DROP TABLE IF EXISTS `plantasyzonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantasyzonas` (
  `Idplantazona` int NOT NULL,
  `planta` int NOT NULL,
  `zona` int NOT NULL,
  `SuperafectaKm2` float NOT NULL,
  PRIMARY KEY (`Idplantazona`),
  KEY `planta` (`planta`),
  KEY `zona` (`zona`),
  CONSTRAINT `plantasyzonas_ibfk_1` FOREIGN KEY (`planta`) REFERENCES `especies` (`codespecie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plantasyzonas_ibfk_2` FOREIGN KEY (`zona`) REFERENCES `zonas` (`idzona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantasyzonas`
--

LOCK TABLES `plantasyzonas` WRITE;
/*!40000 ALTER TABLE `plantasyzonas` DISABLE KEYS */;
INSERT INTO `plantasyzonas` VALUES (1,1,1,3.2),(2,1,3,8.3),(3,1,4,2.5),(4,1,5,3.5),(5,1,6,4.6),(6,1,7,2.1),(7,1,8,3.6),(8,1,9,4.8),(9,2,2,4.8),(10,2,3,3.9),(11,2,6,6.7),(12,2,9,8.6),(13,3,4,3.6),(14,3,5,2),(15,4,6,4.7),(16,1,2,5.3);
/*!40000 ALTER TABLE `plantasyzonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `plantaszonasycomarcas`
--

DROP TABLE IF EXISTS `plantaszonasycomarcas`;
/*!50001 DROP VIEW IF EXISTS `plantaszonasycomarcas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plantaszonasycomarcas` AS SELECT 
 1 AS `Idplantazona`,
 1 AS `planta`,
 1 AS `zona`,
 1 AS `superafectaKm2`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `idzona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `latitud` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `longitud` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `condicionesterreno` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idzona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` VALUES (1,'Sierra de Ibio','43º 32\' N','4º 20\' O','ladera'),(2,'Bahía de Santander','43º 28\' N','3º 48\' O','encharcado'),(3,'Marismas de Santoña','43º 45\' N','3º 44\' O','encharcado'),(4,'Pantano del Ebro','43º 0\' N','3º 58\' O','normal'),(5,'Parque de la Viesca','43º 21\' N','4º 4\' O','normal'),(6,'Canteras de Cuchía','43º 26\' N','4º 2\' O','normal'),(7,'Monte Corona','44º 1\' N','4º 12\' O','ladera'),(8,'Monte Dobra','43º 19\' N','4º  0\' O','ladera'),(9,'Abra del Pas','43º 12\' N','3º 58\' O','normal');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonasyaytos`
--

DROP TABLE IF EXISTS `zonasyaytos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonasyaytos` (
  `ayuntamiento` int NOT NULL,
  `zona` int NOT NULL,
  PRIMARY KEY (`ayuntamiento`,`zona`),
  KEY `zona` (`zona`),
  CONSTRAINT `zonasyaytos_ibfk_2` FOREIGN KEY (`zona`) REFERENCES `zonas` (`idzona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zonasyaytos_ibfk_3` FOREIGN KEY (`ayuntamiento`) REFERENCES `ayuntamientos` (`IdAyto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonasyaytos`
--

LOCK TABLES `zonasyaytos` WRITE;
/*!40000 ALTER TABLE `zonasyaytos` DISABLE KEYS */;
INSERT INTO `zonasyaytos` VALUES (1,1),(4,1),(17,2),(24,2),(13,3),(14,3),(3,4),(15,4),(18,4),(4,5),(11,5),(12,5),(16,6),(19,7),(20,7),(21,7),(22,7),(11,8),(23,8),(16,9);
/*!40000 ALTER TABLE `zonasyaytos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `info_plantasyzonas`
--

/*!50001 DROP VIEW IF EXISTS `info_plantasyzonas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_plantasyzonas` AS select distinct `plantasyzonas`.`Idplantazona` AS `Idplantazona`,`plantasyzonas`.`planta` AS `planta`,`plantasyzonas`.`zona` AS `zona`,`plantasyzonas`.`SuperafectaKm2` AS `SuperafectaKm2`,`comarcas`.`nombre` AS `nombre` from ((((`comarcas` join `ayuntamientos` on((`ayuntamientos`.`comarca` = `comarcas`.`idcomarca`))) join `zonasyaytos` on((`zonasyaytos`.`ayuntamiento` = `ayuntamientos`.`IdAyto`))) join `zonas` on((`zonas`.`idzona` = `zonasyaytos`.`zona`))) join `plantasyzonas` on((`plantasyzonas`.`zona` = `zonas`.`idzona`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plantasycomarcas`
--

/*!50001 DROP VIEW IF EXISTS `plantasycomarcas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `plantasycomarcas` AS select distinct `plantasyzonas`.`Idplantazona` AS `Idplantazona`,`plantasyzonas`.`planta` AS `planta`,`plantasyzonas`.`zona` AS `zona`,`comarcas`.`nombre` AS `nombre` from (((`plantasyzonas` join `zonasyaytos` on((`plantasyzonas`.`zona` = `zonasyaytos`.`zona`))) join `ayuntamientos` on((`ayuntamientos`.`IdAyto` = `zonasyaytos`.`ayuntamiento`))) join `comarcas` on((`comarcas`.`idcomarca` = `ayuntamientos`.`comarca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plantasycomarcas2`
--

/*!50001 DROP VIEW IF EXISTS `plantasycomarcas2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `plantasycomarcas2` AS select `plantasyzonas`.`Idplantazona` AS `Idplantazona`,`plantasyzonas`.`planta` AS `planta`,`plantasyzonas`.`zona` AS `zona`,`plantasyzonas`.`SuperafectaKm2` AS `SuperafectaKm2`,`comarcas`.`nombre` AS `comarcas` from ((((`plantasyzonas` join `zonas` on((`plantasyzonas`.`zona` = `zonas`.`idzona`))) join `zonasyaytos` on((`zonas`.`idzona` = `zonasyaytos`.`zona`))) join `ayuntamientos` on((`zonasyaytos`.`ayuntamiento` = `ayuntamientos`.`IdAyto`))) join `comarcas` on((`ayuntamientos`.`comarca` = `comarcas`.`idcomarca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `plantaszonasycomarcas`
--

/*!50001 DROP VIEW IF EXISTS `plantaszonasycomarcas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `plantaszonasycomarcas` AS select distinct `plantasyzonas`.`Idplantazona` AS `Idplantazona`,`plantasyzonas`.`planta` AS `planta`,`plantasyzonas`.`zona` AS `zona`,`plantasyzonas`.`SuperafectaKm2` AS `superafectaKm2`,`comarcas`.`nombre` AS `nombre` from (((`plantasyzonas` join `zonasyaytos` on((`plantasyzonas`.`zona` = `zonasyaytos`.`zona`))) join `ayuntamientos` on((`ayuntamientos`.`IdAyto` = `zonasyaytos`.`ayuntamiento`))) join `comarcas` on((`comarcas`.`idcomarca` = `ayuntamientos`.`comarca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 15:28:48
