-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: comercio2
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DEPARTAMENTOS`
--

DROP TABLE IF EXISTS `DEPARTAMENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTAMENTOS` (
  `cod_dep` varchar(5) NOT NULL,
  `nombre_dep` varchar(15) DEFAULT NULL,
  `presupuesto` decimal(8,2) DEFAULT 0.00,
  PRIMARY KEY (`cod_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTOS`
--

LOCK TABLES `DEPARTAMENTOS` WRITE;
/*!40000 ALTER TABLE `DEPARTAMENTOS` DISABLE KEYS */;
INSERT INTO `DEPARTAMENTOS` VALUES ('10000','Technologia',7725.14),('20000','Motomami',12.30),('INFOR','Informática',77777.77);
/*!40000 ALTER TABLE `DEPARTAMENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADOS`
--

DROP TABLE IF EXISTS `EMPLEADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLEADOS` (
  `dni` char(9) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `salario_anual` decimal(7,2) DEFAULT NULL,
  `cod_dep` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `cod_dep` (`cod_dep`),
  CONSTRAINT `EMPLEADOS_ibfk_1` FOREIGN KEY (`cod_dep`) REFERENCES `DEPARTAMENTOS` (`cod_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADOS`
--

LOCK TABLES `EMPLEADOS` WRITE;
/*!40000 ALTER TABLE `EMPLEADOS` DISABLE KEYS */;
INSERT INTO `EMPLEADOS` VALUES ('23123323P','Paco Sanz',7725.14,'10000'),('31631620X','Andrea Garte',12.30,'20000'),('58295719K','El Nuevo',77777.77,'INFOR');
/*!40000 ALTER TABLE `EMPLEADOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`alumno`@`localhost`*/ /*!50003 TRIGGER dp_insert_empleado AFTER INSERT ON EMPLEADOS
FOR EACH ROW
UPDATE DEPARTAMENTOS
SET presupuesto = presupuesto + NEW.salario_anual
WHERE cod_dep = NEW.cod_dep */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`alumno`@`localhost`*/ /*!50003 TRIGGER dp_modif_empleado AFTER UPDATE ON EMPLEADOS
FOR EACH ROW
UPDATE DEPARTAMENTOS
SET presupuesto = presupuesto - OLD.salario_anual + NEW.salario_anual
WHERE cod_dep = NEW.cod_dep */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06 10:08:46
    