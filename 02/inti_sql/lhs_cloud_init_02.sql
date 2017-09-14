-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 114.215.90.83    Database: cloud-init
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `electronic_file_groups`
--

DROP TABLE IF EXISTS `electronic_file_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electronic_file_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `station_sn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronic_file_groups`
--

LOCK TABLES `electronic_file_groups` WRITE;
/*!40000 ALTER TABLE `electronic_file_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `electronic_file_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronic_files`
--

DROP TABLE IF EXISTS `electronic_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electronic_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `src_link` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_account` varchar(45) NOT NULL,
  `storage_type` varchar(45) DEFAULT NULL,
  `storage_index` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronic_files`
--

LOCK TABLES `electronic_files` WRITE;
/*!40000 ALTER TABLE `electronic_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `electronic_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `is` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `device_sn` varchar(45) DEFAULT NULL,
  `station_sn` varchar(45) DEFAULT NULL,
  `info` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `checker_user_account` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`is`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_company`
--

DROP TABLE IF EXISTS `ops_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desp` text,
  `address` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `owner_cellphone` varchar(255) DEFAULT NULL,
  `admin_id` mediumtext NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_company`
--

LOCK TABLES `ops_company` WRITE;
/*!40000 ALTER TABLE `ops_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_task`
--

DROP TABLE IF EXISTS `ops_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desp` text NOT NULL,
  `task_type` int(11) NOT NULL,
  `station_sn` varchar(100) DEFAULT NULL,
  `stage_id` int(100) NOT NULL,
  `pre_handler` varchar(100) NOT NULL,
  `current_handler` varchar(100) NOT NULL,
  `creater` varchar(100) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expect_complete_time` timestamp NULL DEFAULT NULL,
  `last_modified_time` timestamp NULL DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_task`
--

LOCK TABLES `ops_task` WRITE;
/*!40000 ALTER TABLE `ops_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_task_type`
--

DROP TABLE IF EXISTS `ops_task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_task_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_task_type`
--

LOCK TABLES `ops_task_type` WRITE;
/*!40000 ALTER TABLE `ops_task_type` DISABLE KEYS */;
INSERT INTO `ops_task_type` VALUES (1,'巡检'),(2,'检修'),(3,'抢修'),(4,'其它');
/*!40000 ALTER TABLE `ops_task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_task_update_record`
--

DROP TABLE IF EXISTS `ops_task_update_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_task_update_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL,
  `handler` varchar(100) NOT NULL,
  `desp` varchar(1000) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stage_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `picture1_name` varchar(100) DEFAULT NULL,
  `picture1_data` mediumtext,
  `picture2_name` varchar(100) DEFAULT NULL,
  `picture2_data` mediumtext,
  `picture3_name` varchar(100) DEFAULT NULL,
  `picture3_data` mediumtext,
  `picture4_name` varchar(100) DEFAULT NULL,
  `picture4_data` mediumtext,
  `picture5_name` varchar(100) DEFAULT NULL,
  `picture5_data` mediumtext,
  `picture6_name` varchar(100) DEFAULT NULL,
  `picture6_data` mediumtext,
  `picture7_name` varchar(100) DEFAULT NULL,
  `picture7_data` mediumtext,
  `picture8_name` varchar(100) DEFAULT NULL,
  `picture8_data` mediumtext,
  `picture9_name` varchar(100) DEFAULT NULL,
  `picture9_data` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_task_update_record`
--

LOCK TABLES `ops_task_update_record` WRITE;
/*!40000 ALTER TABLE `ops_task_update_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ops_task_update_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_templates`
--

DROP TABLE IF EXISTS `permission_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `content_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_1` (`name`,`content_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_templates`
--

LOCK TABLES `permission_templates` WRITE;
/*!40000 ALTER TABLE `permission_templates` DISABLE KEYS */;
INSERT INTO `permission_templates` VALUES (1,'_VIEW_','DEFAULT','可以查看站点各个维度的信息','STATION'),(2,'_DATA_EDIT_','','可以创建或配置 报表、趋势分析、看板的监控项；管理电子档案','STATION'),(3,'_INFO_EDIT_','','可以配置站点基本信息与用户信息','STATION'),(4,'_SUPERUSER','','可以做任何事情','ROLE'),(5,'_OPS_ADMIN','','','ROLE'),(6,'_USER','','','ROLE'),(7,'_OPS_OPERATOR','','','ROLE'),(8,'_BETA_USER','','','ROLE'),(9,'_PLATFORM_VIEW','','可以进入平台全景功能','UI'),(10,'_OPS_VIEW','','可以进入运维管理功能','UI'),(11,'_OPS_USER_VIEW','','可以进入运维人员管理功能','UI'),(12,'_OPS_STATISTICS_VIEW','','可以进入运维统计功能','UI'),(13,'_NEW_STATION','','可以新建站点','SYSTEM'),(14,'_NEW_USER','','可以新建用户','SYSTEM'),(17,'_OPS_COMPANY_VIEW','DEFAULT','可以看到所有员工信息和任务信息','COMPANY'),(18,'_OPS_COMPANY_USER_MAINTANCE','','可以管理员工','COMPANY'),(19,'_OPS_COMPANY_TASK_MAINTANCE','','可以管理任务','COMPANY');
/*!40000 ALTER TABLE `permission_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `content_index` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_Index_1` (`template_id`,`content_index`),
  CONSTRAINT `foreignkey1` FOREIGN KEY (`template_id`) REFERENCES `permission_templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,4,''),(2,5,''),(3,6,''),(4,7,''),(5,8,''),(6,9,''),(7,10,''),(8,11,''),(9,12,''),(10,13,''),(11,14,'');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_cofig`
--

DROP TABLE IF EXISTS `platform_cofig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_cofig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `palt_cofig_unique` (`name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_cofig`
--

LOCK TABLES `platform_cofig` WRITE;
/*!40000 ALTER TABLE `platform_cofig` DISABLE KEYS */;
INSERT INTO `platform_cofig` VALUES (1,'frontend','title','快控物联网云平台'),(2,'frontend','top_nav_station_monitor','1'),(3,'frontend','top_nav_ems','1'),(4,'frontend','top_nav_station_manage','1'),(5,'frontend','top_nav_operation_manage','1'),(6,'frontend','top_nav_platform_manage','1'),(7,'frontend','left_nav_station_kanban','1'),(8,'frontend','left_nav_running_screen','1'),(9,'frontend','left_nav_device_monitor','1'),(10,'frontend','left_nav_event','1'),(11,'frontend','left_nav_efile','1'),(12,'frontend','left_nav_analysis_trend','1'),(13,'frontend','left_nav_report_table','1'),(14,'frontend','left_nav_meter_reading','1'),(15,'frontend','left_nav_analysis_chain_ratio','1'),(16,'frontend','left_nav_analysis_time_on_time','1'),(17,'frontend','left_nav_ratio','1'),(18,'frontend','left_nav_region_monitor','1'),(19,'frontend','left_nav_station_msg','1'),(20,'frontend','left_nav_ops_task','1'),(21,'frontend','left_nav_ops_member','1'),(22,'frontend','left_nav_ops_statistics','1'),(23,'frontend','left_nav_ops_monitor','1'),(24,'frontend','left_nav_ops_companies','1'),(27,'frontend','left_nav_ops_todo_task','0');
/*!40000 ALTER TABLE `platform_cofig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_action`
--

DROP TABLE IF EXISTS `stage_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_index` int(11) NOT NULL,
  `stage_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `action_index` int(11) DEFAULT NULL,
  `action_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `next_stage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_action`
--

LOCK TABLES `stage_action` WRITE;
/*!40000 ALTER TABLE `stage_action` DISABLE KEYS */;
INSERT INTO `stage_action` VALUES (1,1,'待接单',1,'接受任务',3),(2,1,'待接单',2,'拒绝任务',2),(3,2,'待指派',3,'指派任务',1),(4,3,'已接单',4,'更新进展',3),(5,3,'已接单',5,'报告任务',4),(6,4,'待确认',6,'驳回',3),(7,4,'待确认',7,'关闭',5),(8,5,'关闭',NULL,NULL,100),(9,0,'创建',0,'创建任务',1);
/*!40000 ALTER TABLE `stage_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_permissions`
--

DROP TABLE IF EXISTS `user_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_groupid_and_permissionid` (`group_id`,`permission_id`),
  KEY `foreign_key4_idx` (`permission_id`),
  CONSTRAINT `foreign_key3` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key4` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_permissions`
--

LOCK TABLES `user_group_permissions` WRITE;
/*!40000 ALTER TABLE `user_group_permissions` DISABLE KEYS */;
INSERT INTO `user_group_permissions` VALUES (2,1,3),(3,2,4),(10,2,7),(4,3,2),(7,3,7),(8,3,8),(9,3,9),(13,3,10),(12,3,11),(6,4,1),(1,4,6),(14,4,10),(11,4,11),(5,6,5);
/*!40000 ALTER TABLE `user_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_users`
--

DROP TABLE IF EXISTS `user_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_account` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_account` (`user_account`,`group_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `foreign_key5_idx` (`group_id`),
  CONSTRAINT `foreign_key5` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key6` FOREIGN KEY (`user_account`) REFERENCES `users` (`account`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_users`
--

LOCK TABLES `user_group_users` WRITE;
/*!40000 ALTER TABLE `user_group_users` DISABLE KEYS */;
INSERT INTO `user_group_users` VALUES (1,4,'admin');
/*!40000 ALTER TABLE `user_group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'USER','普通用户',NULL),(2,'OPS_OPERATOR','运维工人',NULL),(3,'OPS_ADMIN','运维管理员',NULL),(4,'SUPERUSER','平台用户',NULL),(6,'BETA_USER','新特性',NULL);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(45) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_account_and_permission_id` (`user_account`,`permission_id`),
  KEY `foreign_key1_idx` (`permission_id`),
  CONSTRAINT `foreign_key1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreign_key2` FOREIGN KEY (`user_account`) REFERENCES `users` (`account`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `extend_js` longtext,
  `phone` varchar(255) DEFAULT NULL,
  `photo_data` mediumtext,
  `photo_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (46,'admin','管理员','$2a$10$smwe7XQW.mrybnFmIMmcnu.BqJ0bUgqyi5dxpkUj5wB4/Nla7eMLG',NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `var_group`
--

DROP TABLE IF EXISTS `var_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `var_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `station_sn` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `label1_name` varchar(45) DEFAULT NULL,
  `label2_name` varchar(45) DEFAULT NULL,
  `label3_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_UNIQUE` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `var_group`
--

LOCK TABLES `var_group` WRITE;
/*!40000 ALTER TABLE `var_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `var_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `var_group_vars`
--

DROP TABLE IF EXISTS `var_group_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `var_group_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(200) NOT NULL,
  `var_group_sn` varchar(100) NOT NULL,
  `device_var_sn` varchar(45) NOT NULL,
  `label1_value` varchar(45) DEFAULT NULL,
  `label2_value` varchar(45) DEFAULT NULL,
  `label3_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_UNIQUE` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `var_group_vars`
--

LOCK TABLES `var_group_vars` WRITE;
/*!40000 ALTER TABLE `var_group_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `var_group_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cloud-init'
--

--
-- Dumping routines for database 'cloud-init'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-14 16:56:20
