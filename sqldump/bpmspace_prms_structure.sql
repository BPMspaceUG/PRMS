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
-- Temporary table structure for view `_edges`
--

DROP TABLE IF EXISTS `_edges`;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_edges` (
  `EdgeType` tinyint NOT NULL,
  `EdgeID` tinyint NOT NULL,
  `EdgePartner` tinyint NOT NULL,
  `EdgeStateID` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_nodes`
--

DROP TABLE IF EXISTS `_nodes`;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_nodes` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_orphans`
--

DROP TABLE IF EXISTS `_orphans`;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_orphans` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prms_project`
--

DROP TABLE IF EXISTS `prms_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prms_project` (
  `prms_project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prms_project_name` varchar(256) DEFAULT NULL,
  `prms_project_description` mediumtext,
  `state_id` bigint(20) DEFAULT '1',
  PRIMARY KEY (`prms_project_id`),
  KEY `state_id_01d918ae` (`state_id`),
  CONSTRAINT `state_id_01d918ae` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prms_project_task`
--

DROP TABLE IF EXISTS `prms_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prms_project_task` (
  `prms_project_task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prms_project_id_fk_350642` bigint(20) DEFAULT NULL,
  `prms_task_id_fk_516161` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '5',
  PRIMARY KEY (`prms_project_task_id`),
  KEY `prms_project_id_fk_350642` (`prms_project_id_fk_350642`),
  KEY `prms_task_id_fk_516161` (`prms_task_id_fk_516161`),
  KEY `state_id_490029f5` (`state_id`),
  CONSTRAINT `prms_project_task_ibfk_1` FOREIGN KEY (`prms_project_id_fk_350642`) REFERENCES `prms_project` (`prms_project_id`),
  CONSTRAINT `prms_project_task_ibfk_2` FOREIGN KEY (`prms_task_id_fk_516161`) REFERENCES `prms_task` (`prms_task_id`),
  CONSTRAINT `state_id_490029f5` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prms_task`
--

DROP TABLE IF EXISTS `prms_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prms_task` (
  `prms_task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prms_task_name` varchar(256) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7',
  PRIMARY KEY (`prms_task_id`),
  KEY `state_id_b3b953bf` (`state_id`),
  CONSTRAINT `state_id_b3b953bf` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `ConfigDiff` longtext,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `role_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_user_id`),
  KEY `role_id_fk` (`role_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Final view structure for view `_edges`
--

/*!50001 DROP TABLE IF EXISTS `_edges`*/;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_edges` AS select 'prms_project_task' AS `EdgeType`,`prms_project_task`.`prms_project_task_id` AS `EdgeID`,0 AS `EdgePartner`,`prms_project_task`.`state_id` AS `EdgeStateID`,`prms_project_task`.`prms_project_id_fk_350642` AS `ObjectID` from `prms_project_task` union select 'prms_project_task' AS `EdgeType`,`prms_project_task`.`prms_project_task_id` AS `EdgeID`,1 AS `EdgePartner`,`prms_project_task`.`state_id` AS `EdgeStateID`,`prms_project_task`.`prms_task_id_fk_516161` AS `ObjectID` from `prms_project_task` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_nodes`
--

/*!50001 DROP TABLE IF EXISTS `_nodes`*/;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_nodes` AS select 'prms_project' AS `ObjectType`,`prms_project`.`prms_project_id` AS `ObjectID`,`prms_project`.`state_id` AS `ObjectStateID` from `prms_project` union select 'prms_task' AS `ObjectType`,`prms_task`.`prms_task_id` AS `ObjectID`,`prms_task`.`state_id` AS `ObjectStateID` from `prms_task` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_orphans`
--

/*!50001 DROP TABLE IF EXISTS `_orphans`*/;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orphans` AS select `n`.`ObjectType` AS `ObjectType`,`n`.`ObjectID` AS `ObjectID`,`n`.`ObjectStateID` AS `ObjectStateID` from (`_nodes` `n` left join `_edges` `e` on((`e`.`ObjectID` = `n`.`ObjectID`))) where isnull(`e`.`EdgeType`) */;
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

-- Dump completed on 2020-02-17 14:28:37
