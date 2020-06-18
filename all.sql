CREATE DATABASE  IF NOT EXISTS `fjnu_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fjnu_inventory`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fjnu_inventory
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `custom`
--

DROP TABLE IF EXISTS `custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `custom` (
  `cusid` int(25) NOT NULL,
  `cusname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emali` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cusid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom`
--

LOCK TABLES `custom` WRITE;
/*!40000 ALTER TABLE `custom` DISABLE KEYS */;
INSERT INTO `custom` VALUES (1,'数学与信息学院学生部','13354682145','詹姆斯·邦德','南门','MCS@fjnu.edu.cn'),(2,'随园餐厅负责人','13385982130','强森','南区',NULL),(3,'行政楼管理员','13659870913','admin','东门','fjnu@edu.cn'),(4,'负责人','15259809972','爱莉杏菜','南区',NULL),(5,'兰苑7-8号楼阿姨','13459870913','测试','南区',''),(6,'测试','10086','朱静雯','南区','sonetto@foxmail.com');
/*!40000 ALTER TABLE `custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export`
--

DROP TABLE IF EXISTS `export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `export` (
  `inid` int(8) NOT NULL AUTO_INCREMENT,
  `proid` int(8) NOT NULL,
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(25) DEFAULT NULL,
  `indate` date DEFAULT NULL,
  `retdate` date DEFAULT NULL,
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`inid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export`
--

LOCK TABLES `export` WRITE;
/*!40000 ALTER TABLE `export` DISABLE KEYS */;
INSERT INTO `export` VALUES (100,1,'铅笔盒',20,'2020-06-01','2020-06-01','詹姆斯·邦德',''),(101,2,'茶具',10,'2020-06-02','2020-06-02','强森',''),(102,3,'杯子',1,'2020-06-03','2020-06-03','爱莉杏菜',''),(103,4,'无糖可口可乐',2,'2020-06-04','2020-06-04','朱静雯',''),(104,5,'糯玉米',2,'2020-06-05','2020-06-05','爱莉杏菜',''),(105,6,'被单',1,'2020-06-05','2020-06-05','爱莉杏菜',''),(106,10,'Razer无线鼠标',1,'2020-06-06','2020-06-06','爱莉杏菜',''),(107,11,'Cherry青轴键盘',1,'2020-06-06','2020-06-06','admin',''),(108,12,'衣架',10,'2020-06-06','2020-06-06','admin','');
/*!40000 ALTER TABLE `export` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `th` AFTER INSERT ON `export` FOR EACH ROW BEGIN
UPDATE kcxx set num=num-new.num where proid=new.proid;
end */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `xgth` AFTER UPDATE ON `export` FOR EACH ROW BEGIN
update kcxx set num=num+old.num-new.num where proid=new.proid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kcxx`
--

DROP TABLE IF EXISTS `kcxx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kcxx` (
  `proid` int(25) NOT NULL,
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(25) DEFAULT NULL,
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`proid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kcxx`
--

LOCK TABLES `kcxx` WRITE;
/*!40000 ALTER TABLE `kcxx` DISABLE KEYS */;
INSERT INTO `kcxx` VALUES (1,'铅笔盒',480,'福建师范大学附中六一节统一采购'),(2,'茶具',40,'成功人士必备'),(3,'杯子',19,NULL),(4,'无糖可口可乐',998,'朱静雯最爱的饮料'),(5,'糯玉米',18,'隔壁小孩都馋哭了'),(6,'被单',39,'啥颜色都有'),(7,'窗帘',0,'暂时没有库存'),(8,'电风扇',0,'卖得太好了'),(9,'六神花露水',-3,'隔壁老张说让我再批发三瓶'),(10,'Razer无线鼠标',49,'偶尔进点高端的'),(11,'Cherry青轴键盘',1,'自己用不起'),(12,'衣架',56,'IKEA同款，义乌批发'),(13,'Air Jordan 1',1,'杨梦琳拜托我帮她卖了'),(14,'任天堂Switch',20,'任天堂，永远滴神'),(15,'动物森友会',5,'懂的都懂，不仅好玩，卡带还好吃噢！'),(16,'赛博朋克2077抢先版',1,'全世界仅此一份，仅在学霸超市'),(17,'朱静雯亲笔签名',5,''),(18,'Black Pink正规1辑',88,'in your area.');
/*!40000 ALTER TABLE `kcxx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `proid` int(25) NOT NULL AUTO_INCREMENT,
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(25,3) NOT NULL,
  `inprice` double(25,3) DEFAULT NULL,
  `prodate` date DEFAULT NULL,
  `reledate` date DEFAULT NULL,
  `supname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `protype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `unit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`proid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8556505 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'铅笔盒',10.000,5.000,'2020-04-11','2020-04-11',NULL,NULL,NULL,NULL),(2,'茶具',100.000,50.000,NULL,NULL,NULL,'套',NULL,''),(3,'杯子',15.000,10.000,NULL,NULL,NULL,'个',NULL,NULL),(4,'无糖可口可乐',3.000,2.500,NULL,NULL,NULL,'罐',NULL,NULL),(5,'糯玉米',5.000,1.500,NULL,NULL,NULL,'根',NULL,NULL),(6,'被单',150.000,40.000,NULL,NULL,NULL,'套',NULL,NULL),(7,'窗帘',300.000,100.000,NULL,NULL,NULL,'件',NULL,NULL),(8,'电风扇',50.000,20.000,NULL,NULL,NULL,'台',NULL,NULL),(9,'六神花露水',10.500,3.000,NULL,NULL,NULL,'瓶',NULL,NULL),(10,'Razer无线鼠标',300.000,200.000,NULL,NULL,NULL,'个',NULL,NULL),(11,'Cherry青轴键盘',1000.000,500.000,NULL,NULL,NULL,'个',NULL,NULL),(12,'衣架',2.000,1.000,NULL,NULL,NULL,'个',NULL,NULL),(13,'Air Jordan 1',1500.000,1000.000,NULL,NULL,NULL,'双',NULL,NULL),(14,'任天堂Switch',3000.000,2500.000,NULL,NULL,NULL,'台',NULL,NULL),(15,'动物森友会',800.000,500.000,NULL,NULL,NULL,'盒',NULL,NULL),(16,'赛博朋克2077抢先版',10000.000,200.000,NULL,NULL,NULL,'盒',NULL,NULL),(17,'朱静雯亲笔签名',1.500,1.000,NULL,NULL,NULL,'张',NULL,NULL),(18,'Black Pink正规1辑',150.000,100.000,NULL,NULL,NULL,'盒',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase` (
  `inid` int(7) NOT NULL AUTO_INCREMENT,
  `proid` int(7) NOT NULL,
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(25) unsigned DEFAULT '100',
  `indate` date DEFAULT NULL,
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`inid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (17,7,'窗帘',10,'2020-06-09','詹姆斯·邦德'),(18,8,'电风扇',10,'2020-06-09','admin'),(19,9,'六神花露水',100,'2020-06-09','朱静雯'),(20,17,'朱静雯亲笔签名',55,'2020-06-13','朱静雯'),(21,18,'Black Pink正规1辑',47,'2020-06-13','朱静雯'),(22,5,'糯玉米',10,'2020-06-13','admin');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `xgjhxx` AFTER UPDATE ON `purchase` FOR EACH ROW begin
UPDATE kcxx set num=num+new.num-old.num where proid=new.proid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `staffid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staffname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stafftype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`staffid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('1','詹姆斯·邦德','','男','13354682145','特工','007'),('2','强森','4141854474715841414','男','13385982130','普通员工',''),('3','爱莉杏菜','','女','13659870913','普通员工','123'),('4','朱静雯','4441154414141414141','女','15259809972','软件研发人员','123'),('5','admin','224785112547784147','无','13459870913','管理员',''),('6','测试','','无','10086','测试','123');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `protypeid` int(25) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`protypeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'个'),(2,'套'),(3,'罐'),(4,'根'),(5,'套'),(6,'件'),(7,'台'),(8,'瓶'),(9,'双'),(10,'盒'),(11,'张');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `xglb` AFTER UPDATE ON `type` FOR EACH ROW begin
update product set protype=new.typename where protype=old.typename;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'fjnu_inventory'
--

--
-- Dumping routines for database 'fjnu_inventory'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18 14:02:24
