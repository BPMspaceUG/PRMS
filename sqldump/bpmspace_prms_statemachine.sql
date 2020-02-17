-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bpmspace_prms
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `entrypoint` tinyint(1) NOT NULL DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL DEFAULT '1',
  `script_IN` longtext,
  `script_OUT` longtext,
  PRIMARY KEY (`state_id`),
  KEY `state_machine_id_fk` (`statemachine_id`),
  CONSTRAINT `state_machine_id_fk` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'new',1,1,NULL,NULL),(2,'initated',0,1,'',''),(3,'update',0,1,NULL,NULL),(4,'planned',0,1,'',''),(5,'selected',1,2,NULL,NULL),(6,'unselected',0,2,NULL,NULL),(7,'new',1,3,NULL,NULL),(8,'active',0,3,NULL,NULL),(9,'update',0,3,NULL,NULL),(10,'inactive',0,3,NULL,NULL),(11,'cancel',0,1,'',''),(12,'agreed',0,1,'',''),(13,'succesfull',0,1,'',''),(14,'not succesfull',0,1,'','');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) DEFAULT NULL,
  `transition_script` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machines`
--

LOCK TABLES `state_machines` WRITE;
/*!40000 ALTER TABLE `state_machines` DISABLE KEYS */;
INSERT INTO `state_machines` VALUES (1,'prms_project','include_once(__DIR__.\'/../_state_machines/1/create.php\');'),(2,'prms_project_task','include_once(__DIR__.\'/../_state_machines/2/create.php\');'),(3,'prms_task','include_once(__DIR__.\'/../_state_machines/3/create.php\');');
/*!40000 ALTER TABLE `state_machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_rules`
--

DROP TABLE IF EXISTS `state_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` longtext,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_rules`
--

LOCK TABLES `state_rules` WRITE;
/*!40000 ALTER TABLE `state_rules` DISABLE KEYS */;
INSERT INTO `state_rules` VALUES (1,1,1,'include_once(__DIR__.\'/../_state_rules/1.php\');'),(2,3,3,'include_once(__DIR__.\'/../_state_rules/2.php\');'),(3,1,2,'include_once(__DIR__.\'/../_state_rules/3.php\');'),(4,2,3,'include_once(__DIR__.\'/../_state_rules/4.php\');'),(5,3,2,'include_once(__DIR__.\'/../_state_rules/5.php\');'),(6,2,4,'include_once(__DIR__.\'/../_state_rules/6.php\');'),(7,5,6,'include_once(__DIR__.\'/../_state_rules/7.php\');'),(8,6,5,'include_once(__DIR__.\'/../_state_rules/8.php\');'),(9,7,7,'include_once(__DIR__.\'/../_state_rules/9.php\');'),(10,9,9,'include_once(__DIR__.\'/../_state_rules/10.php\');'),(11,7,8,'include_once(__DIR__.\'/../_state_rules/11.php\');'),(12,8,9,'include_once(__DIR__.\'/../_state_rules/12.php\');'),(13,9,8,'include_once(__DIR__.\'/../_state_rules/13.php\');'),(14,8,10,'include_once(__DIR__.\'/../_state_rules/14.php\');'),(16,4,11,'include_once(__DIR__.\'/../_state_rules/16.php\');'),(17,4,12,'include_once(__DIR__.\'/../_state_rules/17.php\');'),(18,4,2,'include_once(__DIR__.\'/../_state_rules/18.php\');'),(19,12,14,'include_once(__DIR__.\'/../_state_rules/19.php\');'),(20,12,13,'include_once(__DIR__.\'/../_state_rules/20.php\');');
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bpmspace_prms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 17:15:02
