-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dbescola
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reldisciplinaturma`
--

DROP TABLE IF EXISTS `reldisciplinaturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reldisciplinaturma` (
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `fkTurma` int(11) NOT NULL,
  `fkDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `fkTurma` (`fkTurma`),
  KEY `fkDisciplina` (`fkDisciplina`),
  CONSTRAINT `reldisciplinaturma_ibfk_1` FOREIGN KEY (`fkTurma`) REFERENCES `tblturma` (`pkchave`),
  CONSTRAINT `reldisciplinaturma_ibfk_2` FOREIGN KEY (`fkDisciplina`) REFERENCES `tbldisciplina` (`pkchave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reldisciplinaturma`
--

LOCK TABLES `reldisciplinaturma` WRITE;
/*!40000 ALTER TABLE `reldisciplinaturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `reldisciplinaturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reldocentedisciplina`
--

DROP TABLE IF EXISTS `reldocentedisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reldocentedisciplina` (
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `fkDocente` int(11) NOT NULL,
  `fkDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `fkDocente` (`fkDocente`,`fkDisciplina`),
  KEY `fkDisciplina` (`fkDisciplina`),
  CONSTRAINT `reldocentedisciplina_ibfk_1` FOREIGN KEY (`fkDocente`) REFERENCES `tbldocente` (`pkchave`),
  CONSTRAINT `reldocentedisciplina_ibfk_2` FOREIGN KEY (`fkDisciplina`) REFERENCES `tbldisciplina` (`pkchave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reldocentedisciplina`
--

LOCK TABLES `reldocentedisciplina` WRITE;
/*!40000 ALTER TABLE `reldocentedisciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `reldocentedisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relestudanteturma`
--

DROP TABLE IF EXISTS `relestudanteturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `relestudanteturma` (
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `fkEstudante` int(11) NOT NULL,
  `fkTurma` int(11) NOT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `fkEstudante` (`fkEstudante`,`fkTurma`),
  KEY `fkTurma` (`fkTurma`),
  CONSTRAINT `relestudanteturma_ibfk_1` FOREIGN KEY (`fkEstudante`) REFERENCES `tblestudante` (`pkchave`),
  CONSTRAINT `relestudanteturma_ibfk_2` FOREIGN KEY (`fkTurma`) REFERENCES `tblturma` (`pkchave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relestudanteturma`
--

LOCK TABLES `relestudanteturma` WRITE;
/*!40000 ALTER TABLE `relestudanteturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `relestudanteturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldisciplina`
--

DROP TABLE IF EXISTS `tbldisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbldisciplina` (
  `upkDisciplina` binary(16) NOT NULL,
  `strNome` varchar(50) DEFAULT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `strSigla` char(5) NOT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `strSigla` (`strSigla`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldisciplina`
--

LOCK TABLES `tbldisciplina` WRITE;
/*!40000 ALTER TABLE `tbldisciplina` DISABLE KEYS */;
INSERT INTO `tbldisciplina` VALUES (_binary '0\—gº\Èî\ı–îf€ä\Ô','Banco de dados II','2019-04-25 21:41:29',NULL,1,'BD2A2');
/*!40000 ALTER TABLE `tbldisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldocente`
--

DROP TABLE IF EXISTS `tbldocente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbldocente` (
  `upkDocente` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `strProntuario` char(9) NOT NULL,
  `strNome` varchar(50) NOT NULL,
  `escolaridade` enum('FUNDAMENTAL','MEDIO','TECNOLOGO','BACHARELADO','LICENCIATURA','MESTRADO','DOUTORADO','POSGRADUACAO','LIVREDOCENCIA') DEFAULT NULL,
  `dtNascimento` date DEFAULT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `strProntuario` (`strProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldocente`
--

LOCK TABLES `tbldocente` WRITE;
/*!40000 ALTER TABLE `tbldocente` DISABLE KEYS */;
INSERT INTO `tbldocente` VALUES (_binary '>˘xgº\Èî\ı–îf€ä\Ô','2019-04-25 21:42:02',NULL,3,'2222222','Fake','DOUTORADO','1970-10-10');
/*!40000 ALTER TABLE `tbldocente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestudante`
--

DROP TABLE IF EXISTS `tblestudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblestudante` (
  `upkEstudante` binary(16) NOT NULL,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strProntuario` char(7) DEFAULT NULL,
  `strNome` varchar(50) DEFAULT NULL,
  `dtNascimento` date DEFAULT NULL,
  PRIMARY KEY (`pkChave`),
  UNIQUE KEY `strProntuario` (`strProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestudante`
--

LOCK TABLES `tblestudante` WRITE;
/*!40000 ALTER TABLE `tblestudante` DISABLE KEYS */;
INSERT INTO `tblestudante` VALUES (_binary 'hpég∑\Èî\ı–îf€ä\Ô',1,'2019-04-25 21:08:24',NULL,'3013146','Vinicius Eustaquio Cortez','1999-11-23');
/*!40000 ALTER TABLE `tblestudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblturma`
--

DROP TABLE IF EXISTS `tblturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblturma` (
  `upkTurma` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pkChave` int(11) NOT NULL AUTO_INCREMENT,
  `strDia` varchar(6) NOT NULL,
  `strPeriodo` varchar(6) NOT NULL,
  `dia` enum('SEGUNDA','TERCA','QUARTA','QUINTA','SEXTA','SABADO',' DOMINGO') DEFAULT NULL,
  `pediodo` enum('MATUTINO','VESPERTINO','NOTURNO') DEFAULT NULL,
  PRIMARY KEY (`pkChave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblturma`
--

LOCK TABLES `tblturma` WRITE;
/*!40000 ALTER TABLE `tblturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbescola'
--
/*!50003 DROP FUNCTION IF EXISTS `fnNovaChave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnNovaChave`() RETURNS binary(16)
    DETERMINISTIC
RETURN UNHEX(REPLACE(UUID(), '-', '')) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prAtualizarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prAtualizarEstudante`( varProntuario char(7), varNome varchar(50),  varNascimento date)
BEGIN
START TRANSACTION;
UPDATE tblestudante set strProntuario = varProntuario, strNome = varNome, dtNascimento = varNascimento WHERE strProntuario = varProntuario;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarDisciplina`( varSigla char(5), varNome varchar(50))
BEGIN
START TRANSACTION;
INSERT INTO tbldisciplina (upkDisciplina, strSigla  ,strNome ) values (fnNovaChave(), varSigla, varNome);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarDocente`( varProntuario char(7), varNome varchar(50),  varNascimento date,  
varEscolaridade enum("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "MESTRADO", "DOUTORADO", "POSGRADUACAO","LIVREDOCENCIA" ))
BEGIN
START TRANSACTION;
INSERT INTO tbldocente(upkDocente, strProntuario, strNome, escolaridade, dtNascimento) values (fnNovaChave(), varProntuario, varNome, varEscolaridade, varNascimento);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarEstudante`( varProntuario char(7), varNome varchar(50),  varNascimento date)
BEGIN
START TRANSACTION;
INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) values (fnNovaChave(), varProntuario, varNome, varNascimento);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarTurma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarTurma`( varSigla char(5), varDia enum( "SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO"," DOMINGO") , varPeriodo enum("MATUTINO", "VESPERTINO", "NOTURNO") )
BEGIN
START TRANSACTION;
INSERT INTO tblturma (upkTurma, periodo, dia)  values (fnNovaChave(), varDia, varPeriodo);
INSERT INTO reldisciplinaturma(upkTurma, fkTurma, fkDisciplina) SELECT fnNovaChave(), LAST_INSERT_ID, fkDisciplina from tbldisciplina where strSigla = varSigla; 
COMMIT ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prLerEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prLerEstudante`( varProntuario char(7))
BEGIN
START TRANSACTION;
SELECT dcCreated as "criado", dcModified as "modificado", strProntuario as "prontuario", 
strNome as "nome", dtNascimento as "nascimento" from tblestudante;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarDisciplina`()
BEGIN
START TRANSACTION;
SELECT dcCreated as "criado", dcModified as "modificado", strSigla as "sigla", strNome as "nome" from tbldisciplina;
COMMIT ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarDocente`()
BEGIN
START TRANSACTION;
SELECT dcCreated as "criado", dcModified as "modificado", strProntuario as "prontuario", strNome as "nome" , escolaridade, dtNascimento as "nascimento"   from tbldocente;
COMMIT ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarEstudante`()
BEGIN
START TRANSACTION;
SELECT dcCreated as "criado", dcModified as 
"modificado", strProntuario as "prontuario", strNome as "nome", 
dtNascimento as "nascimento"
from tblestudante;
COMMIT;
END ;;
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

-- Dump completed on 2019-04-25 22:05:56
