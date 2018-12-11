-- MySQL dump 10.17  Distrib 10.3.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bpmspace_prms_v1
-- ------------------------------------------------------
-- Server version	10.3.11-MariaDB-1:10.3.11+maria~jessie-log


DROP DATABASE `bpmspace_prms_v1`;
CREATE DATABASE IF NOT EXISTS bpmspace_prms_v1;
USE bpmspace_prms_v1;

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
-- Table structure for table `PRMS_customer`
--

DROP TABLE IF EXISTS `PRMS_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRMS_customer` (
  `PRMS_customer_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRMS_customer_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PRMS_customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=608909 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRMS_customer_person`
--

DROP TABLE IF EXISTS `PRMS_customer_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRMS_customer_person` (
  `PRMS_customer_person_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRMS_customer_person_person_ID` bigint(20) unsigned DEFAULT NULL,
  `PRMS_customer_person_customer_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`PRMS_customer_person_ID`),
  KEY `person_ID_fk_456765_idx` (`PRMS_customer_person_person_ID`),
  KEY `customer_ID_fk_98765_idx` (`PRMS_customer_person_customer_ID`),
  CONSTRAINT `customer_ID_fk_98765` FOREIGN KEY (`PRMS_customer_person_customer_ID`) REFERENCES `PRMS_customer` (`PRMS_customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `person_ID_fk_456765` FOREIGN KEY (`PRMS_customer_person_person_ID`) REFERENCES `PRMS_person` (`PRMS_person_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9463245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRMS_person`
--

DROP TABLE IF EXISTS `PRMS_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRMS_person` (
  `PRMS_person_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRMS_person_name` varchar(45) DEFAULT NULL,
  `PRMS_person_e_mail` varchar(45) DEFAULT NULL,
  `PRMS_person_LIAM_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`PRMS_person_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32586 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRMS_project`
--

DROP TABLE IF EXISTS `PRMS_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRMS_project` (
  `PRMS_project_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRMS_project_name` varchar(45) DEFAULT NULL,
  `PRMS_project_start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `PRMS_project_comment` varchar(5000) DEFAULT NULL,
  `PRMS_project_budget_hours` int(11) DEFAULT NULL,
  `PRMS_project_customer_ID` bigint(20) unsigned DEFAULT NULL,
  `PRMS_project_person_ID_project_manager` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`PRMS_project_ID`),
  KEY `customer_ID_fk_75675_idx` (`PRMS_project_customer_ID`),
  KEY `project_manager_ID_fk_5376_idx` (`PRMS_project_person_ID_project_manager`),
  CONSTRAINT `customer_ID_fk_75675` FOREIGN KEY (`PRMS_project_customer_ID`) REFERENCES `PRMS_customer` (`PRMS_customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_manager_ID_fk_5376` FOREIGN KEY (`PRMS_project_person_ID_project_manager`) REFERENCES `PRMS_person` (`PRMS_person_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49837495 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRMS_task`
--

DROP TABLE IF EXISTS `PRMS_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRMS_task` (
  `PRMS_task_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRMS_task_name` varchar(45) DEFAULT NULL,
  `PRMS_task_budget_hours` int(11) DEFAULT 0,
  `PRMS_task_working_hours` int(11) DEFAULT 0,
  `PRMS_task_person_ID` bigint(20) unsigned DEFAULT NULL,
  `PRMS_task_project_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`PRMS_task_ID`),
  KEY `person_ID_fk_84938_idx` (`PRMS_task_person_ID`),
  KEY `project_ID_fk_456540_idx` (`PRMS_task_project_ID`),
  CONSTRAINT `person_ID_fk_84938` FOREIGN KEY (`PRMS_task_person_ID`) REFERENCES `PRMS_person` (`PRMS_person_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_ID_fk_456540` FOREIGN KEY (`PRMS_task_project_ID`) REFERENCES `PRMS_project` (`PRMS_project_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=245665 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11 16:59:39
