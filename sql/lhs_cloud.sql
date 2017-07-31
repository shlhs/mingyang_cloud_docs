-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: lhs_cloud_03
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'zoujian','zoujian','$2a$10$whiDMFO1AxitsRsavoPRje6CgAxd6mZgPepd2Xcn1rA0ts32Rr7Ii','ROLE_ADMIN',1,NULL),(2,'zhangsan','zhangsan','$2a$10$HtIaSWww7EOCVN4th.SYo.eMOV1aXUL2LWQ9AtqSpagh0rXEexMbe','ROLE_USER',1,NULL),(3,'renxifeng',NULL,'$2a$10$PahDOtjur7iDLPNCyk7OROHC.oTrwWUPyKvjMVed1ZAVSfKwf7uCy','ROLE_ADMIN',1,NULL),(4,'lisi',NULL,'$2a$10$6QIY0IjF.F7nVcjLwGAZPePU0KSWVL9lMlclv9KB7E3qAt8dxoXc2','ROLE_SUPERUSER',1,NULL),(13,'12345','string','$2a$10$Shcrkc8befcw3Mhs7unA5uFnigROxWSqT8tbXlmFvY9e2pyYxt2ey','ROLE_SUPERUSER',1,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_UNIQUE` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `var_group`
--

LOCK TABLES `var_group` WRITE;
/*!40000 ALTER TABLE `var_group` DISABLE KEYS */;
INSERT INTO `var_group` VALUES (1,'12340','关键数据','123456789','normal'),(2,'12341','能耗占比','123456789','normal'),(3,'12342','总能耗','123456789','normal'),(7,'12344','负荷','123456789','normal'),(8,'12334','负荷','123456788',NULL),(9,'12330','关键数据','zdyt','normal'),(10,'12331','能耗占比','zdyt','normal'),(11,'12332','总能耗','zdyt','normal'),(13,'12324','负荷','zdyt','normal'),(14,'12320','关键数据','123456787','normal'),(15,'12321','能耗占比','123456787','normal'),(16,'12322','总能耗','123456787','normal'),(31,'123456789_运行报表2_report','运行报表2','123456789','report'),(66,'123456788_丰东股份黄金分割交换机','丰东股份黄金分割交换机','123456788','report'),(69,'123456788_测试1改名1_trend','测试1改名1','123456788','trend'),(70,'123456788_讽德诵功','讽德诵功','123456788','trend'),(73,'123456789_发电功率_report','发电功率','123456789','report'),(78,'123456787_谷歌','谷歌','123456787','trend'),(79,'123456788_报表改名1_report','报表改名1','123456788','report'),(87,'123456789_xxx趋势分析_trend','xxx趋势分析','123456789','trend'),(89,'123456789_业务报表1_report','业务报表1','123456789','report'),(93,'123456788_第三方_report','第三方','123456788','report'),(96,'123456789_M_TWO_MOST_IMPORTANT_report','M_TWO_MOST_IMPORTANT','123456789','normal'),(97,'123456788_M_TWO_MOST_IMPORTANT_report','M_TWO_MOST_IMPORTANT','123456788','normal'),(98,'123456787_M_TWO_MOST_IMPORTANT_report','M_TWO_MOST_IMPORTANT','123456787','normal'),(99,'123456789_M_关键数据_report','M_关键数据','123456789','normal'),(100,'123456788_M_关键数据_report','M_关键数据','123456788','normal'),(101,'123456787_M_关键数据_report','M_关键数据','123456787','normal'),(102,'123456789_M_实时曲线_report','M_实时曲线','123456789','normal'),(103,'123456788_M_实时曲线_report','M_实时曲线','123456788','normal'),(104,'123456787_M_实时曲线_report','M_实时曲线','123456787','normal'),(105,'123456789_M_发电贡献_report','M_发电贡献','123456789','normal'),(106,'123456788_M_发电贡献_report','M_发电贡献','123456788','normal'),(107,'123456787_M_发电贡献_report','M_发电贡献','123456787','normal'),(108,'123456789_中心配电室总功率趋势曲线图_trend','中心配电室总功率趋势曲线图','123456789','trend'),(109,'123456789_中心配电室日报表_report','中心配电室日报表','123456789','report'),(111,'123456789_newtest_trend','newtest','123456789','trend'),(112,'123456789_用电功率_report','用电功率','123456789','report'),(113,'123456789_new趋势分析_trend','new趋势分析','123456789','trend'),(119,'zdyt_设备1报表_report','设备1报表','zdyt','report'),(120,'zdyt_设备1电压电流功率_trend','设备1电压电流功率','zdyt','trend');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_UNIQUE` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `var_group_vars`
--

LOCK TABLES `var_group_vars` WRITE;
/*!40000 ALTER TABLE `var_group_vars` DISABLE KEYS */;
INSERT INTO `var_group_vars` VALUES (1,'1','12340','123456789_1_1'),(2,'2','12340','123456789_1_2'),(3,'3','12340','123456789_2_1'),(4,'4','12342','123456789_1_1'),(5,'5','12341','123456789_2_2'),(6,'6','12341','123456789_3_1'),(7,'7','12341','123456789_4_1'),(8,'8','12341','123456789_5_1'),(9,'9','12341','123456789_6_1'),(10,'10','12344','123456789_1_3'),(11,'11','12344','123456789_2_3'),(12,'1_1','12330','zdyt001_P'),(13,'2_1','12330','zdyt002_P'),(14,'3_1','12330','zdyt003_P'),(15,'4_1','12332','123456788_1_1'),(16,'5_1','12331','zdyt001_P'),(17,'6_1','12331','zdyt002_P'),(18,'7_1','12331','zdyt003_P'),(21,'10_1','12334','123456788_1_3'),(22,'11_1','12334','123456788_2_3'),(23,'1_2','12320','123456787_1_1'),(24,'2_2','12320','123456787_1_2'),(25,'3_2','12320','123456787_2_1'),(26,'4_2','12322','123456787_0_1'),(27,'5_2','12321','123456787_2_2'),(28,'6_2','12321','123456787_3_1'),(29,'7_2','12321','123456787_4_1'),(30,'8_2','12321','123456787_5_1'),(31,'9_2','12321','123456787_6_1'),(32,'10_2','12324','123456787_1_3'),(33,'11_2','12324','123456787_2_3'),(34,'20_1','11111','123456789_1_1'),(35,'20_2','11111','123456789_1_2'),(36,'20_12','11112','123456789_1_1'),(37,'20_22','11112','123456789_1_2'),(40,'20_14','11114','123456789_1_1'),(41,'20_24','11114','123456789_1_2'),(42,'20_3','11121','123456788_1_1'),(43,'20_4','11121','123456788_1_2'),(44,'20_32','11122','123456788_1_1'),(45,'20_42','11122','123456788_1_2'),(46,'20_33','11123','123456788_1_1'),(47,'20_43','11123','123456788_1_2'),(48,'20_50','11130','123456787_1_1'),(49,'20_60','11130','123456787_1_2'),(50,'20_51','11111','123456787_1_1'),(51,'20_61','11111','123456787_1_2'),(52,'20_52','11112','123456787_1_1'),(53,'20_62','11112','123456787_1_2'),(56,'20_54','11114','123456787_1_1'),(57,'20_64','11114','123456787_1_2'),(62,'220_13','21113','123456789_1_1'),(63,'220_23','21113','123456789_1_2'),(64,'220_14','21114','123456789_1_1'),(65,'220_24','21114','123456789_1_2'),(66,'220_3','21121','123456788_1_1'),(67,'220_4','21121','123456788_1_2'),(68,'220_32','21122','123456788_1_1'),(69,'220_42','21122','123456788_1_2'),(70,'220_33','21123','123456788_1_1'),(71,'220_43','21123','123456788_1_2'),(72,'220_50','21130','123456787_1_1'),(73,'220_60','21130','123456787_1_2'),(78,'220_53','21113','123456787_1_1'),(79,'220_63','21113','123456787_1_2'),(80,'220_54','21114','123456787_1_1'),(81,'220_64','11114','123456787_1_2'),(154,'string_12233545456','string','12233545456'),(287,'123456787_谷歌_123456787_2_2','123456787_谷歌','123456787_2_2'),(288,'123456787_谷歌_123456787_4_1','123456787_谷歌','123456787_4_1'),(289,'123456787_谷歌_123456787_2_3','123456787_谷歌','123456787_2_3'),(292,'123456788_讽德诵功_123456788_3_1','123456788_讽德诵功','123456788_3_1'),(293,'123456788_讽德诵功_123456788_4_1','123456788_讽德诵功','123456788_4_1'),(294,'123456788_讽德诵功_123456788_1_2','123456788_讽德诵功','123456788_1_2'),(307,'123456788_丰东股份黄金分割交换机_123456788_2_3','123456788_丰东股份黄金分割交换机','123456788_2_3'),(308,'123456788_丰东股份黄金分割交换机_123456788_2_2','123456788_丰东股份黄金分割交换机','123456788_2_2'),(309,'123456788_丰东股份黄金分割交换机_123456788_5_1','123456788_丰东股份黄金分割交换机','123456788_5_1'),(310,'123456788_丰东股份黄金分割交换机_123456788_1_1','123456788_丰东股份黄金分割交换机','123456788_1_1'),(463,'123456788_测试1改名1_trend_123456788_1_3','123456788_测试1改名1_trend','123456788_1_3'),(464,'123456788_测试1改名1_trend_123456788_2_3','123456788_测试1改名1_trend','123456788_2_3'),(465,'123456788_测试1改名1_trend_123456788_2_2','123456788_测试1改名1_trend','123456788_2_2'),(466,'123456788_测试1改名1_trend_123456788_4_1','123456788_测试1改名1_trend','123456788_4_1'),(467,'123456788_测试1改名1_trend_123456788_5_1','123456788_测试1改名1_trend','123456788_5_1'),(468,'123456788_测试1改名1_trend_123456788_6_1','123456788_测试1改名1_trend','123456788_6_1'),(470,'123456788_第三方_report_123456788_2_1','123456788_第三方_report','123456788_2_1'),(471,'123456788_第三方_report_123456788_3_1','123456788_第三方_report','123456788_3_1'),(472,'123456788_报表改名1_report_123456788_1_1','123456788_报表改名1_report','123456788_1_1'),(473,'123456788_报表改名1_report_123456788_3_1','123456788_报表改名1_report','123456788_3_1'),(474,'123456788_报表改名1_report_123456788_4_1','123456788_报表改名1_report','123456788_4_1'),(483,'123456789_M_TWO_MOST_IMPORTANT_report_123456789_0_2','123456789_M_TWO_MOST_IMPORTANT_report','123456789_0_2'),(484,'123456789_M_TWO_MOST_IMPORTANT_report_123456789_0_3','123456789_M_TWO_MOST_IMPORTANT_report','123456789_0_3'),(485,'123456788_M_TWO_MOST_IMPORTANT_report_123456788_0_2','123456788_M_TWO_MOST_IMPORTANT_report','123456788_0_2'),(486,'123456788_M_TWO_MOST_IMPORTANT_report_123456788_0_3','123456788_M_TWO_MOST_IMPORTANT_report','123456788_0_3'),(487,'123456787_M_TWO_MOST_IMPORTANT_report_123456787_0_2','123456787_M_TWO_MOST_IMPORTANT_report','123456787_0_2'),(488,'123456787_M_TWO_MOST_IMPORTANT_report_123456787_0_3','123456787_M_TWO_MOST_IMPORTANT_report','123456787_0_3'),(497,'123456789_M_关键数据_report_123456789_0_2','123456789_M_关键数据_report','123456789_0_2'),(498,'123456789_M_关键数据_report_123456789_0_3','123456789_M_关键数据_report','123456789_0_3'),(499,'123456789_M_关键数据_report_123456789_2_2','123456789_M_关键数据_report','123456789_2_2'),(500,'123456789_M_关键数据_report_123456789_3_1','123456789_M_关键数据_report','123456789_3_1'),(501,'123456788_M_关键数据_report_123456788_0_2','123456788_M_关键数据_report','123456788_0_2'),(502,'123456788_M_关键数据_report_123456788_0_3','123456788_M_关键数据_report','123456788_0_3'),(503,'123456788_M_关键数据_report_123456788_2_2','123456788_M_关键数据_report','123456788_2_2'),(504,'123456788_M_关键数据_report_123456788_3_1','123456788_M_关键数据_report','123456788_3_1'),(505,'123456787_M_关键数据_report_123456787_0_2','123456787_M_关键数据_report','123456787_0_2'),(506,'123456787_M_关键数据_report_123456787_0_3','123456787_M_关键数据_report','123456787_0_3'),(507,'123456787_M_关键数据_report_123456787_2_2','123456787_M_关键数据_report','123456787_2_2'),(508,'123456787_M_关键数据_report_123456787_3_1','123456787_M_关键数据_report','123456787_3_1'),(509,'123456789_M_实时曲线_report_123456789_4_1','123456789_M_实时曲线_report','123456789_4_1'),(510,'123456788_M_实时曲线_report_123456788_4_1','123456788_M_实时曲线_report','123456788_4_1'),(511,'123456787_M_实时曲线_report_123456787_4_1','123456787_M_实时曲线_report','123456787_4_1'),(512,'123456789_M_发电贡献_report_123456789_1_11','123456789_M_发电贡献_report','123456789_1_11'),(513,'123456789_M_发电贡献_report_123456789_2_11','123456789_M_发电贡献_report','123456789_2_11'),(514,'123456789_M_发电贡献_report_123456789_3_11','123456789_M_发电贡献_report','123456789_3_11'),(515,'123456789_M_发电贡献_report_123456789_4_11','123456789_M_发电贡献_report','123456789_4_11'),(516,'123456789_M_发电贡献_report_123456789_5_11','123456789_M_发电贡献_report','123456789_5_11'),(517,'123456789_M_发电贡献_report_123456789_6_11','123456789_M_发电贡献_report','123456789_6_11'),(518,'123456788_M_发电贡献_report_123456788_1_11','123456788_M_发电贡献_report','123456788_1_11'),(519,'123456788_M_发电贡献_report_123456788_2_11','123456788_M_发电贡献_report','123456788_2_11'),(520,'123456788_M_发电贡献_report_123456788_3_11','123456788_M_发电贡献_report','123456788_3_11'),(521,'123456788_M_发电贡献_report_123456788_4_11','123456788_M_发电贡献_report','123456788_4_11'),(522,'123456788_M_发电贡献_report_123456788_5_11','123456788_M_发电贡献_report','123456788_5_11'),(523,'123456788_M_发电贡献_report_123456788_6_11','123456788_M_发电贡献_report','123456788_6_11'),(524,'123456787_M_发电贡献_report_123456787_1_11','123456787_M_发电贡献_report','123456787_1_11'),(525,'123456787_M_发电贡献_report_123456787_2_11','123456787_M_发电贡献_report','123456787_2_11'),(526,'123456787_M_发电贡献_report_123456787_3_11','123456787_M_发电贡献_report','123456787_3_11'),(527,'123456787_M_发电贡献_report_123456787_4_11','123456787_M_发电贡献_report','123456787_4_11'),(528,'123456787_M_发电贡献_report_123456787_5_11','123456787_M_发电贡献_report','123456787_5_11'),(529,'123456787_M_发电贡献_report_123456787_6_11','123456787_M_发电贡献_report','123456787_6_11'),(532,'123456789_中心配电室总功率趋势曲线图_trend_123456789_1_1','123456789_中心配电室总功率趋势曲线图_trend','123456789_1_1'),(533,'123456789_中心配电室总功率趋势曲线图_trend_123456789_2_3','123456789_中心配电室总功率趋势曲线图_trend','123456789_2_3'),(534,'123456789_中心配电室日报表_report_123456789_1_1','123456789_中心配电室日报表_report','123456789_1_1'),(548,'123456789_newtest_trend_123456789_0_2','123456789_newtest_trend','123456789_0_2'),(549,'123456789_newtest_trend_123456789_1_2','123456789_newtest_trend','123456789_1_2'),(555,'123456789_用电功率_report_123456789_2_2','123456789_用电功率_report','123456789_2_2'),(556,'123456789_用电功率_report_123456789_3_1','123456789_用电功率_report','123456789_3_1'),(560,'123456789_xxx趋势分析_trend_123456789_2_2','123456789_xxx趋势分析_trend','123456789_2_2'),(561,'123456789_xxx趋势分析_trend_123456789_1_2','123456789_xxx趋势分析_trend','123456789_1_2'),(562,'123456789_xxx趋势分析_trend_123456789_4_1','123456789_xxx趋势分析_trend','123456789_4_1'),(563,'123456789_new趋势分析_trend_123456789_1_1','123456789_new趋势分析_trend','123456789_1_1'),(564,'123456789_new趋势分析_trend_123456789_1_2','123456789_new趋势分析_trend','123456789_1_2'),(565,'123456789_业务报表1_report_123456789_1_1','123456789_业务报表1_report','123456789_1_1'),(566,'123456789_业务报表1_report_123456789_1_2','123456789_业务报表1_report','123456789_1_2'),(567,'123456789_业务报表1_report_123456789_1_3','123456789_业务报表1_report','123456789_1_3'),(568,'123456789_业务报表1_report_123456789_3_1','123456789_业务报表1_report','123456789_3_1'),(569,'123456789_业务报表1_report_123456789_6_1','123456789_业务报表1_report','123456789_6_1'),(580,'123456789_发电功率_report_123456789_1_2','123456789_发电功率_report','123456789_1_2'),(581,'123456789_发电功率_report_123456789_2_1','123456789_发电功率_report','123456789_2_1'),(584,'zdyt_设备1报表_report_zdyt001_Ua','zdyt_设备1报表_report','zdyt001_Ua'),(585,'zdyt_设备1报表_report_zdyt001_Ia','zdyt_设备1报表_report','zdyt001_Ia'),(586,'zdyt_设备1报表_report_zdyt001_P','zdyt_设备1报表_report','zdyt001_P'),(587,'zdyt_设备1电压电流功率_trend_zdyt001_Ua','zdyt_设备1电压电流功率_trend','zdyt001_Ua'),(588,'zdyt_设备1电压电流功率_trend_zdyt001_Ia','zdyt_设备1电压电流功率_trend','zdyt001_Ia'),(589,'zdyt_设备1电压电流功率_trend_zdyt001_P','zdyt_设备1电压电流功率_trend','zdyt001_P');
/*!40000 ALTER TABLE `var_group_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lhs_cloud_03'
--

--
-- Dumping routines for database 'lhs_cloud_03'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-31  9:01:07
