-- MySQL dump 10.13  Distrib 5.5.30, for Win64 (x86)
--
-- Host: localhost    Database: bewell
-- ------------------------------------------------------
-- Server version	5.5.30-log

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
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(64) DEFAULT NULL,
  `text` varchar(1024) DEFAULT NULL,
  `picture` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Table to back citations block on main page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
INSERT INTO `citations` VALUES (1,'Ги де Мопассан','свою деятельность доктор Бонвиль начал с рекламной брошюры, в первых строках которой в пышных и трескучих фразах расхваливал красоты Анваля','pic2.jpg'),(2,'Исократ','Математика есть гимнастика ума и приготовление к философии.','Isokrat.jpg'),(3,'Федор Михайлович Достоевский','… Соприкосновение с природой есть самое последнее слово всякого прогресса, науки, рассудка, здравого смысла, вкуса и отличной манеры.','dost.jpg'),(4,'Михаил Булгаков','Счастье как здоровье: когда оно налицо, его не замечаешь.','bulgakov.jpg'),(5,'Бьерн Страуструп','Мир просто слишком велик, чтобы универсальные стандарты были реалистичны, или чтобы они действительно стали основной целью всех компонент и инструментов.','Stroustrup.png');
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-11  7:39:39
