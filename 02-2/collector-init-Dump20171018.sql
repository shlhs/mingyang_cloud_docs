-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: collector_init_02
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `station_sn` varchar(256) DEFAULT NULL,
  `system_sn` varchar(256) DEFAULT NULL,
  `product_id` varchar(45) DEFAULT NULL,
  `qr_photo_src_link` varchar(500) DEFAULT NULL,
  `qr_photo_storage_type` varchar(45) DEFAULT NULL,
  `qr_photo_storage_index` varchar(256) DEFAULT NULL,
  `certification_photo_src_link` varchar(500) DEFAULT NULL,
  `certification_photo_storage_type` varchar(45) DEFAULT NULL,
  `certification_photo_storage_index` varchar(256) DEFAULT NULL,
  `initial_time` datetime DEFAULT NULL,
  `last_overhaul_time` datetime DEFAULT NULL,
  `position_desp` longtext,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_annual_certification`
--

DROP TABLE IF EXISTS `device_annual_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_annual_certification` (
  `id` text,
  `device_id` text,
  `time` text,
  `photo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_annual_certification`
--

LOCK TABLES `device_annual_certification` WRITE;
/*!40000 ALTER TABLE `device_annual_certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_annual_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_scene_photo`
--

DROP TABLE IF EXISTS `device_scene_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_scene_photo` (
  `id` text,
  `device_id` text,
  `name` text,
  `photo` text,
  `update_time` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_scene_photo`
--

LOCK TABLES `device_scene_photo` WRITE;
/*!40000 ALTER TABLE `device_scene_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_scene_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_var`
--

DROP TABLE IF EXISTS `device_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_var` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT '',
  `type` varchar(45) DEFAULT NULL,
  `device_sn` varchar(45) DEFAULT NULL,
  `station_sn` varchar(45) DEFAULT NULL,
  `sn_in_point_table` varchar(45) DEFAULT NULL,
  `record_period` varchar(45) DEFAULT NULL,
  `base_value` double DEFAULT NULL,
  `coefficient` double DEFAULT NULL,
  `is_key` tinyint(3) unsigned zerofill DEFAULT NULL,
  `lower_limit` double DEFAULT NULL,
  `more_lower_limit` double DEFAULT NULL,
  `upper_limit` double DEFAULT NULL,
  `more_upper_limit` double DEFAULT NULL,
  `zero_to_one_alarm` tinyint(3) DEFAULT NULL,
  `one_to_zero_alarm` tinyint(3) DEFAULT NULL,
  `zero_meaning` varchar(45) DEFAULT NULL,
  `one_meaning` varchar(45) DEFAULT NULL,
  `alarm` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_var`
--

LOCK TABLES `device_var` WRITE;
/*!40000 ALTER TABLE `device_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` varchar(100) NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `station_sn` varchar(45) NOT NULL,
  `station_name` varchar(255) DEFAULT NULL,
  `device_sn` varchar(45) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `level_name` varchar(45) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `status_name` varchar(45) DEFAULT NULL,
  `var_sn` varchar(255) NOT NULL,
  `var_value` varchar(255) NOT NULL,
  `report_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `closed_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `info` longtext,
  `checker` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_rules`
--

DROP TABLE IF EXISTS `event_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_rules` (
  `id` int(11) NOT NULL,
  `object_sn` varchar(256) NOT NULL,
  `type` varchar(45) NOT NULL,
  `condition` longtext NOT NULL,
  `level` int(4) DEFAULT NULL,
  `info` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_rules`
--

LOCK TABLES `event_rules` WRITE;
/*!40000 ALTER TABLE `event_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `object_type` varchar(45) NOT NULL,
  `default_level` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_types`
--

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_screen`
--

DROP TABLE IF EXISTS `monitor_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `station_sn` varchar(45) DEFAULT NULL,
  `svg_file` longtext,
  `lhs_file` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_screen`
--

LOCK TABLES `monitor_screen` WRITE;
/*!40000 ALTER TABLE `monitor_screen` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `desp` varchar(200) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `fix_line_telephone` varchar(15) DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  `power_supply_type` varchar(45) DEFAULT NULL,
  `voltage_class` varchar(45) DEFAULT NULL,
  `extend_js` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_UNIQUE` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'collector_init_02'
--

--
-- Dumping routines for database 'collector_init_02'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 15:15:59
