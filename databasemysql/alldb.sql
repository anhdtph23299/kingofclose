-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: training
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'LV'),(2,'Apple'),(3,'Dell'),(4,'HP');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cate_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'CG1','Máy tính'),(2,'CG2','Túi Xách');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subcate_id` bigint NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `origin_price` double DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcate_id` (`subcate_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`subcate_id`) REFERENCES `sub_category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Dell Vostro 3500','Black',12,100000,3000000,'Bảo hành 2 năm',1),(2,3,'Máy tính asus gamming 1220','Red',5,120000,2400000,'Hí hí 3',1),(17,3,'Bánh mì','Blue',2,60000,50000,'Bảo hành 2 năm',1),(18,2,'Bánh kẹo','Red',4,6,20,'Bảo hành 2 năm',1),(19,2,'New Product','Black',123,123,321,'Bảo hành 2 năm',1),(22,2,'Test new Product','123',45,3,12,'Description',1),(23,2,'Product23','Red',4,40000,50000,'123',1),(27,1,'Product24','Red',0,0,0,'123',1),(37,2,'new Product abc 1','123',12,2222,33333,'Abc',1),(38,1,'ád','ád',0,0,0,'ád',1),(45,1,'Test thêm','123',123,1231,23,'123',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `product_id` bigint NOT NULL,
  `brand_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`,`brand_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_brand_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_brand_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (1,1),(2,1),(17,1),(18,1),(45,1),(38,2),(23,3),(27,3),(19,4),(22,4),(37,4);
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Còn hàng'),(2,'Hết hàng');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sub_cate_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_cate_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cate_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'SC1','Laptop',1),(2,'SC2','Máy tính để bàn',1),(3,'SC3','Túi xách đeo',2);
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'training'
--

--
-- Dumping routines for database 'training'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 19:01:40
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tooldetailproject
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `pass_work` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `framework`
--

DROP TABLE IF EXISTS `framework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `framework` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `framework_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `framework`
--

LOCK TABLES `framework` WRITE;
/*!40000 ALTER TABLE `framework` DISABLE KEYS */;
INSERT INTO `framework` VALUES (1,'Framework new 1'),(2,'Hibernate'),(3,'JPA'),(4,'Springboot');
/*!40000 ALTER TABLE `framework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frameworkproject`
--

DROP TABLE IF EXISTS `frameworkproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frameworkproject` (
  `id_framework` bigint NOT NULL,
  `id_project` bigint NOT NULL,
  PRIMARY KEY (`id_framework`,`id_project`),
  KEY `id_project` (`id_project`),
  CONSTRAINT `frameworkproject_ibfk_1` FOREIGN KEY (`id_framework`) REFERENCES `framework` (`id`),
  CONSTRAINT `frameworkproject_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frameworkproject`
--

LOCK TABLES `frameworkproject` WRITE;
/*!40000 ALTER TABLE `frameworkproject` DISABLE KEYS */;
INSERT INTO `frameworkproject` VALUES (2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `frameworkproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ide`
--

DROP TABLE IF EXISTS `ide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ide` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ide_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ide`
--

LOCK TABLES `ide` WRITE;
/*!40000 ALTER TABLE `ide` DISABLE KEYS */;
INSERT INTO `ide` VALUES (1,'IntelJi'),(2,'MySQL');
/*!40000 ALTER TABLE `ide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideproject`
--

DROP TABLE IF EXISTS `ideproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ideproject` (
  `id_project` bigint NOT NULL,
  `id_ide` bigint NOT NULL,
  PRIMARY KEY (`id_project`,`id_ide`),
  KEY `id_ide` (`id_ide`),
  CONSTRAINT `ideproject_ibfk_1` FOREIGN KEY (`id_ide`) REFERENCES `ide` (`id`),
  CONSTRAINT `ideproject_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideproject`
--

LOCK TABLES `ideproject` WRITE;
/*!40000 ALTER TABLE `ideproject` DISABLE KEYS */;
INSERT INTO `ideproject` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `ideproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_code` varchar(15) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'anhdtph23299','Đinh Tuấn Anh'),(2,'danhnp','Phan Ngọc Danh');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date DEFAULT NULL,
  `images` longblob,
  `Description` varchar(255) NOT NULL,
  `id_account` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_account` (`id_account`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Detail Project','Done','2023-05-04',NULL,NULL,'Hello world',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmember`
--

DROP TABLE IF EXISTS `projectmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectmember` (
  `id_project` bigint NOT NULL,
  `id_member` bigint NOT NULL,
  `id_role` bigint NOT NULL,
  `start_join` date DEFAULT NULL,
  `Task` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_project`,`id_member`,`id_role`),
  KEY `id_member` (`id_member`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `projectmember_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`),
  CONSTRAINT `projectmember_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`),
  CONSTRAINT `projectmember_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmember`
--

LOCK TABLES `projectmember` WRITE;
/*!40000 ALTER TABLE `projectmember` DISABLE KEYS */;
INSERT INTO `projectmember` VALUES (1,1,1,'2023-04-30','- Phụ trách tạo git, giao diện detail project,Mapping orm'),(1,2,2,'2023-04-30','- Phụ trách dạy kiến thức mới , làm giao diện hiển thị card project của xưởng');
/*!40000 ALTER TABLE `projectmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Leader Team','Scrum Team '),(2,'Team dev','Là thành viên team team'),(3,'Tester','Thành viên kiểm thử');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'Trello'),(2,'Zalo'),(3,'Meet');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toolproject`
--

DROP TABLE IF EXISTS `toolproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toolproject` (
  `id_project` bigint NOT NULL,
  `id_tool` bigint NOT NULL,
  PRIMARY KEY (`id_project`,`id_tool`),
  KEY `id_tool` (`id_tool`),
  CONSTRAINT `toolproject_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`),
  CONSTRAINT `toolproject_ibfk_2` FOREIGN KEY (`id_tool`) REFERENCES `tool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toolproject`
--

LOCK TABLES `toolproject` WRITE;
/*!40000 ALTER TABLE `toolproject` DISABLE KEYS */;
INSERT INTO `toolproject` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `toolproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tooldetailproject'
--

--
-- Dumping routines for database 'tooldetailproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 19:01:40
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: productattribute
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bienthe`
--

DROP TABLE IF EXISTS `bienthe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bienthe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `gia` double DEFAULT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `sanphamid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe6mc0hwj8n1bdf7c73qdaso5u` (`sanphamid`),
  CONSTRAINT `FKe6mc0hwj8n1bdf7c73qdaso5u` FOREIGN KEY (`sanphamid`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienthe`
--

LOCK TABLES `bienthe` WRITE;
/*!40000 ALTER TABLE `bienthe` DISABLE KEYS */;
INSERT INTO `bienthe` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,34900,NULL,'Trắng,M [ < 1m55 / 45 kg]',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7833472959.jpg','Trắng,L [ < 1m6 / 55 kg]',1),(3,NULL,NULL,NULL,NULL,NULL,NULL,39000,NULL,'Đen,M [ < 1m55 / 45 kg]',1),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2747834138.jpg','Đen,L [ < 1m6 / 55 kg]',1),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trắng,S(29kg-35kg)',3),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3510310781093.jpg','Trắng,M(36kg-44kg)',3),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trắng,L(45kg-53kg)',3),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trắng,XL(54kg-64kg)',3),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đen,S(29kg-35kg)',3),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đen,M(36kg-44kg)',3),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'645221047102.jpg','Đen,L(45kg-53kg)',3),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đen,XL(54kg-64kg)',3),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'S',4),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M',4),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'99210914835.jpg','Sheep GLASS Đen,M (Dưới 46kg)',5),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Đen,L (46-65kg)',5),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Đen,XL(65-75kg)',5),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Trắng,M (Dưới 46kg)',5),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Trắng,L (46-65kg)',5),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3396319945.jpg','Sheep GLASS Trắng,XL(65-75kg)',5),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Đen,M (Dưới 46kg)',5),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Đen,L (46-65kg)',5),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2622858128.jpg','CD Cáo Đen,XL(65-75kg)',5),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Đen,M (Dưới 46kg)',5),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Đen,L (46-65kg)',5),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'71094442254.jpg','CD Thỏ Đen,XL(65-75kg)',5),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Trắng,M (Dưới 46kg)',5),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Trắng,L (46-65kg)',5),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'842210915310.jpg','CD Cáo Trắng,XL(65-75kg)',5),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Trắng,M (Dưới 46kg)',5),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Trắng,L (46-65kg)',5),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10663638889.jpg','CD Thỏ Trắng,XL(65-75kg)',5),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10515851296.jpg','Grey,S',6),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10525658284.jpg','White,S',6),(39,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'XXL,Bả trầu,Chạy bộ',7),(40,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'XS,Bả trầu,Chạy bộ',7);
/*!40000 ALTER TABLE `bienthe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bienthe_saukhi_insert` AFTER INSERT ON `bienthe` FOR EACH ROW BEGIN
	INSERT INTO giatrithuoctinhbienthe (bientheid, giatrithuoctinhid) (SELECT 
						bienthe.id AS bientheid, 
						giatrithuoctinh.id AS giatrithuoctinhid
					FROM bienthe, giatrithuoctinh
					WHERE 
						bienthe.id = NEW.id
						AND giatrithuoctinh.sanphamid = NEW.sanphamid
						AND FIND_IN_SET(giatrithuoctinh.giatri, NEW.ten));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `isshowhomepage` int DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `danhmuccha` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sulfov08aud7rmuh75nxqn4fj` (`slug`),
  KEY `FK26doqfh3lvxagh2o3mdurcs6v` (`danhmuccha`),
  CONSTRAINT `FK26doqfh3lvxagh2o3mdurcs6v` FOREIGN KEY (`danhmuccha`) REFERENCES `danhmuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` VALUES (1,NULL,NULL,NULL,NULL,1,1,NULL,'thoi-trang-tre-em','Thời trang trẻ em',NULL),(2,NULL,NULL,NULL,NULL,1,1,NULL,'thoi-trang-nam','Thời trang nam',NULL),(3,NULL,NULL,NULL,NULL,1,1,NULL,'thoi-trang-nu','Thời trang nữ',NULL);
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giatrithuoctinh`
--

DROP TABLE IF EXISTS `giatrithuoctinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giatrithuoctinh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `giatri` varchar(255) DEFAULT NULL,
  `sanphamid` bigint DEFAULT NULL,
  `thuoctinhid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10amq6k9hc2m208xv419hvk3d` (`sanphamid`),
  KEY `FKkwmi83d9i2cg9j6l61sw00w73` (`thuoctinhid`),
  CONSTRAINT `FK10amq6k9hc2m208xv419hvk3d` FOREIGN KEY (`sanphamid`) REFERENCES `sanpham` (`id`),
  CONSTRAINT `FKkwmi83d9i2cg9j6l61sw00w73` FOREIGN KEY (`thuoctinhid`) REFERENCES `thuoctinh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giatrithuoctinh`
--

LOCK TABLES `giatrithuoctinh` WRITE;
/*!40000 ALTER TABLE `giatrithuoctinh` DISABLE KEYS */;
INSERT INTO `giatrithuoctinh` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'Trắng',1,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,'Đen',1,1),(3,NULL,NULL,NULL,NULL,NULL,NULL,'M [ < 1m55 / 45 kg]',1,2),(4,NULL,NULL,NULL,NULL,NULL,NULL,'L [ < 1m6 / 55 kg]',1,2),(7,NULL,NULL,NULL,NULL,NULL,NULL,'Trắng',3,5),(8,NULL,NULL,NULL,NULL,NULL,NULL,'Đen',3,5),(9,NULL,NULL,NULL,NULL,NULL,NULL,'S(29kg-35kg)',3,6),(10,NULL,NULL,NULL,NULL,NULL,NULL,'M(36kg-44kg)',3,6),(11,NULL,NULL,NULL,NULL,NULL,NULL,'L(45kg-53kg)',3,6),(12,NULL,NULL,NULL,NULL,NULL,NULL,'XL(54kg-64kg)',3,6),(13,NULL,NULL,NULL,NULL,NULL,NULL,'S',4,7),(14,NULL,NULL,NULL,NULL,NULL,NULL,'M',4,7),(15,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Đen',5,8),(16,NULL,NULL,NULL,NULL,NULL,NULL,'Sheep GLASS Trắng',5,8),(17,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Đen',5,8),(18,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Đen',5,8),(19,NULL,NULL,NULL,NULL,NULL,NULL,'CD Cáo Trắng',5,8),(20,NULL,NULL,NULL,NULL,NULL,NULL,'CD Thỏ Trắng',5,8),(21,NULL,NULL,NULL,NULL,NULL,NULL,'M (Dưới 46kg)',5,9),(22,NULL,NULL,NULL,NULL,NULL,NULL,'L (46-65kg)',5,9),(23,NULL,NULL,NULL,NULL,NULL,NULL,'XL(65-75kg)',5,9),(24,NULL,NULL,NULL,NULL,NULL,NULL,'Grey',6,10),(25,NULL,NULL,NULL,NULL,NULL,NULL,'White',6,10),(26,NULL,NULL,NULL,NULL,NULL,NULL,'S',6,11),(27,NULL,NULL,NULL,NULL,1,1,'XXL',7,12),(28,NULL,NULL,NULL,NULL,1,1,'XS',7,12),(29,NULL,NULL,NULL,NULL,1,1,'Bả trầu',7,13),(30,NULL,NULL,NULL,NULL,1,1,'Chạy bộ',7,14);
/*!40000 ALTER TABLE `giatrithuoctinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giatrithuoctinhbienthe`
--

DROP TABLE IF EXISTS `giatrithuoctinhbienthe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giatrithuoctinhbienthe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `bientheid` bigint DEFAULT NULL,
  `giatrithuoctinhid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2wm4po04p6lg0qul6ypmrmuti` (`bientheid`),
  KEY `FK9ge8pwyfw1ypjrj5sn1vysqnc` (`giatrithuoctinhid`),
  CONSTRAINT `FK2wm4po04p6lg0qul6ypmrmuti` FOREIGN KEY (`bientheid`) REFERENCES `bienthe` (`id`),
  CONSTRAINT `FK9ge8pwyfw1ypjrj5sn1vysqnc` FOREIGN KEY (`giatrithuoctinhid`) REFERENCES `giatrithuoctinh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giatrithuoctinhbienthe`
--

LOCK TABLES `giatrithuoctinhbienthe` WRITE;
/*!40000 ALTER TABLE `giatrithuoctinhbienthe` DISABLE KEYS */;
INSERT INTO `giatrithuoctinhbienthe` VALUES (1,NULL,NULL,NULL,NULL,1,1,1,1),(2,NULL,NULL,NULL,NULL,1,1,1,3),(4,NULL,NULL,NULL,NULL,1,1,2,1),(5,NULL,NULL,NULL,NULL,1,1,2,4),(7,NULL,NULL,NULL,NULL,1,1,3,2),(8,NULL,NULL,NULL,NULL,1,1,3,3),(10,NULL,NULL,NULL,NULL,1,1,4,2),(11,NULL,NULL,NULL,NULL,1,1,4,4),(15,NULL,NULL,NULL,NULL,1,1,7,7),(16,NULL,NULL,NULL,NULL,1,1,7,9),(18,NULL,NULL,NULL,NULL,1,1,8,7),(19,NULL,NULL,NULL,NULL,1,1,8,10),(21,NULL,NULL,NULL,NULL,1,1,9,7),(22,NULL,NULL,NULL,NULL,1,1,9,11),(24,NULL,NULL,NULL,NULL,1,1,10,7),(25,NULL,NULL,NULL,NULL,1,1,10,12),(27,NULL,NULL,NULL,NULL,1,1,11,8),(28,NULL,NULL,NULL,NULL,1,1,11,9),(30,NULL,NULL,NULL,NULL,1,1,12,8),(31,NULL,NULL,NULL,NULL,1,1,12,10),(33,NULL,NULL,NULL,NULL,1,1,13,8),(34,NULL,NULL,NULL,NULL,1,1,13,11),(36,NULL,NULL,NULL,NULL,1,1,14,8),(37,NULL,NULL,NULL,NULL,1,1,14,12),(39,NULL,NULL,NULL,NULL,1,1,15,13),(40,NULL,NULL,NULL,NULL,1,1,16,14),(41,NULL,NULL,NULL,NULL,1,1,17,15),(42,NULL,NULL,NULL,NULL,1,1,17,21),(44,NULL,NULL,NULL,NULL,1,1,18,15),(45,NULL,NULL,NULL,NULL,1,1,18,22),(47,NULL,NULL,NULL,NULL,1,1,19,15),(48,NULL,NULL,NULL,NULL,1,1,19,23),(50,NULL,NULL,NULL,NULL,1,1,20,16),(51,NULL,NULL,NULL,NULL,1,1,20,21),(53,NULL,NULL,NULL,NULL,1,1,21,16),(54,NULL,NULL,NULL,NULL,1,1,21,22),(56,NULL,NULL,NULL,NULL,1,1,22,16),(57,NULL,NULL,NULL,NULL,1,1,22,23),(59,NULL,NULL,NULL,NULL,1,1,23,17),(60,NULL,NULL,NULL,NULL,1,1,23,21),(62,NULL,NULL,NULL,NULL,1,1,24,17),(63,NULL,NULL,NULL,NULL,1,1,24,22),(65,NULL,NULL,NULL,NULL,1,1,25,17),(66,NULL,NULL,NULL,NULL,1,1,25,23),(68,NULL,NULL,NULL,NULL,1,1,26,18),(69,NULL,NULL,NULL,NULL,1,1,26,21),(71,NULL,NULL,NULL,NULL,1,1,27,18),(72,NULL,NULL,NULL,NULL,1,1,27,22),(74,NULL,NULL,NULL,NULL,1,1,28,18),(75,NULL,NULL,NULL,NULL,1,1,28,23),(77,NULL,NULL,NULL,NULL,1,1,29,19),(78,NULL,NULL,NULL,NULL,1,1,29,21),(80,NULL,NULL,NULL,NULL,1,1,30,19),(81,NULL,NULL,NULL,NULL,1,1,30,22),(83,NULL,NULL,NULL,NULL,1,1,31,19),(84,NULL,NULL,NULL,NULL,1,1,31,23),(86,NULL,NULL,NULL,NULL,1,1,32,20),(87,NULL,NULL,NULL,NULL,1,1,32,21),(89,NULL,NULL,NULL,NULL,1,1,33,20),(90,NULL,NULL,NULL,NULL,1,1,33,22),(92,NULL,NULL,NULL,NULL,1,1,34,20),(93,NULL,NULL,NULL,NULL,1,1,34,23),(95,NULL,NULL,NULL,NULL,1,1,35,24),(96,NULL,NULL,NULL,NULL,1,1,35,26),(98,NULL,NULL,NULL,NULL,1,1,36,25),(99,NULL,NULL,NULL,NULL,1,1,36,26),(107,NULL,NULL,NULL,NULL,1,1,39,27),(108,NULL,NULL,NULL,NULL,1,1,39,29),(109,NULL,NULL,NULL,NULL,1,1,39,30),(110,NULL,NULL,NULL,NULL,1,1,40,28),(111,NULL,NULL,NULL,NULL,1,1,40,29),(112,NULL,NULL,NULL,NULL,1,1,40,30);
/*!40000 ALTER TABLE `giatrithuoctinhbienthe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `cccd` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gioitinh` bit(1) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `matkhau` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `ngaydangky` datetime DEFAULT NULL,
  `ngaysinh` datetime DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `tenkh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'thanhdn1234','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,NULL,NULL,NULL,'Đặng Ngọc Thanh');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `cccd` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gioitinh` bit(1) DEFAULT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `manv` varchar(255) DEFAULT NULL,
  `matkhau` varchar(255) DEFAULT NULL,
  `ngaycap` datetime DEFAULT NULL,
  `ngaysinh` datetime DEFAULT NULL,
  `noicap` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `tennv` varchar(255) DEFAULT NULL,
  `idchucvu` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdnln0piv4a38v23mqcbqmnii8` (`idchucvu`),
  CONSTRAINT `FKdnln0piv4a38v23mqcbqmnii8` FOREIGN KEY (`idchucvu`) REFERENCES `chucvu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,NULL,NULL,NULL,'Nguyễn Văn A',1),(2,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,NULL,NULL,NULL,'Admin',2);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `chitietsanpham` text,
  `gia` double NOT NULL,
  `isbestseller` int DEFAULT NULL,
  `ismostviewed` int DEFAULT NULL,
  `isnew` int DEFAULT NULL,
  `ispopular` int DEFAULT NULL,
  `motasanpham` text,
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) NOT NULL,
  `danhmucid` bigint DEFAULT NULL,
  `thuonghieuid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mucuvhos7dm6xtbpt6l03201w` (`slug`),
  KEY `FKiuqwat8x5gmalwsb6jemcombd` (`danhmucid`),
  KEY `FKm6q7u4wfeoeomtuce5nc5e3bl` (`thuonghieuid`),
  CONSTRAINT `FKiuqwat8x5gmalwsb6jemcombd` FOREIGN KEY (`danhmucid`) REFERENCES `danhmuc` (`id`),
  CONSTRAINT `FKm6q7u4wfeoeomtuce5nc5e3bl` FOREIGN KEY (`thuonghieuid`) REFERENCES `thuonghieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'',38000,NULL,NULL,NULL,NULL,'<p>Áo Polo Form Rộng Tay Lỡ CRHSUR THÔNG TIN SẢN PHẨM: - Tên sản phẩm: Áo Polo Form Rộng Tay Lỡ CRHSUR - Màu sắc: Trắng - Đen - Xuất sứ: Việt Nam - Chất liệu: Cotton và Polyester. - FREE Size : 40-70kg =&gt; Áo thun tay lỡ form rộng kiểu dáng sadboiz ngày nay đang trở nên phổ biến trong giới trẻ với sự đa dạng thiết kế kiểu dáng độc đáo bắt mắt, là sự lựa chọn không thể bỏ qua của áo thun nam, áo thun nữ, áo thun cặp đôi và áo thun hội nhóm =&gt; Áo thun Unisex form rộng là sự bứt phá ấn tượng trong thời trang dàng cho các bạn trẻ lựa chon áo thun nam và áo thun nữ thích thể hiện cả tính riêng, đậm chất tôi. =&gt; Áo thun cặp đôi, áo thun tình nhân mang phong cách hàn quốc, dễ thương, nhí nhảnh, hài hước, vui nhộn độc đáo về phong cách. =&gt; Mẫu Áo thun tay lỡ Unisex kiểu dáng sadboiz form rộng với sự đa dạng thiết kế, mẫu áo thun theo xu hướng hot trend, trẻ trung và năng động, phong cách thời thượng, đậm chất cá tính dành. Mặc làm áo thun cặp, áo thun nhóm và áo thun câu lạc bộ. --------------------------- Đặc điểm nổi bật của áo thun Unisex - Áo thun Unisex form rộng là áo thụn thích hợp cho cả nam và nữ, tạo sự thoải mái, dễ dàng phối với các loại quần khác nhau - Áo thun Unisex không phân biệt giới tính. Mặc làm áo thun tính nhân, áo thun nhóm. - Áo thun là sự kết Cotton và Polyester nên thoáng mát, co dãn, không nhăm, không xù, không hút bụi bẩn, và có khả năng hút mồ hôi khi vận động. --------------------------- Tại sao bạn nên chọn Trung_store99 + Chúng tôi luôn coi sự hài lòng của khách hàng là tiên chỉ phát triển của shop. Chúng tôi cam kết về CHẤT LƯỢNG của sản phẩm. + Tất cả các mặt hàng luôn có tại shop, giao hàng nhanh chóng. + Tất cả các sản phẩm của chúng tôi đều được bảo hành theo quy định của shop. + Đội ngũ nhân viên tư vấn luôn thường trực 24/7 để hỗ trợ bạn khắc phục khi có sự cố xảy ra. --------------------------- Mọi người cùng tìm kiếm : #ao #aoformrong #aoformrongnu #aonu #aonam #aophong #aophongformrong #aophongformrongnu #aosadboiz #aothun #aothunformrong #aothunformrongnu #aothunformrongtaylo #aothunnuformrong #aothuntaylo #aothununisex #aounisex #aounisexnu</p>\n','ao-polo-form-rong-tay-lo-crhsur','Áo Polo Form Rộng Tay Lỡ CRHSUR',2,1),(3,NULL,NULL,NULL,NULL,NULL,NULL,'',41000,NULL,NULL,NULL,NULL,'<p>Tên sản phẩm: Áo Phông Rộng Nam Nữ Tay Lỡ 1969Unisex Áo Thun Nam Cổ Tròn Giá Rẻ In Hình Cậu Bé</p>\n\n<p>Xuất xứ: Việt Nam.Cơ sở sản xuất: Hùng Vũ. Địa chỉ: Bình Thành, Bình Hưng Hòa B, Quận Bình Tân, Thành Phố Hồ Chí Minh</p>\n\n<p>- Sản phẩm là hàng áo tay lỡ</p>\n\n<p>- Cách thức đặt hàng:</p>\n\n<p>+ Các bạn chọn mẫu và chọn size áo sau đó bấm \"thêm vào giỏ hàng\", nếu mua nhiều sản phẩm khác nhau thì bấm thêm vào giỏ nhiều lần</p>\n\n<p>+ Vào giỏ hàng chọn hết tất cả các phân loại mới thêm vào giỏ rồi mua ngay, sau đó bấm chọn phần Shope e Voucher để được giảm giá ship. Sau đó bấm đặt hàng là xong, tránh tốn nhiều phí ship.</p>\n\n<p>+ Các bạn chú ý là khi mua đơn từ 50k sẽ được giảm 15k tiền ship, khi đơn từ 300k sẽ được giảm 70k tiền ship, trong phần Voucher của bạn sẽ có mã giảm phí ship do shope e gửi vào cho bạn hằng tháng ạ. Các bạn ủng hộ shop trên 50k thì phí ship sẽ được giảm nhé, chứ mua dưới 50k thì ở xa phí ship sẽ cao nhé ạ.</p>\n\n<p>- Giá cả cạnh tranh</p>\n\n<p>+ Shop là xưởng sản xuất trực tiếp tận gốc nên giá cả sẽ cạnh tranh, shop bán chủ yếu lấy lượt mua và đánh giá nên bán rất rẻ, các bạn mua xong nhờ đánh giá cho shop nha.</p>\n\n<p>&nbsp;</p>\n\n<p>- Áo Thun, Áo Phông Unisex tay lỡ là item không thể thiếu trong tủ đồ vì sự thoải mái, dễ chịu, lại rất dễ phối đồ.</p>\n\n<p>- Áo tay lỡ được làm bằng chất liệu co giãn, cực kì đẹp, vải rất mát, sờ mịn tay.</p>\n\n<p>- Áo thun tay lỡ unisex thích hợp với cả nam và nữ. Mặc làm áo thun cặp, áo nhóm rất phù hợp.</p>\n\n<p>- Áo thun tay lỡ form rộng dễ dàng phối đồ, thời trang phong cách Hàn Quốc.</p>\n\n<p>- Hàng sản xuất tại xưởng, đảm bảo chất lượng.</p>\n\n<p>- Chất liệu: thun co giãn, vải mềm, vải mịn, thoáng mát.</p>\n\n<p>- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.</p>\n\n<p>- Phù hợp phối nhiều màu.</p>\n\n<p>- Thiết kế trẻ trung, năng động.</p>\n\n<p>&nbsp;</p>\n\n<p>----------------------------------------------</p>\n\n<p>&nbsp;</p>\n\n<p>THÔNG SỐ CHỌN SIZE ÁO THUN UNISEX: gồm 6 size:</p>\n\n<p>1.Size XS: dưới 1m30 (dưới 28kg)</p>\n\n<p>2. Size S: 1m31-1m41 (29-35kg)</p>\n\n<p>3. Size M: 1m42- 1m53 (36-44kg)</p>\n\n<p>4. Size L: 1m54- 1m60 (45-53kg)</p>\n\n<p>5. Size XL: 1m61- 1m69 (54-64kg)</p>\n\n<p>6. Size XXL: trên 1m70 (trên 65kg)</p>\n\n<p>&nbsp;</p>\n\n<p>----------------------------------------------</p>\n\n<p>&nbsp;</p>\n\n<p>CAM KẾT ĐẢM BẢO</p>\n\n<p>☑️Sản phẩm chất lượng.</p>\n\n<p>☑️Hoàn tiền nếu sản phẩm không giống với mô tả.</p>\n\n<p>☑️Hỗ trợ đổi trả theo quy định.</p>\n\n<p>&nbsp;</p>\n\n<p>ĐIỀU KIỆN ĐỔI TRẢ</p>\n\n<p>&nbsp;</p>\n\n<p>1.Điều kiện áp dụng</p>\n\n<p>☑️Trong vòng 5 ngày kể từ khi nhận sản phẩm.</p>\n\n<p>☑️Sản phẩm chưa qua sử dụng.</p>\n\n<p>☑️Sản phẩm bị lỗi hoặc hư hỏng do nhà sản xuất.</p>\n\n<p>&nbsp;</p>\n\n<p>2. Trường hợp đươc chấp nhận</p>\n\n<p>☑️Hàng không đúng mẫu, size, kiểu dáng.</p>\n\n<p>☑️Không đủ số lượng sản phẩm.</p>\n\n<p>&nbsp;</p>\n\n<p>3. Trường hợp không đủ điều kiện</p>\n\n<p>☑️Quá 5 ngày kể từ khi nhận hàng.</p>\n\n<p>☑️Sản phẩm gửi lại không phải của shop.</p>\n\n<p>☑️Lỗi không xuất phát từ shop và nhà sản xuất</p>\n\n<p>&nbsp;</p>\n\n<p>----------------------------------------------</p>\n\n<p>&nbsp;</p>\n\n<p>☑️HÀNG HÓA ĐƯỢC SẢN XUẤT TẠI VIỆT NAM</p>\n\n<p>&nbsp;</p>\n\n<p>#aothununisex #aothununisexnu #unisex #aothun #aounisex #aotaylo #aothuntaylo #thuntaylo #aophong #aophongunisex #aophongunisexformrong #thoitrangunisex #ao #aothununisexnamnu #aothununisexnam #aonam #aorong</p>\n','ao-phong-rong-nam-nu-tay-lo-1969unisex-ao-thun-nam-co-tron-gia-re-in-hinh-cau-be','Áo Phông Rộng Nam Nữ Tay Lỡ 1969Unisex Áo Thun Nam Cổ Tròn Giá Rẻ In Hình Cậu Bé',1,1),(4,NULL,NULL,NULL,NULL,NULL,NULL,'',29000,NULL,NULL,NULL,NULL,'<p>+GONZ TEE/ BLACK</p>\n\n<p>COLOR: BLACK</p>\n\n<p>MATERIAL: COTTON - Phiên bản chất vải thoáng mát, mềm mịn nhưng không bị nhăn hay xù.</p>\n\n<p>SIZE S : 40KG - 445KG</p>\n\n<p>SIZE M 45-50KG</p>\n\n<p>_________________________</p>\n\n<p>Form áo được Fit size theo form và tiêu chuẩn tương đối của người Việt Nam, nếu bạn đang cân nhắc giữa hai size, nên chọn size lớn hơn.</p>\n\n<p>+GONZ TEE/ BLACK</p>\n\n<p>COLOR: BLACK</p>\n\n<p>MATERIAL: COTTON - Phiên bản chất vải thoáng mát, mềm mịn nhưng không bị nhăn hay xù.</p>\n\n<p>SIZE S : 40KG - 445KG</p>\n\n<p>SIZE M 45-50KG</p>\n\n<p>_________________________</p>\n\n<p>Form áo được Fit size theo form và tiêu chuẩn tương đối của người Việt Nam, nếu bạn đang cân nhắc giữa hai size, nên chọn size lớn hơn.</p>\n','ao-thun-nu-body-mau-trang-phoi-den-gonzstudio-new','ÁO THUN NỮ BODY MÀU TRẮNG PHỐI ĐEN GONZSTUDIO NEW',1,1),(5,NULL,NULL,NULL,NULL,NULL,NULL,'',45000,1,1,1,1,'<p>THÔNG TIN SẢN PHẨM: • Áo phong tay lỡ nam nữ phom rộng, áo thun cotton unisex phong Hàn Quốc cách trẻ trung hot trend • Kiểu dáng: Unisex, Freesize, Tay lỡ, Form rộng • Xuất sứ: Việt Nam • Chất liệu: Poly , cotton co dãn, không xù • Họa tiết: In • Màu sắc: Đen, Trắng SIZE: M, L, XL: Unisex form rộng có 3 size phù hợp hầu hết mọi lứa tuổi: • Size M: Dài 67Cm, Rộng 51Cm, Dài tay áo 25Cm (Dưới 1m6, dưới 46Kg) • Size L: Dài 70Cm, Rộng 53Cm, Dài tay áo 25Cm (1m6 - 1m7, 46Kg - 65Kg) • Size XL: Dài 73Cm, Rộng 56Cm, Dài tay áo 25Cm (1m7 - 1m75, 66Kg - 75Kg) LOGI SHOP CAM KẾT: • Form dáng của sản phẩm đẹp chuẩn như hình. • Đảm bảo vải chất lượng Poly, cotton. • Tất cả các đơn hàng trước khi gửi đi đều được kiểm tra kĩ lưỡng, đóng gói cẩn thận. • Hàng có sẵn, giao hàng ngay khi nhận được đơn. • Giao hàng toàn quốc, nhận hàng thanh toán. • Hỗ trợ trả hàng trong 6 ngày (Từ khi nhận hàng) #áo_thun_nam #áo_thun_nữ #áo_phông_nam #áo_phông_nữ #ao_thun_nam #ao_thun_nữ #áo_phông_nam_giá_rẻ#áo_thun_trơn #áo_thun_nam_cao_cấp #áo_thun_form_rộng #áo_phông_giá_rẻ #áo_thun_nữ_đẹp #áo_thun nữ_form_rộng #áo_phông_nữ_giá_rẻ #áo_form_rộng_nam #ao_thun_nam_dep #ao_summer #áo_thun_summer</p>\n','ao-phong-tay-lo-nam-nu-phom-rong-ao-doi-gioi-tre-ao-thun-cotton-unisex-phong-han-quoc-cach-tre-trung-hot-trend','Áo phông tay lỡ nam nữ phom rộng, áo đôi giới trẻ, áo thun cotton unisex phong Hàn Quốc cách trẻ trung hot trend',1,2),(6,NULL,NULL,NULL,NULL,NULL,NULL,'',109000,1,1,NULL,NULL,'<p>[ Vui lòng chọn kích thước gần nhất với chiều cao của bạn \'trọng lượng \'</p>\n\n<p>&nbsp;</p>\n\n<p>S \' Dài 60cm , Ngực 94cm , Tay áo 26cm , Vai 48cm .</p>\n\n<p>&nbsp;</p>\n\n<p>M \' Dài 61cm , Ngực 98cm , Tay áo 27cm , Vai 49cm .</p>\n\n<p>&nbsp;</p>\n\n<p>Dài 62cm , Ngực 102cm , Tay áo 28cm , Vai 50cm .</p>\n\n<p>&nbsp;</p>\n\n<p>Xl \' Dài 63cm , Ngực 106cm , Tay áo 28,5cm , Vai 51cm .</p>\n\n<p>&nbsp;</p>\n\n<p>2xl \' Chiều dài 64cm , Ngực 108cm , Tay áo 29cm , Vai 52cm.</p>\n\n<p>&nbsp;</p>\n\n<p>Chiều dài 3XL \' 65cm , Ngực 112cm , Tay áo 29,5cm , Vai 53cm.</p>\n\n<p>&nbsp;</p>\n\n<p>4xl \' Chiều dài 66cm , Ngực 116cm , Tay áo 30cm , Vai 54cm .</p>\n\n<p>&nbsp;</p>\n\n<p>5xl \' Dài 67cm , Ngực 120cm , Tay áo 31cm , Vai 55cm .</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Kích thước do chính chúng tôi đo , đôi khi có một số sai sót , nhưng luôn trong vòng 3 cm . Xin lưu ý 1 cm \'0.39 inch,1 inch \'2.54 cm. Xin vui lòng liên hệ với chúng tôi khi tìm thấy khó khăn trong việc chọn kích thước. chúng tôi sẽ cung cấp cho bạn lựa chọn tốt nhất .</p>\n\n<p>&nbsp;</p>\n\n<p>Để biết các khuyến nghị về kích thước , vui lòng tham khảo hình ảnh cuối cùng . Nếu bạn không chắc chắn về kích thước mình đang mặc , bạn có thể nói về việc cung cấp chiều cao và cân nặng cho dịch vụ khách hàng và dịch vụ khách hàng sẽ tư vấn chuyên nghiệp cho bạn \'</p>\n\n<p>&nbsp;</p>\n\n<p>Mollge đã được kiểm tra chất lượng trước khi xuất xưởng . Nếu quần áo nhận được không được gửi đúng cách vấn đề về chất lượng , vui lòng liên hệ với chúng tôi càng sớm càng tốt để giúp bạn giải quyết . Cửa hàng này rất có trách nhiệm \'</p>\n\n<p>&nbsp;</p>\n\n<p>Vì lý do ánh sáng và cách hiển thị khác nhau , màu sắc có thể khác với hình ảnh. vui lòng tham khảo sản phẩm thực tế \' Hàng hóa trong cửa hàng là hàng bạn muốn thanh toán . Vui lòng không mua hàng giá rẻ với ý tưởng về quầy \'</p>\n\n<p>&nbsp;</p>\n\n<p>Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi , xin vui lòng cho chúng tôi một lời khuyên tốt . Nếu bạn không bị smdisfied , vui lòng liên hệ với chúng tôi qua Chat. Chúng tôi sẽ luôn onLine .</p>\n','ao-thun-mmiot-tay-lo-dang-rong-in-hoa-tiet-dau-lau-va-hoa-hong-phong-cach-duong-pho-thoi-trang-mua-he-cho-nam-va-nu','Áo thun MMIOT tay lỡ dáng rộng in họa tiết đầu lâu và hoa hồng phong cách đường phố thời trang mùa hè cho nam và nữ',2,1),(7,NULL,NULL,NULL,NULL,1,1,NULL,100000,NULL,NULL,NULL,NULL,NULL,'san-pham-test','Sản phẩm test',3,2);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanphamhinhanh`
--

DROP TABLE IF EXISTS `sanphamhinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanphamhinhanh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `hinhanh` varchar(255) DEFAULT NULL,
  `sanphamid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm4kdigswp92q0qpuv8ash0xw1` (`sanphamid`),
  CONSTRAINT `FKm4kdigswp92q0qpuv8ash0xw1` FOREIGN KEY (`sanphamid`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanphamhinhanh`
--

LOCK TABLES `sanphamhinhanh` WRITE;
/*!40000 ALTER TABLE `sanphamhinhanh` DISABLE KEYS */;
INSERT INTO `sanphamhinhanh` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'9108210610412.jpg',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,'36176741067.jpg',1),(3,NULL,NULL,NULL,NULL,NULL,NULL,'7833472959.jpg',1),(4,NULL,NULL,NULL,NULL,NULL,NULL,'2747834138.jpg',1),(5,NULL,NULL,NULL,NULL,NULL,NULL,'9298587146.jpg',3),(6,NULL,NULL,NULL,NULL,NULL,NULL,'713631011085.jpg',3),(7,NULL,NULL,NULL,NULL,NULL,NULL,'3510310781093.jpg',3),(8,NULL,NULL,NULL,NULL,NULL,NULL,'645221047102.jpg',3),(9,NULL,NULL,NULL,NULL,NULL,NULL,'75823510236.jpg',4),(10,NULL,NULL,NULL,NULL,NULL,NULL,'5727328719.jpg',4),(11,NULL,NULL,NULL,NULL,NULL,NULL,'4927892361.jpg',5),(12,NULL,NULL,NULL,NULL,NULL,NULL,'6339421241.jpg',5),(13,NULL,NULL,NULL,NULL,NULL,NULL,'99210914835.jpg',5),(14,NULL,NULL,NULL,NULL,NULL,NULL,'3396319945.jpg',5),(15,NULL,NULL,NULL,NULL,NULL,NULL,'2622858128.jpg',5),(16,NULL,NULL,NULL,NULL,NULL,NULL,'71094442254.jpg',5),(17,NULL,NULL,NULL,NULL,NULL,NULL,'842210915310.jpg',5),(18,NULL,NULL,NULL,NULL,NULL,NULL,'10663638889.jpg',5),(19,NULL,NULL,NULL,NULL,NULL,NULL,'74710859842.jpg',6),(20,NULL,NULL,NULL,NULL,NULL,NULL,'4311472467.jpg',6),(21,NULL,NULL,NULL,NULL,NULL,NULL,'26310451422.jpg',6),(22,NULL,NULL,NULL,NULL,NULL,NULL,'10515851296.jpg',6),(23,NULL,NULL,NULL,NULL,NULL,NULL,'10525658284.jpg',6);
/*!40000 ALTER TABLE `sanphamhinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoctinh`
--

DROP TABLE IF EXISTS `thuoctinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoctinh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `sanphamid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkvohiwy9mqg2yj0v3rnjb34dk` (`sanphamid`),
  CONSTRAINT `FKkvohiwy9mqg2yj0v3rnjb34dk` FOREIGN KEY (`sanphamid`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoctinh`
--

LOCK TABLES `thuoctinh` WRITE;
/*!40000 ALTER TABLE `thuoctinh` DISABLE KEYS */;
INSERT INTO `thuoctinh` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'mau','Màu',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,'size','Size',1),(5,NULL,NULL,NULL,NULL,NULL,NULL,'mau-sac','Màu Sắc',3),(6,NULL,NULL,NULL,NULL,NULL,NULL,'size','Size',3),(7,NULL,NULL,NULL,NULL,NULL,NULL,'kich-co','Kích cỡ',4),(8,NULL,NULL,NULL,NULL,NULL,NULL,'mau-ao','Màu Áo',5),(9,NULL,NULL,NULL,NULL,NULL,NULL,'size','Size',5),(10,NULL,NULL,NULL,NULL,NULL,NULL,'color','Color',6),(11,NULL,NULL,NULL,NULL,NULL,NULL,'size','Size',6),(12,NULL,NULL,NULL,NULL,1,1,'kich-thuoc','Kích thước',7),(13,NULL,NULL,NULL,NULL,1,1,'mau-sac','Màu Sắc',7),(14,NULL,NULL,NULL,NULL,1,1,'loai','Loại',7);
/*!40000 ALTER TABLE `thuoctinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuonghieu`
--

DROP TABLE IF EXISTS `thuonghieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuonghieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT '1',
  `trangthai` int DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s0mvror9u635ragoc5rwiuueh` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuonghieu`
--

LOCK TABLES `thuonghieu` WRITE;
/*!40000 ALTER TABLE `thuonghieu` DISABLE KEYS */;
INSERT INTO `thuonghieu` VALUES (1,NULL,NULL,NULL,NULL,1,1,'adidas','Adidas'),(2,NULL,NULL,NULL,NULL,1,1,'nike','Nike');
/*!40000 ALTER TABLE `thuonghieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'productattribute'
--

--
-- Dumping routines for database 'productattribute'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 19:01:40
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: duantotnghiep
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anhsanpham`
--

DROP TABLE IF EXISTS `anhsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anhsanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `hinhanh` varchar(255) DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl2yrbw1jmokavcq0mcl2215j3` (`idsanpham`),
  CONSTRAINT `FKl2yrbw1jmokavcq0mcl2215j3` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhsanpham`
--

LOCK TABLES `anhsanpham` WRITE;
/*!40000 ALTER TABLE `anhsanpham` DISABLE KEYS */;
INSERT INTO `anhsanpham` VALUES (1,NULL,'2023-11-22 16:26:02',NULL,'admin9193','ACTIVE','TBpuvQ.jpg',1),(2,NULL,'2023-11-22 16:26:02',NULL,'admin9193','ACTIVE','hCuy1c.jpg',1),(3,NULL,'2023-11-22 16:26:02',NULL,'admin9193','ACTIVE','DuM6xt.jpg',1),(4,NULL,'2023-11-22 16:26:02',NULL,'admin9193','ACTIVE','AL49cu.jpg',1),(5,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','PrSCiL.jpg',1),(6,NULL,'2023-11-22 16:26:04',NULL,'admin9193','ACTIVE','jrrNFi.jpg',1),(7,NULL,'2023-11-22 16:30:53',NULL,'admin9193','ACTIVE','v9zdxP.jpg',2),(8,NULL,'2023-11-22 16:30:53',NULL,'admin9193','ACTIVE','cBbfyB.jpg',2),(9,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','yhWYZs.jpg',3),(10,NULL,'2023-11-27 02:22:00',NULL,'admin9193','ACTIVE','U46jBA.jpg',5),(11,NULL,'2023-11-27 02:22:01',NULL,'admin9193','ACTIVE','sYhGqW.jpg',5),(12,NULL,'2023-11-27 02:22:02',NULL,'admin9193','ACTIVE','DOl52o.jpg',5),(13,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','l92XG2.jpg',5),(14,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','uroRYO.jpg',5),(15,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','hpVTxM.jpg',5),(16,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','mQNIOC.jpg',5),(17,NULL,'2023-11-27 02:39:52',NULL,'admin9193','ACTIVE','ip5I39.jpg',7),(18,NULL,'2023-11-27 02:39:53',NULL,'admin9193','ACTIVE','SjTivi.jpg',7),(19,NULL,'2023-11-27 02:39:53',NULL,'admin9193','ACTIVE','pzkpct.jpg',7),(20,NULL,'2023-11-27 02:39:53',NULL,'admin9193','ACTIVE','4SmTyN.jpg',7),(21,NULL,'2023-11-27 02:39:53',NULL,'admin9193','ACTIVE','RCvnAR.jpg',7),(22,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','FM5GCd.jpg',8),(23,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','9RRyJv.jpg',8),(24,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','x6F7PO.jpg',8),(25,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','6r6Bxo.jpg',8),(26,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','FWNrxX.jpg',9),(27,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','ophxa5.jpg',9),(28,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','oxjvWV.jpg',9),(29,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','csdSj8.jpg',10),(30,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','cm8ljf.jpg',10),(31,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','FPiM4F.jpg',10),(32,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','i4mTHm.jpg',10),(33,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','ycg5P2.jpg',10),(34,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','uI6kAj.jpg',11),(35,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','b2LLFO.jpg',11),(36,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','oX72hg.jpg',11),(37,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','cd7KVX.jpg',11),(38,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','W4x7fM.jpg',11),(39,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','FSFhCo.jpg',11),(40,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','TMd7lV.jpg',12),(41,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','JQPutc.jpg',12),(42,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','ihTckW.jpg',12),(43,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','HT85Ez.jpg',12),(48,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','vUVVgV.jpg',14),(49,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','vPZ6Sa.jpg',14),(50,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','vDKK7L.jpg',14),(51,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','7s7eme.jpg',14),(52,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','meBYJW.jpg',14),(53,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','5gZVdq.jpg',14),(54,NULL,'2023-11-27 03:00:35',NULL,'admin9193','ACTIVE','lQiHsi.jpg',14),(64,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','n1TBoD.jpg',18),(65,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','IBr0v1.jpg',18),(66,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','Q49i7t.jpg',18),(67,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','u9TqOO.jpg',18),(68,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','DjrOcD.jpg',18),(69,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','LxCoV2.jpg',19),(70,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','WxN7l1.jpg',19),(71,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','lVnaqp.jpg',19),(72,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','KrremL.jpg',19),(73,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','pAs5se.jpg',19),(74,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','5fcPg7.jpg',19),(79,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','dpBMPp.jpg',22),(80,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','2KWt6x.jpg',22),(81,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','SFNcEp.jpg',22),(82,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','gBeeje.jpg',22),(83,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','MXjCuc.jpg',22),(84,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','Agig87.jpg',22),(85,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','dxcYK1.jpg',22),(86,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','EmU376.jpg',22),(87,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','e8831p.jpg',23),(88,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','A6faO2.jpg',23),(89,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','YZcXMk.jpg',23),(90,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','7BEBAD.jpg',23),(91,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','IZnU21.jpg',23),(92,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','0PQldf.jpg',23),(93,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','B4S4VY.jpg',23),(94,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','zsMhnX.jpg',24),(95,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','MlsycO.jpg',24),(96,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','LWWcLv.jpg',24),(97,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','cGhYcg.jpg',24),(98,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','0sECSg.jpg',24),(99,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','rdDDQU.jpg',24),(100,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','gICuWg.jpg',24),(101,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','OaURFy.jpg',25),(102,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','Mh241Q.jpg',25),(103,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','MTQ0ap.jpg',25),(104,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','cJHtPH.jpg',25),(105,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','h8BW6o.jpg',25),(106,NULL,'2023-11-27 03:29:29',NULL,'admin9193','ACTIVE','gpOUel.jpg',25),(107,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','2EMmJL.jpg',26),(108,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','0aYoUR.jpg',26),(109,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','uSzSzd.jpg',26),(110,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','8Jy9S2.jpg',26),(111,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','dMujyb.jpg',26),(112,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','8LeWen.jpg',26),(113,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','AYGmIJ.jpg',26),(114,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','fhOJeO.jpg',26),(115,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','XP9QRH.jpg',26),(116,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','F4RiKD.jpg',26),(117,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','ofgi0L.jpg',26),(118,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','CcjjZF.jpg',26),(119,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','roRFHP.jpg',26),(120,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','MTsxTs.jpg',26),(121,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','CfPLqs.jpg',27),(122,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','NcjlTD.jpg',27),(123,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','v8BWDf.jpg',27),(124,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','Cqi7J9.jpg',27),(125,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','Qu5Dfr.jpg',27),(126,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','V8cEZ9.jpg',27),(127,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','EH2Ipn.jpg',27),(128,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','kneBzi.jpg',27),(129,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','j6AV1M.jpg',27),(130,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','rYDsmj.jpg',27),(131,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE','7L2jsK.jpg',27),(132,NULL,'2023-11-27 15:27:15',NULL,'admin9193','ACTIVE','X5uN3z.jpg',28),(133,NULL,'2023-11-27 15:27:15',NULL,'admin9193','ACTIVE','e5Av7L.jpg',28),(134,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE','n3Ruv5.jpg',28),(135,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE','IQznid.jpg',28),(136,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE','a5oLH5.jpg',28),(137,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE','LroLXy.jpg',28),(138,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE','EnDNcr.jpg',28),(139,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','VGpvOl.jpg',29),(140,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','f9OGFD.jpg',29),(141,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','NF6lF0.jpg',29),(142,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','9Lz8Xt.jpg',29),(143,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','rHEdhF.jpg',29),(144,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','7YSCvY.jpg',30),(145,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','JrZTEg.jpg',30),(146,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','QuZsDu.jpg',30),(147,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','J4idhU.jpg',30),(148,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','S5N2qF.jpg',30),(149,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','zdtBq0.jpg',30),(150,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','dCZtlT.jpg',31),(151,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','xNXTT5.jpg',31),(152,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','WHJ9Wq.jpg',31),(153,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','9xfOOF.jpg',31),(154,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','hpW0Tz.jpg',32),(155,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','xfTHTO.jpg',32),(156,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','nJ8fjr.jpg',32),(157,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','xlYvAU.jpg',32),(158,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','dBsDAL.jpg',33),(159,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','s9L1EA.jpg',33),(160,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','9E2Doz.jpg',34),(161,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','WffmaK.jpg',34),(162,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','rY3INa.jpg',34),(163,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','QRBefx.jpg',34),(164,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','fM9IuO.jpg',35),(165,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','J0DSJz.jpg',35),(166,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','0qu6GE.jpg',35),(167,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','3IPzsz.jpg',35),(168,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','x6geKz.jpg',36),(169,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','Bf5IEM.jpg',36),(170,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','XUHmHC.jpg',36),(171,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','UbKQrH.jpg',36),(172,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','YGsMrj.jpg',36),(173,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','O5AJV9.jpg',37),(174,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','WgaEVZ.jpg',37),(175,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','PbILh2.jpg',37),(176,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','VsPFmY.jpg',38),(177,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','oRq9yK.jpg',38),(178,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','AT5UCS.jpg',38),(179,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','6Tuepb.jpg',38),(180,NULL,'2023-11-27 16:29:03',NULL,'admin9193','ACTIVE','6TyyOi.jpg',39),(181,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','mBqv2j.jpg',39),(182,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','esLARM.jpg',39),(183,NULL,'2023-11-27 16:34:34',NULL,'admin9193','ACTIVE','aGInKg.jpg',40),(184,NULL,'2023-11-27 16:34:34',NULL,'admin9193','ACTIVE','vYiyv9.jpg',40),(185,NULL,'2023-11-27 16:34:34',NULL,'admin9193','ACTIVE','aauo4r.jpg',40),(186,NULL,'2023-11-27 16:40:53',NULL,'admin9193','ACTIVE','qYAytq.jpg',41),(187,NULL,'2023-11-27 16:40:53',NULL,'admin9193','ACTIVE','IrxMV7.jpg',41),(188,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','ADGxfb.jpg',41),(189,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','VstsxP.jpg',41),(190,NULL,'2023-11-27 16:48:18',NULL,'admin9193','ACTIVE','xajp6S.jpg',42),(191,NULL,'2023-11-27 16:48:18',NULL,'admin9193','ACTIVE','xf5leQ.jpg',42),(192,NULL,'2023-11-27 16:48:18',NULL,'admin9193','ACTIVE','VWqTz7.jpg',42),(193,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE','BBgWxe.jpg',42),(194,NULL,'2023-12-09 05:23:48',NULL,'admin9193','ACTIVE','9FOqe0.jpg',43),(195,NULL,'2023-12-09 05:23:48',NULL,'admin9193','ACTIVE','5gWRdU.jpg',43),(196,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','xFNS0O.jpg',43),(197,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','TnMzIX.jpg',43),(198,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE','DrmnNx.jpg',43),(199,NULL,'2023-12-09 05:27:29',NULL,'admin9193','ACTIVE','0oJJeG.jpg',44),(200,NULL,'2023-12-09 05:27:29',NULL,'admin9193','ACTIVE','kB5KVW.jpg',44),(201,NULL,'2023-12-09 05:27:29',NULL,'admin9193','ACTIVE','mIktVG.jpg',44),(202,NULL,'2023-12-09 05:27:30',NULL,'admin9193','ACTIVE','sce4AK.jpg',44),(203,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','IBeq3U.jpg',45),(204,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','TSLyUy.jpg',45),(205,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','sfLCvh.jpg',45),(206,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','PNcSqS.jpg',45),(207,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','znId4O.jpg',45),(208,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','4l4O5I.jpg',45),(209,NULL,'2023-12-09 05:29:47',NULL,'admin9193','ACTIVE','iUdFbI.jpg',45),(210,NULL,'2023-12-09 05:29:48',NULL,'admin9193','ACTIVE','scguyv.jpg',45),(211,NULL,'2023-12-09 05:33:09',NULL,'admin9193','ACTIVE','ZATGrs.jpg',46),(212,NULL,'2023-12-09 05:33:09',NULL,'admin9193','ACTIVE','X5vrgm.jpg',46),(213,NULL,'2023-12-09 05:33:09',NULL,'admin9193','ACTIVE','CFanXL.jpg',46),(214,NULL,'2023-12-09 05:33:10',NULL,'admin9193','ACTIVE','vnCfpl.jpg',46),(215,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','Hqu47T.jpg',47),(216,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','eLaSY5.jpg',47),(217,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','elTe5c.jpg',47),(218,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','1cdaBH.jpg',47),(219,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','fpHXuH.jpg',47),(220,NULL,'2023-12-09 05:42:31',NULL,'admin9193','ACTIVE','vyZzIP.jpg',48),(221,NULL,'2023-12-09 05:42:31',NULL,'admin9193','ACTIVE','Bqf1V9.jpg',48),(222,NULL,'2023-12-09 05:42:31',NULL,'admin9193','ACTIVE','A2cduU.jpg',48),(223,NULL,'2023-12-09 05:42:31',NULL,'admin9193','ACTIVE','SRdXmF.jpg',48),(224,NULL,'2023-12-09 05:42:32',NULL,'admin9193','ACTIVE','fxk6ku.jpg',48),(225,NULL,'2023-12-09 05:42:32',NULL,'admin9193','ACTIVE','Iq8Bzv.jpg',48),(226,NULL,'2023-12-09 05:42:33',NULL,'admin9193','ACTIVE','VA28tK.jpg',48),(227,NULL,'2023-12-09 05:42:34',NULL,'admin9193','ACTIVE','RDSlNB.jpg',48),(228,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','jZRRBi.jpg',49),(229,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','q4CdO2.jpg',49),(230,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','8YWa7N.jpg',49),(231,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','vx04tG.jpg',49),(232,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','T5jKFR.jpg',49),(233,NULL,'2023-12-12 06:57:24',NULL,'admin9193','ACTIVE','g343y5.jpg',4),(234,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE','pgEEpI.jpg',50),(235,NULL,'2023-12-17 06:30:36',NULL,'admin9193','ACTIVE','fpHXuH.jpg',51),(236,NULL,'2023-12-18 07:46:17',NULL,'admin9193','ACTIVE','X5vrgm.jpg',56),(237,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','XKLds3.jpg',57),(238,NULL,'2023-12-19 05:54:26',NULL,'admin9193','ACTIVE','IkFIh4.jpg',58),(239,NULL,'2023-12-19 07:41:57',NULL,'admin9193','ACTIVE','C29qGn.jpg',59),(240,NULL,'2023-12-19 08:25:13',NULL,'admin9193','ACTIVE','xjWTb5.jpg',60),(241,NULL,'2023-12-19 08:38:08',NULL,'admin9193','ACTIVE','1EhzR1.jpg',61),(242,NULL,'2023-12-19 08:51:40',NULL,'admin9193','ACTIVE','CxFYu7.jpg',62),(243,NULL,'2023-12-19 09:08:33',NULL,'admin9193','ACTIVE','km7iJM.jpg',63),(244,NULL,'2024-01-09 07:53:40',NULL,'admin9193','ACTIVE','Fpqjpa.jpg',64),(245,NULL,'2024-01-09 07:53:40',NULL,'admin9193','ACTIVE','3u52GK.jpg',64),(246,NULL,'2024-01-09 07:53:40',NULL,'admin9193','ACTIVE','9AlQkl.jpg',64),(247,NULL,'2024-01-09 08:13:33',NULL,'admin9193','ACTIVE','4N7ROP.jpg',65),(248,NULL,'2024-01-09 08:13:33',NULL,'admin9193','ACTIVE','4N7ROP.jpg',65),(257,NULL,'2024-01-09 15:20:04',NULL,'admin9193','ACTIVE','x19X6M.jpg',68),(258,NULL,'2024-01-09 15:20:04',NULL,'admin9193','ACTIVE','UZQIQa.jpg',68),(259,NULL,'2024-01-09 15:20:04',NULL,'admin9193','ACTIVE','LxAvNr.jpg',68),(260,NULL,'2024-01-09 15:20:04',NULL,'admin9193','ACTIVE','Ns2iZi.jpg',68),(261,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','orGq9F.jpg',69),(262,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','X1VUa2.jpg',69),(263,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','ODXJKi.jpg',69),(264,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','WAj07q.jpg',69),(265,NULL,'2024-01-10 09:33:28',NULL,'admin9193','ACTIVE','RnsKxf.jpg',70),(266,NULL,'2024-01-10 09:33:28',NULL,'admin9193','ACTIVE','1j2aBX.jpg',70),(267,NULL,'2024-01-10 09:33:29',NULL,'admin9193','ACTIVE','sUAtZM.jpg',70),(268,NULL,'2024-01-10 09:33:29',NULL,'admin9193','ACTIVE','CE5xhz.jpg',70),(272,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','AEvBXi.jpg',71),(273,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','Lotuqt.jpg',71),(274,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','ivZjEu.jpg',71),(275,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','SUsFoD.jpg',72),(276,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','XV5Oo7.jpg',72),(277,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','giQ0t6.jpg',72),(278,NULL,'2024-01-13 19:12:44',NULL,'admin9193','ACTIVE','yFMqyQ.jpg',73),(279,NULL,'2024-01-13 19:12:44',NULL,'admin9193','ACTIVE','I4ZRVx.jpg',73),(280,NULL,'2024-01-13 19:12:44',NULL,'admin9193','ACTIVE','bgu6cF.jpg',73),(281,NULL,'2024-01-13 19:16:26',NULL,'admin9193','ACTIVE','orrmDp.jpg',74),(282,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','MgLcYl.jpg',74),(283,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','uLhEiR.jpg',74),(284,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','S7g7Ug.jpg',74),(285,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','jK3fX3.jpg',75),(286,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','RUqytD.jpg',75),(287,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','IazYLI.jpg',75),(288,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','pU66lZ.jpg',76),(289,NULL,'2024-01-14 19:49:10',NULL,'admin9193','ACTIVE','payI3o.jpg',77),(290,NULL,'2024-01-14 19:49:10',NULL,'admin9193','ACTIVE','nWMoi1.jpg',77),(291,NULL,'2024-01-14 19:49:10',NULL,'admin9193','ACTIVE','qoi52P.jpg',77),(292,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','7cYhsu.jpg',78),(293,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','6zSkVc.jpg',78),(294,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','OYxCdh.jpg',78),(295,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','FPTSe2.jpg',78),(296,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','hvoir4.jpg',79),(297,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','HxCK8q.jpg',79),(298,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','BvYK8C.jpg',79),(299,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','hLzZxS.jpg',80),(300,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','4FHDIV.jpg',80),(301,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','4jSVQ1.jpg',81),(302,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','ScqTSP.jpg',81),(303,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','jDRgm7.jpg',82),(304,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','OZClAB.jpg',82),(305,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','qtrhHA.jpg',82),(306,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','OMEsKi.jpg',82),(307,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','3sO5rY.jpg',83);
/*!40000 ALTER TABLE `anhsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bienthe`
--

DROP TABLE IF EXISTS `bienthe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bienthe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `gia` double DEFAULT NULL,
  `hinhanh` varchar(255) DEFAULT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1i0avoe2xfvbl86pcd6fltolm` (`ma`),
  KEY `FK5wqyagvu9na935be2xsh2a9xv` (`idsanpham`),
  CONSTRAINT `FK5wqyagvu9na935be2xsh2a9xv` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1376 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienthe`
--

LOCK TABLES `bienthe` WRITE;
/*!40000 ALTER TABLE `bienthe` DISABLE KEYS */;
INSERT INTO `bienthe` VALUES (6,NULL,'2023-11-22 16:26:04',NULL,'admin9193','ACTIVE',130000,NULL,'mAgmWSWv',12000,'Đen,L',1),(7,NULL,'2023-11-22 16:26:04',NULL,'admin9193','ACTIVE',128000,NULL,'eVCL5INo',12000,'Đen,XL',1),(8,NULL,'2023-11-22 16:26:04',NULL,'admin9193','ACTIVE',128000,NULL,'yET689Fu',12000,'Đen,XXL',1),(29,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',198000,NULL,'scpzEOvt',12000,'Xanh,M',3),(30,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,NULL,'OrfLn0m9',12000,'Xanh,L',3),(31,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',80000,NULL,'sK4siOz0',12000,'Xanh,XL',3),(32,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,NULL,'vPmsDQLQ',12000,'Trắng,M',3),(33,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,NULL,'D7XeB76D',12000,'Trắng,L',3),(34,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',85000,NULL,'mh1IOJZ7',12000,'Trắng,XL',3),(35,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,NULL,'Td6U3esL',12000,'Đen,M',3),(36,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',75000,NULL,'fYzF4Bs8',12000,'Đen,L',3),(37,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,NULL,'WSLbE1v9',12000,'Đen,XL',3),(50,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE',160000,'l92XG2.jpg','NSU8YGbC',12000,'Trắng,M',5),(51,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE',170000,'uroRYO.jpg','MHGx1FX1',12000,'Trắng,XL',5),(52,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE',150000,'hpVTxM.jpg','Ta0lvAkn',12000,'Đen,M',5),(53,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE',165000,'mQNIOC.jpg','jLGHMNXD',12000,'Đen,XL',5),(58,'2024-01-10 08:55:52','2023-11-27 02:43:46','admin9193','admin9193','ACTIVE',259000,'x6F7PO.jpg','9tJJJBr3',12000,'Đen,L',8),(59,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE',269000,'6r6Bxo.jpg','6ubTfoUS',11999,'Đen,XL',8),(60,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE',345000,'ophxa5.jpg','sGxcr8Ap',12000,'Đen,L',9),(61,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE',360000,'oxjvWV.jpg','X8JncyDE',12000,'Đen,XL',9),(63,'2024-01-10 09:08:24','2023-11-27 02:48:58','admin9193','admin9193','ACTIVE',355000,'ycg5P2.jpg','6fzo9LCS',11995,'Đen,L',10),(64,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE',155000,'oX72hg.jpg','TGod8s6H',12000,'Đen,M',11),(65,'2024-01-10 08:55:52','2023-11-27 02:53:09','admin9193','admin9193','ACTIVE',165000,'cd7KVX.jpg','OmjkFhP1',12000,'Đen,XL',11),(66,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE',145000,'W4x7fM.jpg','GirCZsxV',12000,'Be,M',11),(67,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE',155000,'FSFhCo.jpg','ZpBR22Kz',12000,'Be,XL',11),(68,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE',169000,'ihTckW.jpg','CBCrFbC7',12000,'Đen,M',12),(69,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE',179000,'HT85Ez.jpg','9x1Iyyef',12000,'Đen,XL',12),(79,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE',178000,'u9TqOO.jpg','BvHrlC5C',12000,'Đen,M',18),(80,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE',175000,'DjrOcD.jpg','FqqZoJpg',12000,'Đen,XL',18),(81,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE',149000,'pAs5se.jpg','ygeRHcYy',12000,'Be',19),(82,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE',149000,'5fcPg7.jpg','9KNFu2ps',12000,'Đen',19),(85,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',90000,'SFNcEp.jpg','mC0vHt8M',12000,'Be,M',22),(86,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',95000,'gBeeje.jpg','QKsYDHuQ',12000,'Be,XL',22),(87,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',89000,'MXjCuc.jpg','hnLh3iPX',12000,'Xanh,M',22),(88,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',90000,'Agig87.jpg','RKA6ZX1d',12000,'Xanh,XL',22),(89,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',100000,'dxcYK1.jpg','HbVo72zr',12000,'Xám,M',22),(90,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',95000,'EmU376.jpg','Jq9yqoVM',12000,'Xám,XL',22),(91,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE',129000,'IZnU21.jpg','Yd0HSDhe',12000,'Trắng',23),(92,'2024-01-09 05:34:20','2023-11-27 03:20:51','admin9193','admin9193','ACTIVE',135000,'0PQldf.jpg','8tHKHQEX',11995,'Xanh',23),(93,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE',129000,'B4S4VY.jpg','Qpdfpsad',12000,'Xám',23),(94,'2024-01-02 03:23:02','2023-11-27 03:25:03','admin9193','admin9193','ACTIVE',299000,'cGhYcg.jpg','IZMfKTRq',11998,'Be',24),(95,'2023-12-31 06:59:43','2023-11-27 03:25:03','admin9193','admin9193','ACTIVE',305000,'0sECSg.jpg','1jqXfagn',12000,'Nâu',24),(96,'2024-01-09 05:34:20','2023-11-27 03:25:03','admin9193','admin9193','ACTIVE',295000,'rdDDQU.jpg','l8DhIXQO',12000,'Xám',24),(97,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE',300000,'gICuWg.jpg','yuUDjETB',12000,'Đen',24),(101,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',95870,'uSzSzd.jpg','vyL2eQyb',12000,'Xanh,M',26),(102,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',99000,'8Jy9S2.jpg','98DoIYno',12000,'Xanh,XL',26),(103,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',98000,'dMujyb.jpg','a7Y8UyeE',12000,'Xanh,S',26),(104,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',100000,'8LeWen.jpg','6UsOKZGR',12000,'Đen,M',26),(105,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',99000,'AYGmIJ.jpg','yZ0UTQZJ',12000,'Đen,XL',26),(106,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',105000,'fhOJeO.jpg','AuSxSsGI',12000,'Đen,S',26),(107,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',99000,'XP9QRH.jpg','SIK295VG',12000,'Trắng,M',26),(108,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',110000,'F4RiKD.jpg','7ZALC6YR',12000,'Trắng,XL',26),(109,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',99000,'ofgi0L.jpg','LRXlyWOZ',12000,'Trắng,S',26),(110,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',95000,'CcjjZF.jpg','dAaSCDML',12000,'Xám,M',26),(111,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',99000,'roRFHP.jpg','qI4SYp7j',12000,'Xám,XL',26),(112,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE',98000,'MTsxTs.jpg','bcNflxkx',12000,'Xám,S',26),(113,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE',145000,'v8BWDf.jpg','6oECdTP1',12000,'Đen,30',27),(114,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE',150000,'Cqi7J9.jpg','J6qmtyFd',12000,'Đen,31',27),(115,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE',145000,'Qu5Dfr.jpg','zMenZ27U',12000,'Đen,32',27),(116,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE',155000,'V8cEZ9.jpg','uJtJiCsK',12000,'Xám,30',27),(117,'2023-12-31 03:47:30','2023-11-27 03:40:54','admin9193','admin9193','ACTIVE',140000,'EH2Ipn.jpg','NKoVYBTg',11996,'Xám,31',27),(118,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE',145000,'kneBzi.jpg','Ri6rupx0',12000,'Xám,32',27),(119,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE',149000,'j6AV1M.jpg','kXGXPgfz',12000,'Xanh nhạt,30',27),(120,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE',144000,'rYDsmj.jpg','RClaP2Ep',12000,'Xanh nhạt,31',27),(121,NULL,'2023-11-27 03:40:54',NULL,'admin9193','ACTIVE',145000,'7L2jsK.jpg','iiORoPSu',12000,'Xanh nhạt,32',27),(123,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',130000,NULL,'6UrMjZS0',12000,'Đen,L',28),(124,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',125000,NULL,'l7pSmtWP',12000,'Đen,XL',28),(126,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',125000,NULL,'0IE9b6r8',12000,'Vàng,L',28),(127,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',130000,NULL,'otYCcJjf',12000,'Vàng,XL',28),(129,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',126000,NULL,'t2LME52r',12000,'Xanh Đậm,L',28),(130,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',125000,NULL,'xfULYpi1',12000,'Xanh Đậm,XL',28),(132,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',129000,NULL,'XxM3UrWd',12000,'Xanh Nhạt,L',28),(133,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',126000,NULL,'tqBGS7I2',12000,'Xanh Nhạt,XL',28),(135,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',126000,NULL,'m4ILz0B0',12000,'Xám,L',28),(136,NULL,'2023-11-27 15:27:17',NULL,'admin9193','ACTIVE',129000,NULL,'p3mpT8sr',12000,'Xám,XL',28),(137,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',170000,'9Lz8Xt.jpg','XedAEYd4',12000,'Be,M',29),(138,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',180000,NULL,'FReNal7z',12000,'Be,L',29),(139,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',170000,NULL,'5MZR6rvJ',12000,'Be,XL',29),(140,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',175000,NULL,'pumSvb38',12000,'Be,2XL',29),(141,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',170000,'rHEdhF.jpg','bJueL7Dj',12000,'Đen,M',29),(142,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',178000,NULL,'oJpRirli',12000,'Đen,L',29),(143,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',170000,NULL,'vej8OjrA',12000,'Đen,XL',29),(144,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',179000,NULL,'3ecc7dNI',12000,'Đen,2XL',29),(145,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',385000,'J4idhU.jpg','K4va0TkC',12000,'Đen,M',30),(146,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'0KOoRPe9',12000,'Đen,L',30),(147,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',378000,NULL,'KEYGlKC1',12000,'Đen,XL',30),(148,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'39xy9dEF',12000,'Đen,2XL',30),(149,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',375000,NULL,'e8xCK07d',12000,'Đen,3XL',30),(150,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',385000,'S5N2qF.jpg','71dj2hmN',12000,'Xanh Lá,M',30),(151,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',375000,NULL,'SqpJ9tDa',12000,'Xanh Lá,L',30),(152,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'UfRJmqn0',12000,'Xanh Lá,XL',30),(153,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',388000,NULL,'BcOjZYAT',12000,'Xanh Lá,2XL',30),(154,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'MQSA17Sm',12000,'Xanh Lá,3XL',30),(155,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',375000,NULL,'P42SPzF3',12000,'Kaki,M',30),(156,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',381000,'zdtBq0.jpg','jCOVdgBD',12000,'Kaki,L',30),(157,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'eor0jhdL',12000,'Kaki,XL',30),(158,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',375000,NULL,'a7pjhL7j',12000,'Kaki,2XL',30),(159,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,NULL,'GdMGS25O',12000,'Kaki,3XL',30),(160,'2024-01-13 17:28:48','2023-11-27 15:44:42','admin9193','admin9193','ACTIVE',500000,NULL,'8S63lxtK',11999,'M',31),(162,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE',360000,NULL,'bvnKKJoQ',12000,'XL',31),(164,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE',360000,NULL,'ITZtpWjr',12000,'3XL',31),(165,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,'nJ8fjr.jpg','QJM4A2jt',11998,'Đen,M',32),(166,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',375000,NULL,'f3v02BXs',12000,'Đen,L',32),(167,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,NULL,'xDhCyjid',12000,'Đen,XL',32),(168,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',385000,NULL,'uECbiq1r',12000,'Đen,XXL',32),(169,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,NULL,'mZlWvfKN',12000,'Đen,3XL',32),(170,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',375000,'xlYvAU.jpg','oGKe8aXP',12000,'Be,M',32),(171,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,NULL,'0B7KKZtT',12000,'Be,L',32),(172,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',388000,NULL,'ndySIrU4',12000,'Be,XL',32),(173,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,NULL,'Y6BDZ2A2',12000,'Be,XXL',32),(174,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',375000,NULL,'GudWxV10',12000,'Be,3XL',32),(176,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',130000,NULL,'QMmHBVIT',12000,'Xám,L',33),(177,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',120000,NULL,'uHkkQ8Rg',12000,'Xám,XL',33),(178,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',140000,NULL,'ZCnddVpq',12000,'Xám,2XL',33),(180,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',130000,NULL,'tTW4c5ad',12000,'Xanh nhạt,L',33),(181,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',125000,NULL,'YFu5WDrJ',12000,'Xanh nhạt,XL',33),(182,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE',120000,NULL,'tcAQuj6J',12000,'Xanh nhạt,2XL',33),(183,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',149000,'rY3INa.jpg','eRnEmdqB',12000,'JX:90,M',34),(184,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',155000,NULL,'xafvvjmC',12000,'JX:90,L',34),(185,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',149000,NULL,'EZ84qEmo',12000,'JX:90,XL',34),(186,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',150000,NULL,'7zGvvx4h',12000,'JX:90,XXL',34),(187,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',149000,'QRBefx.jpg','eVF570vu',12000,'JX:92,M',34),(188,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',155000,NULL,'AaiPPv3q',12000,'JX:92,L',34),(189,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE',149000,NULL,'rmmZzSTv',12000,'JX:92,XL',34),(190,'2023-12-31 10:13:39','2023-11-27 16:02:20','admin9193','admin9193','ACTIVE',150000,NULL,'oZ4tnoDS',12000,'JX:92,XXL',34),(191,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,'0qu6GE.jpg','vDxkdfr5',12000,'Xanh,30',35),(192,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',155000,NULL,'eygiJPA2',12000,'Xanh,31',35),(193,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,NULL,'qM4cg4JC',12000,'Xanh,32',35),(194,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',150000,NULL,'ZusUs2aB',12000,'Xanh,33',35),(195,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,NULL,'PVK5RaAI',12000,'Xanh,29',35),(196,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',150000,NULL,'REAxb1AU',12000,'Xanh,28',35),(197,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,'3IPzsz.jpg','2ficnYvk',12000,'Đen,30',35),(198,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',140000,NULL,'OS4dlimG',12000,'Đen,31',35),(199,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,NULL,'ybzPILXZ',12000,'Đen,32',35),(200,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',145000,NULL,'PmyCqFUq',12000,'Đen,33',35),(201,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',155000,NULL,'ECZjNm5J',12000,'Đen,29',35),(202,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE',155000,NULL,'5UB21nGV',12000,'Đen,28',35),(203,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',140000,'XUHmHC.jpg','VofyUQnD',12000,'Be,S',36),(204,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',155000,NULL,'HACvqqtB',12000,'Be,M',36),(205,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',140000,NULL,'CocxCGHu',12000,'Be,L',36),(206,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',150000,NULL,'ReCaVMLK',12000,'Be,XL',36),(207,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',140000,'UbKQrH.jpg','qterenDc',12000,'Đen,S',36),(208,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',155000,NULL,'vUBp6Aa7',12000,'Đen,M',36),(209,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',145000,NULL,'cE6KVytS',12000,'Đen,L',36),(210,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',150000,NULL,'uIA1TURq',12000,'Đen,XL',36),(211,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',140000,'YGsMrj.jpg','y3OdrzgB',12000,'Nâu,S',36),(212,NULL,'2023-11-27 16:11:31',NULL,'admin9193','ACTIVE',145000,NULL,'9e4OLO7C',12000,'Nâu,M',36),(213,NULL,'2023-11-27 16:11:31',NULL,'admin9193','ACTIVE',140000,NULL,'19BqoCpx',12000,'Nâu,L',36),(214,NULL,'2023-11-27 16:11:31',NULL,'admin9193','ACTIVE',145000,NULL,'YiNK8mMt',12000,'Nâu,XL',36),(215,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',145000,NULL,'QbWUJyCR',12000,'28',37),(216,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',155000,NULL,'T9UiqrPz',12000,'29',37),(217,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',165000,NULL,'kUBBv6bg',12000,'30',37),(218,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',150000,NULL,'LtqrnVuS',12000,'31',37),(219,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',145000,NULL,'C5skX4fu',12000,'32',37),(220,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',280000,'AT5UCS.jpg','AX6rfZrI',12000,'Đen,M',38),(221,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',300000,NULL,'Ej2UJdZu',12000,'Đen,L',38),(222,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',280000,NULL,'jyp0CUPu',12000,'Đen,XL',38),(223,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',280000,NULL,'mrjeIbjy',12000,'Đen,2XL',38),(224,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',290000,'6Tuepb.jpg','Z5GQgpnt',12000,'Xanh Nhạt,M',38),(225,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',280000,NULL,'uOclT0YA',12000,'Xanh Nhạt,L',38),(226,'2024-01-09 05:36:28','2023-11-27 16:24:18','admin9193','admin9193','ACTIVE',285000,NULL,'8Kao0oZy',11997,'Xanh Nhạt,XL',38),(227,'2024-01-08 06:00:17','2023-11-27 16:24:18','admin9193','admin9193','ACTIVE',280000,NULL,'GeUKsaro',11999,'Xanh Nhạt,2XL',38),(228,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE',340000,NULL,'9bLopIMV',12000,'M',39),(229,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE',345000,NULL,'oT2NUFkP',12000,'L',39),(230,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE',350000,NULL,'yROZb6Qf',12000,'XL',39),(231,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE',340000,NULL,'Pd6GJvX5',12000,'2XL',39),(232,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE',350000,NULL,'O3uPAKHW',12000,'M',41),(233,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE',360000,NULL,'oCxrPLde',12000,'L',41),(234,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE',355000,NULL,'s1QP6QW6',11999,'XL',41),(235,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE',199000,NULL,'vlQCrYkp',12000,'M',42),(236,'2024-01-14 18:20:34','2023-11-27 16:48:19','admin9193','admin9193','ACTIVE',300000,NULL,'LP3NjhFG',11999,'L',42),(237,'2023-12-19 05:18:15','2023-11-27 16:48:19','admin9193','admin9193','ACTIVE',210000,NULL,'DHnGDkeX',2001,'XL',42),(238,'2024-01-09 05:49:58','2023-12-09 05:23:49','admin9193','admin9193','ACTIVE',379000,'xFNS0O.jpg','HAPdtgLS',11999,'Đen,M,Địa Cầu',43),(239,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',380000,NULL,'N13AGniV',12000,'Đen,M,Họa Hình',43),(240,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',380000,NULL,'hrxXuRiN',12000,'Đen,L,Địa Cầu',43),(241,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',379000,NULL,'1kvZcEkj',12000,'Đen,L,Họa Hình',43),(242,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',385000,NULL,'6Feddyl4',12000,'Đen,XL,Địa Cầu',43),(243,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',379000,NULL,'vcIfVi3u',12000,'Đen,XL,Họa Hình',43),(244,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',385000,'TnMzIX.jpg','uhZBnJiu',12000,'Be,M,Địa Cầu',43),(245,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',379000,NULL,'eSMdL4jX',12000,'Be,M,Họa Hình',43),(246,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',380000,NULL,'KIEzeJAI',11998,'Be,L,Địa Cầu',43),(247,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',380000,NULL,'WoOrQ7yi',12000,'Be,L,Họa Hình',43),(248,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',385000,NULL,'013jGpPk',12000,'Be,XL,Địa Cầu',43),(249,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE',379000,NULL,'Zmq04H0a',12000,'Be,XL,Họa Hình',43),(250,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',379000,'DrmnNx.jpg','TnG5vUJy',12000,'Xanh Xám,M,Địa Cầu',43),(251,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',380000,NULL,'Whs0bm95',12000,'Xanh Xám,M,Họa Hình',43),(252,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',379000,NULL,'C1qRdz6L',12000,'Xanh Xám,L,Địa Cầu',43),(253,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',380000,NULL,'PWbfAONW',12000,'Xanh Xám,L,Họa Hình',43),(254,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',379000,NULL,'TfTyefRe',12000,'Xanh Xám,XL,Địa Cầu',43),(255,NULL,'2023-12-09 05:23:50',NULL,'admin9193','ACTIVE',385000,NULL,'prh2PD0o',12000,'Xanh Xám,XL,Họa Hình',43),(312,'2024-01-02 03:27:49','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',279000,'1cdaBH.jpg','bHPu0jZd',10419,'Xanh,S,Logo',47),(313,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',280000,NULL,'FyQF31BY',12000,'Xanh,S,Chữ cái',47),(314,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',279000,NULL,'1MrpcfPG',11999,'Xanh,L,Logo',47),(315,'2024-01-01 16:15:40','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',285000,NULL,'qRNXM91s',11995,'Xanh,L,Chữ cái',47),(316,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',280000,NULL,'S8LBjd3W',12000,'Xanh,XL,Logo',47),(317,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',279000,NULL,'7LGppDQL',12000,'Xanh,XL,Chữ cái',47),(318,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',279000,NULL,'JrnncEz9',12000,'Xanh,XXL,Logo',47),(319,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',280000,NULL,'2MokOjL0',12000,'Xanh,XXL,Chữ cái',47),(320,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',280000,'fpHXuH.jpg','psWF2mCg',12000,'Trắng,S,Logo',47),(321,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',285000,NULL,'HkBc26hH',12000,'Trắng,S,Chữ cái',47),(322,'2023-12-28 08:35:32','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',279000,NULL,'4B3WkJEo',11997,'Trắng,L,Logo',47),(323,'2023-12-31 04:54:11','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',285000,NULL,'NUQixXdf',11997,'Trắng,L,Chữ cái',47),(324,'2023-12-31 06:43:57','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',285000,NULL,'fKZfWBb2',11999,'Trắng,XL,Logo',47),(325,'2024-01-08 06:00:17','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',280000,NULL,'mHvj1f9p',11998,'Trắng,XL,Chữ cái',47),(326,'2023-12-28 12:20:14','2023-12-09 05:35:35','admin9193','admin9193','ACTIVE',279000,NULL,'b6ZNdxHP',11994,'Trắng,XXL,Logo',47),(327,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',289000,NULL,'rVEkEKek',12000,'Trắng,XXL,Chữ cái',47),(520,'2024-01-13 16:48:12','2023-12-09 05:47:44','admin9193','admin9193','ACTIVE',80000,NULL,'5LM1SqSp',11995,'Đen,M,Vải Cotton,Tay ngắn',49),(521,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'bpJIeOTh',12000,'Đen,M,Vải Cotton,Tay lỡ',49),(522,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'Rq6N4TKp',12000,'Đen,M,Vải Corolan,Tay ngắn',49),(523,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'1Xg72YAl',12000,'Đen,M,Vải Corolan,Tay lỡ',49),(528,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'F2YGlGqY',12000,'Đen,XL,Vải Cotton,Tay ngắn',49),(529,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',85000,NULL,'9Uepny2b',12000,'Đen,XL,Vải Cotton,Tay lỡ',49),(530,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'OLGh7zix',12000,'Đen,XL,Vải Corolan,Tay ngắn',49),(531,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',89000,NULL,'0bzD9W2V',12000,'Đen,XL,Vải Corolan,Tay lỡ',49),(532,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'lvmuH0R8',12000,'Đen,XXL,Vải Cotton,Tay ngắn',49),(533,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'l5L8NMk7',12000,'Đen,XXL,Vải Cotton,Tay lỡ',49),(534,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'dPNokcWT',12000,'Đen,XXL,Vải Corolan,Tay ngắn',49),(535,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'nKiKPfMK',12000,'Đen,XXL,Vải Corolan,Tay lỡ',49),(536,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,'vx04tG.jpg','0agiYujh',12000,'Xám,M,Vải Cotton,Tay ngắn',49),(537,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'hJZfiMtM',12000,'Xám,M,Vải Cotton,Tay lỡ',49),(538,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',85000,NULL,'IM2Iahsx',12000,'Xám,M,Vải Corolan,Tay ngắn',49),(539,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'eLtISgqd',12000,'Xám,M,Vải Corolan,Tay lỡ',49),(544,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'6PZEVfsV',11999,'Xám,XL,Vải Cotton,Tay ngắn',49),(545,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'0ASPLVXb',12000,'Xám,XL,Vải Cotton,Tay lỡ',49),(546,'2024-01-01 16:14:12','2023-12-09 05:47:44','admin9193','admin9193','ACTIVE',79000,NULL,'CM0ykSbH',12000,'Xám,XL,Vải Corolan,Tay ngắn',49),(547,'2023-12-25 14:16:34','2023-12-09 05:47:44','admin9193','admin9193','ACTIVE',80000,NULL,'tC69Ws4R',11996,'Xám,XL,Vải Corolan,Tay lỡ',49),(548,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'fC7eFF4G',12000,'Xám,XXL,Vải Cotton,Tay ngắn',49),(549,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',89000,NULL,'DuaEb5y8',12000,'Xám,XXL,Vải Cotton,Tay lỡ',49),(550,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'HSyJiHhj',12000,'Xám,XXL,Vải Corolan,Tay ngắn',49),(551,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'t62oHqeu',12000,'Xám,XXL,Vải Corolan,Tay lỡ',49),(552,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,'T5jKFR.jpg','xtb4ZkBv',12000,'Trắng,M,Vải Cotton,Tay ngắn',49),(553,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'mUucIbrP',12000,'Trắng,M,Vải Cotton,Tay lỡ',49),(554,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',80000,NULL,'ngrWrdGr',12000,'Trắng,M,Vải Corolan,Tay ngắn',49),(555,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE',79000,NULL,'I2nmHH4D',12000,'Trắng,M,Vải Corolan,Tay lỡ',49),(560,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',79000,NULL,'Mxihd7Tq',12000,'Trắng,XL,Vải Cotton,Tay ngắn',49),(561,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',89000,NULL,'EVAR3YLb',12000,'Trắng,XL,Vải Cotton,Tay lỡ',49),(562,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',79000,NULL,'eDXWYTI1',12000,'Trắng,XL,Vải Corolan,Tay ngắn',49),(563,'2023-12-31 06:31:37','2023-12-09 05:47:45','admin9193','admin9193','ACTIVE',79000,NULL,'Ka3ncRzp',11997,'Trắng,XL,Vải Corolan,Tay lỡ',49),(564,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',79000,NULL,'n3FYOMsF',12000,'Trắng,XXL,Vải Cotton,Tay ngắn',49),(565,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',80000,NULL,'07jIkdqi',12000,'Trắng,XXL,Vải Cotton,Tay lỡ',49),(566,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',85000,NULL,'DV0DgbZy',12000,'Trắng,XXL,Vải Corolan,Tay ngắn',49),(567,NULL,'2023-12-09 05:47:45',NULL,'admin9193','ACTIVE',79000,NULL,'vQiacqZL',12000,'Trắng,XXL,Vải Corolan,Tay lỡ',49),(568,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE',200000,NULL,'gAbxQi1q',12000,'Đỏ',50),(569,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE',210000,NULL,'xQWY6z0B',12000,'Xanh',50),(574,'2024-01-12 16:54:14','2023-12-18 07:46:17','admin9193','admin9193','ACTIVE',190000,NULL,'Lt27ypYY',11989,'S',56),(575,'2024-01-02 04:04:22','2023-12-18 07:46:17','admin9193','admin9193','ACTIVE',190000,NULL,'6F4mcAEb',11993,'XL',56),(576,'2024-01-10 09:09:22','2023-12-19 04:44:28','admin9193','admin9193','ACTIVE',200000,NULL,'DHrWL9DS',11991,'XS,Xanh',57),(577,'2023-12-31 07:14:29','2023-12-19 04:44:28','admin9193','admin9193','ACTIVE',200000,NULL,'qqmLI09J',11997,'XS,Đỏ',57),(578,'2023-12-19 05:15:11','2023-12-19 04:44:28','admin9193','admin9193','ACTIVE',200000,NULL,'LAEemhRN',11999,'XXL,Xanh',57),(579,'2024-01-02 04:04:22','2023-12-19 04:44:28','admin9193','admin9193','ACTIVE',200000,NULL,'D3soJoCH',11994,'XXL,Đỏ',57),(580,'2023-12-31 07:49:48','2023-12-19 05:54:26','admin9193','admin9193','ACTIVE',250000,NULL,'jWKUuN3b',15000,'S',58),(581,'2023-12-31 10:30:02','2023-12-19 05:54:26','admin9193','admin9193','ACTIVE',250000,NULL,'X2HOvgsm',14999,'M',58),(582,'2023-12-31 14:53:56','2023-12-19 05:54:26','admin9193','admin9193','ACTIVE',250000,NULL,'z0Q9YCNO',15000,'L',58),(591,NULL,'2023-12-19 08:38:09',NULL,'admin9193','ACTIVE',120000,NULL,'MhzuNEW2',15000,'Đen',61),(604,'2024-01-01 16:31:42','2024-01-01 03:33:46','admin9193','admin9193','ACTIVE',254000,NULL,'98DQrsZC',15000,'S',62),(605,'2024-01-10 09:09:22','2024-01-01 03:33:46','admin9193','admin9193','ACTIVE',423000,NULL,'SL7QmAfm',14999,'XL',62),(634,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE',300000,NULL,'fkgjtmne',1999,'Đen',40),(641,'2024-01-11 15:32:53','2024-01-10 09:28:04','admin9193','admin9193','ACTIVE',169000,NULL,'2iZlkJXm',299,'Ghi,50-60kg',69),(642,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'EI00r3eV',160,'Ghi,60-70kg',69),(643,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'AuaAOGzX',210,'Ghi,70-80kg',69),(644,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'SWDPigAI',300,'Xanh than,50-60kg',69),(645,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'mgxKndiO',250,'Xanh than,60-70kg',69),(646,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'MLXVGuyA',210,'Xanh than,70-80kg',69),(647,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'scZ5fRnQ',300,'Nâu,50-60kg',69),(648,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'tc00ZV8E',160,'Nâu,60-70kg',69),(649,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'LNGuatpJ',250,'Nâu,70-80kg',69),(650,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'QaBoPt4M',300,'Xanh tím,50-60kg',69),(651,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'fM3GXnbJ',210,'Xanh tím,60-70kg',69),(652,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE',169000,NULL,'pHLRHIlk',160,'Xanh tím,70-80kg',69),(694,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',200000,NULL,'5eW9BqsD',15000,'S,Đỏ',59),(695,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',210000,NULL,'X6CtIW5X',15000,'S,Đen',59),(696,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',210000,NULL,'q1kmVJX4',15000,'S,Trắng',59),(697,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',200000,NULL,'M785g52J',14999,'XS,Đỏ',59),(698,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',190000,NULL,'aLN9R5xZ',15000,'XS,Đen',59),(699,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE',210000,NULL,'JVEsiMFe',15000,'XS,Trắng',59),(700,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'k4D9YLoh',100,'Đen,S,Cotton',64),(701,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'1IIBquNL',23,'Đen,S,Nhung tăm',64),(702,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'HSRMfW0V',100,'Đen,L,Cotton',64),(703,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'ESniGghd',65,'Đen,L,Nhung tăm',64),(704,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'3TCYKJZ2',100,'Đen,XXL,Cotton',64),(705,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'E80a6igg',45,'Đen,XXL,Nhung tăm',64),(706,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'TQkGX8Qn',119,'Đen,XL,Cotton',64),(707,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'cFJqLTNU',21,'Đen,XL,Nhung tăm',64),(708,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'gZUYWauR',100,'Xanh lá,S,Cotton',64),(709,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'QlKqVVfJ',75,'Xanh lá,S,Nhung tăm',64),(710,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'xNUEpihH',120,'Xanh lá,L,Cotton',64),(711,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'94huuccE',45,'Xanh lá,L,Nhung tăm',64),(712,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'9TkCYOSM',149,'Xanh lá,XXL,Cotton',64),(713,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'KAQ77DCZ',54,'Xanh lá,XXL,Nhung tăm',64),(714,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'Y1uWUWUv',150,'Xanh lá,XL,Cotton',64),(715,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'TAcSYB5e',0,'Xanh lá,XL,Nhung tăm',64),(716,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'pniEfFUP',120,'Xanh dương,S,Cotton',64),(717,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'BpRnYexp',12,'Xanh dương,S,Nhung tăm',64),(718,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'mRUdhvQN',150,'Xanh dương,L,Cotton',64),(719,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',170000,NULL,'b09gTVI2',18,'Xanh dương,L,Nhung tăm',64),(720,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',160000,NULL,'QExUkURe',120,'Xanh dương,XXL,Cotton',64),(721,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'poN8TzjB',15,'Xanh dương,XXL,Nhung tăm',64),(722,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE',150000,NULL,'mTLB8tJ6',149,'Xanh dương,XL,Cotton',64),(723,'2024-01-12 09:18:08','2024-01-11 16:43:01','admin9193','admin9193','ACTIVE',150000,NULL,'3qajOaWO',148,'Xanh dương,XL,Nhung tăm',64),(724,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'aC2zh3vP',11997,'Đen,M,Vải Cotton,Vòng',46),(725,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',250000,NULL,'W72UWbsf',12000,'Đen,M,Vải Corona,Vòng',46),(726,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',245000,NULL,'2AyPlyQe',11999,'Đen,L,Vải Cotton,Vòng',46),(727,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',250000,NULL,'GcUnHdrQ',11999,'Đen,L,Vải Corona,Vòng',46),(728,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'6DmndqtK',12000,'Đen,XL,Vải Cotton,Vòng',46),(729,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'FgOEvmYB',11999,'Đen,XL,Vải Corona,Vòng',46),(730,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',255000,NULL,'7SYVPftT',12000,'Đen,S,Vải Cotton,Vòng',46),(731,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'MdWCN0fl',12000,'Đen,S,Vải Corona,Vòng',46),(732,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',250000,NULL,'Mh3vgHEh',11999,'Be,M,Vải Cotton,Vòng',46),(733,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'n8y4aiWI',12000,'Be,M,Vải Corona,Vòng',46),(734,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',255000,NULL,'shBQpGAN',12000,'Be,L,Vải Cotton,Vòng',46),(735,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',250000,NULL,'5zzkBTfZ',12000,'Be,L,Vải Corona,Vòng',46),(736,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',250000,NULL,'aBmhFUXa',11998,'Be,XL,Vải Cotton,Vòng',46),(737,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',245000,NULL,'JhL1VAol',12000,'Be,XL,Vải Corona,Vòng',46),(738,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'J8EzizzZ',12000,'Be,S,Vải Cotton,Vòng',46),(739,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE',249000,NULL,'7hzBe8iQ',12000,'Be,S,Vải Corona,Vòng',46),(740,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE',230000,NULL,'8ihl4voU',14998,'Đỏ,XS,Rách',60),(741,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE',240000,NULL,'6t8aEVkT',15000,'Đỏ,XL,Rách',60),(742,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE',230000,NULL,'o39hjvzl',15000,'Đen,XS,Rách',60),(743,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE',230000,NULL,'ertXXSmp',14998,'Đen,XL,Rách',60),(788,'2024-01-13 18:36:30','2024-01-12 16:18:36','admin9193','admin9193','ACTIVE',150000,NULL,'xzt0nFzq',147,'Đen,M',68),(789,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'85PProjG',150,'Đen,L',68),(790,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'91jfeDSG',150,'Đen,XL',68),(791,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'5XeCcxxm',150,'Đen,S',68),(792,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'DSWehv0Z',150,'Trắng,M',68),(793,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'7CUx2oTl',150,'Trắng,L',68),(794,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'bayv4WLU',150,'Trắng,XL',68),(795,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE',199000,NULL,'uGhAfhbF',150,'Trắng,S',68),(796,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',210000,NULL,'xgBVgJGX',11986,'Xanh,Xl',51),(797,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',190000,NULL,'rTJRpYfL',11985,'Xanh,L',51),(798,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',190000,NULL,'RbdVv6Ru',12,'Xanh,S',51),(799,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',190000,NULL,'QPlxJK88',11999,'Đỏ,Xl',51),(800,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',190000,NULL,'uNcphaV7',11968,'Đỏ,L',51),(801,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE',190000,NULL,'3M4tDuNG',14,'Đỏ,S',51),(802,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'5nfonSp8',11999,'Xanh,M,Vải Cotton,Địa Cầu,Dài',48),(803,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'A6ueeGtv',12000,'Xanh,M,Vải Cotton,Mặt Trăng,Dài',48),(804,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'I2A5uVuD',12000,'Xanh,M,Vải Cotton,Bầu Trời,Dài',48),(805,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'KN0j7nIk',12000,'Xanh,M,Vải Cotton,Họa Hình,Dài',48),(806,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'nkEUge5x',12000,'Xanh,M,Vải Kate,Địa Cầu,Dài',48),(807,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'dsD1QaUg',12000,'Xanh,M,Vải Kate,Mặt Trăng,Dài',48),(808,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'A4cWugn9',12000,'Xanh,M,Vải Kate,Bầu Trời,Dài',48),(809,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'AI6GW7Cq',12000,'Xanh,M,Vải Kate,Họa Hình,Dài',48),(810,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'91FdRUGV',12000,'Xanh,M,Vải Visco,Địa Cầu,Dài',48),(811,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',144000,NULL,'HNO5uBrG',12000,'Xanh,M,Vải Visco,Mặt Trăng,Dài',48),(812,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'bUyxKhHv',12000,'Xanh,M,Vải Visco,Bầu Trời,Dài',48),(813,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',149000,NULL,'ezNKjkvm',12000,'Xanh,M,Vải Visco,Họa Hình,Dài',48),(814,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'imnXA59Z',11998,'Xanh,L,Vải Cotton,Địa Cầu,Dài',48),(815,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'V0K1F1C8',12000,'Xanh,L,Vải Cotton,Mặt Trăng,Dài',48),(816,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'W3G3jNND',12000,'Xanh,L,Vải Cotton,Bầu Trời,Dài',48),(817,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'TM1esnWI',12000,'Xanh,L,Vải Cotton,Họa Hình,Dài',48),(818,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'1WiLpsPG',12000,'Xanh,L,Vải Kate,Địa Cầu,Dài',48),(819,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'NnAFgJBN',12000,'Xanh,L,Vải Kate,Mặt Trăng,Dài',48),(820,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'Aq2MTrCF',12000,'Xanh,L,Vải Kate,Bầu Trời,Dài',48),(821,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'7z8lzXrU',12000,'Xanh,L,Vải Kate,Họa Hình,Dài',48),(822,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'RZnS2yVH',12000,'Xanh,L,Vải Visco,Địa Cầu,Dài',48),(823,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'b2W6R4Wn',12000,'Xanh,L,Vải Visco,Mặt Trăng,Dài',48),(824,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'joDB0bkq',12000,'Xanh,L,Vải Visco,Bầu Trời,Dài',48),(825,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'gD4Y84ef',12000,'Xanh,L,Vải Visco,Họa Hình,Dài',48),(826,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'5CcQa5hT',12000,'Xanh,XL,Vải Cotton,Địa Cầu,Dài',48),(827,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'tLa62xek',12000,'Xanh,XL,Vải Cotton,Mặt Trăng,Dài',48),(828,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'lcfWrPe1',12000,'Xanh,XL,Vải Cotton,Bầu Trời,Dài',48),(829,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'R9I4tj47',12000,'Xanh,XL,Vải Cotton,Họa Hình,Dài',48),(830,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'djsy9Vo6',12000,'Xanh,XL,Vải Kate,Địa Cầu,Dài',48),(831,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'54Qx38g3',11997,'Xanh,XL,Vải Kate,Mặt Trăng,Dài',48),(832,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'tu9X3XLN',12000,'Xanh,XL,Vải Kate,Bầu Trời,Dài',48),(833,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'qOzpAdyp',12000,'Xanh,XL,Vải Kate,Họa Hình,Dài',48),(834,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',139000,NULL,'RHFpOYzb',12000,'Xanh,XL,Vải Visco,Địa Cầu,Dài',48),(835,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'nvDjOSfD',12000,'Xanh,XL,Vải Visco,Mặt Trăng,Dài',48),(836,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'7jRKG6Yp',12000,'Xanh,XL,Vải Visco,Bầu Trời,Dài',48),(837,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',138000,NULL,'tlFx31pj',12000,'Xanh,XL,Vải Visco,Họa Hình,Dài',48),(838,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'Lq6Xzsrg',12000,'Xanh,XXL,Vải Cotton,Địa Cầu,Dài',48),(839,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',138000,NULL,'Q9blYHrA',12000,'Xanh,XXL,Vải Cotton,Mặt Trăng,Dài',48),(840,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'s3e9m86m',12000,'Xanh,XXL,Vải Cotton,Bầu Trời,Dài',48),(841,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'NbHQsBmc',12000,'Xanh,XXL,Vải Cotton,Họa Hình,Dài',48),(842,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'9y3vKvPk',12000,'Xanh,XXL,Vải Kate,Địa Cầu,Dài',48),(843,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'ntAXpsUY',12000,'Xanh,XXL,Vải Kate,Mặt Trăng,Dài',48),(844,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'VYPvXPsz',12000,'Xanh,XXL,Vải Kate,Bầu Trời,Dài',48),(845,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'Sjn9SESV',12000,'Xanh,XXL,Vải Kate,Họa Hình,Dài',48),(846,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'lQfehRAW',12000,'Xanh,XXL,Vải Visco,Địa Cầu,Dài',48),(847,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'3kGkSmAN',12000,'Xanh,XXL,Vải Visco,Mặt Trăng,Dài',48),(848,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'SEsRDSvd',12000,'Xanh,XXL,Vải Visco,Bầu Trời,Dài',48),(849,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'KzdhFdpg',12000,'Xanh,XXL,Vải Visco,Họa Hình,Dài',48),(850,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',145000,NULL,'uIAltRTi',11998,'Hồng,M,Vải Cotton,Địa Cầu,Dài',48),(851,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'UiYqOrAx',12000,'Hồng,M,Vải Cotton,Mặt Trăng,Dài',48),(852,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',138000,NULL,'vX7f4Tj7',12000,'Hồng,M,Vải Cotton,Bầu Trời,Dài',48),(853,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',139000,NULL,'ZTf6ukUD',12000,'Hồng,M,Vải Cotton,Họa Hình,Dài',48),(854,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'G24F6NMz',12000,'Hồng,M,Vải Kate,Địa Cầu,Dài',48),(855,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'4cF3HrN1',12000,'Hồng,M,Vải Kate,Mặt Trăng,Dài',48),(856,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',135000,NULL,'aaUpxV2T',12000,'Hồng,M,Vải Kate,Bầu Trời,Dài',48),(857,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE',140000,NULL,'XajCGZm2',12000,'Hồng,M,Vải Kate,Họa Hình,Dài',48),(858,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'gu5jPmPh',12000,'Hồng,M,Vải Visco,Địa Cầu,Dài',48),(859,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'cWP1iUCv',12000,'Hồng,M,Vải Visco,Mặt Trăng,Dài',48),(860,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'EeyEq3WL',12000,'Hồng,M,Vải Visco,Bầu Trời,Dài',48),(861,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'f4qqEjQj',12000,'Hồng,M,Vải Visco,Họa Hình,Dài',48),(862,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'r2MLKsci',11999,'Hồng,L,Vải Cotton,Địa Cầu,Dài',48),(863,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'8s2Vqs33',12000,'Hồng,L,Vải Cotton,Mặt Trăng,Dài',48),(864,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'YsOT3eno',12000,'Hồng,L,Vải Cotton,Bầu Trời,Dài',48),(865,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'AdntN5ED',12000,'Hồng,L,Vải Cotton,Họa Hình,Dài',48),(866,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'4yO1fcQH',12000,'Hồng,L,Vải Kate,Địa Cầu,Dài',48),(867,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'Gb3OQp24',12000,'Hồng,L,Vải Kate,Mặt Trăng,Dài',48),(868,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'kmu7rvg8',12000,'Hồng,L,Vải Kate,Bầu Trời,Dài',48),(869,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'HEGYxoH8',12000,'Hồng,L,Vải Kate,Họa Hình,Dài',48),(870,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'JVkec917',12000,'Hồng,L,Vải Visco,Địa Cầu,Dài',48),(871,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'NqVfmEVc',12000,'Hồng,L,Vải Visco,Mặt Trăng,Dài',48),(872,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'gMp2NnFi',12000,'Hồng,L,Vải Visco,Bầu Trời,Dài',48),(873,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'FpIttDfY',12000,'Hồng,L,Vải Visco,Họa Hình,Dài',48),(874,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'1faj8R3g',12000,'Hồng,XL,Vải Cotton,Địa Cầu,Dài',48),(875,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'3gdJmznp',12000,'Hồng,XL,Vải Cotton,Mặt Trăng,Dài',48),(876,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'8bMQIqCV',12000,'Hồng,XL,Vải Cotton,Bầu Trời,Dài',48),(877,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'nC7u7BQx',12000,'Hồng,XL,Vải Cotton,Họa Hình,Dài',48),(878,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'cki41GeK',12000,'Hồng,XL,Vải Kate,Địa Cầu,Dài',48),(879,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'7zyamzlk',12000,'Hồng,XL,Vải Kate,Mặt Trăng,Dài',48),(880,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'LmKqbdhG',12000,'Hồng,XL,Vải Kate,Bầu Trời,Dài',48),(881,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'jtp3x6tO',12000,'Hồng,XL,Vải Kate,Họa Hình,Dài',48),(882,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'XnAl1Gc1',12000,'Hồng,XL,Vải Visco,Địa Cầu,Dài',48),(883,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'NhkHZsqQ',12000,'Hồng,XL,Vải Visco,Mặt Trăng,Dài',48),(884,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',13900,NULL,'rdjMkrlV',12000,'Hồng,XL,Vải Visco,Bầu Trời,Dài',48),(885,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'zPXGqyYf',12000,'Hồng,XL,Vải Visco,Họa Hình,Dài',48),(886,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'t3DAC1lL',12000,'Hồng,XXL,Vải Cotton,Địa Cầu,Dài',48),(887,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'Z0TM8voU',12000,'Hồng,XXL,Vải Cotton,Mặt Trăng,Dài',48),(888,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'7VmsPiCd',12000,'Hồng,XXL,Vải Cotton,Bầu Trời,Dài',48),(889,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'2J3BtWKG',12000,'Hồng,XXL,Vải Cotton,Họa Hình,Dài',48),(890,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'NCayVmzj',12000,'Hồng,XXL,Vải Kate,Địa Cầu,Dài',48),(891,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'hLDumj1I',12000,'Hồng,XXL,Vải Kate,Mặt Trăng,Dài',48),(892,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'Ng0GdbPX',12000,'Hồng,XXL,Vải Kate,Bầu Trời,Dài',48),(893,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'3qm8P5Hs',12000,'Hồng,XXL,Vải Kate,Họa Hình,Dài',48),(894,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'jtlmqMeA',12000,'Hồng,XXL,Vải Visco,Địa Cầu,Dài',48),(895,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'n5C7Ad8Y',12000,'Hồng,XXL,Vải Visco,Mặt Trăng,Dài',48),(896,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'hdbiLtQe',11999,'Hồng,XXL,Vải Visco,Bầu Trời,Dài',48),(897,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'0yzrP3n2',12000,'Hồng,XXL,Vải Visco,Họa Hình,Dài',48),(898,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'JYCIEAyU',12000,'Trắng,M,Vải Cotton,Địa Cầu,Dài',48),(899,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'9gkVVURy',12000,'Trắng,M,Vải Cotton,Mặt Trăng,Dài',48),(900,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'5UtclQZ3',12000,'Trắng,M,Vải Cotton,Bầu Trời,Dài',48),(901,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'rrdqdQrE',12000,'Trắng,M,Vải Cotton,Họa Hình,Dài',48),(902,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'XesnmKTv',12000,'Trắng,M,Vải Kate,Địa Cầu,Dài',48),(903,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'EVKeYcie',12000,'Trắng,M,Vải Kate,Mặt Trăng,Dài',48),(904,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'Izd0JqHH',12000,'Trắng,M,Vải Kate,Bầu Trời,Dài',48),(905,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'kYWXhmjd',12000,'Trắng,M,Vải Kate,Họa Hình,Dài',48),(906,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'CtTZXlFW',12000,'Trắng,M,Vải Visco,Địa Cầu,Dài',48),(907,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'yPtL8aeZ',12000,'Trắng,M,Vải Visco,Mặt Trăng,Dài',48),(908,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'W3PQ1Him',12000,'Trắng,M,Vải Visco,Bầu Trời,Dài',48),(909,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'shPdsFaJ',12000,'Trắng,M,Vải Visco,Họa Hình,Dài',48),(910,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'pAFZXodP',12000,'Trắng,L,Vải Cotton,Địa Cầu,Dài',48),(911,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'MSsakqb5',12000,'Trắng,L,Vải Cotton,Mặt Trăng,Dài',48),(912,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'Gloyq9gc',12000,'Trắng,L,Vải Cotton,Bầu Trời,Dài',48),(913,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'l93u7j1u',12000,'Trắng,L,Vải Cotton,Họa Hình,Dài',48),(914,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'9C6WYLaZ',12000,'Trắng,L,Vải Kate,Địa Cầu,Dài',48),(915,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'pvCQRJOT',12000,'Trắng,L,Vải Kate,Mặt Trăng,Dài',48),(916,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'Rtu1dCsg',12000,'Trắng,L,Vải Kate,Bầu Trời,Dài',48),(917,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'8fN5Acd5',12000,'Trắng,L,Vải Kate,Họa Hình,Dài',48),(918,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'H35YJuPH',12000,'Trắng,L,Vải Visco,Địa Cầu,Dài',48),(919,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'L7W0ELkB',12000,'Trắng,L,Vải Visco,Mặt Trăng,Dài',48),(920,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'BBjOUxO6',12000,'Trắng,L,Vải Visco,Bầu Trời,Dài',48),(921,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'VXptop67',12000,'Trắng,L,Vải Visco,Họa Hình,Dài',48),(922,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'gRbAqmX7',12000,'Trắng,XL,Vải Cotton,Địa Cầu,Dài',48),(923,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'MYI1zksl',12000,'Trắng,XL,Vải Cotton,Mặt Trăng,Dài',48),(924,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'FlW5ODaj',12000,'Trắng,XL,Vải Cotton,Bầu Trời,Dài',48),(925,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'c9MNYs0A',12000,'Trắng,XL,Vải Cotton,Họa Hình,Dài',48),(926,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'7ZbzpyLh',12000,'Trắng,XL,Vải Kate,Địa Cầu,Dài',48),(927,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'Ka4VaznB',12000,'Trắng,XL,Vải Kate,Mặt Trăng,Dài',48),(928,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'dt1EHPst',12000,'Trắng,XL,Vải Kate,Bầu Trời,Dài',48),(929,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'HtYrgLgh',12000,'Trắng,XL,Vải Kate,Họa Hình,Dài',48),(930,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'gcKlUKbU',12000,'Trắng,XL,Vải Visco,Địa Cầu,Dài',48),(931,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'2ZNhCy2G',12000,'Trắng,XL,Vải Visco,Mặt Trăng,Dài',48),(932,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'FJvnQoYl',11999,'Trắng,XL,Vải Visco,Bầu Trời,Dài',48),(933,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'jKc8RhSA',12000,'Trắng,XL,Vải Visco,Họa Hình,Dài',48),(934,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'DYqrfmlO',12000,'Trắng,XXL,Vải Cotton,Địa Cầu,Dài',48),(935,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'oogeKaMG',12000,'Trắng,XXL,Vải Cotton,Mặt Trăng,Dài',48),(936,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'XSPSch3c',12000,'Trắng,XXL,Vải Cotton,Bầu Trời,Dài',48),(937,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'ozT0fBXh',12000,'Trắng,XXL,Vải Cotton,Họa Hình,Dài',48),(938,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'fKQd84go',12000,'Trắng,XXL,Vải Kate,Địa Cầu,Dài',48),(939,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'dUQLA94u',12000,'Trắng,XXL,Vải Kate,Mặt Trăng,Dài',48),(940,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'Y99fTQXx',12000,'Trắng,XXL,Vải Kate,Bầu Trời,Dài',48),(941,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'ij94pWRZ',12000,'Trắng,XXL,Vải Kate,Họa Hình,Dài',48),(942,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'0q8RizVt',12000,'Trắng,XXL,Vải Visco,Địa Cầu,Dài',48),(943,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'cAgkZrDe',12000,'Trắng,XXL,Vải Visco,Mặt Trăng,Dài',48),(944,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'cQ3lVBVV',12000,'Trắng,XXL,Vải Visco,Bầu Trời,Dài',48),(945,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'5ilWyOdq',12000,'Trắng,XXL,Vải Visco,Họa Hình,Dài',48),(946,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'iaJGiBrg',12000,'Đen,M,Vải Cotton,Địa Cầu,Dài',48),(947,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'givGxJFK',12000,'Đen,M,Vải Cotton,Mặt Trăng,Dài',48),(948,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'M8g4dyCg',12000,'Đen,M,Vải Cotton,Bầu Trời,Dài',48),(949,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'yb5I8Ari',12000,'Đen,M,Vải Cotton,Họa Hình,Dài',48),(950,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'dcdAGcFE',12000,'Đen,M,Vải Kate,Địa Cầu,Dài',48),(951,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'EpPQGjsu',12000,'Đen,M,Vải Kate,Mặt Trăng,Dài',48),(952,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'zdPZMqE8',12000,'Đen,M,Vải Kate,Bầu Trời,Dài',48),(953,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'tDhdfuq7',12000,'Đen,M,Vải Kate,Họa Hình,Dài',48),(954,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'NgFNheJK',12000,'Đen,M,Vải Visco,Địa Cầu,Dài',48),(955,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'kqWudacH',12000,'Đen,M,Vải Visco,Mặt Trăng,Dài',48),(956,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'FGohcqzo',12000,'Đen,M,Vải Visco,Bầu Trời,Dài',48),(957,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'agDo4QnA',12000,'Đen,M,Vải Visco,Họa Hình,Dài',48),(958,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'EYYVT9iI',12000,'Đen,L,Vải Cotton,Địa Cầu,Dài',48),(959,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'D5DyXhYy',12000,'Đen,L,Vải Cotton,Mặt Trăng,Dài',48),(960,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'64QNm1Qc',12000,'Đen,L,Vải Cotton,Bầu Trời,Dài',48),(961,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'cQa1Hr8T',12000,'Đen,L,Vải Cotton,Họa Hình,Dài',48),(962,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'IyHa11AH',12000,'Đen,L,Vải Kate,Địa Cầu,Dài',48),(963,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'5JuTvd8Z',12000,'Đen,L,Vải Kate,Mặt Trăng,Dài',48),(964,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'OQ6qt9l5',12000,'Đen,L,Vải Kate,Bầu Trời,Dài',48),(965,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'mBjE9krA',12000,'Đen,L,Vải Kate,Họa Hình,Dài',48),(966,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'nRSR4LYd',12000,'Đen,L,Vải Visco,Địa Cầu,Dài',48),(967,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'DLYvFZPn',12000,'Đen,L,Vải Visco,Mặt Trăng,Dài',48),(968,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'KlcQeDWn',12000,'Đen,L,Vải Visco,Bầu Trời,Dài',48),(969,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'33RLIJMp',12000,'Đen,L,Vải Visco,Họa Hình,Dài',48),(970,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'QDp6FIJE',12000,'Đen,XL,Vải Cotton,Địa Cầu,Dài',48),(971,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'WsCNz3OI',12000,'Đen,XL,Vải Cotton,Mặt Trăng,Dài',48),(972,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'ogHcjJgV',12000,'Đen,XL,Vải Cotton,Bầu Trời,Dài',48),(973,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'EPtgpcbG',12000,'Đen,XL,Vải Cotton,Họa Hình,Dài',48),(974,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'yWmXekYW',12000,'Đen,XL,Vải Kate,Địa Cầu,Dài',48),(975,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'36A3zItT',12000,'Đen,XL,Vải Kate,Mặt Trăng,Dài',48),(976,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'qg7oa8ZS',12000,'Đen,XL,Vải Kate,Bầu Trời,Dài',48),(977,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'lQi8Tauz',12000,'Đen,XL,Vải Kate,Họa Hình,Dài',48),(978,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'9WMvWhYN',12000,'Đen,XL,Vải Visco,Địa Cầu,Dài',48),(979,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'k8uo5Hcm',12000,'Đen,XL,Vải Visco,Mặt Trăng,Dài',48),(980,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'JJ0pS14X',12000,'Đen,XL,Vải Visco,Bầu Trời,Dài',48),(981,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'9LUllBMX',12000,'Đen,XL,Vải Visco,Họa Hình,Dài',48),(982,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'vOBuGFyO',12000,'Đen,XXL,Vải Cotton,Địa Cầu,Dài',48),(983,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'uRnLJVSW',12000,'Đen,XXL,Vải Cotton,Mặt Trăng,Dài',48),(984,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'tXLUtxpO',12000,'Đen,XXL,Vải Cotton,Bầu Trời,Dài',48),(985,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'8Gl8TWXo',12000,'Đen,XXL,Vải Cotton,Họa Hình,Dài',48),(986,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'14RZstU5',12000,'Đen,XXL,Vải Kate,Địa Cầu,Dài',48),(987,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'46ZdJFIV',12000,'Đen,XXL,Vải Kate,Mặt Trăng,Dài',48),(988,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',140000,NULL,'Gzb6riNH',12000,'Đen,XXL,Vải Kate,Bầu Trời,Dài',48),(989,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'WZHj6jMg',12000,'Đen,XXL,Vải Kate,Họa Hình,Dài',48),(990,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',145000,NULL,'d2ep6yBZ',12000,'Đen,XXL,Vải Visco,Địa Cầu,Dài',48),(991,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'0liAENjo',12000,'Đen,XXL,Vải Visco,Mặt Trăng,Dài',48),(992,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',139000,NULL,'PXYYjsPl',12000,'Đen,XXL,Vải Visco,Bầu Trời,Dài',48),(993,NULL,'2024-01-12 16:31:46',NULL,'admin9193','ACTIVE',135000,NULL,'xzz6J21f',12000,'Đen,XXL,Vải Visco,Họa Hình,Dài',48),(994,'2024-01-12 17:07:04','2024-01-12 17:02:35','admin9193','admin9193','ACTIVE',342000,NULL,'pMYmIa0e',14998,'S,Đen',63),(995,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE',342000,NULL,'I5H2iWqx',14999,'S,Trắng',63),(996,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE',399000,NULL,'uG42IHmW',14999,'XL,Đen',63),(997,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE',342000,NULL,'srexJuF6',14999,'XL,Trắng',63),(1094,'2024-01-14 08:56:42','2024-01-12 18:10:42','admin9193','admin9193','ACTIVE',300000,NULL,'XuAW61mX',146,'Be,L,Da',65),(1095,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE',230000,NULL,'4vXLTh4K',120,'Be,XL,Da',65),(1096,'2024-01-13 18:49:35','2024-01-13 07:32:13','admin9193','admin9193','ACTIVE',300000,NULL,'OAd6vjtX',200,'Đen,M 40-52KG,Cotton,Dài',70),(1098,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'WeubksXF',500,'Đen,L 52-60KG,Cotton,Dài',70),(1104,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'yRjWeU1K',500,'Than,M 40-52KG,Cotton,Dài',70),(1106,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'Q6foPm72',500,'Than,L 52-60KG,Cotton,Dài',70),(1112,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'AqU6gqI1',500,'Ghi,M 40-52KG,Cotton,Dài',70),(1114,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'UiVBD8lT',500,'Ghi,L 52-60KG,Cotton,Dài',70),(1120,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'ABNtHyxh',500,'Trắng,M 40-52KG,Cotton,Dài',70),(1122,NULL,'2024-01-13 07:32:14',NULL,'admin9193','ACTIVE',290000,NULL,'ixRR4zHv',500,'Trắng,L 52-60KG,Cotton,Dài',70),(1146,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',210000,NULL,'hmsC5KMs',20,'Đen,S,Dài,Thêu',45),(1147,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',220000,NULL,'GMYFXZ00',10,'Đen,S,Ngắn,Thêu',45),(1148,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',230000,NULL,'MAjeW6Qi',20,'Đen,M,Dài,Thêu',45),(1149,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',240000,NULL,'sBe9kTgV',30,'Đen,M,Ngắn,Thêu',45),(1150,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'L8TJsCA9',20,'Đen,XL,Dài,Thêu',45),(1151,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',230000,NULL,'A84hk6m9',20,'Đen,XL,Ngắn,Thêu',45),(1152,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'JkavUSac',30,'Trắng,S,Dài,Thêu',45),(1153,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'KeroujQN',20,'Trắng,S,Ngắn,Thêu',45),(1154,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',230000,NULL,'vGN6v2rS',10,'Trắng,M,Dài,Thêu',45),(1155,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'AKMMvC9H',30,'Trắng,M,Ngắn,Thêu',45),(1156,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',240000,NULL,'FRMYhqsT',20,'Trắng,XL,Dài,Thêu',45),(1157,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'RozErLLJ',30,'Trắng,XL,Ngắn,Thêu',45),(1158,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',240000,NULL,'tyezMH2O',30,'Xám,S,Dài,Thêu',45),(1159,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'zD7zdJiA',10,'Xám,S,Ngắn,Thêu',45),(1160,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'qxigjvRn',20,'Xám,M,Dài,Thêu',45),(1161,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',230000,NULL,'NU6UDyGU',10,'Xám,M,Ngắn,Thêu',45),(1162,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'rf6A56vq',30,'Xám,XL,Dài,Thêu',45),(1163,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE',200000,NULL,'tYTTGzi1',20,'Xám,XL,Ngắn,Thêu',45),(1172,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,NULL,'IikThWY2',300,'S,Đen',71),(1173,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,NULL,'SYlKHDC1',300,'S,Be',71),(1174,'2024-01-15 14:20:43','2024-01-13 19:08:29','admin9193','admin9193','ACTIVE',250000,NULL,'dmftzpn2',297,'M,Đen',71),(1175,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,NULL,'J5fWyJOz',300,'M,Be',71),(1176,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',250000,NULL,'qVvZNEh2',300,'L,Đen',71),(1177,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,NULL,'ivobXNkV',300,'L,Be',71),(1178,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,NULL,'RjdzqKZH',300,'XL,Đen',71),(1179,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',250000,NULL,'DjQasQDF',300,'XL,Be',71),(1180,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE',160000,NULL,'Q28WhQeL',200,'Hồng,M',72),(1181,'2024-01-14 14:30:29','2024-01-13 19:10:48','admin9193','admin9193','ACTIVE',170000,NULL,'MT7lD6k5',195,'Hồng,L',72),(1182,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE',150000,NULL,'u3bTPheZ',200,'Hồng,XL',72),(1186,'2024-01-14 18:23:35','2024-01-13 19:16:27','admin9193','admin9193','ACTIVE',100000,NULL,'5sGqgy17',100,'M,Trắng',74),(1187,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE',99000,NULL,'vAVrKqSu',100,'M,Xanh',74),(1189,'2024-01-15 18:47:28','2024-01-13 19:16:27','admin9193','admin9193','ACTIVE',100000,NULL,'yXoHDnBm',100,'L,Trắng',74),(1190,'2024-01-14 17:10:55','2024-01-13 19:16:27','admin9193','admin9193','ACTIVE',99000,NULL,'y6rf9756',100,'L,Xanh',74),(1192,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE',99000,NULL,'S1gKY8YR',100,'Xl,Trắng',74),(1193,'2024-01-15 14:19:12','2024-01-13 19:16:27','admin9193','admin9193','ACTIVE',99000,NULL,'XqK6I61U',99,'Xl,Xanh',74),(1195,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE',99000,NULL,'UFzPYD7q',100,'XXL,Trắng',74),(1196,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE',99000,NULL,'1jsa6bQu',100,'XXL,Xanh',74),(1198,'2024-01-15 19:20:38','2024-01-13 19:19:31','admin9193','admin9193','ACTIVE',400000,NULL,'0bqPggx2',149,'Đen,S',75),(1199,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',350000,NULL,'ga36Ym5M',150,'Đen,M',75),(1200,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'zhsoqK4y',150,'Đen,L',75),(1201,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'jYyMjVv2',150,'Đen,XL',75),(1202,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'06MrAs82',150,'Xám,S',75),(1203,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'QEeh5Ccl',150,'Xám,M',75),(1204,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',350000,NULL,'9pnthORH',150,'Xám,L',75),(1205,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'CCXK6Fdg',150,'Xám,XL',75),(1206,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',350000,NULL,'aGkxGrlu',150,'Xanh ngọc,S',75),(1207,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',339000,NULL,'32VlzP82',150,'Xanh ngọc,M',75),(1208,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',330000,NULL,'F1ZVnQ01',150,'Xanh ngọc,L',75),(1209,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE',339000,NULL,'yUeN9LTi',150,'Xanh ngọc,XL',75),(1217,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',180000,NULL,'NnRXKKyM',20,'Trắng,S,Tay lỡ',2),(1218,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',160000,NULL,'zrnJgUWP',12,'Trắng,M,Tay lỡ',2),(1222,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',180000,NULL,'k8ItYxWk',14,'Đen,S,Tay lỡ',2),(1223,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',160000,NULL,'kiKuHxHZ',18,'Đen,M,Tay lỡ',2),(1227,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',170000,NULL,'eqe8VCsJ',19,'Xanh,S,Tay lỡ',2),(1228,'2024-01-14 18:11:36','2024-01-14 09:12:32','admin9193','admin9193','ACTIVE',180000,NULL,'LSKWWrCd',12,'Xanh,M,Tay lỡ',2),(1238,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',89000,NULL,'5aeljlzA',15,'Trắng,M,Dài tay',4),(1239,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',99000,NULL,'FRgragSQ',20,'Trắng,L,Dài tay',4),(1240,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',110000,NULL,'iBq1o5xg',15,'Trắng,XL,Dài tay',4),(1242,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',99000,NULL,'ii897Oom',48,'Đen,M,Dài tay',4),(1243,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',99000,NULL,'4xJfea7Z',32,'Đen,L,Dài tay',4),(1244,'2024-01-16 06:40:12','2024-01-14 09:14:41','admin9193','admin9193','ACTIVE',99000,NULL,'cfRFZqBn',20,'Đen,XL,Dài tay',4),(1249,'2024-01-15 19:00:52','2024-01-14 10:10:07','admin9193','admin9193','ACTIVE',190000,NULL,'6dknEC3J',0,'XL,Đen',76),(1250,'2024-01-14 16:57:19','2024-01-14 10:10:07','admin9193','admin9193','ACTIVE',200000,NULL,'TtfOuWo2',14,'XL,Vàng',76),(1251,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE',190000,NULL,'ViduGmHX',10,'XS,Đen',76),(1252,'2024-01-15 19:20:38','2024-01-14 10:10:07','admin9193','admin9193','ACTIVE',210000,NULL,'jCLYB2yY',24,'XS,Vàng',76),(1262,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE',180000,NULL,'xWFDozZT',18,'Xanh,XS,Tay lỡ',2),(1263,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE',160000,NULL,'uoCIju2N',50,'Đen,XS,Tay lỡ',2),(1264,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE',180000,NULL,'zW136im9',19,'Trắng,XS,Tay lỡ',2),(1265,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE',75000,NULL,'cy94mTjK',12000,'Xanh dương,M',25),(1266,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE',79000,NULL,'LzaWtjLs',12000,'Đen,M',25),(1267,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE',75000,NULL,'KZ02cHqc',12000,'Trắng,M',25),(1268,'2024-01-15 16:23:22','2024-01-14 19:49:11','admin9193','admin9193','ACTIVE',140000,NULL,'XfsrCkAa',12,'Xanh Lá,M',77),(1269,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE',100000,NULL,'U7rV8n7s',18,'Xanh Lá,L',77),(1270,'2024-01-15 16:23:22','2024-01-14 19:49:11','admin9193','admin9193','ACTIVE',150000,NULL,'BMhXGrYV',15,'Xanh Lá,S',77),(1271,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE',100000,NULL,'H0nnBJMB',20,'Xanh Lá,XL',77),(1272,NULL,'2024-01-14 20:36:58',NULL,'admin9193','ACTIVE',400000,NULL,'IDLo8MlE',29,'Trắng,<65Kg',78),(1273,NULL,'2024-01-14 20:36:58',NULL,'admin9193','ACTIVE',400000,NULL,'gIlloEau',30,'Đen,<65Kg',78),(1274,NULL,'2024-01-14 20:36:58',NULL,'admin9193','ACTIVE',200000,NULL,'Var7UpbI',29,'Chì,<65Kg',78),(1275,NULL,'2024-01-14 20:36:58',NULL,'admin9193','ACTIVE',400000,NULL,'4MpfeMR1',30,'Be,<65Kg',78),(1276,NULL,'2024-01-14 20:36:58',NULL,'admin9193','ACTIVE',300000,NULL,'okV3ZAxL',30,'Xám,<65Kg',78),(1277,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',429000,NULL,'WcFVLDdi',39,'Đen,28',79),(1278,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',499000,NULL,'8PzvGiFk',47,'Đen,29',79),(1279,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',450000,NULL,'z4Ivep10',40,'Đen,30',79),(1280,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',429000,NULL,'hxXloCar',47,'Đen,31',79),(1281,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',499000,NULL,'gfHP0Ks6',40,'Đen,32',79),(1282,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',450000,NULL,'GYXBDDPq',47,'Đen,33',79),(1283,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',499000,NULL,'BsaoUB2c',40,'Xanh than,28',79),(1284,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE',450000,NULL,'eQ7cA8hB',47,'Xanh than,29',79),(1285,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',429000,NULL,'4GZOybLX',40,'Xanh than,30',79),(1286,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'sjHJWbUf',47,'Xanh than,31',79),(1287,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',450000,NULL,'uN0zWNr0',40,'Xanh than,32',79),(1288,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'ogSXGGmH',55,'Xanh than,33',79),(1289,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',450000,NULL,'xA9NH9DR',40,'Xám,28',79),(1290,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'ZWJCAnX9',55,'Xám,29',79),(1291,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',450000,NULL,'7co10ppi',40,'Xám,30',79),(1292,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',429000,NULL,'DCnEYfaA',50,'Xám,31',79),(1293,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'b343fLWv',40,'Xám,32',79),(1294,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'hKBvad0t',50,'Xám,33',79),(1295,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'fn5NmDEO',55,'Ghi,28',79),(1296,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'v1KW38yq',50,'Ghi,29',79),(1297,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'e0u7Pmg7',55,'Ghi,30',79),(1298,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'iZcQoehQ',55,'Ghi,31',79),(1299,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',429000,NULL,'8N5YoMFY',55,'Ghi,32',79),(1300,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'LyWHlQJd',50,'Ghi,33',79),(1301,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'5r24rWfn',50,'Trắng,28',79),(1302,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'t2OVDtLJ',50,'Trắng,29',79),(1303,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'3TRabWo5',55,'Trắng,30',79),(1304,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',429000,NULL,'Z7RUSg9m',50,'Trắng,31',79),(1305,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',499000,NULL,'7XjThUlM',55,'Trắng,32',79),(1306,NULL,'2024-01-14 20:57:15',NULL,'admin9193','ACTIVE',429000,NULL,'DnjZNNYg',49,'Trắng,33',79),(1307,'2024-01-15 16:56:39','2024-01-14 21:04:39','admin9193','admin9193','ACTIVE',460000,NULL,'NBUifRSA',28,'28,Kem',80),(1308,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'P5M1ZVFv',30,'28,Ghi sáng',80),(1309,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'xoYjcUCZ',30,'29,Kem',80),(1310,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'a1d3tlFI',30,'29,Ghi sáng',80),(1311,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'3BnKPyuF',30,'30,Kem',80),(1312,'2024-01-15 14:20:11','2024-01-14 21:04:39','admin9193','admin9193','ACTIVE',450000,NULL,'7TJNDsFJ',29,'30,Ghi sáng',80),(1313,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'AJFMOltE',30,'31,Kem',80),(1314,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE',450000,NULL,'9U4ixyEH',29,'31,Ghi sáng',80),(1315,'2024-01-15 17:03:31','2024-01-14 21:06:35','admin9193','admin9193','ACTIVE',160000,NULL,'2ydtDdMd',47,'X,Đen',81),(1316,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE',150000,NULL,'j0KPBN7m',50,'X,Trắng',81),(1317,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE',150000,NULL,'kqAvlrWv',50,'L,Đen',81),(1318,'2024-01-15 14:20:11','2024-01-14 21:06:35','admin9193','admin9193','ACTIVE',150000,NULL,'600xWu16',49,'L,Trắng',81),(1319,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE',150000,NULL,'S9fR4q9r',48,'XL,Đen',81),(1320,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE',150000,NULL,'19riAuYm',49,'XL,Trắng',81),(1321,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE',150000,NULL,'DcBe1c0n',49,'XXL,Đen',81),(1322,'2024-01-16 05:29:42','2024-01-14 21:06:35','admin9193','admin9193','ACTIVE',170000,NULL,'ynuvloKr',47,'XXL,Trắng',81),(1323,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE',250000,NULL,'ciFf8yiJ',29,'oversize,Đen',82),(1324,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE',200000,NULL,'bvkddtcZ',42,'oversize,Xám',82),(1325,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE',100000,NULL,'qvU91iQR',15,'oversize,Trắng',82),(1326,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE',180000,NULL,'Ph3zHFth',64,'oversize,Rêu',82),(1336,'2024-01-15 18:54:33','2024-01-15 07:25:49','admin9193','admin9193','ACTIVE',160000,NULL,'8hQpEUFH',54,'S,Đen,Xuông,Dây chuyền',73),(1337,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'yHkSZofx',53,'S,Trắng,Xuông,Dây chuyền',73),(1338,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',150000,NULL,'0UOicBZh',51,'S,Xanh,Xuông,Dây chuyền',73),(1339,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'Gjq3DIRJ',38,'M,Đen,Xuông,Dây chuyền',73),(1340,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'v3m4cIj8',12,'M,Trắng,Xuông,Dây chuyền',73),(1341,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'6ZOhunXK',62,'M,Xanh,Xuông,Dây chuyền',73),(1342,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'8lnhsGa8',42,'XL,Đen,Xuông,Dây chuyền',73),(1343,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'zvUXvI4h',43,'XL,Trắng,Xuông,Dây chuyền',73),(1344,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE',120000,NULL,'FP9uuuHQ',23,'XL,Xanh,Xuông,Dây chuyền',73),(1345,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',225000,NULL,'mishUt6Y',11999,'Xanh,29',44),(1346,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',235000,NULL,'qtjD7dig',11998,'Xanh,30',44),(1347,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',229000,NULL,'j9s9sQId',12000,'Xanh,31',44),(1348,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',230000,NULL,'Mi2sGgTq',12000,'Đen,29',44),(1349,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',230000,NULL,'DIPiL4Fx',12000,'Đen,30',44),(1350,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE',230000,NULL,'kdquqIAs',12000,'Đen,31',44),(1351,'2024-01-15 16:50:41','2024-01-15 13:46:34','admin9193','admin9193','ACTIVE',150000,NULL,'yi3evmC5',10,'Xám,S',83),(1352,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'qEx5BNVB',19,'Xám,L',83),(1353,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'F0WDXqvl',17,'Xám,XL',83),(1354,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'CmiWS5fS',19,'Trắng,S',83),(1355,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'umBZQ3r0',14,'Trắng,L',83),(1356,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'GFqSkR3g',18,'Trắng,XL',83),(1357,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'uIV7yesX',19,'Đen,S',83),(1358,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE',99000,NULL,'iTeAgydu',22,'Đen,L',83),(1359,'2024-01-15 14:19:12','2024-01-15 13:46:35','admin9193','admin9193','ACTIVE',99000,NULL,'YpBtSIXi',13,'Đen,XL',83),(1360,NULL,'2024-01-15 16:18:02',NULL,'admin9193','ACTIVE',140000,NULL,'pumbFADE',13,'Đen,M',77),(1361,NULL,'2024-01-15 16:18:02',NULL,'admin9193','ACTIVE',156000,NULL,'ctLpoqPE',16,'Đen,L',77),(1362,NULL,'2024-01-15 16:18:02',NULL,'admin9193','ACTIVE',130000,NULL,'KiN1Dbrs',18,'Đen,S',77),(1363,NULL,'2024-01-15 16:18:02',NULL,'admin9193','ACTIVE',120000,NULL,'Q4NA22TS',17,'Đen,XL',77),(1364,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE',180000,NULL,'VXR2SX5Q',12000,'Đen,M,Tay lỡ',14),(1365,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE',195000,NULL,'3WQdOvID',12000,'Đen,XL,Tay lỡ',14),(1366,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE',179000,NULL,'4IcCIhgi',12000,'Trắng,M,Tay lỡ',14),(1367,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE',189000,NULL,'JlRWVQh8',12000,'Trắng,XL,Tay lỡ',14),(1368,'2024-01-16 06:47:36','2024-01-16 06:38:32','admin9193','admin9193','ACTIVE',300000,NULL,'Df2Mzisy',11997,'Be,M,2 cúc',7),(1369,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',279000,NULL,'iCeWK8Lm',11997,'Be,M,1 cúc',7),(1370,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',289000,NULL,'rR6TvxAM',12000,'Be,L,2 cúc',7),(1371,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',279000,NULL,'YfyNDUt4',12000,'Be,L,1 cúc',7),(1372,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',270000,NULL,'vQ5T1u6p',12000,'Đen,M,2 cúc',7),(1373,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',279000,NULL,'YhbdcOJX',12000,'Đen,M,1 cúc',7),(1374,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',279000,NULL,'joN3Zqij',12000,'Đen,L,2 cúc',7),(1375,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE',279000,NULL,'PZHjX1uc',12000,'Đen,L,1 cúc',7);
/*!40000 ALTER TABLE `bienthe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bienthe_saukhi_insert` AFTER INSERT ON `bienthe` FOR EACH ROW BEGIN
	INSERT INTO giatrithuoctinhbienthe (idbienthe, idgiatrithuoctinh) (SELECT 
						bienthe.id AS idbienthe, 
						giatrithuoctinh.id AS idgiatrithuoctinh
					FROM bienthe, giatrithuoctinh
					WHERE 
						bienthe.id = NEW.id
						AND giatrithuoctinh.idsanpham = NEW.idsanpham
						AND FIND_IN_SET(giatrithuoctinh.giatri, NEW.ten));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `calam`
--

DROP TABLE IF EXISTS `calam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `sotiencuoica` double DEFAULT NULL,
  `sotiendauca` double DEFAULT NULL,
  `idnhanvien` bigint DEFAULT NULL,
  `ghichu` varchar(255) DEFAULT NULL,
  `tienchenhlech` double DEFAULT NULL,
  `tienmatbangiao` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqwajinxv270ke9tysey6xigop` (`idnhanvien`),
  CONSTRAINT `FKqwajinxv270ke9tysey6xigop` FOREIGN KEY (`idnhanvien`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calam`
--

LOCK TABLES `calam` WRITE;
/*!40000 ALTER TABLE `calam` DISABLE KEYS */;
INSERT INTO `calam` VALUES (8,NULL,'2023-12-16 16:03:08',NULL,'nguyenvana0183','ACTIVE',NULL,500000,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `calam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietcalam`
--

DROP TABLE IF EXISTS `chitietcalam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietcalam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `idcalam` bigint DEFAULT NULL,
  `idhoadon` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3pypfn1y99kakj3xfnjpjk8pn` (`idcalam`),
  KEY `FKas009v8q6c9ut5hv8ko0x508d` (`idhoadon`),
  CONSTRAINT `FK3pypfn1y99kakj3xfnjpjk8pn` FOREIGN KEY (`idcalam`) REFERENCES `calam` (`id`),
  CONSTRAINT `FKas009v8q6c9ut5hv8ko0x508d` FOREIGN KEY (`idhoadon`) REFERENCES `hoadon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietcalam`
--

LOCK TABLES `chitietcalam` WRITE;
/*!40000 ALTER TABLE `chitietcalam` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietcalam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitieu`
--

DROP TABLE IF EXISTS `chitieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `loaichitieu` int DEFAULT NULL,
  `sotien` double DEFAULT NULL,
  `idvidientu` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7fr74dox50p8nxx296nhl6740` (`idvidientu`),
  CONSTRAINT `FK7fr74dox50p8nxx296nhl6740` FOREIGN KEY (`idvidientu`) REFERENCES `vidientu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitieu`
--

LOCK TABLES `chitieu` WRITE;
/*!40000 ALTER TABLE `chitieu` DISABLE KEYS */;
INSERT INTO `chitieu` VALUES (82,NULL,'2024-01-16 06:32:51',NULL,'admin9193',NULL,2,325301,17);
/*!40000 ALTER TABLE `chitieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucvu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `ma` varchar(255) NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,NULL,'2023-11-19 16:54:49',NULL,'admin9193','ACTIVE','ADMIN','Quản lý hệ thống'),(2,NULL,'2023-11-19 16:54:50',NULL,'admin9193','ACTIVE','STAFF','Nhân viên');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhgiasanpham`
--

DROP TABLE IF EXISTS `danhgiasanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgiasanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `noidung` text,
  `sosao` int DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3n3101mjmh45an8j6qkb82pon` (`idkhachhang`),
  KEY `FKnh67cfln5ihj5ownxeitn2vbb` (`idsanpham`),
  CONSTRAINT `FK3n3101mjmh45an8j6qkb82pon` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `FKnh67cfln5ihj5ownxeitn2vbb` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgiasanpham`
--

LOCK TABLES `danhgiasanpham` WRITE;
/*!40000 ALTER TABLE `danhgiasanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `danhgiasanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `hienthi` int DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sulfov08aud7rmuh75nxqn4fj` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` VALUES (1,NULL,'2023-11-19 17:09:00',NULL,'admin9193','ACTIVE',NULL,'ao-thun','Áo thun'),(2,NULL,'2023-11-19 17:18:46',NULL,'admin9193','ACTIVE',NULL,'ao-so-mi','Áo sơ mi'),(3,NULL,'2023-11-19 17:18:46',NULL,'admin9193','ACTIVE',NULL,'ao-polo','Áo polo'),(4,NULL,'2023-11-19 17:18:47',NULL,'admin9193','ACTIVE',NULL,'ao-len-cardigan','Áo len & Cardigan'),(5,NULL,'2023-11-19 17:18:48',NULL,'admin9193','ACTIVE',NULL,'ao-khoac','Áo khoác'),(6,NULL,'2023-11-19 17:18:48',NULL,'admin9193','ACTIVE',NULL,'quan-jeans','Quần Jeans'),(7,NULL,'2023-11-19 17:18:49',NULL,'admin9193','ACTIVE',NULL,'quan-dai-quan-au','Quần dài / Quần Âu'),(8,NULL,'2023-11-19 17:18:49',NULL,'admin9193','ACTIVE',NULL,'quan-dui','Quần short'),(9,NULL,'2023-11-19 17:18:50',NULL,'admin9193','ACTIVE',NULL,'quan-ngu','Quần ngủ'),(10,NULL,'2023-11-19 17:18:51',NULL,'admin9193','ACTIVE',NULL,'quan-kaki','Quần  Kaki'),(11,'2023-12-18 04:10:01','2023-12-13 14:53:42','admin9193','admin9193','INACTIVE',NULL,'ao-vai','Áo vải'),(15,NULL,'2023-12-18 03:19:35',NULL,'khanhlinh4878','ACTIVE',NULL,'ao-balo','Áo balo'),(20,NULL,'2023-12-18 16:35:20',NULL,'admin9193','ACTIVE',NULL,'da','      da');
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giatrithuoctinh`
--

DROP TABLE IF EXISTS `giatrithuoctinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giatrithuoctinh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `giatri` varchar(255) DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  `idthuoctinh` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpm5svcqbt5m7ipbbihqu6d139` (`idsanpham`),
  KEY `FK6y4ueyayt8cgynk5a14wylvun` (`idthuoctinh`),
  CONSTRAINT `FK6y4ueyayt8cgynk5a14wylvun` FOREIGN KEY (`idthuoctinh`) REFERENCES `thuoctinh` (`id`),
  CONSTRAINT `FKpm5svcqbt5m7ipbbihqu6d139` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giatrithuoctinh`
--

LOCK TABLES `giatrithuoctinh` WRITE;
/*!40000 ALTER TABLE `giatrithuoctinh` DISABLE KEYS */;
INSERT INTO `giatrithuoctinh` VALUES (2,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','Đen',1,1),(4,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','L',1,2),(5,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','XL',1,2),(6,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','XXL',1,2),(16,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','Xanh',3,5),(17,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','Trắng',3,5),(18,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','Đen',3,5),(19,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','M',3,6),(20,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','L',3,6),(21,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','XL',3,6),(29,NULL,'2023-11-27 02:22:04',NULL,'admin9193','ACTIVE','Trắng',5,9),(30,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','Đen',5,9),(31,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','M',5,10),(32,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','XL',5,10),(37,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','Đen',8,13),(38,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','L',8,14),(39,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','XL',8,14),(40,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','Đen',9,15),(41,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','L',9,16),(42,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','XL',9,16),(43,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','Đen',10,17),(45,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','L',10,18),(46,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','Đen',11,19),(47,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','Be',11,19),(48,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','M',11,20),(49,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','XL',11,20),(50,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','Đen',12,21),(51,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','M',12,22),(52,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','XL',12,22),(70,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','Đen',18,33),(71,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','M',18,34),(72,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','XL',18,34),(73,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','Be',19,35),(74,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','Đen',19,35),(85,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','Be',22,40),(86,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','Xanh',22,40),(87,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','Xám',22,40),(88,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','M',22,41),(89,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','XL',22,41),(90,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','Trắng',23,42),(91,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','Xanh',23,42),(92,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','Xám',23,42),(93,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','Be',24,43),(94,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','Nâu',24,43),(95,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','Xám',24,43),(96,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','Đen',24,43),(100,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','Xanh',26,47),(101,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','Đen',26,47),(102,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','Trắng',26,47),(103,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','Xám',26,47),(104,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','M',26,48),(105,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','XL',26,48),(106,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','S',26,48),(107,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','Đen',27,49),(108,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','Xám',27,49),(109,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','Xanh nhạt',27,49),(110,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','30',27,50),(111,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','31',27,50),(112,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','32',27,50),(113,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','Đen',28,51),(114,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','Vàng',28,51),(115,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','Xanh Đậm',28,51),(116,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','Xanh Nhạt',28,51),(117,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','Xám',28,51),(119,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','L',28,52),(120,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','XL',28,52),(121,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','Be',29,53),(122,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','Đen',29,53),(123,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','M',29,54),(124,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','L',29,54),(125,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','XL',29,54),(126,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','2XL',29,54),(127,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','Đen',30,55),(128,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','Xanh Lá',30,55),(129,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','Kaki',30,55),(130,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','M',30,56),(131,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','L',30,56),(132,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','XL',30,56),(133,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','2XL',30,56),(134,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','3XL',30,56),(135,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','M',31,57),(137,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','XL',31,57),(139,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','3XL',31,57),(140,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','Đen',32,58),(141,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','Be',32,58),(142,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','M',32,59),(143,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','L',32,59),(144,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','XL',32,59),(145,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','XXL',32,59),(146,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','3XL',32,59),(147,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','Xám',33,60),(148,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','Xanh nhạt',33,60),(150,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','L',33,61),(151,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','XL',33,61),(152,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','2XL',33,61),(153,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','JX:90',34,62),(154,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','JX:92',34,62),(155,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','M',34,63),(156,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','L',34,63),(157,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','XL',34,63),(158,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','XXL',34,63),(159,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','Xanh',35,64),(160,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','Đen',35,64),(161,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','30',35,65),(162,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','31',35,65),(163,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','32',35,65),(164,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','33',35,65),(165,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','29',35,65),(166,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','28',35,65),(167,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','Be',36,66),(168,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','Đen',36,66),(169,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','Nâu',36,66),(170,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','S',36,67),(171,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','M',36,67),(172,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','L',36,67),(173,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','XL',36,67),(174,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','28',37,68),(175,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','29',37,68),(176,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','30',37,68),(177,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','31',37,68),(178,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','32',37,68),(179,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','Đen',38,69),(180,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','Xanh Nhạt',38,69),(181,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','M',38,70),(182,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','L',38,70),(183,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','XL',38,70),(184,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','2XL',38,70),(185,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','M',39,71),(186,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','L',39,71),(187,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','XL',39,71),(188,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','2XL',39,71),(189,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','M',41,72),(190,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','L',41,72),(191,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','XL',41,72),(192,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE','M',42,73),(193,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE','L',42,73),(194,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE','XL',42,73),(195,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','Đen',43,74),(196,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','Be',43,74),(197,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','Xanh Xám',43,74),(198,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','M',43,75),(199,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','L',43,75),(200,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','XL',43,75),(201,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','Địa Cầu',43,76),(202,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','Họa Hình',43,76),(228,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','Xanh',47,86),(229,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','Trắng',47,86),(230,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','S',47,87),(231,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','L',47,87),(232,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','XL',47,87),(233,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','XXL',47,87),(234,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','Logo',47,88),(235,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','Chữ cái',47,88),(251,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Đen',49,93),(252,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Xám',49,93),(253,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Trắng',49,93),(254,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','M',49,94),(256,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','XL',49,94),(257,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','XXL',49,94),(258,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Vải Cotton',49,95),(259,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Vải Corolan',49,95),(260,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Tay ngắn',49,96),(261,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','Tay lỡ',49,96),(262,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE','Đỏ',50,97),(263,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE','Xanh',50,97),(268,NULL,'2023-12-18 07:46:17',NULL,'admin9193','ACTIVE','S',56,100),(269,NULL,'2023-12-18 07:46:17',NULL,'admin9193','ACTIVE','XL',56,100),(270,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','XS',57,101),(271,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','XXL',57,101),(272,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','Xanh',57,102),(273,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','Đỏ',57,102),(274,NULL,'2023-12-19 05:54:26',NULL,'admin9193','ACTIVE','S',58,103),(275,NULL,'2023-12-19 05:54:26',NULL,'admin9193','ACTIVE','M',58,103),(276,NULL,'2023-12-19 05:54:26',NULL,'admin9193','ACTIVE','L',58,103),(285,NULL,'2023-12-19 08:38:08',NULL,'admin9193','ACTIVE','Dây chuyền',61,108),(286,NULL,'2023-12-19 08:38:09',NULL,'admin9193','ACTIVE','Than',61,109),(300,NULL,'2024-01-01 03:33:46',NULL,'admin9193','ACTIVE','S',62,116),(301,NULL,'2024-01-01 03:33:46',NULL,'admin9193','ACTIVE','XL',62,116),(321,NULL,'2024-01-09 08:13:33',NULL,'admin9193','ACTIVE','Đen',40,124),(327,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','Ghi',69,127),(328,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','Xanh than',69,127),(329,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','Nâu',69,127),(330,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','Xanh tím',69,127),(331,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','50-60kg',69,128),(332,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','60-70kg',69,128),(333,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','70-80kg',69,128),(361,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','S',59,139),(362,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','XS',59,139),(363,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','Đỏ',59,140),(364,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','Đen',59,140),(365,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','Trắng',59,140),(366,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','Đen',64,141),(367,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','Xanh lá',64,141),(368,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','Xanh dương',64,141),(369,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','S',64,142),(370,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','L',64,142),(371,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','XXL',64,142),(372,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','XL',64,142),(373,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','Cotton',64,143),(374,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','Nhung tăm',64,143),(375,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','Đen',46,144),(376,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','Be',46,144),(377,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','M',46,145),(378,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','L',46,145),(379,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','XL',46,145),(380,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','S',46,145),(381,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','Vải Cotton',46,146),(382,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','Vải Corona',46,146),(383,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','Vòng',46,147),(384,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','Đỏ',60,148),(385,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','Đen',60,148),(386,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','XS',60,149),(387,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','XL',60,149),(388,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','Rách',60,150),(410,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','Đen',68,159),(411,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','Trắng',68,159),(412,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','M',68,160),(413,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','L',68,160),(414,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','XL',68,160),(415,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','S',68,160),(416,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','Xanh',51,161),(417,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','Đỏ',51,161),(418,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','Xl',51,162),(419,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','L',51,162),(420,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','S',51,162),(421,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Xanh',48,163),(422,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Hồng',48,163),(423,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Trắng',48,163),(424,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Đen',48,163),(425,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','M',48,164),(426,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','L',48,164),(427,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','XL',48,164),(428,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','XXL',48,164),(429,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Vải Cotton',48,165),(430,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Vải Kate',48,165),(431,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Vải Visco',48,165),(432,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Địa Cầu',48,166),(433,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Mặt Trăng',48,166),(434,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Bầu Trời',48,166),(435,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Họa Hình',48,166),(436,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','Dài',48,167),(437,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','S',63,168),(438,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','XL',63,168),(439,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','Đen',63,169),(440,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','Trắng',63,169),(452,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','Đen',70,173),(453,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','Than',70,173),(454,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','Ghi',70,173),(455,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','Trắng',70,173),(456,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','M 40-52KG',70,174),(457,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','L 52-60KG',70,174),(461,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','Cotton',70,175),(464,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','Be',65,177),(465,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','L',65,178),(466,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','XL',65,178),(467,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','Da',65,179),(468,NULL,'2024-01-13 07:32:13',NULL,'admin9193','ACTIVE','Dài',70,176),(469,NULL,'2024-01-13 13:59:50',NULL,'admin9193','ACTIVE','Thêu',45,183),(470,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','Đen',45,180),(471,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','Trắng',45,180),(472,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','Xám',45,180),(473,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','S',45,181),(474,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','M',45,181),(475,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','XL',45,181),(476,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','Dài',45,182),(477,NULL,'2024-01-13 16:17:54',NULL,'admin9193','ACTIVE','Ngắn',45,182),(479,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','S',71,184),(480,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','M',71,184),(481,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','L',71,184),(482,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','XL',71,184),(483,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','Đen',71,185),(484,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','Be',71,185),(485,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','Hồng',72,186),(486,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','M',72,187),(487,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','L',72,187),(488,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','XL',72,187),(493,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','M',74,190),(494,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','L',74,190),(495,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','Xl',74,190),(496,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','XXL',74,190),(497,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','Trắng',74,191),(498,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','Xanh',74,191),(500,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','Đen',75,192),(501,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','Xám',75,192),(502,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','Xanh ngọc',75,192),(503,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','S',75,193),(504,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','M',75,193),(505,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','L',75,193),(506,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','XL',75,193),(511,NULL,'2024-01-14 09:12:32',NULL,'admin9193','ACTIVE','Tay lỡ',2,202),(512,NULL,'2024-01-14 09:14:41',NULL,'admin9193','ACTIVE','Dài tay',4,205),(513,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','XL',76,206),(514,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','XS',76,206),(515,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','Đen',76,207),(516,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','Vàng',76,207),(523,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','Xanh',2,200),(524,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','Đen',2,200),(525,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','Trắng',2,200),(526,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','XS',2,201),(527,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','S',2,201),(528,NULL,'2024-01-14 18:11:36',NULL,'admin9193','ACTIVE','M',2,201),(529,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE','M',25,209),(530,NULL,'2024-01-14 19:49:10',NULL,'admin9193','ACTIVE','Xanh Lá',77,210),(531,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE','M',77,211),(532,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE','L',77,211),(533,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE','S',77,211),(534,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE','XL',77,211),(535,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','Trắng',78,212),(536,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','Đen',78,212),(537,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','Chì',78,212),(538,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','Be',78,212),(539,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','Xám',78,212),(540,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','<65Kg',78,213),(541,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','Đen',79,214),(542,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','Xanh than',79,214),(543,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','Xám',79,214),(544,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','Ghi',79,214),(545,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','Trắng',79,214),(546,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','28',79,215),(547,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','29',79,215),(548,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','30',79,215),(549,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','31',79,215),(550,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','32',79,215),(551,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','33',79,215),(552,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','28',80,216),(553,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','29',80,216),(554,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','30',80,216),(555,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','31',80,216),(556,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','Kem',80,217),(557,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','Ghi sáng',80,217),(558,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','X',81,218),(559,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','L',81,218),(560,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','XL',81,218),(561,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','XXL',81,218),(562,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','Đen',81,219),(563,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','Trắng',81,219),(564,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','oversize',82,220),(565,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','Đen',82,221),(566,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','Xám',82,221),(567,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','Trắng',82,221),(568,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','Rêu',82,221),(570,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','S',73,222),(571,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','M',73,222),(572,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','XL',73,222),(573,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','Đen',73,223),(574,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','Trắng',73,223),(575,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','Xanh',73,223),(576,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','Xuông',73,224),(577,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','Dây chuyền',73,225),(578,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','Xanh',44,226),(579,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','Đen',44,226),(580,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','29',44,227),(581,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','30',44,227),(582,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','31',44,227),(583,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','Xám',83,228),(584,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','Trắng',83,228),(585,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','Đen',83,228),(586,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','S',83,229),(587,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','L',83,229),(588,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','XL',83,229),(589,NULL,'2024-01-15 16:18:02',NULL,'admin9193','ACTIVE','Đen',77,210),(590,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','Đen',14,230),(591,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','Trắng',14,230),(592,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','M',14,231),(593,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','XL',14,231),(594,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','Tay lỡ',14,232),(595,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','Be',7,233),(596,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','Đen',7,233),(597,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','M',7,234),(598,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','L',7,234),(599,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','2 cúc',7,235),(600,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','1 cúc',7,235),(601,NULL,'2024-01-16 06:40:11',NULL,'admin9193','ACTIVE','Trắng',4,203),(602,NULL,'2024-01-16 06:40:11',NULL,'admin9193','ACTIVE','Đen',4,203),(603,NULL,'2024-01-16 06:40:11',NULL,'admin9193','ACTIVE','M',4,204),(604,NULL,'2024-01-16 06:40:11',NULL,'admin9193','ACTIVE','L',4,204),(605,NULL,'2024-01-16 06:40:11',NULL,'admin9193','ACTIVE','XL',4,204);
/*!40000 ALTER TABLE `giatrithuoctinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giatrithuoctinhbienthe`
--

DROP TABLE IF EXISTS `giatrithuoctinhbienthe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giatrithuoctinhbienthe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `idbienthe` bigint DEFAULT NULL,
  `idgiatrithuoctinh` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKobw0qcs615au67nx2d0ktp41d` (`idbienthe`),
  KEY `FKnj57apbbxsmiwq7187rsgtp7s` (`idgiatrithuoctinh`),
  CONSTRAINT `FKnj57apbbxsmiwq7187rsgtp7s` FOREIGN KEY (`idgiatrithuoctinh`) REFERENCES `giatrithuoctinh` (`id`),
  CONSTRAINT `FKobw0qcs615au67nx2d0ktp41d` FOREIGN KEY (`idbienthe`) REFERENCES `bienthe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6261 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giatrithuoctinhbienthe`
--

LOCK TABLES `giatrithuoctinhbienthe` WRITE;
/*!40000 ALTER TABLE `giatrithuoctinhbienthe` DISABLE KEYS */;
INSERT INTO `giatrithuoctinhbienthe` VALUES (163,NULL,NULL,NULL,NULL,'ACTIVE',6,2),(164,NULL,NULL,NULL,NULL,'ACTIVE',6,4),(166,NULL,NULL,NULL,NULL,'ACTIVE',7,2),(167,NULL,NULL,NULL,NULL,'ACTIVE',7,5),(169,NULL,NULL,NULL,NULL,'ACTIVE',8,2),(170,NULL,NULL,NULL,NULL,'ACTIVE',8,6),(232,NULL,NULL,NULL,NULL,'ACTIVE',29,16),(233,NULL,NULL,NULL,NULL,'ACTIVE',29,19),(235,NULL,NULL,NULL,NULL,'ACTIVE',30,16),(236,NULL,NULL,NULL,NULL,'ACTIVE',30,20),(238,NULL,NULL,NULL,NULL,'ACTIVE',31,16),(239,NULL,NULL,NULL,NULL,'ACTIVE',31,21),(241,NULL,NULL,NULL,NULL,'ACTIVE',32,17),(242,NULL,NULL,NULL,NULL,'ACTIVE',32,19),(244,NULL,NULL,NULL,NULL,'ACTIVE',33,17),(245,NULL,NULL,NULL,NULL,'ACTIVE',33,20),(247,NULL,NULL,NULL,NULL,'ACTIVE',34,17),(248,NULL,NULL,NULL,NULL,'ACTIVE',34,21),(250,NULL,NULL,NULL,NULL,'ACTIVE',35,18),(251,NULL,NULL,NULL,NULL,'ACTIVE',35,19),(253,NULL,NULL,NULL,NULL,'ACTIVE',36,18),(254,NULL,NULL,NULL,NULL,'ACTIVE',36,20),(256,NULL,NULL,NULL,NULL,'ACTIVE',37,18),(257,NULL,NULL,NULL,NULL,'ACTIVE',37,21),(295,NULL,NULL,NULL,NULL,'ACTIVE',50,29),(296,NULL,NULL,NULL,NULL,'ACTIVE',50,31),(298,NULL,NULL,NULL,NULL,'ACTIVE',51,29),(299,NULL,NULL,NULL,NULL,'ACTIVE',51,32),(301,NULL,NULL,NULL,NULL,'ACTIVE',52,30),(302,NULL,NULL,NULL,NULL,'ACTIVE',52,31),(304,NULL,NULL,NULL,NULL,'ACTIVE',53,30),(305,NULL,NULL,NULL,NULL,'ACTIVE',53,32),(319,NULL,NULL,NULL,NULL,'ACTIVE',58,37),(320,NULL,NULL,NULL,NULL,'ACTIVE',58,38),(322,NULL,NULL,NULL,NULL,'ACTIVE',59,37),(323,NULL,NULL,NULL,NULL,'ACTIVE',59,39),(325,NULL,NULL,NULL,NULL,'ACTIVE',60,40),(326,NULL,NULL,NULL,NULL,'ACTIVE',60,41),(328,NULL,NULL,NULL,NULL,'ACTIVE',61,40),(329,NULL,NULL,NULL,NULL,'ACTIVE',61,42),(334,NULL,NULL,NULL,NULL,'ACTIVE',63,43),(335,NULL,NULL,NULL,NULL,'ACTIVE',63,45),(337,NULL,NULL,NULL,NULL,'ACTIVE',64,46),(338,NULL,NULL,NULL,NULL,'ACTIVE',64,48),(340,NULL,NULL,NULL,NULL,'ACTIVE',65,46),(341,NULL,NULL,NULL,NULL,'ACTIVE',65,49),(343,NULL,NULL,NULL,NULL,'ACTIVE',66,47),(344,NULL,NULL,NULL,NULL,'ACTIVE',66,48),(346,NULL,NULL,NULL,NULL,'ACTIVE',67,47),(347,NULL,NULL,NULL,NULL,'ACTIVE',67,49),(349,NULL,NULL,NULL,NULL,'ACTIVE',68,50),(350,NULL,NULL,NULL,NULL,'ACTIVE',68,51),(352,NULL,NULL,NULL,NULL,'ACTIVE',69,50),(353,NULL,NULL,NULL,NULL,'ACTIVE',69,52),(367,NULL,NULL,NULL,NULL,'ACTIVE',79,70),(368,NULL,NULL,NULL,NULL,'ACTIVE',79,71),(370,NULL,NULL,NULL,NULL,'ACTIVE',80,70),(371,NULL,NULL,NULL,NULL,'ACTIVE',80,72),(373,NULL,NULL,NULL,NULL,'ACTIVE',81,73),(374,NULL,NULL,NULL,NULL,'ACTIVE',82,74),(375,NULL,NULL,NULL,NULL,'ACTIVE',85,85),(376,NULL,NULL,NULL,NULL,'ACTIVE',85,88),(378,NULL,NULL,NULL,NULL,'ACTIVE',86,85),(379,NULL,NULL,NULL,NULL,'ACTIVE',86,89),(381,NULL,NULL,NULL,NULL,'ACTIVE',87,86),(382,NULL,NULL,NULL,NULL,'ACTIVE',87,88),(384,NULL,NULL,NULL,NULL,'ACTIVE',88,86),(385,NULL,NULL,NULL,NULL,'ACTIVE',88,89),(387,NULL,NULL,NULL,NULL,'ACTIVE',89,87),(388,NULL,NULL,NULL,NULL,'ACTIVE',89,88),(390,NULL,NULL,NULL,NULL,'ACTIVE',90,87),(391,NULL,NULL,NULL,NULL,'ACTIVE',90,89),(393,NULL,NULL,NULL,NULL,'ACTIVE',91,90),(394,NULL,NULL,NULL,NULL,'ACTIVE',92,91),(395,NULL,NULL,NULL,NULL,'ACTIVE',93,92),(396,NULL,NULL,NULL,NULL,'ACTIVE',94,93),(397,NULL,NULL,NULL,NULL,'ACTIVE',95,94),(398,NULL,NULL,NULL,NULL,'ACTIVE',96,95),(399,NULL,NULL,NULL,NULL,'ACTIVE',97,96),(403,NULL,NULL,NULL,NULL,'ACTIVE',101,100),(404,NULL,NULL,NULL,NULL,'ACTIVE',101,104),(406,NULL,NULL,NULL,NULL,'ACTIVE',102,100),(407,NULL,NULL,NULL,NULL,'ACTIVE',102,105),(409,NULL,NULL,NULL,NULL,'ACTIVE',103,100),(410,NULL,NULL,NULL,NULL,'ACTIVE',103,106),(412,NULL,NULL,NULL,NULL,'ACTIVE',104,101),(413,NULL,NULL,NULL,NULL,'ACTIVE',104,104),(415,NULL,NULL,NULL,NULL,'ACTIVE',105,101),(416,NULL,NULL,NULL,NULL,'ACTIVE',105,105),(418,NULL,NULL,NULL,NULL,'ACTIVE',106,101),(419,NULL,NULL,NULL,NULL,'ACTIVE',106,106),(421,NULL,NULL,NULL,NULL,'ACTIVE',107,102),(422,NULL,NULL,NULL,NULL,'ACTIVE',107,104),(424,NULL,NULL,NULL,NULL,'ACTIVE',108,102),(425,NULL,NULL,NULL,NULL,'ACTIVE',108,105),(427,NULL,NULL,NULL,NULL,'ACTIVE',109,102),(428,NULL,NULL,NULL,NULL,'ACTIVE',109,106),(430,NULL,NULL,NULL,NULL,'ACTIVE',110,103),(431,NULL,NULL,NULL,NULL,'ACTIVE',110,104),(433,NULL,NULL,NULL,NULL,'ACTIVE',111,103),(434,NULL,NULL,NULL,NULL,'ACTIVE',111,105),(436,NULL,NULL,NULL,NULL,'ACTIVE',112,103),(437,NULL,NULL,NULL,NULL,'ACTIVE',112,106),(439,NULL,NULL,NULL,NULL,'ACTIVE',113,107),(440,NULL,NULL,NULL,NULL,'ACTIVE',113,110),(442,NULL,NULL,NULL,NULL,'ACTIVE',114,107),(443,NULL,NULL,NULL,NULL,'ACTIVE',114,111),(445,NULL,NULL,NULL,NULL,'ACTIVE',115,107),(446,NULL,NULL,NULL,NULL,'ACTIVE',115,112),(448,NULL,NULL,NULL,NULL,'ACTIVE',116,108),(449,NULL,NULL,NULL,NULL,'ACTIVE',116,110),(451,NULL,NULL,NULL,NULL,'ACTIVE',117,108),(452,NULL,NULL,NULL,NULL,'ACTIVE',117,111),(454,NULL,NULL,NULL,NULL,'ACTIVE',118,108),(455,NULL,NULL,NULL,NULL,'ACTIVE',118,112),(457,NULL,NULL,NULL,NULL,'ACTIVE',119,109),(458,NULL,NULL,NULL,NULL,'ACTIVE',119,110),(460,NULL,NULL,NULL,NULL,'ACTIVE',120,109),(461,NULL,NULL,NULL,NULL,'ACTIVE',120,111),(463,NULL,NULL,NULL,NULL,'ACTIVE',121,109),(464,NULL,NULL,NULL,NULL,'ACTIVE',121,112),(469,NULL,NULL,NULL,NULL,'ACTIVE',123,113),(470,NULL,NULL,NULL,NULL,'ACTIVE',123,119),(472,NULL,NULL,NULL,NULL,'ACTIVE',124,113),(473,NULL,NULL,NULL,NULL,'ACTIVE',124,120),(478,NULL,NULL,NULL,NULL,'ACTIVE',126,114),(479,NULL,NULL,NULL,NULL,'ACTIVE',126,119),(481,NULL,NULL,NULL,NULL,'ACTIVE',127,114),(482,NULL,NULL,NULL,NULL,'ACTIVE',127,120),(487,NULL,NULL,NULL,NULL,'ACTIVE',129,115),(488,NULL,NULL,NULL,NULL,'ACTIVE',129,119),(490,NULL,NULL,NULL,NULL,'ACTIVE',130,115),(491,NULL,NULL,NULL,NULL,'ACTIVE',130,120),(496,NULL,NULL,NULL,NULL,'ACTIVE',132,116),(497,NULL,NULL,NULL,NULL,'ACTIVE',132,119),(499,NULL,NULL,NULL,NULL,'ACTIVE',133,116),(500,NULL,NULL,NULL,NULL,'ACTIVE',133,120),(505,NULL,NULL,NULL,NULL,'ACTIVE',135,117),(506,NULL,NULL,NULL,NULL,'ACTIVE',135,119),(508,NULL,NULL,NULL,NULL,'ACTIVE',136,117),(509,NULL,NULL,NULL,NULL,'ACTIVE',136,120),(511,NULL,NULL,NULL,NULL,'ACTIVE',137,121),(512,NULL,NULL,NULL,NULL,'ACTIVE',137,123),(514,NULL,NULL,NULL,NULL,'ACTIVE',138,121),(515,NULL,NULL,NULL,NULL,'ACTIVE',138,124),(517,NULL,NULL,NULL,NULL,'ACTIVE',139,121),(518,NULL,NULL,NULL,NULL,'ACTIVE',139,125),(520,NULL,NULL,NULL,NULL,'ACTIVE',140,121),(521,NULL,NULL,NULL,NULL,'ACTIVE',140,126),(523,NULL,NULL,NULL,NULL,'ACTIVE',141,122),(524,NULL,NULL,NULL,NULL,'ACTIVE',141,123),(526,NULL,NULL,NULL,NULL,'ACTIVE',142,122),(527,NULL,NULL,NULL,NULL,'ACTIVE',142,124),(529,NULL,NULL,NULL,NULL,'ACTIVE',143,122),(530,NULL,NULL,NULL,NULL,'ACTIVE',143,125),(532,NULL,NULL,NULL,NULL,'ACTIVE',144,122),(533,NULL,NULL,NULL,NULL,'ACTIVE',144,126),(535,NULL,NULL,NULL,NULL,'ACTIVE',145,127),(536,NULL,NULL,NULL,NULL,'ACTIVE',145,130),(538,NULL,NULL,NULL,NULL,'ACTIVE',146,127),(539,NULL,NULL,NULL,NULL,'ACTIVE',146,131),(541,NULL,NULL,NULL,NULL,'ACTIVE',147,127),(542,NULL,NULL,NULL,NULL,'ACTIVE',147,132),(544,NULL,NULL,NULL,NULL,'ACTIVE',148,127),(545,NULL,NULL,NULL,NULL,'ACTIVE',148,133),(547,NULL,NULL,NULL,NULL,'ACTIVE',149,127),(548,NULL,NULL,NULL,NULL,'ACTIVE',149,134),(550,NULL,NULL,NULL,NULL,'ACTIVE',150,128),(551,NULL,NULL,NULL,NULL,'ACTIVE',150,130),(553,NULL,NULL,NULL,NULL,'ACTIVE',151,128),(554,NULL,NULL,NULL,NULL,'ACTIVE',151,131),(556,NULL,NULL,NULL,NULL,'ACTIVE',152,128),(557,NULL,NULL,NULL,NULL,'ACTIVE',152,132),(559,NULL,NULL,NULL,NULL,'ACTIVE',153,128),(560,NULL,NULL,NULL,NULL,'ACTIVE',153,133),(562,NULL,NULL,NULL,NULL,'ACTIVE',154,128),(563,NULL,NULL,NULL,NULL,'ACTIVE',154,134),(565,NULL,NULL,NULL,NULL,'ACTIVE',155,129),(566,NULL,NULL,NULL,NULL,'ACTIVE',155,130),(568,NULL,NULL,NULL,NULL,'ACTIVE',156,129),(569,NULL,NULL,NULL,NULL,'ACTIVE',156,131),(571,NULL,NULL,NULL,NULL,'ACTIVE',157,129),(572,NULL,NULL,NULL,NULL,'ACTIVE',157,132),(574,NULL,NULL,NULL,NULL,'ACTIVE',158,129),(575,NULL,NULL,NULL,NULL,'ACTIVE',158,133),(577,NULL,NULL,NULL,NULL,'ACTIVE',159,129),(578,NULL,NULL,NULL,NULL,'ACTIVE',159,134),(580,NULL,NULL,NULL,NULL,'ACTIVE',160,135),(582,NULL,NULL,NULL,NULL,'ACTIVE',162,137),(584,NULL,NULL,NULL,NULL,'ACTIVE',164,139),(585,NULL,NULL,NULL,NULL,'ACTIVE',165,140),(586,NULL,NULL,NULL,NULL,'ACTIVE',165,142),(588,NULL,NULL,NULL,NULL,'ACTIVE',166,140),(589,NULL,NULL,NULL,NULL,'ACTIVE',166,143),(591,NULL,NULL,NULL,NULL,'ACTIVE',167,140),(592,NULL,NULL,NULL,NULL,'ACTIVE',167,144),(594,NULL,NULL,NULL,NULL,'ACTIVE',168,140),(595,NULL,NULL,NULL,NULL,'ACTIVE',168,145),(597,NULL,NULL,NULL,NULL,'ACTIVE',169,140),(598,NULL,NULL,NULL,NULL,'ACTIVE',169,146),(600,NULL,NULL,NULL,NULL,'ACTIVE',170,141),(601,NULL,NULL,NULL,NULL,'ACTIVE',170,142),(603,NULL,NULL,NULL,NULL,'ACTIVE',171,141),(604,NULL,NULL,NULL,NULL,'ACTIVE',171,143),(606,NULL,NULL,NULL,NULL,'ACTIVE',172,141),(607,NULL,NULL,NULL,NULL,'ACTIVE',172,144),(609,NULL,NULL,NULL,NULL,'ACTIVE',173,141),(610,NULL,NULL,NULL,NULL,'ACTIVE',173,145),(612,NULL,NULL,NULL,NULL,'ACTIVE',174,141),(613,NULL,NULL,NULL,NULL,'ACTIVE',174,146),(618,NULL,NULL,NULL,NULL,'ACTIVE',176,147),(619,NULL,NULL,NULL,NULL,'ACTIVE',176,150),(621,NULL,NULL,NULL,NULL,'ACTIVE',177,147),(622,NULL,NULL,NULL,NULL,'ACTIVE',177,151),(624,NULL,NULL,NULL,NULL,'ACTIVE',178,147),(625,NULL,NULL,NULL,NULL,'ACTIVE',178,152),(630,NULL,NULL,NULL,NULL,'ACTIVE',180,148),(631,NULL,NULL,NULL,NULL,'ACTIVE',180,150),(633,NULL,NULL,NULL,NULL,'ACTIVE',181,148),(634,NULL,NULL,NULL,NULL,'ACTIVE',181,151),(636,NULL,NULL,NULL,NULL,'ACTIVE',182,148),(637,NULL,NULL,NULL,NULL,'ACTIVE',182,152),(639,NULL,NULL,NULL,NULL,'ACTIVE',183,153),(640,NULL,NULL,NULL,NULL,'ACTIVE',183,155),(642,NULL,NULL,NULL,NULL,'ACTIVE',184,153),(643,NULL,NULL,NULL,NULL,'ACTIVE',184,156),(645,NULL,NULL,NULL,NULL,'ACTIVE',185,153),(646,NULL,NULL,NULL,NULL,'ACTIVE',185,157),(648,NULL,NULL,NULL,NULL,'ACTIVE',186,153),(649,NULL,NULL,NULL,NULL,'ACTIVE',186,158),(651,NULL,NULL,NULL,NULL,'ACTIVE',187,154),(652,NULL,NULL,NULL,NULL,'ACTIVE',187,155),(654,NULL,NULL,NULL,NULL,'ACTIVE',188,154),(655,NULL,NULL,NULL,NULL,'ACTIVE',188,156),(657,NULL,NULL,NULL,NULL,'ACTIVE',189,154),(658,NULL,NULL,NULL,NULL,'ACTIVE',189,157),(660,NULL,NULL,NULL,NULL,'ACTIVE',190,154),(661,NULL,NULL,NULL,NULL,'ACTIVE',190,158),(663,NULL,NULL,NULL,NULL,'ACTIVE',191,159),(664,NULL,NULL,NULL,NULL,'ACTIVE',191,161),(666,NULL,NULL,NULL,NULL,'ACTIVE',192,159),(667,NULL,NULL,NULL,NULL,'ACTIVE',192,162),(669,NULL,NULL,NULL,NULL,'ACTIVE',193,159),(670,NULL,NULL,NULL,NULL,'ACTIVE',193,163),(672,NULL,NULL,NULL,NULL,'ACTIVE',194,159),(673,NULL,NULL,NULL,NULL,'ACTIVE',194,164),(675,NULL,NULL,NULL,NULL,'ACTIVE',195,159),(676,NULL,NULL,NULL,NULL,'ACTIVE',195,165),(678,NULL,NULL,NULL,NULL,'ACTIVE',196,159),(679,NULL,NULL,NULL,NULL,'ACTIVE',196,166),(681,NULL,NULL,NULL,NULL,'ACTIVE',197,160),(682,NULL,NULL,NULL,NULL,'ACTIVE',197,161),(684,NULL,NULL,NULL,NULL,'ACTIVE',198,160),(685,NULL,NULL,NULL,NULL,'ACTIVE',198,162),(687,NULL,NULL,NULL,NULL,'ACTIVE',199,160),(688,NULL,NULL,NULL,NULL,'ACTIVE',199,163),(690,NULL,NULL,NULL,NULL,'ACTIVE',200,160),(691,NULL,NULL,NULL,NULL,'ACTIVE',200,164),(693,NULL,NULL,NULL,NULL,'ACTIVE',201,160),(694,NULL,NULL,NULL,NULL,'ACTIVE',201,165),(696,NULL,NULL,NULL,NULL,'ACTIVE',202,160),(697,NULL,NULL,NULL,NULL,'ACTIVE',202,166),(699,NULL,NULL,NULL,NULL,'ACTIVE',203,167),(700,NULL,NULL,NULL,NULL,'ACTIVE',203,170),(702,NULL,NULL,NULL,NULL,'ACTIVE',204,167),(703,NULL,NULL,NULL,NULL,'ACTIVE',204,171),(705,NULL,NULL,NULL,NULL,'ACTIVE',205,167),(706,NULL,NULL,NULL,NULL,'ACTIVE',205,172),(708,NULL,NULL,NULL,NULL,'ACTIVE',206,167),(709,NULL,NULL,NULL,NULL,'ACTIVE',206,173),(711,NULL,NULL,NULL,NULL,'ACTIVE',207,168),(712,NULL,NULL,NULL,NULL,'ACTIVE',207,170),(714,NULL,NULL,NULL,NULL,'ACTIVE',208,168),(715,NULL,NULL,NULL,NULL,'ACTIVE',208,171),(717,NULL,NULL,NULL,NULL,'ACTIVE',209,168),(718,NULL,NULL,NULL,NULL,'ACTIVE',209,172),(720,NULL,NULL,NULL,NULL,'ACTIVE',210,168),(721,NULL,NULL,NULL,NULL,'ACTIVE',210,173),(723,NULL,NULL,NULL,NULL,'ACTIVE',211,169),(724,NULL,NULL,NULL,NULL,'ACTIVE',211,170),(726,NULL,NULL,NULL,NULL,'ACTIVE',212,169),(727,NULL,NULL,NULL,NULL,'ACTIVE',212,171),(729,NULL,NULL,NULL,NULL,'ACTIVE',213,169),(730,NULL,NULL,NULL,NULL,'ACTIVE',213,172),(732,NULL,NULL,NULL,NULL,'ACTIVE',214,169),(733,NULL,NULL,NULL,NULL,'ACTIVE',214,173),(735,NULL,NULL,NULL,NULL,'ACTIVE',215,174),(736,NULL,NULL,NULL,NULL,'ACTIVE',216,175),(737,NULL,NULL,NULL,NULL,'ACTIVE',217,176),(738,NULL,NULL,NULL,NULL,'ACTIVE',218,177),(739,NULL,NULL,NULL,NULL,'ACTIVE',219,178),(740,NULL,NULL,NULL,NULL,'ACTIVE',220,179),(741,NULL,NULL,NULL,NULL,'ACTIVE',220,181),(743,NULL,NULL,NULL,NULL,'ACTIVE',221,179),(744,NULL,NULL,NULL,NULL,'ACTIVE',221,182),(746,NULL,NULL,NULL,NULL,'ACTIVE',222,179),(747,NULL,NULL,NULL,NULL,'ACTIVE',222,183),(749,NULL,NULL,NULL,NULL,'ACTIVE',223,179),(750,NULL,NULL,NULL,NULL,'ACTIVE',223,184),(752,NULL,NULL,NULL,NULL,'ACTIVE',224,180),(753,NULL,NULL,NULL,NULL,'ACTIVE',224,181),(755,NULL,NULL,NULL,NULL,'ACTIVE',225,180),(756,NULL,NULL,NULL,NULL,'ACTIVE',225,182),(758,NULL,NULL,NULL,NULL,'ACTIVE',226,180),(759,NULL,NULL,NULL,NULL,'ACTIVE',226,183),(761,NULL,NULL,NULL,NULL,'ACTIVE',227,180),(762,NULL,NULL,NULL,NULL,'ACTIVE',227,184),(764,NULL,NULL,NULL,NULL,'ACTIVE',228,185),(765,NULL,NULL,NULL,NULL,'ACTIVE',229,186),(766,NULL,NULL,NULL,NULL,'ACTIVE',230,187),(767,NULL,NULL,NULL,NULL,'ACTIVE',231,188),(768,NULL,NULL,NULL,NULL,'ACTIVE',232,189),(769,NULL,NULL,NULL,NULL,'ACTIVE',233,190),(770,NULL,NULL,NULL,NULL,'ACTIVE',234,191),(771,NULL,NULL,NULL,NULL,'ACTIVE',235,192),(772,NULL,NULL,NULL,NULL,'ACTIVE',236,193),(773,NULL,NULL,NULL,NULL,'ACTIVE',237,194),(774,NULL,NULL,NULL,NULL,'ACTIVE',238,195),(775,NULL,NULL,NULL,NULL,'ACTIVE',238,198),(776,NULL,NULL,NULL,NULL,'ACTIVE',238,201),(777,NULL,NULL,NULL,NULL,'ACTIVE',239,195),(778,NULL,NULL,NULL,NULL,'ACTIVE',239,198),(779,NULL,NULL,NULL,NULL,'ACTIVE',239,202),(780,NULL,NULL,NULL,NULL,'ACTIVE',240,195),(781,NULL,NULL,NULL,NULL,'ACTIVE',240,199),(782,NULL,NULL,NULL,NULL,'ACTIVE',240,201),(783,NULL,NULL,NULL,NULL,'ACTIVE',241,195),(784,NULL,NULL,NULL,NULL,'ACTIVE',241,199),(785,NULL,NULL,NULL,NULL,'ACTIVE',241,202),(786,NULL,NULL,NULL,NULL,'ACTIVE',242,195),(787,NULL,NULL,NULL,NULL,'ACTIVE',242,200),(788,NULL,NULL,NULL,NULL,'ACTIVE',242,201),(789,NULL,NULL,NULL,NULL,'ACTIVE',243,195),(790,NULL,NULL,NULL,NULL,'ACTIVE',243,200),(791,NULL,NULL,NULL,NULL,'ACTIVE',243,202),(792,NULL,NULL,NULL,NULL,'ACTIVE',244,196),(793,NULL,NULL,NULL,NULL,'ACTIVE',244,198),(794,NULL,NULL,NULL,NULL,'ACTIVE',244,201),(795,NULL,NULL,NULL,NULL,'ACTIVE',245,196),(796,NULL,NULL,NULL,NULL,'ACTIVE',245,198),(797,NULL,NULL,NULL,NULL,'ACTIVE',245,202),(798,NULL,NULL,NULL,NULL,'ACTIVE',246,196),(799,NULL,NULL,NULL,NULL,'ACTIVE',246,199),(800,NULL,NULL,NULL,NULL,'ACTIVE',246,201),(801,NULL,NULL,NULL,NULL,'ACTIVE',247,196),(802,NULL,NULL,NULL,NULL,'ACTIVE',247,199),(803,NULL,NULL,NULL,NULL,'ACTIVE',247,202),(804,NULL,NULL,NULL,NULL,'ACTIVE',248,196),(805,NULL,NULL,NULL,NULL,'ACTIVE',248,200),(806,NULL,NULL,NULL,NULL,'ACTIVE',248,201),(807,NULL,NULL,NULL,NULL,'ACTIVE',249,196),(808,NULL,NULL,NULL,NULL,'ACTIVE',249,200),(809,NULL,NULL,NULL,NULL,'ACTIVE',249,202),(810,NULL,NULL,NULL,NULL,'ACTIVE',250,197),(811,NULL,NULL,NULL,NULL,'ACTIVE',250,198),(812,NULL,NULL,NULL,NULL,'ACTIVE',250,201),(813,NULL,NULL,NULL,NULL,'ACTIVE',251,197),(814,NULL,NULL,NULL,NULL,'ACTIVE',251,198),(815,NULL,NULL,NULL,NULL,'ACTIVE',251,202),(816,NULL,NULL,NULL,NULL,'ACTIVE',252,197),(817,NULL,NULL,NULL,NULL,'ACTIVE',252,199),(818,NULL,NULL,NULL,NULL,'ACTIVE',252,201),(819,NULL,NULL,NULL,NULL,'ACTIVE',253,197),(820,NULL,NULL,NULL,NULL,'ACTIVE',253,199),(821,NULL,NULL,NULL,NULL,'ACTIVE',253,202),(822,NULL,NULL,NULL,NULL,'ACTIVE',254,197),(823,NULL,NULL,NULL,NULL,'ACTIVE',254,200),(824,NULL,NULL,NULL,NULL,'ACTIVE',254,201),(825,NULL,NULL,NULL,NULL,'ACTIVE',255,197),(826,NULL,NULL,NULL,NULL,'ACTIVE',255,200),(827,NULL,NULL,NULL,NULL,'ACTIVE',255,202),(996,NULL,NULL,NULL,NULL,'ACTIVE',312,228),(997,NULL,NULL,NULL,NULL,'ACTIVE',312,230),(998,NULL,NULL,NULL,NULL,'ACTIVE',312,234),(999,NULL,NULL,NULL,NULL,'ACTIVE',313,228),(1000,NULL,NULL,NULL,NULL,'ACTIVE',313,230),(1001,NULL,NULL,NULL,NULL,'ACTIVE',313,235),(1002,NULL,NULL,NULL,NULL,'ACTIVE',314,228),(1003,NULL,NULL,NULL,NULL,'ACTIVE',314,231),(1004,NULL,NULL,NULL,NULL,'ACTIVE',314,234),(1005,NULL,NULL,NULL,NULL,'ACTIVE',315,228),(1006,NULL,NULL,NULL,NULL,'ACTIVE',315,231),(1007,NULL,NULL,NULL,NULL,'ACTIVE',315,235),(1008,NULL,NULL,NULL,NULL,'ACTIVE',316,228),(1009,NULL,NULL,NULL,NULL,'ACTIVE',316,232),(1010,NULL,NULL,NULL,NULL,'ACTIVE',316,234),(1011,NULL,NULL,NULL,NULL,'ACTIVE',317,228),(1012,NULL,NULL,NULL,NULL,'ACTIVE',317,232),(1013,NULL,NULL,NULL,NULL,'ACTIVE',317,235),(1014,NULL,NULL,NULL,NULL,'ACTIVE',318,228),(1015,NULL,NULL,NULL,NULL,'ACTIVE',318,233),(1016,NULL,NULL,NULL,NULL,'ACTIVE',318,234),(1017,NULL,NULL,NULL,NULL,'ACTIVE',319,228),(1018,NULL,NULL,NULL,NULL,'ACTIVE',319,233),(1019,NULL,NULL,NULL,NULL,'ACTIVE',319,235),(1020,NULL,NULL,NULL,NULL,'ACTIVE',320,229),(1021,NULL,NULL,NULL,NULL,'ACTIVE',320,230),(1022,NULL,NULL,NULL,NULL,'ACTIVE',320,234),(1023,NULL,NULL,NULL,NULL,'ACTIVE',321,229),(1024,NULL,NULL,NULL,NULL,'ACTIVE',321,230),(1025,NULL,NULL,NULL,NULL,'ACTIVE',321,235),(1026,NULL,NULL,NULL,NULL,'ACTIVE',322,229),(1027,NULL,NULL,NULL,NULL,'ACTIVE',322,231),(1028,NULL,NULL,NULL,NULL,'ACTIVE',322,234),(1029,NULL,NULL,NULL,NULL,'ACTIVE',323,229),(1030,NULL,NULL,NULL,NULL,'ACTIVE',323,231),(1031,NULL,NULL,NULL,NULL,'ACTIVE',323,235),(1032,NULL,NULL,NULL,NULL,'ACTIVE',324,229),(1033,NULL,NULL,NULL,NULL,'ACTIVE',324,232),(1034,NULL,NULL,NULL,NULL,'ACTIVE',324,234),(1035,NULL,NULL,NULL,NULL,'ACTIVE',325,229),(1036,NULL,NULL,NULL,NULL,'ACTIVE',325,232),(1037,NULL,NULL,NULL,NULL,'ACTIVE',325,235),(1038,NULL,NULL,NULL,NULL,'ACTIVE',326,229),(1039,NULL,NULL,NULL,NULL,'ACTIVE',326,233),(1040,NULL,NULL,NULL,NULL,'ACTIVE',326,234),(1041,NULL,NULL,NULL,NULL,'ACTIVE',327,229),(1042,NULL,NULL,NULL,NULL,'ACTIVE',327,233),(1043,NULL,NULL,NULL,NULL,'ACTIVE',327,235),(2388,NULL,NULL,NULL,NULL,'ACTIVE',520,251),(2389,NULL,NULL,NULL,NULL,'ACTIVE',520,254),(2390,NULL,NULL,NULL,NULL,'ACTIVE',520,258),(2391,NULL,NULL,NULL,NULL,'ACTIVE',520,260),(2395,NULL,NULL,NULL,NULL,'ACTIVE',521,251),(2396,NULL,NULL,NULL,NULL,'ACTIVE',521,254),(2397,NULL,NULL,NULL,NULL,'ACTIVE',521,258),(2398,NULL,NULL,NULL,NULL,'ACTIVE',521,261),(2402,NULL,NULL,NULL,NULL,'ACTIVE',522,251),(2403,NULL,NULL,NULL,NULL,'ACTIVE',522,254),(2404,NULL,NULL,NULL,NULL,'ACTIVE',522,259),(2405,NULL,NULL,NULL,NULL,'ACTIVE',522,260),(2409,NULL,NULL,NULL,NULL,'ACTIVE',523,251),(2410,NULL,NULL,NULL,NULL,'ACTIVE',523,254),(2411,NULL,NULL,NULL,NULL,'ACTIVE',523,259),(2412,NULL,NULL,NULL,NULL,'ACTIVE',523,261),(2444,NULL,NULL,NULL,NULL,'ACTIVE',528,251),(2445,NULL,NULL,NULL,NULL,'ACTIVE',528,256),(2446,NULL,NULL,NULL,NULL,'ACTIVE',528,258),(2447,NULL,NULL,NULL,NULL,'ACTIVE',528,260),(2451,NULL,NULL,NULL,NULL,'ACTIVE',529,251),(2452,NULL,NULL,NULL,NULL,'ACTIVE',529,256),(2453,NULL,NULL,NULL,NULL,'ACTIVE',529,258),(2454,NULL,NULL,NULL,NULL,'ACTIVE',529,261),(2458,NULL,NULL,NULL,NULL,'ACTIVE',530,251),(2459,NULL,NULL,NULL,NULL,'ACTIVE',530,256),(2460,NULL,NULL,NULL,NULL,'ACTIVE',530,259),(2461,NULL,NULL,NULL,NULL,'ACTIVE',530,260),(2465,NULL,NULL,NULL,NULL,'ACTIVE',531,251),(2466,NULL,NULL,NULL,NULL,'ACTIVE',531,256),(2467,NULL,NULL,NULL,NULL,'ACTIVE',531,259),(2468,NULL,NULL,NULL,NULL,'ACTIVE',531,261),(2472,NULL,NULL,NULL,NULL,'ACTIVE',532,251),(2473,NULL,NULL,NULL,NULL,'ACTIVE',532,257),(2474,NULL,NULL,NULL,NULL,'ACTIVE',532,258),(2475,NULL,NULL,NULL,NULL,'ACTIVE',532,260),(2479,NULL,NULL,NULL,NULL,'ACTIVE',533,251),(2480,NULL,NULL,NULL,NULL,'ACTIVE',533,257),(2481,NULL,NULL,NULL,NULL,'ACTIVE',533,258),(2482,NULL,NULL,NULL,NULL,'ACTIVE',533,261),(2486,NULL,NULL,NULL,NULL,'ACTIVE',534,251),(2487,NULL,NULL,NULL,NULL,'ACTIVE',534,257),(2488,NULL,NULL,NULL,NULL,'ACTIVE',534,259),(2489,NULL,NULL,NULL,NULL,'ACTIVE',534,260),(2493,NULL,NULL,NULL,NULL,'ACTIVE',535,251),(2494,NULL,NULL,NULL,NULL,'ACTIVE',535,257),(2495,NULL,NULL,NULL,NULL,'ACTIVE',535,259),(2496,NULL,NULL,NULL,NULL,'ACTIVE',535,261),(2500,NULL,NULL,NULL,NULL,'ACTIVE',536,252),(2501,NULL,NULL,NULL,NULL,'ACTIVE',536,254),(2502,NULL,NULL,NULL,NULL,'ACTIVE',536,258),(2503,NULL,NULL,NULL,NULL,'ACTIVE',536,260),(2507,NULL,NULL,NULL,NULL,'ACTIVE',537,252),(2508,NULL,NULL,NULL,NULL,'ACTIVE',537,254),(2509,NULL,NULL,NULL,NULL,'ACTIVE',537,258),(2510,NULL,NULL,NULL,NULL,'ACTIVE',537,261),(2514,NULL,NULL,NULL,NULL,'ACTIVE',538,252),(2515,NULL,NULL,NULL,NULL,'ACTIVE',538,254),(2516,NULL,NULL,NULL,NULL,'ACTIVE',538,259),(2517,NULL,NULL,NULL,NULL,'ACTIVE',538,260),(2521,NULL,NULL,NULL,NULL,'ACTIVE',539,252),(2522,NULL,NULL,NULL,NULL,'ACTIVE',539,254),(2523,NULL,NULL,NULL,NULL,'ACTIVE',539,259),(2524,NULL,NULL,NULL,NULL,'ACTIVE',539,261),(2556,NULL,NULL,NULL,NULL,'ACTIVE',544,252),(2557,NULL,NULL,NULL,NULL,'ACTIVE',544,256),(2558,NULL,NULL,NULL,NULL,'ACTIVE',544,258),(2559,NULL,NULL,NULL,NULL,'ACTIVE',544,260),(2563,NULL,NULL,NULL,NULL,'ACTIVE',545,252),(2564,NULL,NULL,NULL,NULL,'ACTIVE',545,256),(2565,NULL,NULL,NULL,NULL,'ACTIVE',545,258),(2566,NULL,NULL,NULL,NULL,'ACTIVE',545,261),(2570,NULL,NULL,NULL,NULL,'ACTIVE',546,252),(2571,NULL,NULL,NULL,NULL,'ACTIVE',546,256),(2572,NULL,NULL,NULL,NULL,'ACTIVE',546,259),(2573,NULL,NULL,NULL,NULL,'ACTIVE',546,260),(2577,NULL,NULL,NULL,NULL,'ACTIVE',547,252),(2578,NULL,NULL,NULL,NULL,'ACTIVE',547,256),(2579,NULL,NULL,NULL,NULL,'ACTIVE',547,259),(2580,NULL,NULL,NULL,NULL,'ACTIVE',547,261),(2584,NULL,NULL,NULL,NULL,'ACTIVE',548,252),(2585,NULL,NULL,NULL,NULL,'ACTIVE',548,257),(2586,NULL,NULL,NULL,NULL,'ACTIVE',548,258),(2587,NULL,NULL,NULL,NULL,'ACTIVE',548,260),(2591,NULL,NULL,NULL,NULL,'ACTIVE',549,252),(2592,NULL,NULL,NULL,NULL,'ACTIVE',549,257),(2593,NULL,NULL,NULL,NULL,'ACTIVE',549,258),(2594,NULL,NULL,NULL,NULL,'ACTIVE',549,261),(2598,NULL,NULL,NULL,NULL,'ACTIVE',550,252),(2599,NULL,NULL,NULL,NULL,'ACTIVE',550,257),(2600,NULL,NULL,NULL,NULL,'ACTIVE',550,259),(2601,NULL,NULL,NULL,NULL,'ACTIVE',550,260),(2605,NULL,NULL,NULL,NULL,'ACTIVE',551,252),(2606,NULL,NULL,NULL,NULL,'ACTIVE',551,257),(2607,NULL,NULL,NULL,NULL,'ACTIVE',551,259),(2608,NULL,NULL,NULL,NULL,'ACTIVE',551,261),(2612,NULL,NULL,NULL,NULL,'ACTIVE',552,253),(2613,NULL,NULL,NULL,NULL,'ACTIVE',552,254),(2614,NULL,NULL,NULL,NULL,'ACTIVE',552,258),(2615,NULL,NULL,NULL,NULL,'ACTIVE',552,260),(2619,NULL,NULL,NULL,NULL,'ACTIVE',553,253),(2620,NULL,NULL,NULL,NULL,'ACTIVE',553,254),(2621,NULL,NULL,NULL,NULL,'ACTIVE',553,258),(2622,NULL,NULL,NULL,NULL,'ACTIVE',553,261),(2626,NULL,NULL,NULL,NULL,'ACTIVE',554,253),(2627,NULL,NULL,NULL,NULL,'ACTIVE',554,254),(2628,NULL,NULL,NULL,NULL,'ACTIVE',554,259),(2629,NULL,NULL,NULL,NULL,'ACTIVE',554,260),(2633,NULL,NULL,NULL,NULL,'ACTIVE',555,253),(2634,NULL,NULL,NULL,NULL,'ACTIVE',555,254),(2635,NULL,NULL,NULL,NULL,'ACTIVE',555,259),(2636,NULL,NULL,NULL,NULL,'ACTIVE',555,261),(2668,NULL,NULL,NULL,NULL,'ACTIVE',560,253),(2669,NULL,NULL,NULL,NULL,'ACTIVE',560,256),(2670,NULL,NULL,NULL,NULL,'ACTIVE',560,258),(2671,NULL,NULL,NULL,NULL,'ACTIVE',560,260),(2675,NULL,NULL,NULL,NULL,'ACTIVE',561,253),(2676,NULL,NULL,NULL,NULL,'ACTIVE',561,256),(2677,NULL,NULL,NULL,NULL,'ACTIVE',561,258),(2678,NULL,NULL,NULL,NULL,'ACTIVE',561,261),(2682,NULL,NULL,NULL,NULL,'ACTIVE',562,253),(2683,NULL,NULL,NULL,NULL,'ACTIVE',562,256),(2684,NULL,NULL,NULL,NULL,'ACTIVE',562,259),(2685,NULL,NULL,NULL,NULL,'ACTIVE',562,260),(2689,NULL,NULL,NULL,NULL,'ACTIVE',563,253),(2690,NULL,NULL,NULL,NULL,'ACTIVE',563,256),(2691,NULL,NULL,NULL,NULL,'ACTIVE',563,259),(2692,NULL,NULL,NULL,NULL,'ACTIVE',563,261),(2696,NULL,NULL,NULL,NULL,'ACTIVE',564,253),(2697,NULL,NULL,NULL,NULL,'ACTIVE',564,257),(2698,NULL,NULL,NULL,NULL,'ACTIVE',564,258),(2699,NULL,NULL,NULL,NULL,'ACTIVE',564,260),(2703,NULL,NULL,NULL,NULL,'ACTIVE',565,253),(2704,NULL,NULL,NULL,NULL,'ACTIVE',565,257),(2705,NULL,NULL,NULL,NULL,'ACTIVE',565,258),(2706,NULL,NULL,NULL,NULL,'ACTIVE',565,261),(2710,NULL,NULL,NULL,NULL,'ACTIVE',566,253),(2711,NULL,NULL,NULL,NULL,'ACTIVE',566,257),(2712,NULL,NULL,NULL,NULL,'ACTIVE',566,259),(2713,NULL,NULL,NULL,NULL,'ACTIVE',566,260),(2717,NULL,NULL,NULL,NULL,'ACTIVE',567,253),(2718,NULL,NULL,NULL,NULL,'ACTIVE',567,257),(2719,NULL,NULL,NULL,NULL,'ACTIVE',567,259),(2720,NULL,NULL,NULL,NULL,'ACTIVE',567,261),(2724,NULL,NULL,NULL,NULL,'ACTIVE',568,262),(2725,NULL,NULL,NULL,NULL,'ACTIVE',569,263),(2737,NULL,NULL,NULL,NULL,'ACTIVE',574,268),(2738,NULL,NULL,NULL,NULL,'ACTIVE',575,269),(2739,NULL,NULL,NULL,NULL,'ACTIVE',576,270),(2740,NULL,NULL,NULL,NULL,'ACTIVE',576,272),(2742,NULL,NULL,NULL,NULL,'ACTIVE',577,270),(2743,NULL,NULL,NULL,NULL,'ACTIVE',577,273),(2745,NULL,NULL,NULL,NULL,'ACTIVE',578,271),(2746,NULL,NULL,NULL,NULL,'ACTIVE',578,272),(2748,NULL,NULL,NULL,NULL,'ACTIVE',579,271),(2749,NULL,NULL,NULL,NULL,'ACTIVE',579,273),(2751,NULL,NULL,NULL,NULL,'ACTIVE',580,274),(2752,NULL,NULL,NULL,NULL,'ACTIVE',581,275),(2753,NULL,NULL,NULL,NULL,'ACTIVE',582,276),(2778,NULL,NULL,NULL,NULL,'ACTIVE',591,285),(2779,NULL,NULL,NULL,NULL,'ACTIVE',591,286),(2805,NULL,NULL,NULL,NULL,'ACTIVE',604,300),(2806,NULL,NULL,NULL,NULL,'ACTIVE',605,301),(2889,NULL,NULL,NULL,NULL,'ACTIVE',634,321),(2908,NULL,NULL,NULL,NULL,'ACTIVE',641,327),(2909,NULL,NULL,NULL,NULL,'ACTIVE',641,331),(2911,NULL,NULL,NULL,NULL,'ACTIVE',642,327),(2912,NULL,NULL,NULL,NULL,'ACTIVE',642,332),(2914,NULL,NULL,NULL,NULL,'ACTIVE',643,327),(2915,NULL,NULL,NULL,NULL,'ACTIVE',643,333),(2917,NULL,NULL,NULL,NULL,'ACTIVE',644,328),(2918,NULL,NULL,NULL,NULL,'ACTIVE',644,331),(2920,NULL,NULL,NULL,NULL,'ACTIVE',645,328),(2921,NULL,NULL,NULL,NULL,'ACTIVE',645,332),(2923,NULL,NULL,NULL,NULL,'ACTIVE',646,328),(2924,NULL,NULL,NULL,NULL,'ACTIVE',646,333),(2926,NULL,NULL,NULL,NULL,'ACTIVE',647,329),(2927,NULL,NULL,NULL,NULL,'ACTIVE',647,331),(2929,NULL,NULL,NULL,NULL,'ACTIVE',648,329),(2930,NULL,NULL,NULL,NULL,'ACTIVE',648,332),(2932,NULL,NULL,NULL,NULL,'ACTIVE',649,329),(2933,NULL,NULL,NULL,NULL,'ACTIVE',649,333),(2935,NULL,NULL,NULL,NULL,'ACTIVE',650,330),(2936,NULL,NULL,NULL,NULL,'ACTIVE',650,331),(2938,NULL,NULL,NULL,NULL,'ACTIVE',651,330),(2939,NULL,NULL,NULL,NULL,'ACTIVE',651,332),(2941,NULL,NULL,NULL,NULL,'ACTIVE',652,330),(2942,NULL,NULL,NULL,NULL,'ACTIVE',652,333),(3067,NULL,NULL,NULL,NULL,'ACTIVE',694,361),(3068,NULL,NULL,NULL,NULL,'ACTIVE',694,363),(3070,NULL,NULL,NULL,NULL,'ACTIVE',695,361),(3071,NULL,NULL,NULL,NULL,'ACTIVE',695,364),(3073,NULL,NULL,NULL,NULL,'ACTIVE',696,361),(3074,NULL,NULL,NULL,NULL,'ACTIVE',696,365),(3076,NULL,NULL,NULL,NULL,'ACTIVE',697,362),(3077,NULL,NULL,NULL,NULL,'ACTIVE',697,363),(3079,NULL,NULL,NULL,NULL,'ACTIVE',698,362),(3080,NULL,NULL,NULL,NULL,'ACTIVE',698,364),(3082,NULL,NULL,NULL,NULL,'ACTIVE',699,362),(3083,NULL,NULL,NULL,NULL,'ACTIVE',699,365),(3085,NULL,NULL,NULL,NULL,'ACTIVE',700,366),(3086,NULL,NULL,NULL,NULL,'ACTIVE',700,369),(3087,NULL,NULL,NULL,NULL,'ACTIVE',700,373),(3088,NULL,NULL,NULL,NULL,'ACTIVE',701,366),(3089,NULL,NULL,NULL,NULL,'ACTIVE',701,369),(3090,NULL,NULL,NULL,NULL,'ACTIVE',701,374),(3091,NULL,NULL,NULL,NULL,'ACTIVE',702,366),(3092,NULL,NULL,NULL,NULL,'ACTIVE',702,370),(3093,NULL,NULL,NULL,NULL,'ACTIVE',702,373),(3094,NULL,NULL,NULL,NULL,'ACTIVE',703,366),(3095,NULL,NULL,NULL,NULL,'ACTIVE',703,370),(3096,NULL,NULL,NULL,NULL,'ACTIVE',703,374),(3097,NULL,NULL,NULL,NULL,'ACTIVE',704,366),(3098,NULL,NULL,NULL,NULL,'ACTIVE',704,371),(3099,NULL,NULL,NULL,NULL,'ACTIVE',704,373),(3100,NULL,NULL,NULL,NULL,'ACTIVE',705,366),(3101,NULL,NULL,NULL,NULL,'ACTIVE',705,371),(3102,NULL,NULL,NULL,NULL,'ACTIVE',705,374),(3103,NULL,NULL,NULL,NULL,'ACTIVE',706,366),(3104,NULL,NULL,NULL,NULL,'ACTIVE',706,372),(3105,NULL,NULL,NULL,NULL,'ACTIVE',706,373),(3106,NULL,NULL,NULL,NULL,'ACTIVE',707,366),(3107,NULL,NULL,NULL,NULL,'ACTIVE',707,372),(3108,NULL,NULL,NULL,NULL,'ACTIVE',707,374),(3109,NULL,NULL,NULL,NULL,'ACTIVE',708,367),(3110,NULL,NULL,NULL,NULL,'ACTIVE',708,369),(3111,NULL,NULL,NULL,NULL,'ACTIVE',708,373),(3112,NULL,NULL,NULL,NULL,'ACTIVE',709,367),(3113,NULL,NULL,NULL,NULL,'ACTIVE',709,369),(3114,NULL,NULL,NULL,NULL,'ACTIVE',709,374),(3115,NULL,NULL,NULL,NULL,'ACTIVE',710,367),(3116,NULL,NULL,NULL,NULL,'ACTIVE',710,370),(3117,NULL,NULL,NULL,NULL,'ACTIVE',710,373),(3118,NULL,NULL,NULL,NULL,'ACTIVE',711,367),(3119,NULL,NULL,NULL,NULL,'ACTIVE',711,370),(3120,NULL,NULL,NULL,NULL,'ACTIVE',711,374),(3121,NULL,NULL,NULL,NULL,'ACTIVE',712,367),(3122,NULL,NULL,NULL,NULL,'ACTIVE',712,371),(3123,NULL,NULL,NULL,NULL,'ACTIVE',712,373),(3124,NULL,NULL,NULL,NULL,'ACTIVE',713,367),(3125,NULL,NULL,NULL,NULL,'ACTIVE',713,371),(3126,NULL,NULL,NULL,NULL,'ACTIVE',713,374),(3127,NULL,NULL,NULL,NULL,'ACTIVE',714,367),(3128,NULL,NULL,NULL,NULL,'ACTIVE',714,372),(3129,NULL,NULL,NULL,NULL,'ACTIVE',714,373),(3130,NULL,NULL,NULL,NULL,'ACTIVE',715,367),(3131,NULL,NULL,NULL,NULL,'ACTIVE',715,372),(3132,NULL,NULL,NULL,NULL,'ACTIVE',715,374),(3133,NULL,NULL,NULL,NULL,'ACTIVE',716,368),(3134,NULL,NULL,NULL,NULL,'ACTIVE',716,369),(3135,NULL,NULL,NULL,NULL,'ACTIVE',716,373),(3136,NULL,NULL,NULL,NULL,'ACTIVE',717,368),(3137,NULL,NULL,NULL,NULL,'ACTIVE',717,369),(3138,NULL,NULL,NULL,NULL,'ACTIVE',717,374),(3139,NULL,NULL,NULL,NULL,'ACTIVE',718,368),(3140,NULL,NULL,NULL,NULL,'ACTIVE',718,370),(3141,NULL,NULL,NULL,NULL,'ACTIVE',718,373),(3142,NULL,NULL,NULL,NULL,'ACTIVE',719,368),(3143,NULL,NULL,NULL,NULL,'ACTIVE',719,370),(3144,NULL,NULL,NULL,NULL,'ACTIVE',719,374),(3145,NULL,NULL,NULL,NULL,'ACTIVE',720,368),(3146,NULL,NULL,NULL,NULL,'ACTIVE',720,371),(3147,NULL,NULL,NULL,NULL,'ACTIVE',720,373),(3148,NULL,NULL,NULL,NULL,'ACTIVE',721,368),(3149,NULL,NULL,NULL,NULL,'ACTIVE',721,371),(3150,NULL,NULL,NULL,NULL,'ACTIVE',721,374),(3151,NULL,NULL,NULL,NULL,'ACTIVE',722,368),(3152,NULL,NULL,NULL,NULL,'ACTIVE',722,372),(3153,NULL,NULL,NULL,NULL,'ACTIVE',722,373),(3154,NULL,NULL,NULL,NULL,'ACTIVE',723,368),(3155,NULL,NULL,NULL,NULL,'ACTIVE',723,372),(3156,NULL,NULL,NULL,NULL,'ACTIVE',723,374),(3157,NULL,NULL,NULL,NULL,'ACTIVE',724,375),(3158,NULL,NULL,NULL,NULL,'ACTIVE',724,377),(3159,NULL,NULL,NULL,NULL,'ACTIVE',724,381),(3160,NULL,NULL,NULL,NULL,'ACTIVE',724,383),(3164,NULL,NULL,NULL,NULL,'ACTIVE',725,375),(3165,NULL,NULL,NULL,NULL,'ACTIVE',725,377),(3166,NULL,NULL,NULL,NULL,'ACTIVE',725,382),(3167,NULL,NULL,NULL,NULL,'ACTIVE',725,383),(3171,NULL,NULL,NULL,NULL,'ACTIVE',726,375),(3172,NULL,NULL,NULL,NULL,'ACTIVE',726,378),(3173,NULL,NULL,NULL,NULL,'ACTIVE',726,381),(3174,NULL,NULL,NULL,NULL,'ACTIVE',726,383),(3178,NULL,NULL,NULL,NULL,'ACTIVE',727,375),(3179,NULL,NULL,NULL,NULL,'ACTIVE',727,378),(3180,NULL,NULL,NULL,NULL,'ACTIVE',727,382),(3181,NULL,NULL,NULL,NULL,'ACTIVE',727,383),(3185,NULL,NULL,NULL,NULL,'ACTIVE',728,375),(3186,NULL,NULL,NULL,NULL,'ACTIVE',728,379),(3187,NULL,NULL,NULL,NULL,'ACTIVE',728,381),(3188,NULL,NULL,NULL,NULL,'ACTIVE',728,383),(3192,NULL,NULL,NULL,NULL,'ACTIVE',729,375),(3193,NULL,NULL,NULL,NULL,'ACTIVE',729,379),(3194,NULL,NULL,NULL,NULL,'ACTIVE',729,382),(3195,NULL,NULL,NULL,NULL,'ACTIVE',729,383),(3199,NULL,NULL,NULL,NULL,'ACTIVE',730,375),(3200,NULL,NULL,NULL,NULL,'ACTIVE',730,380),(3201,NULL,NULL,NULL,NULL,'ACTIVE',730,381),(3202,NULL,NULL,NULL,NULL,'ACTIVE',730,383),(3206,NULL,NULL,NULL,NULL,'ACTIVE',731,375),(3207,NULL,NULL,NULL,NULL,'ACTIVE',731,380),(3208,NULL,NULL,NULL,NULL,'ACTIVE',731,382),(3209,NULL,NULL,NULL,NULL,'ACTIVE',731,383),(3213,NULL,NULL,NULL,NULL,'ACTIVE',732,376),(3214,NULL,NULL,NULL,NULL,'ACTIVE',732,377),(3215,NULL,NULL,NULL,NULL,'ACTIVE',732,381),(3216,NULL,NULL,NULL,NULL,'ACTIVE',732,383),(3220,NULL,NULL,NULL,NULL,'ACTIVE',733,376),(3221,NULL,NULL,NULL,NULL,'ACTIVE',733,377),(3222,NULL,NULL,NULL,NULL,'ACTIVE',733,382),(3223,NULL,NULL,NULL,NULL,'ACTIVE',733,383),(3227,NULL,NULL,NULL,NULL,'ACTIVE',734,376),(3228,NULL,NULL,NULL,NULL,'ACTIVE',734,378),(3229,NULL,NULL,NULL,NULL,'ACTIVE',734,381),(3230,NULL,NULL,NULL,NULL,'ACTIVE',734,383),(3234,NULL,NULL,NULL,NULL,'ACTIVE',735,376),(3235,NULL,NULL,NULL,NULL,'ACTIVE',735,378),(3236,NULL,NULL,NULL,NULL,'ACTIVE',735,382),(3237,NULL,NULL,NULL,NULL,'ACTIVE',735,383),(3241,NULL,NULL,NULL,NULL,'ACTIVE',736,376),(3242,NULL,NULL,NULL,NULL,'ACTIVE',736,379),(3243,NULL,NULL,NULL,NULL,'ACTIVE',736,381),(3244,NULL,NULL,NULL,NULL,'ACTIVE',736,383),(3248,NULL,NULL,NULL,NULL,'ACTIVE',737,376),(3249,NULL,NULL,NULL,NULL,'ACTIVE',737,379),(3250,NULL,NULL,NULL,NULL,'ACTIVE',737,382),(3251,NULL,NULL,NULL,NULL,'ACTIVE',737,383),(3255,NULL,NULL,NULL,NULL,'ACTIVE',738,376),(3256,NULL,NULL,NULL,NULL,'ACTIVE',738,380),(3257,NULL,NULL,NULL,NULL,'ACTIVE',738,381),(3258,NULL,NULL,NULL,NULL,'ACTIVE',738,383),(3262,NULL,NULL,NULL,NULL,'ACTIVE',739,376),(3263,NULL,NULL,NULL,NULL,'ACTIVE',739,380),(3264,NULL,NULL,NULL,NULL,'ACTIVE',739,382),(3265,NULL,NULL,NULL,NULL,'ACTIVE',739,383),(3269,NULL,NULL,NULL,NULL,'ACTIVE',740,384),(3270,NULL,NULL,NULL,NULL,'ACTIVE',740,386),(3271,NULL,NULL,NULL,NULL,'ACTIVE',740,388),(3272,NULL,NULL,NULL,NULL,'ACTIVE',741,384),(3273,NULL,NULL,NULL,NULL,'ACTIVE',741,387),(3274,NULL,NULL,NULL,NULL,'ACTIVE',741,388),(3275,NULL,NULL,NULL,NULL,'ACTIVE',742,385),(3276,NULL,NULL,NULL,NULL,'ACTIVE',742,386),(3277,NULL,NULL,NULL,NULL,'ACTIVE',742,388),(3278,NULL,NULL,NULL,NULL,'ACTIVE',743,385),(3279,NULL,NULL,NULL,NULL,'ACTIVE',743,387),(3280,NULL,NULL,NULL,NULL,'ACTIVE',743,388),(3413,NULL,NULL,NULL,NULL,'ACTIVE',788,410),(3414,NULL,NULL,NULL,NULL,'ACTIVE',788,412),(3416,NULL,NULL,NULL,NULL,'ACTIVE',789,410),(3417,NULL,NULL,NULL,NULL,'ACTIVE',789,413),(3419,NULL,NULL,NULL,NULL,'ACTIVE',790,410),(3420,NULL,NULL,NULL,NULL,'ACTIVE',790,414),(3422,NULL,NULL,NULL,NULL,'ACTIVE',791,410),(3423,NULL,NULL,NULL,NULL,'ACTIVE',791,415),(3425,NULL,NULL,NULL,NULL,'ACTIVE',792,411),(3426,NULL,NULL,NULL,NULL,'ACTIVE',792,412),(3428,NULL,NULL,NULL,NULL,'ACTIVE',793,411),(3429,NULL,NULL,NULL,NULL,'ACTIVE',793,413),(3431,NULL,NULL,NULL,NULL,'ACTIVE',794,411),(3432,NULL,NULL,NULL,NULL,'ACTIVE',794,414),(3434,NULL,NULL,NULL,NULL,'ACTIVE',795,411),(3435,NULL,NULL,NULL,NULL,'ACTIVE',795,415),(3437,NULL,NULL,NULL,NULL,'ACTIVE',796,416),(3438,NULL,NULL,NULL,NULL,'ACTIVE',796,418),(3440,NULL,NULL,NULL,NULL,'ACTIVE',797,416),(3441,NULL,NULL,NULL,NULL,'ACTIVE',797,419),(3443,NULL,NULL,NULL,NULL,'ACTIVE',798,416),(3444,NULL,NULL,NULL,NULL,'ACTIVE',798,420),(3446,NULL,NULL,NULL,NULL,'ACTIVE',799,417),(3447,NULL,NULL,NULL,NULL,'ACTIVE',799,418),(3449,NULL,NULL,NULL,NULL,'ACTIVE',800,417),(3450,NULL,NULL,NULL,NULL,'ACTIVE',800,419),(3452,NULL,NULL,NULL,NULL,'ACTIVE',801,417),(3453,NULL,NULL,NULL,NULL,'ACTIVE',801,420),(3455,NULL,NULL,NULL,NULL,'ACTIVE',802,421),(3456,NULL,NULL,NULL,NULL,'ACTIVE',802,425),(3457,NULL,NULL,NULL,NULL,'ACTIVE',802,429),(3458,NULL,NULL,NULL,NULL,'ACTIVE',802,432),(3459,NULL,NULL,NULL,NULL,'ACTIVE',802,436),(3462,NULL,NULL,NULL,NULL,'ACTIVE',803,421),(3463,NULL,NULL,NULL,NULL,'ACTIVE',803,425),(3464,NULL,NULL,NULL,NULL,'ACTIVE',803,429),(3465,NULL,NULL,NULL,NULL,'ACTIVE',803,433),(3466,NULL,NULL,NULL,NULL,'ACTIVE',803,436),(3469,NULL,NULL,NULL,NULL,'ACTIVE',804,421),(3470,NULL,NULL,NULL,NULL,'ACTIVE',804,425),(3471,NULL,NULL,NULL,NULL,'ACTIVE',804,429),(3472,NULL,NULL,NULL,NULL,'ACTIVE',804,434),(3473,NULL,NULL,NULL,NULL,'ACTIVE',804,436),(3476,NULL,NULL,NULL,NULL,'ACTIVE',805,421),(3477,NULL,NULL,NULL,NULL,'ACTIVE',805,425),(3478,NULL,NULL,NULL,NULL,'ACTIVE',805,429),(3479,NULL,NULL,NULL,NULL,'ACTIVE',805,435),(3480,NULL,NULL,NULL,NULL,'ACTIVE',805,436),(3483,NULL,NULL,NULL,NULL,'ACTIVE',806,421),(3484,NULL,NULL,NULL,NULL,'ACTIVE',806,425),(3485,NULL,NULL,NULL,NULL,'ACTIVE',806,430),(3486,NULL,NULL,NULL,NULL,'ACTIVE',806,432),(3487,NULL,NULL,NULL,NULL,'ACTIVE',806,436),(3490,NULL,NULL,NULL,NULL,'ACTIVE',807,421),(3491,NULL,NULL,NULL,NULL,'ACTIVE',807,425),(3492,NULL,NULL,NULL,NULL,'ACTIVE',807,430),(3493,NULL,NULL,NULL,NULL,'ACTIVE',807,433),(3494,NULL,NULL,NULL,NULL,'ACTIVE',807,436),(3497,NULL,NULL,NULL,NULL,'ACTIVE',808,421),(3498,NULL,NULL,NULL,NULL,'ACTIVE',808,425),(3499,NULL,NULL,NULL,NULL,'ACTIVE',808,430),(3500,NULL,NULL,NULL,NULL,'ACTIVE',808,434),(3501,NULL,NULL,NULL,NULL,'ACTIVE',808,436),(3504,NULL,NULL,NULL,NULL,'ACTIVE',809,421),(3505,NULL,NULL,NULL,NULL,'ACTIVE',809,425),(3506,NULL,NULL,NULL,NULL,'ACTIVE',809,430),(3507,NULL,NULL,NULL,NULL,'ACTIVE',809,435),(3508,NULL,NULL,NULL,NULL,'ACTIVE',809,436),(3511,NULL,NULL,NULL,NULL,'ACTIVE',810,421),(3512,NULL,NULL,NULL,NULL,'ACTIVE',810,425),(3513,NULL,NULL,NULL,NULL,'ACTIVE',810,431),(3514,NULL,NULL,NULL,NULL,'ACTIVE',810,432),(3515,NULL,NULL,NULL,NULL,'ACTIVE',810,436),(3518,NULL,NULL,NULL,NULL,'ACTIVE',811,421),(3519,NULL,NULL,NULL,NULL,'ACTIVE',811,425),(3520,NULL,NULL,NULL,NULL,'ACTIVE',811,431),(3521,NULL,NULL,NULL,NULL,'ACTIVE',811,433),(3522,NULL,NULL,NULL,NULL,'ACTIVE',811,436),(3525,NULL,NULL,NULL,NULL,'ACTIVE',812,421),(3526,NULL,NULL,NULL,NULL,'ACTIVE',812,425),(3527,NULL,NULL,NULL,NULL,'ACTIVE',812,431),(3528,NULL,NULL,NULL,NULL,'ACTIVE',812,434),(3529,NULL,NULL,NULL,NULL,'ACTIVE',812,436),(3532,NULL,NULL,NULL,NULL,'ACTIVE',813,421),(3533,NULL,NULL,NULL,NULL,'ACTIVE',813,425),(3534,NULL,NULL,NULL,NULL,'ACTIVE',813,431),(3535,NULL,NULL,NULL,NULL,'ACTIVE',813,435),(3536,NULL,NULL,NULL,NULL,'ACTIVE',813,436),(3539,NULL,NULL,NULL,NULL,'ACTIVE',814,421),(3540,NULL,NULL,NULL,NULL,'ACTIVE',814,426),(3541,NULL,NULL,NULL,NULL,'ACTIVE',814,429),(3542,NULL,NULL,NULL,NULL,'ACTIVE',814,432),(3543,NULL,NULL,NULL,NULL,'ACTIVE',814,436),(3546,NULL,NULL,NULL,NULL,'ACTIVE',815,421),(3547,NULL,NULL,NULL,NULL,'ACTIVE',815,426),(3548,NULL,NULL,NULL,NULL,'ACTIVE',815,429),(3549,NULL,NULL,NULL,NULL,'ACTIVE',815,433),(3550,NULL,NULL,NULL,NULL,'ACTIVE',815,436),(3553,NULL,NULL,NULL,NULL,'ACTIVE',816,421),(3554,NULL,NULL,NULL,NULL,'ACTIVE',816,426),(3555,NULL,NULL,NULL,NULL,'ACTIVE',816,429),(3556,NULL,NULL,NULL,NULL,'ACTIVE',816,434),(3557,NULL,NULL,NULL,NULL,'ACTIVE',816,436),(3560,NULL,NULL,NULL,NULL,'ACTIVE',817,421),(3561,NULL,NULL,NULL,NULL,'ACTIVE',817,426),(3562,NULL,NULL,NULL,NULL,'ACTIVE',817,429),(3563,NULL,NULL,NULL,NULL,'ACTIVE',817,435),(3564,NULL,NULL,NULL,NULL,'ACTIVE',817,436),(3567,NULL,NULL,NULL,NULL,'ACTIVE',818,421),(3568,NULL,NULL,NULL,NULL,'ACTIVE',818,426),(3569,NULL,NULL,NULL,NULL,'ACTIVE',818,430),(3570,NULL,NULL,NULL,NULL,'ACTIVE',818,432),(3571,NULL,NULL,NULL,NULL,'ACTIVE',818,436),(3574,NULL,NULL,NULL,NULL,'ACTIVE',819,421),(3575,NULL,NULL,NULL,NULL,'ACTIVE',819,426),(3576,NULL,NULL,NULL,NULL,'ACTIVE',819,430),(3577,NULL,NULL,NULL,NULL,'ACTIVE',819,433),(3578,NULL,NULL,NULL,NULL,'ACTIVE',819,436),(3581,NULL,NULL,NULL,NULL,'ACTIVE',820,421),(3582,NULL,NULL,NULL,NULL,'ACTIVE',820,426),(3583,NULL,NULL,NULL,NULL,'ACTIVE',820,430),(3584,NULL,NULL,NULL,NULL,'ACTIVE',820,434),(3585,NULL,NULL,NULL,NULL,'ACTIVE',820,436),(3588,NULL,NULL,NULL,NULL,'ACTIVE',821,421),(3589,NULL,NULL,NULL,NULL,'ACTIVE',821,426),(3590,NULL,NULL,NULL,NULL,'ACTIVE',821,430),(3591,NULL,NULL,NULL,NULL,'ACTIVE',821,435),(3592,NULL,NULL,NULL,NULL,'ACTIVE',821,436),(3595,NULL,NULL,NULL,NULL,'ACTIVE',822,421),(3596,NULL,NULL,NULL,NULL,'ACTIVE',822,426),(3597,NULL,NULL,NULL,NULL,'ACTIVE',822,431),(3598,NULL,NULL,NULL,NULL,'ACTIVE',822,432),(3599,NULL,NULL,NULL,NULL,'ACTIVE',822,436),(3602,NULL,NULL,NULL,NULL,'ACTIVE',823,421),(3603,NULL,NULL,NULL,NULL,'ACTIVE',823,426),(3604,NULL,NULL,NULL,NULL,'ACTIVE',823,431),(3605,NULL,NULL,NULL,NULL,'ACTIVE',823,433),(3606,NULL,NULL,NULL,NULL,'ACTIVE',823,436),(3609,NULL,NULL,NULL,NULL,'ACTIVE',824,421),(3610,NULL,NULL,NULL,NULL,'ACTIVE',824,426),(3611,NULL,NULL,NULL,NULL,'ACTIVE',824,431),(3612,NULL,NULL,NULL,NULL,'ACTIVE',824,434),(3613,NULL,NULL,NULL,NULL,'ACTIVE',824,436),(3616,NULL,NULL,NULL,NULL,'ACTIVE',825,421),(3617,NULL,NULL,NULL,NULL,'ACTIVE',825,426),(3618,NULL,NULL,NULL,NULL,'ACTIVE',825,431),(3619,NULL,NULL,NULL,NULL,'ACTIVE',825,435),(3620,NULL,NULL,NULL,NULL,'ACTIVE',825,436),(3623,NULL,NULL,NULL,NULL,'ACTIVE',826,421),(3624,NULL,NULL,NULL,NULL,'ACTIVE',826,427),(3625,NULL,NULL,NULL,NULL,'ACTIVE',826,429),(3626,NULL,NULL,NULL,NULL,'ACTIVE',826,432),(3627,NULL,NULL,NULL,NULL,'ACTIVE',826,436),(3630,NULL,NULL,NULL,NULL,'ACTIVE',827,421),(3631,NULL,NULL,NULL,NULL,'ACTIVE',827,427),(3632,NULL,NULL,NULL,NULL,'ACTIVE',827,429),(3633,NULL,NULL,NULL,NULL,'ACTIVE',827,433),(3634,NULL,NULL,NULL,NULL,'ACTIVE',827,436),(3637,NULL,NULL,NULL,NULL,'ACTIVE',828,421),(3638,NULL,NULL,NULL,NULL,'ACTIVE',828,427),(3639,NULL,NULL,NULL,NULL,'ACTIVE',828,429),(3640,NULL,NULL,NULL,NULL,'ACTIVE',828,434),(3641,NULL,NULL,NULL,NULL,'ACTIVE',828,436),(3644,NULL,NULL,NULL,NULL,'ACTIVE',829,421),(3645,NULL,NULL,NULL,NULL,'ACTIVE',829,427),(3646,NULL,NULL,NULL,NULL,'ACTIVE',829,429),(3647,NULL,NULL,NULL,NULL,'ACTIVE',829,435),(3648,NULL,NULL,NULL,NULL,'ACTIVE',829,436),(3651,NULL,NULL,NULL,NULL,'ACTIVE',830,421),(3652,NULL,NULL,NULL,NULL,'ACTIVE',830,427),(3653,NULL,NULL,NULL,NULL,'ACTIVE',830,430),(3654,NULL,NULL,NULL,NULL,'ACTIVE',830,432),(3655,NULL,NULL,NULL,NULL,'ACTIVE',830,436),(3658,NULL,NULL,NULL,NULL,'ACTIVE',831,421),(3659,NULL,NULL,NULL,NULL,'ACTIVE',831,427),(3660,NULL,NULL,NULL,NULL,'ACTIVE',831,430),(3661,NULL,NULL,NULL,NULL,'ACTIVE',831,433),(3662,NULL,NULL,NULL,NULL,'ACTIVE',831,436),(3665,NULL,NULL,NULL,NULL,'ACTIVE',832,421),(3666,NULL,NULL,NULL,NULL,'ACTIVE',832,427),(3667,NULL,NULL,NULL,NULL,'ACTIVE',832,430),(3668,NULL,NULL,NULL,NULL,'ACTIVE',832,434),(3669,NULL,NULL,NULL,NULL,'ACTIVE',832,436),(3672,NULL,NULL,NULL,NULL,'ACTIVE',833,421),(3673,NULL,NULL,NULL,NULL,'ACTIVE',833,427),(3674,NULL,NULL,NULL,NULL,'ACTIVE',833,430),(3675,NULL,NULL,NULL,NULL,'ACTIVE',833,435),(3676,NULL,NULL,NULL,NULL,'ACTIVE',833,436),(3679,NULL,NULL,NULL,NULL,'ACTIVE',834,421),(3680,NULL,NULL,NULL,NULL,'ACTIVE',834,427),(3681,NULL,NULL,NULL,NULL,'ACTIVE',834,431),(3682,NULL,NULL,NULL,NULL,'ACTIVE',834,432),(3683,NULL,NULL,NULL,NULL,'ACTIVE',834,436),(3686,NULL,NULL,NULL,NULL,'ACTIVE',835,421),(3687,NULL,NULL,NULL,NULL,'ACTIVE',835,427),(3688,NULL,NULL,NULL,NULL,'ACTIVE',835,431),(3689,NULL,NULL,NULL,NULL,'ACTIVE',835,433),(3690,NULL,NULL,NULL,NULL,'ACTIVE',835,436),(3693,NULL,NULL,NULL,NULL,'ACTIVE',836,421),(3694,NULL,NULL,NULL,NULL,'ACTIVE',836,427),(3695,NULL,NULL,NULL,NULL,'ACTIVE',836,431),(3696,NULL,NULL,NULL,NULL,'ACTIVE',836,434),(3697,NULL,NULL,NULL,NULL,'ACTIVE',836,436),(3700,NULL,NULL,NULL,NULL,'ACTIVE',837,421),(3701,NULL,NULL,NULL,NULL,'ACTIVE',837,427),(3702,NULL,NULL,NULL,NULL,'ACTIVE',837,431),(3703,NULL,NULL,NULL,NULL,'ACTIVE',837,435),(3704,NULL,NULL,NULL,NULL,'ACTIVE',837,436),(3707,NULL,NULL,NULL,NULL,'ACTIVE',838,421),(3708,NULL,NULL,NULL,NULL,'ACTIVE',838,428),(3709,NULL,NULL,NULL,NULL,'ACTIVE',838,429),(3710,NULL,NULL,NULL,NULL,'ACTIVE',838,432),(3711,NULL,NULL,NULL,NULL,'ACTIVE',838,436),(3714,NULL,NULL,NULL,NULL,'ACTIVE',839,421),(3715,NULL,NULL,NULL,NULL,'ACTIVE',839,428),(3716,NULL,NULL,NULL,NULL,'ACTIVE',839,429),(3717,NULL,NULL,NULL,NULL,'ACTIVE',839,433),(3718,NULL,NULL,NULL,NULL,'ACTIVE',839,436),(3721,NULL,NULL,NULL,NULL,'ACTIVE',840,421),(3722,NULL,NULL,NULL,NULL,'ACTIVE',840,428),(3723,NULL,NULL,NULL,NULL,'ACTIVE',840,429),(3724,NULL,NULL,NULL,NULL,'ACTIVE',840,434),(3725,NULL,NULL,NULL,NULL,'ACTIVE',840,436),(3728,NULL,NULL,NULL,NULL,'ACTIVE',841,421),(3729,NULL,NULL,NULL,NULL,'ACTIVE',841,428),(3730,NULL,NULL,NULL,NULL,'ACTIVE',841,429),(3731,NULL,NULL,NULL,NULL,'ACTIVE',841,435),(3732,NULL,NULL,NULL,NULL,'ACTIVE',841,436),(3735,NULL,NULL,NULL,NULL,'ACTIVE',842,421),(3736,NULL,NULL,NULL,NULL,'ACTIVE',842,428),(3737,NULL,NULL,NULL,NULL,'ACTIVE',842,430),(3738,NULL,NULL,NULL,NULL,'ACTIVE',842,432),(3739,NULL,NULL,NULL,NULL,'ACTIVE',842,436),(3742,NULL,NULL,NULL,NULL,'ACTIVE',843,421),(3743,NULL,NULL,NULL,NULL,'ACTIVE',843,428),(3744,NULL,NULL,NULL,NULL,'ACTIVE',843,430),(3745,NULL,NULL,NULL,NULL,'ACTIVE',843,433),(3746,NULL,NULL,NULL,NULL,'ACTIVE',843,436),(3749,NULL,NULL,NULL,NULL,'ACTIVE',844,421),(3750,NULL,NULL,NULL,NULL,'ACTIVE',844,428),(3751,NULL,NULL,NULL,NULL,'ACTIVE',844,430),(3752,NULL,NULL,NULL,NULL,'ACTIVE',844,434),(3753,NULL,NULL,NULL,NULL,'ACTIVE',844,436),(3756,NULL,NULL,NULL,NULL,'ACTIVE',845,421),(3757,NULL,NULL,NULL,NULL,'ACTIVE',845,428),(3758,NULL,NULL,NULL,NULL,'ACTIVE',845,430),(3759,NULL,NULL,NULL,NULL,'ACTIVE',845,435),(3760,NULL,NULL,NULL,NULL,'ACTIVE',845,436),(3763,NULL,NULL,NULL,NULL,'ACTIVE',846,421),(3764,NULL,NULL,NULL,NULL,'ACTIVE',846,428),(3765,NULL,NULL,NULL,NULL,'ACTIVE',846,431),(3766,NULL,NULL,NULL,NULL,'ACTIVE',846,432),(3767,NULL,NULL,NULL,NULL,'ACTIVE',846,436),(3770,NULL,NULL,NULL,NULL,'ACTIVE',847,421),(3771,NULL,NULL,NULL,NULL,'ACTIVE',847,428),(3772,NULL,NULL,NULL,NULL,'ACTIVE',847,431),(3773,NULL,NULL,NULL,NULL,'ACTIVE',847,433),(3774,NULL,NULL,NULL,NULL,'ACTIVE',847,436),(3777,NULL,NULL,NULL,NULL,'ACTIVE',848,421),(3778,NULL,NULL,NULL,NULL,'ACTIVE',848,428),(3779,NULL,NULL,NULL,NULL,'ACTIVE',848,431),(3780,NULL,NULL,NULL,NULL,'ACTIVE',848,434),(3781,NULL,NULL,NULL,NULL,'ACTIVE',848,436),(3784,NULL,NULL,NULL,NULL,'ACTIVE',849,421),(3785,NULL,NULL,NULL,NULL,'ACTIVE',849,428),(3786,NULL,NULL,NULL,NULL,'ACTIVE',849,431),(3787,NULL,NULL,NULL,NULL,'ACTIVE',849,435),(3788,NULL,NULL,NULL,NULL,'ACTIVE',849,436),(3791,NULL,NULL,NULL,NULL,'ACTIVE',850,422),(3792,NULL,NULL,NULL,NULL,'ACTIVE',850,425),(3793,NULL,NULL,NULL,NULL,'ACTIVE',850,429),(3794,NULL,NULL,NULL,NULL,'ACTIVE',850,432),(3795,NULL,NULL,NULL,NULL,'ACTIVE',850,436),(3798,NULL,NULL,NULL,NULL,'ACTIVE',851,422),(3799,NULL,NULL,NULL,NULL,'ACTIVE',851,425),(3800,NULL,NULL,NULL,NULL,'ACTIVE',851,429),(3801,NULL,NULL,NULL,NULL,'ACTIVE',851,433),(3802,NULL,NULL,NULL,NULL,'ACTIVE',851,436),(3805,NULL,NULL,NULL,NULL,'ACTIVE',852,422),(3806,NULL,NULL,NULL,NULL,'ACTIVE',852,425),(3807,NULL,NULL,NULL,NULL,'ACTIVE',852,429),(3808,NULL,NULL,NULL,NULL,'ACTIVE',852,434),(3809,NULL,NULL,NULL,NULL,'ACTIVE',852,436),(3812,NULL,NULL,NULL,NULL,'ACTIVE',853,422),(3813,NULL,NULL,NULL,NULL,'ACTIVE',853,425),(3814,NULL,NULL,NULL,NULL,'ACTIVE',853,429),(3815,NULL,NULL,NULL,NULL,'ACTIVE',853,435),(3816,NULL,NULL,NULL,NULL,'ACTIVE',853,436),(3819,NULL,NULL,NULL,NULL,'ACTIVE',854,422),(3820,NULL,NULL,NULL,NULL,'ACTIVE',854,425),(3821,NULL,NULL,NULL,NULL,'ACTIVE',854,430),(3822,NULL,NULL,NULL,NULL,'ACTIVE',854,432),(3823,NULL,NULL,NULL,NULL,'ACTIVE',854,436),(3826,NULL,NULL,NULL,NULL,'ACTIVE',855,422),(3827,NULL,NULL,NULL,NULL,'ACTIVE',855,425),(3828,NULL,NULL,NULL,NULL,'ACTIVE',855,430),(3829,NULL,NULL,NULL,NULL,'ACTIVE',855,433),(3830,NULL,NULL,NULL,NULL,'ACTIVE',855,436),(3833,NULL,NULL,NULL,NULL,'ACTIVE',856,422),(3834,NULL,NULL,NULL,NULL,'ACTIVE',856,425),(3835,NULL,NULL,NULL,NULL,'ACTIVE',856,430),(3836,NULL,NULL,NULL,NULL,'ACTIVE',856,434),(3837,NULL,NULL,NULL,NULL,'ACTIVE',856,436),(3840,NULL,NULL,NULL,NULL,'ACTIVE',857,422),(3841,NULL,NULL,NULL,NULL,'ACTIVE',857,425),(3842,NULL,NULL,NULL,NULL,'ACTIVE',857,430),(3843,NULL,NULL,NULL,NULL,'ACTIVE',857,435),(3844,NULL,NULL,NULL,NULL,'ACTIVE',857,436),(3847,NULL,NULL,NULL,NULL,'ACTIVE',858,422),(3848,NULL,NULL,NULL,NULL,'ACTIVE',858,425),(3849,NULL,NULL,NULL,NULL,'ACTIVE',858,431),(3850,NULL,NULL,NULL,NULL,'ACTIVE',858,432),(3851,NULL,NULL,NULL,NULL,'ACTIVE',858,436),(3854,NULL,NULL,NULL,NULL,'ACTIVE',859,422),(3855,NULL,NULL,NULL,NULL,'ACTIVE',859,425),(3856,NULL,NULL,NULL,NULL,'ACTIVE',859,431),(3857,NULL,NULL,NULL,NULL,'ACTIVE',859,433),(3858,NULL,NULL,NULL,NULL,'ACTIVE',859,436),(3861,NULL,NULL,NULL,NULL,'ACTIVE',860,422),(3862,NULL,NULL,NULL,NULL,'ACTIVE',860,425),(3863,NULL,NULL,NULL,NULL,'ACTIVE',860,431),(3864,NULL,NULL,NULL,NULL,'ACTIVE',860,434),(3865,NULL,NULL,NULL,NULL,'ACTIVE',860,436),(3868,NULL,NULL,NULL,NULL,'ACTIVE',861,422),(3869,NULL,NULL,NULL,NULL,'ACTIVE',861,425),(3870,NULL,NULL,NULL,NULL,'ACTIVE',861,431),(3871,NULL,NULL,NULL,NULL,'ACTIVE',861,435),(3872,NULL,NULL,NULL,NULL,'ACTIVE',861,436),(3875,NULL,NULL,NULL,NULL,'ACTIVE',862,422),(3876,NULL,NULL,NULL,NULL,'ACTIVE',862,426),(3877,NULL,NULL,NULL,NULL,'ACTIVE',862,429),(3878,NULL,NULL,NULL,NULL,'ACTIVE',862,432),(3879,NULL,NULL,NULL,NULL,'ACTIVE',862,436),(3882,NULL,NULL,NULL,NULL,'ACTIVE',863,422),(3883,NULL,NULL,NULL,NULL,'ACTIVE',863,426),(3884,NULL,NULL,NULL,NULL,'ACTIVE',863,429),(3885,NULL,NULL,NULL,NULL,'ACTIVE',863,433),(3886,NULL,NULL,NULL,NULL,'ACTIVE',863,436),(3889,NULL,NULL,NULL,NULL,'ACTIVE',864,422),(3890,NULL,NULL,NULL,NULL,'ACTIVE',864,426),(3891,NULL,NULL,NULL,NULL,'ACTIVE',864,429),(3892,NULL,NULL,NULL,NULL,'ACTIVE',864,434),(3893,NULL,NULL,NULL,NULL,'ACTIVE',864,436),(3896,NULL,NULL,NULL,NULL,'ACTIVE',865,422),(3897,NULL,NULL,NULL,NULL,'ACTIVE',865,426),(3898,NULL,NULL,NULL,NULL,'ACTIVE',865,429),(3899,NULL,NULL,NULL,NULL,'ACTIVE',865,435),(3900,NULL,NULL,NULL,NULL,'ACTIVE',865,436),(3903,NULL,NULL,NULL,NULL,'ACTIVE',866,422),(3904,NULL,NULL,NULL,NULL,'ACTIVE',866,426),(3905,NULL,NULL,NULL,NULL,'ACTIVE',866,430),(3906,NULL,NULL,NULL,NULL,'ACTIVE',866,432),(3907,NULL,NULL,NULL,NULL,'ACTIVE',866,436),(3910,NULL,NULL,NULL,NULL,'ACTIVE',867,422),(3911,NULL,NULL,NULL,NULL,'ACTIVE',867,426),(3912,NULL,NULL,NULL,NULL,'ACTIVE',867,430),(3913,NULL,NULL,NULL,NULL,'ACTIVE',867,433),(3914,NULL,NULL,NULL,NULL,'ACTIVE',867,436),(3917,NULL,NULL,NULL,NULL,'ACTIVE',868,422),(3918,NULL,NULL,NULL,NULL,'ACTIVE',868,426),(3919,NULL,NULL,NULL,NULL,'ACTIVE',868,430),(3920,NULL,NULL,NULL,NULL,'ACTIVE',868,434),(3921,NULL,NULL,NULL,NULL,'ACTIVE',868,436),(3924,NULL,NULL,NULL,NULL,'ACTIVE',869,422),(3925,NULL,NULL,NULL,NULL,'ACTIVE',869,426),(3926,NULL,NULL,NULL,NULL,'ACTIVE',869,430),(3927,NULL,NULL,NULL,NULL,'ACTIVE',869,435),(3928,NULL,NULL,NULL,NULL,'ACTIVE',869,436),(3931,NULL,NULL,NULL,NULL,'ACTIVE',870,422),(3932,NULL,NULL,NULL,NULL,'ACTIVE',870,426),(3933,NULL,NULL,NULL,NULL,'ACTIVE',870,431),(3934,NULL,NULL,NULL,NULL,'ACTIVE',870,432),(3935,NULL,NULL,NULL,NULL,'ACTIVE',870,436),(3938,NULL,NULL,NULL,NULL,'ACTIVE',871,422),(3939,NULL,NULL,NULL,NULL,'ACTIVE',871,426),(3940,NULL,NULL,NULL,NULL,'ACTIVE',871,431),(3941,NULL,NULL,NULL,NULL,'ACTIVE',871,433),(3942,NULL,NULL,NULL,NULL,'ACTIVE',871,436),(3945,NULL,NULL,NULL,NULL,'ACTIVE',872,422),(3946,NULL,NULL,NULL,NULL,'ACTIVE',872,426),(3947,NULL,NULL,NULL,NULL,'ACTIVE',872,431),(3948,NULL,NULL,NULL,NULL,'ACTIVE',872,434),(3949,NULL,NULL,NULL,NULL,'ACTIVE',872,436),(3952,NULL,NULL,NULL,NULL,'ACTIVE',873,422),(3953,NULL,NULL,NULL,NULL,'ACTIVE',873,426),(3954,NULL,NULL,NULL,NULL,'ACTIVE',873,431),(3955,NULL,NULL,NULL,NULL,'ACTIVE',873,435),(3956,NULL,NULL,NULL,NULL,'ACTIVE',873,436),(3959,NULL,NULL,NULL,NULL,'ACTIVE',874,422),(3960,NULL,NULL,NULL,NULL,'ACTIVE',874,427),(3961,NULL,NULL,NULL,NULL,'ACTIVE',874,429),(3962,NULL,NULL,NULL,NULL,'ACTIVE',874,432),(3963,NULL,NULL,NULL,NULL,'ACTIVE',874,436),(3966,NULL,NULL,NULL,NULL,'ACTIVE',875,422),(3967,NULL,NULL,NULL,NULL,'ACTIVE',875,427),(3968,NULL,NULL,NULL,NULL,'ACTIVE',875,429),(3969,NULL,NULL,NULL,NULL,'ACTIVE',875,433),(3970,NULL,NULL,NULL,NULL,'ACTIVE',875,436),(3973,NULL,NULL,NULL,NULL,'ACTIVE',876,422),(3974,NULL,NULL,NULL,NULL,'ACTIVE',876,427),(3975,NULL,NULL,NULL,NULL,'ACTIVE',876,429),(3976,NULL,NULL,NULL,NULL,'ACTIVE',876,434),(3977,NULL,NULL,NULL,NULL,'ACTIVE',876,436),(3980,NULL,NULL,NULL,NULL,'ACTIVE',877,422),(3981,NULL,NULL,NULL,NULL,'ACTIVE',877,427),(3982,NULL,NULL,NULL,NULL,'ACTIVE',877,429),(3983,NULL,NULL,NULL,NULL,'ACTIVE',877,435),(3984,NULL,NULL,NULL,NULL,'ACTIVE',877,436),(3987,NULL,NULL,NULL,NULL,'ACTIVE',878,422),(3988,NULL,NULL,NULL,NULL,'ACTIVE',878,427),(3989,NULL,NULL,NULL,NULL,'ACTIVE',878,430),(3990,NULL,NULL,NULL,NULL,'ACTIVE',878,432),(3991,NULL,NULL,NULL,NULL,'ACTIVE',878,436),(3994,NULL,NULL,NULL,NULL,'ACTIVE',879,422),(3995,NULL,NULL,NULL,NULL,'ACTIVE',879,427),(3996,NULL,NULL,NULL,NULL,'ACTIVE',879,430),(3997,NULL,NULL,NULL,NULL,'ACTIVE',879,433),(3998,NULL,NULL,NULL,NULL,'ACTIVE',879,436),(4001,NULL,NULL,NULL,NULL,'ACTIVE',880,422),(4002,NULL,NULL,NULL,NULL,'ACTIVE',880,427),(4003,NULL,NULL,NULL,NULL,'ACTIVE',880,430),(4004,NULL,NULL,NULL,NULL,'ACTIVE',880,434),(4005,NULL,NULL,NULL,NULL,'ACTIVE',880,436),(4008,NULL,NULL,NULL,NULL,'ACTIVE',881,422),(4009,NULL,NULL,NULL,NULL,'ACTIVE',881,427),(4010,NULL,NULL,NULL,NULL,'ACTIVE',881,430),(4011,NULL,NULL,NULL,NULL,'ACTIVE',881,435),(4012,NULL,NULL,NULL,NULL,'ACTIVE',881,436),(4015,NULL,NULL,NULL,NULL,'ACTIVE',882,422),(4016,NULL,NULL,NULL,NULL,'ACTIVE',882,427),(4017,NULL,NULL,NULL,NULL,'ACTIVE',882,431),(4018,NULL,NULL,NULL,NULL,'ACTIVE',882,432),(4019,NULL,NULL,NULL,NULL,'ACTIVE',882,436),(4022,NULL,NULL,NULL,NULL,'ACTIVE',883,422),(4023,NULL,NULL,NULL,NULL,'ACTIVE',883,427),(4024,NULL,NULL,NULL,NULL,'ACTIVE',883,431),(4025,NULL,NULL,NULL,NULL,'ACTIVE',883,433),(4026,NULL,NULL,NULL,NULL,'ACTIVE',883,436),(4029,NULL,NULL,NULL,NULL,'ACTIVE',884,422),(4030,NULL,NULL,NULL,NULL,'ACTIVE',884,427),(4031,NULL,NULL,NULL,NULL,'ACTIVE',884,431),(4032,NULL,NULL,NULL,NULL,'ACTIVE',884,434),(4033,NULL,NULL,NULL,NULL,'ACTIVE',884,436),(4036,NULL,NULL,NULL,NULL,'ACTIVE',885,422),(4037,NULL,NULL,NULL,NULL,'ACTIVE',885,427),(4038,NULL,NULL,NULL,NULL,'ACTIVE',885,431),(4039,NULL,NULL,NULL,NULL,'ACTIVE',885,435),(4040,NULL,NULL,NULL,NULL,'ACTIVE',885,436),(4043,NULL,NULL,NULL,NULL,'ACTIVE',886,422),(4044,NULL,NULL,NULL,NULL,'ACTIVE',886,428),(4045,NULL,NULL,NULL,NULL,'ACTIVE',886,429),(4046,NULL,NULL,NULL,NULL,'ACTIVE',886,432),(4047,NULL,NULL,NULL,NULL,'ACTIVE',886,436),(4050,NULL,NULL,NULL,NULL,'ACTIVE',887,422),(4051,NULL,NULL,NULL,NULL,'ACTIVE',887,428),(4052,NULL,NULL,NULL,NULL,'ACTIVE',887,429),(4053,NULL,NULL,NULL,NULL,'ACTIVE',887,433),(4054,NULL,NULL,NULL,NULL,'ACTIVE',887,436),(4057,NULL,NULL,NULL,NULL,'ACTIVE',888,422),(4058,NULL,NULL,NULL,NULL,'ACTIVE',888,428),(4059,NULL,NULL,NULL,NULL,'ACTIVE',888,429),(4060,NULL,NULL,NULL,NULL,'ACTIVE',888,434),(4061,NULL,NULL,NULL,NULL,'ACTIVE',888,436),(4064,NULL,NULL,NULL,NULL,'ACTIVE',889,422),(4065,NULL,NULL,NULL,NULL,'ACTIVE',889,428),(4066,NULL,NULL,NULL,NULL,'ACTIVE',889,429),(4067,NULL,NULL,NULL,NULL,'ACTIVE',889,435),(4068,NULL,NULL,NULL,NULL,'ACTIVE',889,436),(4071,NULL,NULL,NULL,NULL,'ACTIVE',890,422),(4072,NULL,NULL,NULL,NULL,'ACTIVE',890,428),(4073,NULL,NULL,NULL,NULL,'ACTIVE',890,430),(4074,NULL,NULL,NULL,NULL,'ACTIVE',890,432),(4075,NULL,NULL,NULL,NULL,'ACTIVE',890,436),(4078,NULL,NULL,NULL,NULL,'ACTIVE',891,422),(4079,NULL,NULL,NULL,NULL,'ACTIVE',891,428),(4080,NULL,NULL,NULL,NULL,'ACTIVE',891,430),(4081,NULL,NULL,NULL,NULL,'ACTIVE',891,433),(4082,NULL,NULL,NULL,NULL,'ACTIVE',891,436),(4085,NULL,NULL,NULL,NULL,'ACTIVE',892,422),(4086,NULL,NULL,NULL,NULL,'ACTIVE',892,428),(4087,NULL,NULL,NULL,NULL,'ACTIVE',892,430),(4088,NULL,NULL,NULL,NULL,'ACTIVE',892,434),(4089,NULL,NULL,NULL,NULL,'ACTIVE',892,436),(4092,NULL,NULL,NULL,NULL,'ACTIVE',893,422),(4093,NULL,NULL,NULL,NULL,'ACTIVE',893,428),(4094,NULL,NULL,NULL,NULL,'ACTIVE',893,430),(4095,NULL,NULL,NULL,NULL,'ACTIVE',893,435),(4096,NULL,NULL,NULL,NULL,'ACTIVE',893,436),(4099,NULL,NULL,NULL,NULL,'ACTIVE',894,422),(4100,NULL,NULL,NULL,NULL,'ACTIVE',894,428),(4101,NULL,NULL,NULL,NULL,'ACTIVE',894,431),(4102,NULL,NULL,NULL,NULL,'ACTIVE',894,432),(4103,NULL,NULL,NULL,NULL,'ACTIVE',894,436),(4106,NULL,NULL,NULL,NULL,'ACTIVE',895,422),(4107,NULL,NULL,NULL,NULL,'ACTIVE',895,428),(4108,NULL,NULL,NULL,NULL,'ACTIVE',895,431),(4109,NULL,NULL,NULL,NULL,'ACTIVE',895,433),(4110,NULL,NULL,NULL,NULL,'ACTIVE',895,436),(4113,NULL,NULL,NULL,NULL,'ACTIVE',896,422),(4114,NULL,NULL,NULL,NULL,'ACTIVE',896,428),(4115,NULL,NULL,NULL,NULL,'ACTIVE',896,431),(4116,NULL,NULL,NULL,NULL,'ACTIVE',896,434),(4117,NULL,NULL,NULL,NULL,'ACTIVE',896,436),(4120,NULL,NULL,NULL,NULL,'ACTIVE',897,422),(4121,NULL,NULL,NULL,NULL,'ACTIVE',897,428),(4122,NULL,NULL,NULL,NULL,'ACTIVE',897,431),(4123,NULL,NULL,NULL,NULL,'ACTIVE',897,435),(4124,NULL,NULL,NULL,NULL,'ACTIVE',897,436),(4127,NULL,NULL,NULL,NULL,'ACTIVE',898,423),(4128,NULL,NULL,NULL,NULL,'ACTIVE',898,425),(4129,NULL,NULL,NULL,NULL,'ACTIVE',898,429),(4130,NULL,NULL,NULL,NULL,'ACTIVE',898,432),(4131,NULL,NULL,NULL,NULL,'ACTIVE',898,436),(4134,NULL,NULL,NULL,NULL,'ACTIVE',899,423),(4135,NULL,NULL,NULL,NULL,'ACTIVE',899,425),(4136,NULL,NULL,NULL,NULL,'ACTIVE',899,429),(4137,NULL,NULL,NULL,NULL,'ACTIVE',899,433),(4138,NULL,NULL,NULL,NULL,'ACTIVE',899,436),(4141,NULL,NULL,NULL,NULL,'ACTIVE',900,423),(4142,NULL,NULL,NULL,NULL,'ACTIVE',900,425),(4143,NULL,NULL,NULL,NULL,'ACTIVE',900,429),(4144,NULL,NULL,NULL,NULL,'ACTIVE',900,434),(4145,NULL,NULL,NULL,NULL,'ACTIVE',900,436),(4148,NULL,NULL,NULL,NULL,'ACTIVE',901,423),(4149,NULL,NULL,NULL,NULL,'ACTIVE',901,425),(4150,NULL,NULL,NULL,NULL,'ACTIVE',901,429),(4151,NULL,NULL,NULL,NULL,'ACTIVE',901,435),(4152,NULL,NULL,NULL,NULL,'ACTIVE',901,436),(4155,NULL,NULL,NULL,NULL,'ACTIVE',902,423),(4156,NULL,NULL,NULL,NULL,'ACTIVE',902,425),(4157,NULL,NULL,NULL,NULL,'ACTIVE',902,430),(4158,NULL,NULL,NULL,NULL,'ACTIVE',902,432),(4159,NULL,NULL,NULL,NULL,'ACTIVE',902,436),(4162,NULL,NULL,NULL,NULL,'ACTIVE',903,423),(4163,NULL,NULL,NULL,NULL,'ACTIVE',903,425),(4164,NULL,NULL,NULL,NULL,'ACTIVE',903,430),(4165,NULL,NULL,NULL,NULL,'ACTIVE',903,433),(4166,NULL,NULL,NULL,NULL,'ACTIVE',903,436),(4169,NULL,NULL,NULL,NULL,'ACTIVE',904,423),(4170,NULL,NULL,NULL,NULL,'ACTIVE',904,425),(4171,NULL,NULL,NULL,NULL,'ACTIVE',904,430),(4172,NULL,NULL,NULL,NULL,'ACTIVE',904,434),(4173,NULL,NULL,NULL,NULL,'ACTIVE',904,436),(4176,NULL,NULL,NULL,NULL,'ACTIVE',905,423),(4177,NULL,NULL,NULL,NULL,'ACTIVE',905,425),(4178,NULL,NULL,NULL,NULL,'ACTIVE',905,430),(4179,NULL,NULL,NULL,NULL,'ACTIVE',905,435),(4180,NULL,NULL,NULL,NULL,'ACTIVE',905,436),(4183,NULL,NULL,NULL,NULL,'ACTIVE',906,423),(4184,NULL,NULL,NULL,NULL,'ACTIVE',906,425),(4185,NULL,NULL,NULL,NULL,'ACTIVE',906,431),(4186,NULL,NULL,NULL,NULL,'ACTIVE',906,432),(4187,NULL,NULL,NULL,NULL,'ACTIVE',906,436),(4190,NULL,NULL,NULL,NULL,'ACTIVE',907,423),(4191,NULL,NULL,NULL,NULL,'ACTIVE',907,425),(4192,NULL,NULL,NULL,NULL,'ACTIVE',907,431),(4193,NULL,NULL,NULL,NULL,'ACTIVE',907,433),(4194,NULL,NULL,NULL,NULL,'ACTIVE',907,436),(4197,NULL,NULL,NULL,NULL,'ACTIVE',908,423),(4198,NULL,NULL,NULL,NULL,'ACTIVE',908,425),(4199,NULL,NULL,NULL,NULL,'ACTIVE',908,431),(4200,NULL,NULL,NULL,NULL,'ACTIVE',908,434),(4201,NULL,NULL,NULL,NULL,'ACTIVE',908,436),(4204,NULL,NULL,NULL,NULL,'ACTIVE',909,423),(4205,NULL,NULL,NULL,NULL,'ACTIVE',909,425),(4206,NULL,NULL,NULL,NULL,'ACTIVE',909,431),(4207,NULL,NULL,NULL,NULL,'ACTIVE',909,435),(4208,NULL,NULL,NULL,NULL,'ACTIVE',909,436),(4211,NULL,NULL,NULL,NULL,'ACTIVE',910,423),(4212,NULL,NULL,NULL,NULL,'ACTIVE',910,426),(4213,NULL,NULL,NULL,NULL,'ACTIVE',910,429),(4214,NULL,NULL,NULL,NULL,'ACTIVE',910,432),(4215,NULL,NULL,NULL,NULL,'ACTIVE',910,436),(4218,NULL,NULL,NULL,NULL,'ACTIVE',911,423),(4219,NULL,NULL,NULL,NULL,'ACTIVE',911,426),(4220,NULL,NULL,NULL,NULL,'ACTIVE',911,429),(4221,NULL,NULL,NULL,NULL,'ACTIVE',911,433),(4222,NULL,NULL,NULL,NULL,'ACTIVE',911,436),(4225,NULL,NULL,NULL,NULL,'ACTIVE',912,423),(4226,NULL,NULL,NULL,NULL,'ACTIVE',912,426),(4227,NULL,NULL,NULL,NULL,'ACTIVE',912,429),(4228,NULL,NULL,NULL,NULL,'ACTIVE',912,434),(4229,NULL,NULL,NULL,NULL,'ACTIVE',912,436),(4232,NULL,NULL,NULL,NULL,'ACTIVE',913,423),(4233,NULL,NULL,NULL,NULL,'ACTIVE',913,426),(4234,NULL,NULL,NULL,NULL,'ACTIVE',913,429),(4235,NULL,NULL,NULL,NULL,'ACTIVE',913,435),(4236,NULL,NULL,NULL,NULL,'ACTIVE',913,436),(4239,NULL,NULL,NULL,NULL,'ACTIVE',914,423),(4240,NULL,NULL,NULL,NULL,'ACTIVE',914,426),(4241,NULL,NULL,NULL,NULL,'ACTIVE',914,430),(4242,NULL,NULL,NULL,NULL,'ACTIVE',914,432),(4243,NULL,NULL,NULL,NULL,'ACTIVE',914,436),(4246,NULL,NULL,NULL,NULL,'ACTIVE',915,423),(4247,NULL,NULL,NULL,NULL,'ACTIVE',915,426),(4248,NULL,NULL,NULL,NULL,'ACTIVE',915,430),(4249,NULL,NULL,NULL,NULL,'ACTIVE',915,433),(4250,NULL,NULL,NULL,NULL,'ACTIVE',915,436),(4253,NULL,NULL,NULL,NULL,'ACTIVE',916,423),(4254,NULL,NULL,NULL,NULL,'ACTIVE',916,426),(4255,NULL,NULL,NULL,NULL,'ACTIVE',916,430),(4256,NULL,NULL,NULL,NULL,'ACTIVE',916,434),(4257,NULL,NULL,NULL,NULL,'ACTIVE',916,436),(4260,NULL,NULL,NULL,NULL,'ACTIVE',917,423),(4261,NULL,NULL,NULL,NULL,'ACTIVE',917,426),(4262,NULL,NULL,NULL,NULL,'ACTIVE',917,430),(4263,NULL,NULL,NULL,NULL,'ACTIVE',917,435),(4264,NULL,NULL,NULL,NULL,'ACTIVE',917,436),(4267,NULL,NULL,NULL,NULL,'ACTIVE',918,423),(4268,NULL,NULL,NULL,NULL,'ACTIVE',918,426),(4269,NULL,NULL,NULL,NULL,'ACTIVE',918,431),(4270,NULL,NULL,NULL,NULL,'ACTIVE',918,432),(4271,NULL,NULL,NULL,NULL,'ACTIVE',918,436),(4274,NULL,NULL,NULL,NULL,'ACTIVE',919,423),(4275,NULL,NULL,NULL,NULL,'ACTIVE',919,426),(4276,NULL,NULL,NULL,NULL,'ACTIVE',919,431),(4277,NULL,NULL,NULL,NULL,'ACTIVE',919,433),(4278,NULL,NULL,NULL,NULL,'ACTIVE',919,436),(4281,NULL,NULL,NULL,NULL,'ACTIVE',920,423),(4282,NULL,NULL,NULL,NULL,'ACTIVE',920,426),(4283,NULL,NULL,NULL,NULL,'ACTIVE',920,431),(4284,NULL,NULL,NULL,NULL,'ACTIVE',920,434),(4285,NULL,NULL,NULL,NULL,'ACTIVE',920,436),(4288,NULL,NULL,NULL,NULL,'ACTIVE',921,423),(4289,NULL,NULL,NULL,NULL,'ACTIVE',921,426),(4290,NULL,NULL,NULL,NULL,'ACTIVE',921,431),(4291,NULL,NULL,NULL,NULL,'ACTIVE',921,435),(4292,NULL,NULL,NULL,NULL,'ACTIVE',921,436),(4295,NULL,NULL,NULL,NULL,'ACTIVE',922,423),(4296,NULL,NULL,NULL,NULL,'ACTIVE',922,427),(4297,NULL,NULL,NULL,NULL,'ACTIVE',922,429),(4298,NULL,NULL,NULL,NULL,'ACTIVE',922,432),(4299,NULL,NULL,NULL,NULL,'ACTIVE',922,436),(4302,NULL,NULL,NULL,NULL,'ACTIVE',923,423),(4303,NULL,NULL,NULL,NULL,'ACTIVE',923,427),(4304,NULL,NULL,NULL,NULL,'ACTIVE',923,429),(4305,NULL,NULL,NULL,NULL,'ACTIVE',923,433),(4306,NULL,NULL,NULL,NULL,'ACTIVE',923,436),(4309,NULL,NULL,NULL,NULL,'ACTIVE',924,423),(4310,NULL,NULL,NULL,NULL,'ACTIVE',924,427),(4311,NULL,NULL,NULL,NULL,'ACTIVE',924,429),(4312,NULL,NULL,NULL,NULL,'ACTIVE',924,434),(4313,NULL,NULL,NULL,NULL,'ACTIVE',924,436),(4316,NULL,NULL,NULL,NULL,'ACTIVE',925,423),(4317,NULL,NULL,NULL,NULL,'ACTIVE',925,427),(4318,NULL,NULL,NULL,NULL,'ACTIVE',925,429),(4319,NULL,NULL,NULL,NULL,'ACTIVE',925,435),(4320,NULL,NULL,NULL,NULL,'ACTIVE',925,436),(4323,NULL,NULL,NULL,NULL,'ACTIVE',926,423),(4324,NULL,NULL,NULL,NULL,'ACTIVE',926,427),(4325,NULL,NULL,NULL,NULL,'ACTIVE',926,430),(4326,NULL,NULL,NULL,NULL,'ACTIVE',926,432),(4327,NULL,NULL,NULL,NULL,'ACTIVE',926,436),(4330,NULL,NULL,NULL,NULL,'ACTIVE',927,423),(4331,NULL,NULL,NULL,NULL,'ACTIVE',927,427),(4332,NULL,NULL,NULL,NULL,'ACTIVE',927,430),(4333,NULL,NULL,NULL,NULL,'ACTIVE',927,433),(4334,NULL,NULL,NULL,NULL,'ACTIVE',927,436),(4337,NULL,NULL,NULL,NULL,'ACTIVE',928,423),(4338,NULL,NULL,NULL,NULL,'ACTIVE',928,427),(4339,NULL,NULL,NULL,NULL,'ACTIVE',928,430),(4340,NULL,NULL,NULL,NULL,'ACTIVE',928,434),(4341,NULL,NULL,NULL,NULL,'ACTIVE',928,436),(4344,NULL,NULL,NULL,NULL,'ACTIVE',929,423),(4345,NULL,NULL,NULL,NULL,'ACTIVE',929,427),(4346,NULL,NULL,NULL,NULL,'ACTIVE',929,430),(4347,NULL,NULL,NULL,NULL,'ACTIVE',929,435),(4348,NULL,NULL,NULL,NULL,'ACTIVE',929,436),(4351,NULL,NULL,NULL,NULL,'ACTIVE',930,423),(4352,NULL,NULL,NULL,NULL,'ACTIVE',930,427),(4353,NULL,NULL,NULL,NULL,'ACTIVE',930,431),(4354,NULL,NULL,NULL,NULL,'ACTIVE',930,432),(4355,NULL,NULL,NULL,NULL,'ACTIVE',930,436),(4358,NULL,NULL,NULL,NULL,'ACTIVE',931,423),(4359,NULL,NULL,NULL,NULL,'ACTIVE',931,427),(4360,NULL,NULL,NULL,NULL,'ACTIVE',931,431),(4361,NULL,NULL,NULL,NULL,'ACTIVE',931,433),(4362,NULL,NULL,NULL,NULL,'ACTIVE',931,436),(4365,NULL,NULL,NULL,NULL,'ACTIVE',932,423),(4366,NULL,NULL,NULL,NULL,'ACTIVE',932,427),(4367,NULL,NULL,NULL,NULL,'ACTIVE',932,431),(4368,NULL,NULL,NULL,NULL,'ACTIVE',932,434),(4369,NULL,NULL,NULL,NULL,'ACTIVE',932,436),(4372,NULL,NULL,NULL,NULL,'ACTIVE',933,423),(4373,NULL,NULL,NULL,NULL,'ACTIVE',933,427),(4374,NULL,NULL,NULL,NULL,'ACTIVE',933,431),(4375,NULL,NULL,NULL,NULL,'ACTIVE',933,435),(4376,NULL,NULL,NULL,NULL,'ACTIVE',933,436),(4379,NULL,NULL,NULL,NULL,'ACTIVE',934,423),(4380,NULL,NULL,NULL,NULL,'ACTIVE',934,428),(4381,NULL,NULL,NULL,NULL,'ACTIVE',934,429),(4382,NULL,NULL,NULL,NULL,'ACTIVE',934,432),(4383,NULL,NULL,NULL,NULL,'ACTIVE',934,436),(4386,NULL,NULL,NULL,NULL,'ACTIVE',935,423),(4387,NULL,NULL,NULL,NULL,'ACTIVE',935,428),(4388,NULL,NULL,NULL,NULL,'ACTIVE',935,429),(4389,NULL,NULL,NULL,NULL,'ACTIVE',935,433),(4390,NULL,NULL,NULL,NULL,'ACTIVE',935,436),(4393,NULL,NULL,NULL,NULL,'ACTIVE',936,423),(4394,NULL,NULL,NULL,NULL,'ACTIVE',936,428),(4395,NULL,NULL,NULL,NULL,'ACTIVE',936,429),(4396,NULL,NULL,NULL,NULL,'ACTIVE',936,434),(4397,NULL,NULL,NULL,NULL,'ACTIVE',936,436),(4400,NULL,NULL,NULL,NULL,'ACTIVE',937,423),(4401,NULL,NULL,NULL,NULL,'ACTIVE',937,428),(4402,NULL,NULL,NULL,NULL,'ACTIVE',937,429),(4403,NULL,NULL,NULL,NULL,'ACTIVE',937,435),(4404,NULL,NULL,NULL,NULL,'ACTIVE',937,436),(4407,NULL,NULL,NULL,NULL,'ACTIVE',938,423),(4408,NULL,NULL,NULL,NULL,'ACTIVE',938,428),(4409,NULL,NULL,NULL,NULL,'ACTIVE',938,430),(4410,NULL,NULL,NULL,NULL,'ACTIVE',938,432),(4411,NULL,NULL,NULL,NULL,'ACTIVE',938,436),(4414,NULL,NULL,NULL,NULL,'ACTIVE',939,423),(4415,NULL,NULL,NULL,NULL,'ACTIVE',939,428),(4416,NULL,NULL,NULL,NULL,'ACTIVE',939,430),(4417,NULL,NULL,NULL,NULL,'ACTIVE',939,433),(4418,NULL,NULL,NULL,NULL,'ACTIVE',939,436),(4421,NULL,NULL,NULL,NULL,'ACTIVE',940,423),(4422,NULL,NULL,NULL,NULL,'ACTIVE',940,428),(4423,NULL,NULL,NULL,NULL,'ACTIVE',940,430),(4424,NULL,NULL,NULL,NULL,'ACTIVE',940,434),(4425,NULL,NULL,NULL,NULL,'ACTIVE',940,436),(4428,NULL,NULL,NULL,NULL,'ACTIVE',941,423),(4429,NULL,NULL,NULL,NULL,'ACTIVE',941,428),(4430,NULL,NULL,NULL,NULL,'ACTIVE',941,430),(4431,NULL,NULL,NULL,NULL,'ACTIVE',941,435),(4432,NULL,NULL,NULL,NULL,'ACTIVE',941,436),(4435,NULL,NULL,NULL,NULL,'ACTIVE',942,423),(4436,NULL,NULL,NULL,NULL,'ACTIVE',942,428),(4437,NULL,NULL,NULL,NULL,'ACTIVE',942,431),(4438,NULL,NULL,NULL,NULL,'ACTIVE',942,432),(4439,NULL,NULL,NULL,NULL,'ACTIVE',942,436),(4442,NULL,NULL,NULL,NULL,'ACTIVE',943,423),(4443,NULL,NULL,NULL,NULL,'ACTIVE',943,428),(4444,NULL,NULL,NULL,NULL,'ACTIVE',943,431),(4445,NULL,NULL,NULL,NULL,'ACTIVE',943,433),(4446,NULL,NULL,NULL,NULL,'ACTIVE',943,436),(4449,NULL,NULL,NULL,NULL,'ACTIVE',944,423),(4450,NULL,NULL,NULL,NULL,'ACTIVE',944,428),(4451,NULL,NULL,NULL,NULL,'ACTIVE',944,431),(4452,NULL,NULL,NULL,NULL,'ACTIVE',944,434),(4453,NULL,NULL,NULL,NULL,'ACTIVE',944,436),(4456,NULL,NULL,NULL,NULL,'ACTIVE',945,423),(4457,NULL,NULL,NULL,NULL,'ACTIVE',945,428),(4458,NULL,NULL,NULL,NULL,'ACTIVE',945,431),(4459,NULL,NULL,NULL,NULL,'ACTIVE',945,435),(4460,NULL,NULL,NULL,NULL,'ACTIVE',945,436),(4463,NULL,NULL,NULL,NULL,'ACTIVE',946,424),(4464,NULL,NULL,NULL,NULL,'ACTIVE',946,425),(4465,NULL,NULL,NULL,NULL,'ACTIVE',946,429),(4466,NULL,NULL,NULL,NULL,'ACTIVE',946,432),(4467,NULL,NULL,NULL,NULL,'ACTIVE',946,436),(4470,NULL,NULL,NULL,NULL,'ACTIVE',947,424),(4471,NULL,NULL,NULL,NULL,'ACTIVE',947,425),(4472,NULL,NULL,NULL,NULL,'ACTIVE',947,429),(4473,NULL,NULL,NULL,NULL,'ACTIVE',947,433),(4474,NULL,NULL,NULL,NULL,'ACTIVE',947,436),(4477,NULL,NULL,NULL,NULL,'ACTIVE',948,424),(4478,NULL,NULL,NULL,NULL,'ACTIVE',948,425),(4479,NULL,NULL,NULL,NULL,'ACTIVE',948,429),(4480,NULL,NULL,NULL,NULL,'ACTIVE',948,434),(4481,NULL,NULL,NULL,NULL,'ACTIVE',948,436),(4484,NULL,NULL,NULL,NULL,'ACTIVE',949,424),(4485,NULL,NULL,NULL,NULL,'ACTIVE',949,425),(4486,NULL,NULL,NULL,NULL,'ACTIVE',949,429),(4487,NULL,NULL,NULL,NULL,'ACTIVE',949,435),(4488,NULL,NULL,NULL,NULL,'ACTIVE',949,436),(4491,NULL,NULL,NULL,NULL,'ACTIVE',950,424),(4492,NULL,NULL,NULL,NULL,'ACTIVE',950,425),(4493,NULL,NULL,NULL,NULL,'ACTIVE',950,430),(4494,NULL,NULL,NULL,NULL,'ACTIVE',950,432),(4495,NULL,NULL,NULL,NULL,'ACTIVE',950,436),(4498,NULL,NULL,NULL,NULL,'ACTIVE',951,424),(4499,NULL,NULL,NULL,NULL,'ACTIVE',951,425),(4500,NULL,NULL,NULL,NULL,'ACTIVE',951,430),(4501,NULL,NULL,NULL,NULL,'ACTIVE',951,433),(4502,NULL,NULL,NULL,NULL,'ACTIVE',951,436),(4505,NULL,NULL,NULL,NULL,'ACTIVE',952,424),(4506,NULL,NULL,NULL,NULL,'ACTIVE',952,425),(4507,NULL,NULL,NULL,NULL,'ACTIVE',952,430),(4508,NULL,NULL,NULL,NULL,'ACTIVE',952,434),(4509,NULL,NULL,NULL,NULL,'ACTIVE',952,436),(4512,NULL,NULL,NULL,NULL,'ACTIVE',953,424),(4513,NULL,NULL,NULL,NULL,'ACTIVE',953,425),(4514,NULL,NULL,NULL,NULL,'ACTIVE',953,430),(4515,NULL,NULL,NULL,NULL,'ACTIVE',953,435),(4516,NULL,NULL,NULL,NULL,'ACTIVE',953,436),(4519,NULL,NULL,NULL,NULL,'ACTIVE',954,424),(4520,NULL,NULL,NULL,NULL,'ACTIVE',954,425),(4521,NULL,NULL,NULL,NULL,'ACTIVE',954,431),(4522,NULL,NULL,NULL,NULL,'ACTIVE',954,432),(4523,NULL,NULL,NULL,NULL,'ACTIVE',954,436),(4526,NULL,NULL,NULL,NULL,'ACTIVE',955,424),(4527,NULL,NULL,NULL,NULL,'ACTIVE',955,425),(4528,NULL,NULL,NULL,NULL,'ACTIVE',955,431),(4529,NULL,NULL,NULL,NULL,'ACTIVE',955,433),(4530,NULL,NULL,NULL,NULL,'ACTIVE',955,436),(4533,NULL,NULL,NULL,NULL,'ACTIVE',956,424),(4534,NULL,NULL,NULL,NULL,'ACTIVE',956,425),(4535,NULL,NULL,NULL,NULL,'ACTIVE',956,431),(4536,NULL,NULL,NULL,NULL,'ACTIVE',956,434),(4537,NULL,NULL,NULL,NULL,'ACTIVE',956,436),(4540,NULL,NULL,NULL,NULL,'ACTIVE',957,424),(4541,NULL,NULL,NULL,NULL,'ACTIVE',957,425),(4542,NULL,NULL,NULL,NULL,'ACTIVE',957,431),(4543,NULL,NULL,NULL,NULL,'ACTIVE',957,435),(4544,NULL,NULL,NULL,NULL,'ACTIVE',957,436),(4547,NULL,NULL,NULL,NULL,'ACTIVE',958,424),(4548,NULL,NULL,NULL,NULL,'ACTIVE',958,426),(4549,NULL,NULL,NULL,NULL,'ACTIVE',958,429),(4550,NULL,NULL,NULL,NULL,'ACTIVE',958,432),(4551,NULL,NULL,NULL,NULL,'ACTIVE',958,436),(4554,NULL,NULL,NULL,NULL,'ACTIVE',959,424),(4555,NULL,NULL,NULL,NULL,'ACTIVE',959,426),(4556,NULL,NULL,NULL,NULL,'ACTIVE',959,429),(4557,NULL,NULL,NULL,NULL,'ACTIVE',959,433),(4558,NULL,NULL,NULL,NULL,'ACTIVE',959,436),(4561,NULL,NULL,NULL,NULL,'ACTIVE',960,424),(4562,NULL,NULL,NULL,NULL,'ACTIVE',960,426),(4563,NULL,NULL,NULL,NULL,'ACTIVE',960,429),(4564,NULL,NULL,NULL,NULL,'ACTIVE',960,434),(4565,NULL,NULL,NULL,NULL,'ACTIVE',960,436),(4568,NULL,NULL,NULL,NULL,'ACTIVE',961,424),(4569,NULL,NULL,NULL,NULL,'ACTIVE',961,426),(4570,NULL,NULL,NULL,NULL,'ACTIVE',961,429),(4571,NULL,NULL,NULL,NULL,'ACTIVE',961,435),(4572,NULL,NULL,NULL,NULL,'ACTIVE',961,436),(4575,NULL,NULL,NULL,NULL,'ACTIVE',962,424),(4576,NULL,NULL,NULL,NULL,'ACTIVE',962,426),(4577,NULL,NULL,NULL,NULL,'ACTIVE',962,430),(4578,NULL,NULL,NULL,NULL,'ACTIVE',962,432),(4579,NULL,NULL,NULL,NULL,'ACTIVE',962,436),(4582,NULL,NULL,NULL,NULL,'ACTIVE',963,424),(4583,NULL,NULL,NULL,NULL,'ACTIVE',963,426),(4584,NULL,NULL,NULL,NULL,'ACTIVE',963,430),(4585,NULL,NULL,NULL,NULL,'ACTIVE',963,433),(4586,NULL,NULL,NULL,NULL,'ACTIVE',963,436),(4589,NULL,NULL,NULL,NULL,'ACTIVE',964,424),(4590,NULL,NULL,NULL,NULL,'ACTIVE',964,426),(4591,NULL,NULL,NULL,NULL,'ACTIVE',964,430),(4592,NULL,NULL,NULL,NULL,'ACTIVE',964,434),(4593,NULL,NULL,NULL,NULL,'ACTIVE',964,436),(4596,NULL,NULL,NULL,NULL,'ACTIVE',965,424),(4597,NULL,NULL,NULL,NULL,'ACTIVE',965,426),(4598,NULL,NULL,NULL,NULL,'ACTIVE',965,430),(4599,NULL,NULL,NULL,NULL,'ACTIVE',965,435),(4600,NULL,NULL,NULL,NULL,'ACTIVE',965,436),(4603,NULL,NULL,NULL,NULL,'ACTIVE',966,424),(4604,NULL,NULL,NULL,NULL,'ACTIVE',966,426),(4605,NULL,NULL,NULL,NULL,'ACTIVE',966,431),(4606,NULL,NULL,NULL,NULL,'ACTIVE',966,432),(4607,NULL,NULL,NULL,NULL,'ACTIVE',966,436),(4610,NULL,NULL,NULL,NULL,'ACTIVE',967,424),(4611,NULL,NULL,NULL,NULL,'ACTIVE',967,426),(4612,NULL,NULL,NULL,NULL,'ACTIVE',967,431),(4613,NULL,NULL,NULL,NULL,'ACTIVE',967,433),(4614,NULL,NULL,NULL,NULL,'ACTIVE',967,436),(4617,NULL,NULL,NULL,NULL,'ACTIVE',968,424),(4618,NULL,NULL,NULL,NULL,'ACTIVE',968,426),(4619,NULL,NULL,NULL,NULL,'ACTIVE',968,431),(4620,NULL,NULL,NULL,NULL,'ACTIVE',968,434),(4621,NULL,NULL,NULL,NULL,'ACTIVE',968,436),(4624,NULL,NULL,NULL,NULL,'ACTIVE',969,424),(4625,NULL,NULL,NULL,NULL,'ACTIVE',969,426),(4626,NULL,NULL,NULL,NULL,'ACTIVE',969,431),(4627,NULL,NULL,NULL,NULL,'ACTIVE',969,435),(4628,NULL,NULL,NULL,NULL,'ACTIVE',969,436),(4631,NULL,NULL,NULL,NULL,'ACTIVE',970,424),(4632,NULL,NULL,NULL,NULL,'ACTIVE',970,427),(4633,NULL,NULL,NULL,NULL,'ACTIVE',970,429),(4634,NULL,NULL,NULL,NULL,'ACTIVE',970,432),(4635,NULL,NULL,NULL,NULL,'ACTIVE',970,436),(4638,NULL,NULL,NULL,NULL,'ACTIVE',971,424),(4639,NULL,NULL,NULL,NULL,'ACTIVE',971,427),(4640,NULL,NULL,NULL,NULL,'ACTIVE',971,429),(4641,NULL,NULL,NULL,NULL,'ACTIVE',971,433),(4642,NULL,NULL,NULL,NULL,'ACTIVE',971,436),(4645,NULL,NULL,NULL,NULL,'ACTIVE',972,424),(4646,NULL,NULL,NULL,NULL,'ACTIVE',972,427),(4647,NULL,NULL,NULL,NULL,'ACTIVE',972,429),(4648,NULL,NULL,NULL,NULL,'ACTIVE',972,434),(4649,NULL,NULL,NULL,NULL,'ACTIVE',972,436),(4652,NULL,NULL,NULL,NULL,'ACTIVE',973,424),(4653,NULL,NULL,NULL,NULL,'ACTIVE',973,427),(4654,NULL,NULL,NULL,NULL,'ACTIVE',973,429),(4655,NULL,NULL,NULL,NULL,'ACTIVE',973,435),(4656,NULL,NULL,NULL,NULL,'ACTIVE',973,436),(4659,NULL,NULL,NULL,NULL,'ACTIVE',974,424),(4660,NULL,NULL,NULL,NULL,'ACTIVE',974,427),(4661,NULL,NULL,NULL,NULL,'ACTIVE',974,430),(4662,NULL,NULL,NULL,NULL,'ACTIVE',974,432),(4663,NULL,NULL,NULL,NULL,'ACTIVE',974,436),(4666,NULL,NULL,NULL,NULL,'ACTIVE',975,424),(4667,NULL,NULL,NULL,NULL,'ACTIVE',975,427),(4668,NULL,NULL,NULL,NULL,'ACTIVE',975,430),(4669,NULL,NULL,NULL,NULL,'ACTIVE',975,433),(4670,NULL,NULL,NULL,NULL,'ACTIVE',975,436),(4673,NULL,NULL,NULL,NULL,'ACTIVE',976,424),(4674,NULL,NULL,NULL,NULL,'ACTIVE',976,427),(4675,NULL,NULL,NULL,NULL,'ACTIVE',976,430),(4676,NULL,NULL,NULL,NULL,'ACTIVE',976,434),(4677,NULL,NULL,NULL,NULL,'ACTIVE',976,436),(4680,NULL,NULL,NULL,NULL,'ACTIVE',977,424),(4681,NULL,NULL,NULL,NULL,'ACTIVE',977,427),(4682,NULL,NULL,NULL,NULL,'ACTIVE',977,430),(4683,NULL,NULL,NULL,NULL,'ACTIVE',977,435),(4684,NULL,NULL,NULL,NULL,'ACTIVE',977,436),(4687,NULL,NULL,NULL,NULL,'ACTIVE',978,424),(4688,NULL,NULL,NULL,NULL,'ACTIVE',978,427),(4689,NULL,NULL,NULL,NULL,'ACTIVE',978,431),(4690,NULL,NULL,NULL,NULL,'ACTIVE',978,432),(4691,NULL,NULL,NULL,NULL,'ACTIVE',978,436),(4694,NULL,NULL,NULL,NULL,'ACTIVE',979,424),(4695,NULL,NULL,NULL,NULL,'ACTIVE',979,427),(4696,NULL,NULL,NULL,NULL,'ACTIVE',979,431),(4697,NULL,NULL,NULL,NULL,'ACTIVE',979,433),(4698,NULL,NULL,NULL,NULL,'ACTIVE',979,436),(4701,NULL,NULL,NULL,NULL,'ACTIVE',980,424),(4702,NULL,NULL,NULL,NULL,'ACTIVE',980,427),(4703,NULL,NULL,NULL,NULL,'ACTIVE',980,431),(4704,NULL,NULL,NULL,NULL,'ACTIVE',980,434),(4705,NULL,NULL,NULL,NULL,'ACTIVE',980,436),(4708,NULL,NULL,NULL,NULL,'ACTIVE',981,424),(4709,NULL,NULL,NULL,NULL,'ACTIVE',981,427),(4710,NULL,NULL,NULL,NULL,'ACTIVE',981,431),(4711,NULL,NULL,NULL,NULL,'ACTIVE',981,435),(4712,NULL,NULL,NULL,NULL,'ACTIVE',981,436),(4715,NULL,NULL,NULL,NULL,'ACTIVE',982,424),(4716,NULL,NULL,NULL,NULL,'ACTIVE',982,428),(4717,NULL,NULL,NULL,NULL,'ACTIVE',982,429),(4718,NULL,NULL,NULL,NULL,'ACTIVE',982,432),(4719,NULL,NULL,NULL,NULL,'ACTIVE',982,436),(4722,NULL,NULL,NULL,NULL,'ACTIVE',983,424),(4723,NULL,NULL,NULL,NULL,'ACTIVE',983,428),(4724,NULL,NULL,NULL,NULL,'ACTIVE',983,429),(4725,NULL,NULL,NULL,NULL,'ACTIVE',983,433),(4726,NULL,NULL,NULL,NULL,'ACTIVE',983,436),(4729,NULL,NULL,NULL,NULL,'ACTIVE',984,424),(4730,NULL,NULL,NULL,NULL,'ACTIVE',984,428),(4731,NULL,NULL,NULL,NULL,'ACTIVE',984,429),(4732,NULL,NULL,NULL,NULL,'ACTIVE',984,434),(4733,NULL,NULL,NULL,NULL,'ACTIVE',984,436),(4736,NULL,NULL,NULL,NULL,'ACTIVE',985,424),(4737,NULL,NULL,NULL,NULL,'ACTIVE',985,428),(4738,NULL,NULL,NULL,NULL,'ACTIVE',985,429),(4739,NULL,NULL,NULL,NULL,'ACTIVE',985,435),(4740,NULL,NULL,NULL,NULL,'ACTIVE',985,436),(4743,NULL,NULL,NULL,NULL,'ACTIVE',986,424),(4744,NULL,NULL,NULL,NULL,'ACTIVE',986,428),(4745,NULL,NULL,NULL,NULL,'ACTIVE',986,430),(4746,NULL,NULL,NULL,NULL,'ACTIVE',986,432),(4747,NULL,NULL,NULL,NULL,'ACTIVE',986,436),(4750,NULL,NULL,NULL,NULL,'ACTIVE',987,424),(4751,NULL,NULL,NULL,NULL,'ACTIVE',987,428),(4752,NULL,NULL,NULL,NULL,'ACTIVE',987,430),(4753,NULL,NULL,NULL,NULL,'ACTIVE',987,433),(4754,NULL,NULL,NULL,NULL,'ACTIVE',987,436),(4757,NULL,NULL,NULL,NULL,'ACTIVE',988,424),(4758,NULL,NULL,NULL,NULL,'ACTIVE',988,428),(4759,NULL,NULL,NULL,NULL,'ACTIVE',988,430),(4760,NULL,NULL,NULL,NULL,'ACTIVE',988,434),(4761,NULL,NULL,NULL,NULL,'ACTIVE',988,436),(4764,NULL,NULL,NULL,NULL,'ACTIVE',989,424),(4765,NULL,NULL,NULL,NULL,'ACTIVE',989,428),(4766,NULL,NULL,NULL,NULL,'ACTIVE',989,430),(4767,NULL,NULL,NULL,NULL,'ACTIVE',989,435),(4768,NULL,NULL,NULL,NULL,'ACTIVE',989,436),(4771,NULL,NULL,NULL,NULL,'ACTIVE',990,424),(4772,NULL,NULL,NULL,NULL,'ACTIVE',990,428),(4773,NULL,NULL,NULL,NULL,'ACTIVE',990,431),(4774,NULL,NULL,NULL,NULL,'ACTIVE',990,432),(4775,NULL,NULL,NULL,NULL,'ACTIVE',990,436),(4778,NULL,NULL,NULL,NULL,'ACTIVE',991,424),(4779,NULL,NULL,NULL,NULL,'ACTIVE',991,428),(4780,NULL,NULL,NULL,NULL,'ACTIVE',991,431),(4781,NULL,NULL,NULL,NULL,'ACTIVE',991,433),(4782,NULL,NULL,NULL,NULL,'ACTIVE',991,436),(4785,NULL,NULL,NULL,NULL,'ACTIVE',992,424),(4786,NULL,NULL,NULL,NULL,'ACTIVE',992,428),(4787,NULL,NULL,NULL,NULL,'ACTIVE',992,431),(4788,NULL,NULL,NULL,NULL,'ACTIVE',992,434),(4789,NULL,NULL,NULL,NULL,'ACTIVE',992,436),(4792,NULL,NULL,NULL,NULL,'ACTIVE',993,424),(4793,NULL,NULL,NULL,NULL,'ACTIVE',993,428),(4794,NULL,NULL,NULL,NULL,'ACTIVE',993,431),(4795,NULL,NULL,NULL,NULL,'ACTIVE',993,435),(4796,NULL,NULL,NULL,NULL,'ACTIVE',993,436),(4799,NULL,NULL,NULL,NULL,'ACTIVE',994,437),(4800,NULL,NULL,NULL,NULL,'ACTIVE',994,439),(4802,NULL,NULL,NULL,NULL,'ACTIVE',995,437),(4803,NULL,NULL,NULL,NULL,'ACTIVE',995,440),(4805,NULL,NULL,NULL,NULL,'ACTIVE',996,438),(4806,NULL,NULL,NULL,NULL,'ACTIVE',996,439),(4808,NULL,NULL,NULL,NULL,'ACTIVE',997,438),(4809,NULL,NULL,NULL,NULL,'ACTIVE',997,440),(5291,NULL,NULL,NULL,NULL,'ACTIVE',1094,464),(5292,NULL,NULL,NULL,NULL,'ACTIVE',1094,465),(5293,NULL,NULL,NULL,NULL,'ACTIVE',1094,467),(5294,NULL,NULL,NULL,NULL,'ACTIVE',1095,464),(5295,NULL,NULL,NULL,NULL,'ACTIVE',1095,466),(5296,NULL,NULL,NULL,NULL,'ACTIVE',1095,467),(5297,NULL,NULL,NULL,NULL,'ACTIVE',1096,452),(5298,NULL,NULL,NULL,NULL,'ACTIVE',1096,456),(5299,NULL,NULL,NULL,NULL,'ACTIVE',1096,461),(5300,NULL,NULL,NULL,NULL,'ACTIVE',1096,468),(5311,NULL,NULL,NULL,NULL,'ACTIVE',1098,452),(5312,NULL,NULL,NULL,NULL,'ACTIVE',1098,457),(5313,NULL,NULL,NULL,NULL,'ACTIVE',1098,461),(5314,NULL,NULL,NULL,NULL,'ACTIVE',1098,468),(5353,NULL,NULL,NULL,NULL,'ACTIVE',1104,453),(5354,NULL,NULL,NULL,NULL,'ACTIVE',1104,456),(5355,NULL,NULL,NULL,NULL,'ACTIVE',1104,461),(5356,NULL,NULL,NULL,NULL,'ACTIVE',1104,468),(5367,NULL,NULL,NULL,NULL,'ACTIVE',1106,453),(5368,NULL,NULL,NULL,NULL,'ACTIVE',1106,457),(5369,NULL,NULL,NULL,NULL,'ACTIVE',1106,461),(5370,NULL,NULL,NULL,NULL,'ACTIVE',1106,468),(5409,NULL,NULL,NULL,NULL,'ACTIVE',1112,454),(5410,NULL,NULL,NULL,NULL,'ACTIVE',1112,456),(5411,NULL,NULL,NULL,NULL,'ACTIVE',1112,461),(5412,NULL,NULL,NULL,NULL,'ACTIVE',1112,468),(5423,NULL,NULL,NULL,NULL,'ACTIVE',1114,454),(5424,NULL,NULL,NULL,NULL,'ACTIVE',1114,457),(5425,NULL,NULL,NULL,NULL,'ACTIVE',1114,461),(5426,NULL,NULL,NULL,NULL,'ACTIVE',1114,468),(5465,NULL,NULL,NULL,NULL,'ACTIVE',1120,455),(5466,NULL,NULL,NULL,NULL,'ACTIVE',1120,456),(5467,NULL,NULL,NULL,NULL,'ACTIVE',1120,461),(5468,NULL,NULL,NULL,NULL,'ACTIVE',1120,468),(5479,NULL,NULL,NULL,NULL,'ACTIVE',1122,455),(5480,NULL,NULL,NULL,NULL,'ACTIVE',1122,457),(5481,NULL,NULL,NULL,NULL,'ACTIVE',1122,461),(5482,NULL,NULL,NULL,NULL,'ACTIVE',1122,468),(5539,NULL,NULL,NULL,NULL,'ACTIVE',1146,469),(5540,NULL,NULL,NULL,NULL,'ACTIVE',1146,470),(5541,NULL,NULL,NULL,NULL,'ACTIVE',1146,473),(5542,NULL,NULL,NULL,NULL,'ACTIVE',1146,476),(5546,NULL,NULL,NULL,NULL,'ACTIVE',1147,469),(5547,NULL,NULL,NULL,NULL,'ACTIVE',1147,470),(5548,NULL,NULL,NULL,NULL,'ACTIVE',1147,473),(5549,NULL,NULL,NULL,NULL,'ACTIVE',1147,477),(5553,NULL,NULL,NULL,NULL,'ACTIVE',1148,469),(5554,NULL,NULL,NULL,NULL,'ACTIVE',1148,470),(5555,NULL,NULL,NULL,NULL,'ACTIVE',1148,474),(5556,NULL,NULL,NULL,NULL,'ACTIVE',1148,476),(5560,NULL,NULL,NULL,NULL,'ACTIVE',1149,469),(5561,NULL,NULL,NULL,NULL,'ACTIVE',1149,470),(5562,NULL,NULL,NULL,NULL,'ACTIVE',1149,474),(5563,NULL,NULL,NULL,NULL,'ACTIVE',1149,477),(5567,NULL,NULL,NULL,NULL,'ACTIVE',1150,469),(5568,NULL,NULL,NULL,NULL,'ACTIVE',1150,470),(5569,NULL,NULL,NULL,NULL,'ACTIVE',1150,475),(5570,NULL,NULL,NULL,NULL,'ACTIVE',1150,476),(5574,NULL,NULL,NULL,NULL,'ACTIVE',1151,469),(5575,NULL,NULL,NULL,NULL,'ACTIVE',1151,470),(5576,NULL,NULL,NULL,NULL,'ACTIVE',1151,475),(5577,NULL,NULL,NULL,NULL,'ACTIVE',1151,477),(5581,NULL,NULL,NULL,NULL,'ACTIVE',1152,469),(5582,NULL,NULL,NULL,NULL,'ACTIVE',1152,471),(5583,NULL,NULL,NULL,NULL,'ACTIVE',1152,473),(5584,NULL,NULL,NULL,NULL,'ACTIVE',1152,476),(5588,NULL,NULL,NULL,NULL,'ACTIVE',1153,469),(5589,NULL,NULL,NULL,NULL,'ACTIVE',1153,471),(5590,NULL,NULL,NULL,NULL,'ACTIVE',1153,473),(5591,NULL,NULL,NULL,NULL,'ACTIVE',1153,477),(5595,NULL,NULL,NULL,NULL,'ACTIVE',1154,469),(5596,NULL,NULL,NULL,NULL,'ACTIVE',1154,471),(5597,NULL,NULL,NULL,NULL,'ACTIVE',1154,474),(5598,NULL,NULL,NULL,NULL,'ACTIVE',1154,476),(5602,NULL,NULL,NULL,NULL,'ACTIVE',1155,469),(5603,NULL,NULL,NULL,NULL,'ACTIVE',1155,471),(5604,NULL,NULL,NULL,NULL,'ACTIVE',1155,474),(5605,NULL,NULL,NULL,NULL,'ACTIVE',1155,477),(5609,NULL,NULL,NULL,NULL,'ACTIVE',1156,469),(5610,NULL,NULL,NULL,NULL,'ACTIVE',1156,471),(5611,NULL,NULL,NULL,NULL,'ACTIVE',1156,475),(5612,NULL,NULL,NULL,NULL,'ACTIVE',1156,476),(5616,NULL,NULL,NULL,NULL,'ACTIVE',1157,469),(5617,NULL,NULL,NULL,NULL,'ACTIVE',1157,471),(5618,NULL,NULL,NULL,NULL,'ACTIVE',1157,475),(5619,NULL,NULL,NULL,NULL,'ACTIVE',1157,477),(5623,NULL,NULL,NULL,NULL,'ACTIVE',1158,469),(5624,NULL,NULL,NULL,NULL,'ACTIVE',1158,472),(5625,NULL,NULL,NULL,NULL,'ACTIVE',1158,473),(5626,NULL,NULL,NULL,NULL,'ACTIVE',1158,476),(5630,NULL,NULL,NULL,NULL,'ACTIVE',1159,469),(5631,NULL,NULL,NULL,NULL,'ACTIVE',1159,472),(5632,NULL,NULL,NULL,NULL,'ACTIVE',1159,473),(5633,NULL,NULL,NULL,NULL,'ACTIVE',1159,477),(5637,NULL,NULL,NULL,NULL,'ACTIVE',1160,469),(5638,NULL,NULL,NULL,NULL,'ACTIVE',1160,472),(5639,NULL,NULL,NULL,NULL,'ACTIVE',1160,474),(5640,NULL,NULL,NULL,NULL,'ACTIVE',1160,476),(5644,NULL,NULL,NULL,NULL,'ACTIVE',1161,469),(5645,NULL,NULL,NULL,NULL,'ACTIVE',1161,472),(5646,NULL,NULL,NULL,NULL,'ACTIVE',1161,474),(5647,NULL,NULL,NULL,NULL,'ACTIVE',1161,477),(5651,NULL,NULL,NULL,NULL,'ACTIVE',1162,469),(5652,NULL,NULL,NULL,NULL,'ACTIVE',1162,472),(5653,NULL,NULL,NULL,NULL,'ACTIVE',1162,475),(5654,NULL,NULL,NULL,NULL,'ACTIVE',1162,476),(5658,NULL,NULL,NULL,NULL,'ACTIVE',1163,469),(5659,NULL,NULL,NULL,NULL,'ACTIVE',1163,472),(5660,NULL,NULL,NULL,NULL,'ACTIVE',1163,475),(5661,NULL,NULL,NULL,NULL,'ACTIVE',1163,477),(5689,NULL,NULL,NULL,NULL,'ACTIVE',1172,479),(5690,NULL,NULL,NULL,NULL,'ACTIVE',1172,483),(5692,NULL,NULL,NULL,NULL,'ACTIVE',1173,479),(5693,NULL,NULL,NULL,NULL,'ACTIVE',1173,484),(5695,NULL,NULL,NULL,NULL,'ACTIVE',1174,480),(5696,NULL,NULL,NULL,NULL,'ACTIVE',1174,483),(5698,NULL,NULL,NULL,NULL,'ACTIVE',1175,480),(5699,NULL,NULL,NULL,NULL,'ACTIVE',1175,484),(5701,NULL,NULL,NULL,NULL,'ACTIVE',1176,481),(5702,NULL,NULL,NULL,NULL,'ACTIVE',1176,483),(5704,NULL,NULL,NULL,NULL,'ACTIVE',1177,481),(5705,NULL,NULL,NULL,NULL,'ACTIVE',1177,484),(5707,NULL,NULL,NULL,NULL,'ACTIVE',1178,482),(5708,NULL,NULL,NULL,NULL,'ACTIVE',1178,483),(5710,NULL,NULL,NULL,NULL,'ACTIVE',1179,482),(5711,NULL,NULL,NULL,NULL,'ACTIVE',1179,484),(5713,NULL,NULL,NULL,NULL,'ACTIVE',1180,485),(5714,NULL,NULL,NULL,NULL,'ACTIVE',1180,486),(5716,NULL,NULL,NULL,NULL,'ACTIVE',1181,485),(5717,NULL,NULL,NULL,NULL,'ACTIVE',1181,487),(5719,NULL,NULL,NULL,NULL,'ACTIVE',1182,485),(5720,NULL,NULL,NULL,NULL,'ACTIVE',1182,488),(5731,NULL,NULL,NULL,NULL,'ACTIVE',1186,493),(5732,NULL,NULL,NULL,NULL,'ACTIVE',1186,497),(5734,NULL,NULL,NULL,NULL,'ACTIVE',1187,493),(5735,NULL,NULL,NULL,NULL,'ACTIVE',1187,498),(5740,NULL,NULL,NULL,NULL,'ACTIVE',1189,494),(5741,NULL,NULL,NULL,NULL,'ACTIVE',1189,497),(5743,NULL,NULL,NULL,NULL,'ACTIVE',1190,494),(5744,NULL,NULL,NULL,NULL,'ACTIVE',1190,498),(5749,NULL,NULL,NULL,NULL,'ACTIVE',1192,495),(5750,NULL,NULL,NULL,NULL,'ACTIVE',1192,497),(5752,NULL,NULL,NULL,NULL,'ACTIVE',1193,495),(5753,NULL,NULL,NULL,NULL,'ACTIVE',1193,498),(5758,NULL,NULL,NULL,NULL,'ACTIVE',1195,496),(5759,NULL,NULL,NULL,NULL,'ACTIVE',1195,497),(5761,NULL,NULL,NULL,NULL,'ACTIVE',1196,496),(5762,NULL,NULL,NULL,NULL,'ACTIVE',1196,498),(5767,NULL,NULL,NULL,NULL,'ACTIVE',1198,500),(5768,NULL,NULL,NULL,NULL,'ACTIVE',1198,503),(5770,NULL,NULL,NULL,NULL,'ACTIVE',1199,500),(5771,NULL,NULL,NULL,NULL,'ACTIVE',1199,504),(5773,NULL,NULL,NULL,NULL,'ACTIVE',1200,500),(5774,NULL,NULL,NULL,NULL,'ACTIVE',1200,505),(5776,NULL,NULL,NULL,NULL,'ACTIVE',1201,500),(5777,NULL,NULL,NULL,NULL,'ACTIVE',1201,506),(5779,NULL,NULL,NULL,NULL,'ACTIVE',1202,501),(5780,NULL,NULL,NULL,NULL,'ACTIVE',1202,503),(5782,NULL,NULL,NULL,NULL,'ACTIVE',1203,501),(5783,NULL,NULL,NULL,NULL,'ACTIVE',1203,504),(5785,NULL,NULL,NULL,NULL,'ACTIVE',1204,501),(5786,NULL,NULL,NULL,NULL,'ACTIVE',1204,505),(5788,NULL,NULL,NULL,NULL,'ACTIVE',1205,501),(5789,NULL,NULL,NULL,NULL,'ACTIVE',1205,506),(5791,NULL,NULL,NULL,NULL,'ACTIVE',1206,502),(5792,NULL,NULL,NULL,NULL,'ACTIVE',1206,503),(5794,NULL,NULL,NULL,NULL,'ACTIVE',1207,502),(5795,NULL,NULL,NULL,NULL,'ACTIVE',1207,504),(5797,NULL,NULL,NULL,NULL,'ACTIVE',1208,502),(5798,NULL,NULL,NULL,NULL,'ACTIVE',1208,505),(5800,NULL,NULL,NULL,NULL,'ACTIVE',1209,502),(5801,NULL,NULL,NULL,NULL,'ACTIVE',1209,506),(5818,NULL,NULL,NULL,NULL,'ACTIVE',1217,511),(5819,NULL,NULL,NULL,NULL,'ACTIVE',1218,511),(5823,NULL,NULL,NULL,NULL,'ACTIVE',1222,511),(5824,NULL,NULL,NULL,NULL,'ACTIVE',1223,511),(5828,NULL,NULL,NULL,NULL,'ACTIVE',1227,511),(5829,NULL,NULL,NULL,NULL,'ACTIVE',1228,511),(5839,NULL,NULL,NULL,NULL,'ACTIVE',1238,512),(5840,NULL,NULL,NULL,NULL,'ACTIVE',1239,512),(5841,NULL,NULL,NULL,NULL,'ACTIVE',1240,512),(5843,NULL,NULL,NULL,NULL,'ACTIVE',1242,512),(5844,NULL,NULL,NULL,NULL,'ACTIVE',1243,512),(5845,NULL,NULL,NULL,NULL,'ACTIVE',1244,512),(5850,NULL,NULL,NULL,NULL,'ACTIVE',1249,513),(5851,NULL,NULL,NULL,NULL,'ACTIVE',1249,515),(5853,NULL,NULL,NULL,NULL,'ACTIVE',1250,513),(5854,NULL,NULL,NULL,NULL,'ACTIVE',1250,516),(5856,NULL,NULL,NULL,NULL,'ACTIVE',1251,514),(5857,NULL,NULL,NULL,NULL,'ACTIVE',1251,515),(5859,NULL,NULL,NULL,NULL,'ACTIVE',1252,514),(5860,NULL,NULL,NULL,NULL,'ACTIVE',1252,516),(5889,NULL,NULL,NULL,NULL,'ACTIVE',1262,511),(5890,NULL,NULL,NULL,NULL,'ACTIVE',1262,523),(5891,NULL,NULL,NULL,NULL,'ACTIVE',1262,526),(5892,NULL,NULL,NULL,NULL,'ACTIVE',1263,511),(5893,NULL,NULL,NULL,NULL,'ACTIVE',1263,524),(5894,NULL,NULL,NULL,NULL,'ACTIVE',1263,526),(5895,NULL,NULL,NULL,NULL,'ACTIVE',1264,511),(5896,NULL,NULL,NULL,NULL,'ACTIVE',1264,525),(5897,NULL,NULL,NULL,NULL,'ACTIVE',1264,526),(5898,NULL,NULL,NULL,NULL,'ACTIVE',1265,529),(5899,NULL,NULL,NULL,NULL,'ACTIVE',1266,529),(5900,NULL,NULL,NULL,NULL,'ACTIVE',1267,529),(5901,NULL,NULL,NULL,NULL,'ACTIVE',1268,530),(5902,NULL,NULL,NULL,NULL,'ACTIVE',1268,531),(5904,NULL,NULL,NULL,NULL,'ACTIVE',1269,530),(5905,NULL,NULL,NULL,NULL,'ACTIVE',1269,532),(5907,NULL,NULL,NULL,NULL,'ACTIVE',1270,530),(5908,NULL,NULL,NULL,NULL,'ACTIVE',1270,533),(5910,NULL,NULL,NULL,NULL,'ACTIVE',1271,530),(5911,NULL,NULL,NULL,NULL,'ACTIVE',1271,534),(5913,NULL,NULL,NULL,NULL,'ACTIVE',1272,535),(5914,NULL,NULL,NULL,NULL,'ACTIVE',1272,540),(5916,NULL,NULL,NULL,NULL,'ACTIVE',1273,536),(5917,NULL,NULL,NULL,NULL,'ACTIVE',1273,540),(5919,NULL,NULL,NULL,NULL,'ACTIVE',1274,537),(5920,NULL,NULL,NULL,NULL,'ACTIVE',1274,540),(5922,NULL,NULL,NULL,NULL,'ACTIVE',1275,538),(5923,NULL,NULL,NULL,NULL,'ACTIVE',1275,540),(5925,NULL,NULL,NULL,NULL,'ACTIVE',1276,539),(5926,NULL,NULL,NULL,NULL,'ACTIVE',1276,540),(5928,NULL,NULL,NULL,NULL,'ACTIVE',1277,541),(5929,NULL,NULL,NULL,NULL,'ACTIVE',1277,546),(5931,NULL,NULL,NULL,NULL,'ACTIVE',1278,541),(5932,NULL,NULL,NULL,NULL,'ACTIVE',1278,547),(5934,NULL,NULL,NULL,NULL,'ACTIVE',1279,541),(5935,NULL,NULL,NULL,NULL,'ACTIVE',1279,548),(5937,NULL,NULL,NULL,NULL,'ACTIVE',1280,541),(5938,NULL,NULL,NULL,NULL,'ACTIVE',1280,549),(5940,NULL,NULL,NULL,NULL,'ACTIVE',1281,541),(5941,NULL,NULL,NULL,NULL,'ACTIVE',1281,550),(5943,NULL,NULL,NULL,NULL,'ACTIVE',1282,541),(5944,NULL,NULL,NULL,NULL,'ACTIVE',1282,551),(5946,NULL,NULL,NULL,NULL,'ACTIVE',1283,542),(5947,NULL,NULL,NULL,NULL,'ACTIVE',1283,546),(5949,NULL,NULL,NULL,NULL,'ACTIVE',1284,542),(5950,NULL,NULL,NULL,NULL,'ACTIVE',1284,547),(5952,NULL,NULL,NULL,NULL,'ACTIVE',1285,542),(5953,NULL,NULL,NULL,NULL,'ACTIVE',1285,548),(5955,NULL,NULL,NULL,NULL,'ACTIVE',1286,542),(5956,NULL,NULL,NULL,NULL,'ACTIVE',1286,549),(5958,NULL,NULL,NULL,NULL,'ACTIVE',1287,542),(5959,NULL,NULL,NULL,NULL,'ACTIVE',1287,550),(5961,NULL,NULL,NULL,NULL,'ACTIVE',1288,542),(5962,NULL,NULL,NULL,NULL,'ACTIVE',1288,551),(5964,NULL,NULL,NULL,NULL,'ACTIVE',1289,543),(5965,NULL,NULL,NULL,NULL,'ACTIVE',1289,546),(5967,NULL,NULL,NULL,NULL,'ACTIVE',1290,543),(5968,NULL,NULL,NULL,NULL,'ACTIVE',1290,547),(5970,NULL,NULL,NULL,NULL,'ACTIVE',1291,543),(5971,NULL,NULL,NULL,NULL,'ACTIVE',1291,548),(5973,NULL,NULL,NULL,NULL,'ACTIVE',1292,543),(5974,NULL,NULL,NULL,NULL,'ACTIVE',1292,549),(5976,NULL,NULL,NULL,NULL,'ACTIVE',1293,543),(5977,NULL,NULL,NULL,NULL,'ACTIVE',1293,550),(5979,NULL,NULL,NULL,NULL,'ACTIVE',1294,543),(5980,NULL,NULL,NULL,NULL,'ACTIVE',1294,551),(5982,NULL,NULL,NULL,NULL,'ACTIVE',1295,544),(5983,NULL,NULL,NULL,NULL,'ACTIVE',1295,546),(5985,NULL,NULL,NULL,NULL,'ACTIVE',1296,544),(5986,NULL,NULL,NULL,NULL,'ACTIVE',1296,547),(5988,NULL,NULL,NULL,NULL,'ACTIVE',1297,544),(5989,NULL,NULL,NULL,NULL,'ACTIVE',1297,548),(5991,NULL,NULL,NULL,NULL,'ACTIVE',1298,544),(5992,NULL,NULL,NULL,NULL,'ACTIVE',1298,549),(5994,NULL,NULL,NULL,NULL,'ACTIVE',1299,544),(5995,NULL,NULL,NULL,NULL,'ACTIVE',1299,550),(5997,NULL,NULL,NULL,NULL,'ACTIVE',1300,544),(5998,NULL,NULL,NULL,NULL,'ACTIVE',1300,551),(6000,NULL,NULL,NULL,NULL,'ACTIVE',1301,545),(6001,NULL,NULL,NULL,NULL,'ACTIVE',1301,546),(6003,NULL,NULL,NULL,NULL,'ACTIVE',1302,545),(6004,NULL,NULL,NULL,NULL,'ACTIVE',1302,547),(6006,NULL,NULL,NULL,NULL,'ACTIVE',1303,545),(6007,NULL,NULL,NULL,NULL,'ACTIVE',1303,548),(6009,NULL,NULL,NULL,NULL,'ACTIVE',1304,545),(6010,NULL,NULL,NULL,NULL,'ACTIVE',1304,549),(6012,NULL,NULL,NULL,NULL,'ACTIVE',1305,545),(6013,NULL,NULL,NULL,NULL,'ACTIVE',1305,550),(6015,NULL,NULL,NULL,NULL,'ACTIVE',1306,545),(6016,NULL,NULL,NULL,NULL,'ACTIVE',1306,551),(6018,NULL,NULL,NULL,NULL,'ACTIVE',1307,552),(6019,NULL,NULL,NULL,NULL,'ACTIVE',1307,556),(6021,NULL,NULL,NULL,NULL,'ACTIVE',1308,552),(6022,NULL,NULL,NULL,NULL,'ACTIVE',1308,557),(6024,NULL,NULL,NULL,NULL,'ACTIVE',1309,553),(6025,NULL,NULL,NULL,NULL,'ACTIVE',1309,556),(6027,NULL,NULL,NULL,NULL,'ACTIVE',1310,553),(6028,NULL,NULL,NULL,NULL,'ACTIVE',1310,557),(6030,NULL,NULL,NULL,NULL,'ACTIVE',1311,554),(6031,NULL,NULL,NULL,NULL,'ACTIVE',1311,556),(6033,NULL,NULL,NULL,NULL,'ACTIVE',1312,554),(6034,NULL,NULL,NULL,NULL,'ACTIVE',1312,557),(6036,NULL,NULL,NULL,NULL,'ACTIVE',1313,555),(6037,NULL,NULL,NULL,NULL,'ACTIVE',1313,556),(6039,NULL,NULL,NULL,NULL,'ACTIVE',1314,555),(6040,NULL,NULL,NULL,NULL,'ACTIVE',1314,557),(6042,NULL,NULL,NULL,NULL,'ACTIVE',1315,558),(6043,NULL,NULL,NULL,NULL,'ACTIVE',1315,562),(6045,NULL,NULL,NULL,NULL,'ACTIVE',1316,558),(6046,NULL,NULL,NULL,NULL,'ACTIVE',1316,563),(6048,NULL,NULL,NULL,NULL,'ACTIVE',1317,559),(6049,NULL,NULL,NULL,NULL,'ACTIVE',1317,562),(6051,NULL,NULL,NULL,NULL,'ACTIVE',1318,559),(6052,NULL,NULL,NULL,NULL,'ACTIVE',1318,563),(6054,NULL,NULL,NULL,NULL,'ACTIVE',1319,560),(6055,NULL,NULL,NULL,NULL,'ACTIVE',1319,562),(6057,NULL,NULL,NULL,NULL,'ACTIVE',1320,560),(6058,NULL,NULL,NULL,NULL,'ACTIVE',1320,563),(6060,NULL,NULL,NULL,NULL,'ACTIVE',1321,561),(6061,NULL,NULL,NULL,NULL,'ACTIVE',1321,562),(6063,NULL,NULL,NULL,NULL,'ACTIVE',1322,561),(6064,NULL,NULL,NULL,NULL,'ACTIVE',1322,563),(6066,NULL,NULL,NULL,NULL,'ACTIVE',1323,564),(6067,NULL,NULL,NULL,NULL,'ACTIVE',1323,565),(6069,NULL,NULL,NULL,NULL,'ACTIVE',1324,564),(6070,NULL,NULL,NULL,NULL,'ACTIVE',1324,566),(6072,NULL,NULL,NULL,NULL,'ACTIVE',1325,564),(6073,NULL,NULL,NULL,NULL,'ACTIVE',1325,567),(6075,NULL,NULL,NULL,NULL,'ACTIVE',1326,564),(6076,NULL,NULL,NULL,NULL,'ACTIVE',1326,568),(6105,NULL,NULL,NULL,NULL,'ACTIVE',1336,570),(6106,NULL,NULL,NULL,NULL,'ACTIVE',1336,573),(6107,NULL,NULL,NULL,NULL,'ACTIVE',1336,576),(6108,NULL,NULL,NULL,NULL,'ACTIVE',1336,577),(6112,NULL,NULL,NULL,NULL,'ACTIVE',1337,570),(6113,NULL,NULL,NULL,NULL,'ACTIVE',1337,574),(6114,NULL,NULL,NULL,NULL,'ACTIVE',1337,576),(6115,NULL,NULL,NULL,NULL,'ACTIVE',1337,577),(6119,NULL,NULL,NULL,NULL,'ACTIVE',1338,570),(6120,NULL,NULL,NULL,NULL,'ACTIVE',1338,575),(6121,NULL,NULL,NULL,NULL,'ACTIVE',1338,576),(6122,NULL,NULL,NULL,NULL,'ACTIVE',1338,577),(6126,NULL,NULL,NULL,NULL,'ACTIVE',1339,571),(6127,NULL,NULL,NULL,NULL,'ACTIVE',1339,573),(6128,NULL,NULL,NULL,NULL,'ACTIVE',1339,576),(6129,NULL,NULL,NULL,NULL,'ACTIVE',1339,577),(6133,NULL,NULL,NULL,NULL,'ACTIVE',1340,571),(6134,NULL,NULL,NULL,NULL,'ACTIVE',1340,574),(6135,NULL,NULL,NULL,NULL,'ACTIVE',1340,576),(6136,NULL,NULL,NULL,NULL,'ACTIVE',1340,577),(6140,NULL,NULL,NULL,NULL,'ACTIVE',1341,571),(6141,NULL,NULL,NULL,NULL,'ACTIVE',1341,575),(6142,NULL,NULL,NULL,NULL,'ACTIVE',1341,576),(6143,NULL,NULL,NULL,NULL,'ACTIVE',1341,577),(6147,NULL,NULL,NULL,NULL,'ACTIVE',1342,572),(6148,NULL,NULL,NULL,NULL,'ACTIVE',1342,573),(6149,NULL,NULL,NULL,NULL,'ACTIVE',1342,576),(6150,NULL,NULL,NULL,NULL,'ACTIVE',1342,577),(6154,NULL,NULL,NULL,NULL,'ACTIVE',1343,572),(6155,NULL,NULL,NULL,NULL,'ACTIVE',1343,574),(6156,NULL,NULL,NULL,NULL,'ACTIVE',1343,576),(6157,NULL,NULL,NULL,NULL,'ACTIVE',1343,577),(6161,NULL,NULL,NULL,NULL,'ACTIVE',1344,572),(6162,NULL,NULL,NULL,NULL,'ACTIVE',1344,575),(6163,NULL,NULL,NULL,NULL,'ACTIVE',1344,576),(6164,NULL,NULL,NULL,NULL,'ACTIVE',1344,577),(6168,NULL,NULL,NULL,NULL,'ACTIVE',1345,578),(6169,NULL,NULL,NULL,NULL,'ACTIVE',1345,580),(6171,NULL,NULL,NULL,NULL,'ACTIVE',1346,578),(6172,NULL,NULL,NULL,NULL,'ACTIVE',1346,581),(6174,NULL,NULL,NULL,NULL,'ACTIVE',1347,578),(6175,NULL,NULL,NULL,NULL,'ACTIVE',1347,582),(6177,NULL,NULL,NULL,NULL,'ACTIVE',1348,579),(6178,NULL,NULL,NULL,NULL,'ACTIVE',1348,580),(6180,NULL,NULL,NULL,NULL,'ACTIVE',1349,579),(6181,NULL,NULL,NULL,NULL,'ACTIVE',1349,581),(6183,NULL,NULL,NULL,NULL,'ACTIVE',1350,579),(6184,NULL,NULL,NULL,NULL,'ACTIVE',1350,582),(6186,NULL,NULL,NULL,NULL,'ACTIVE',1351,583),(6187,NULL,NULL,NULL,NULL,'ACTIVE',1351,586),(6189,NULL,NULL,NULL,NULL,'ACTIVE',1352,583),(6190,NULL,NULL,NULL,NULL,'ACTIVE',1352,587),(6192,NULL,NULL,NULL,NULL,'ACTIVE',1353,583),(6193,NULL,NULL,NULL,NULL,'ACTIVE',1353,588),(6195,NULL,NULL,NULL,NULL,'ACTIVE',1354,584),(6196,NULL,NULL,NULL,NULL,'ACTIVE',1354,586),(6198,NULL,NULL,NULL,NULL,'ACTIVE',1355,584),(6199,NULL,NULL,NULL,NULL,'ACTIVE',1355,587),(6201,NULL,NULL,NULL,NULL,'ACTIVE',1356,584),(6202,NULL,NULL,NULL,NULL,'ACTIVE',1356,588),(6204,NULL,NULL,NULL,NULL,'ACTIVE',1357,585),(6205,NULL,NULL,NULL,NULL,'ACTIVE',1357,586),(6207,NULL,NULL,NULL,NULL,'ACTIVE',1358,585),(6208,NULL,NULL,NULL,NULL,'ACTIVE',1358,587),(6210,NULL,NULL,NULL,NULL,'ACTIVE',1359,585),(6211,NULL,NULL,NULL,NULL,'ACTIVE',1359,588),(6213,NULL,NULL,NULL,NULL,'ACTIVE',1360,531),(6214,NULL,NULL,NULL,NULL,'ACTIVE',1360,589),(6216,NULL,NULL,NULL,NULL,'ACTIVE',1361,532),(6217,NULL,NULL,NULL,NULL,'ACTIVE',1361,589),(6219,NULL,NULL,NULL,NULL,'ACTIVE',1362,533),(6220,NULL,NULL,NULL,NULL,'ACTIVE',1362,589),(6222,NULL,NULL,NULL,NULL,'ACTIVE',1363,534),(6223,NULL,NULL,NULL,NULL,'ACTIVE',1363,589),(6225,NULL,NULL,NULL,NULL,'ACTIVE',1364,590),(6226,NULL,NULL,NULL,NULL,'ACTIVE',1364,592),(6227,NULL,NULL,NULL,NULL,'ACTIVE',1364,594),(6228,NULL,NULL,NULL,NULL,'ACTIVE',1365,590),(6229,NULL,NULL,NULL,NULL,'ACTIVE',1365,593),(6230,NULL,NULL,NULL,NULL,'ACTIVE',1365,594),(6231,NULL,NULL,NULL,NULL,'ACTIVE',1366,591),(6232,NULL,NULL,NULL,NULL,'ACTIVE',1366,592),(6233,NULL,NULL,NULL,NULL,'ACTIVE',1366,594),(6234,NULL,NULL,NULL,NULL,'ACTIVE',1367,591),(6235,NULL,NULL,NULL,NULL,'ACTIVE',1367,593),(6236,NULL,NULL,NULL,NULL,'ACTIVE',1367,594),(6237,NULL,NULL,NULL,NULL,'ACTIVE',1368,595),(6238,NULL,NULL,NULL,NULL,'ACTIVE',1368,597),(6239,NULL,NULL,NULL,NULL,'ACTIVE',1368,599),(6240,NULL,NULL,NULL,NULL,'ACTIVE',1369,595),(6241,NULL,NULL,NULL,NULL,'ACTIVE',1369,597),(6242,NULL,NULL,NULL,NULL,'ACTIVE',1369,600),(6243,NULL,NULL,NULL,NULL,'ACTIVE',1370,595),(6244,NULL,NULL,NULL,NULL,'ACTIVE',1370,598),(6245,NULL,NULL,NULL,NULL,'ACTIVE',1370,599),(6246,NULL,NULL,NULL,NULL,'ACTIVE',1371,595),(6247,NULL,NULL,NULL,NULL,'ACTIVE',1371,598),(6248,NULL,NULL,NULL,NULL,'ACTIVE',1371,600),(6249,NULL,NULL,NULL,NULL,'ACTIVE',1372,596),(6250,NULL,NULL,NULL,NULL,'ACTIVE',1372,597),(6251,NULL,NULL,NULL,NULL,'ACTIVE',1372,599),(6252,NULL,NULL,NULL,NULL,'ACTIVE',1373,596),(6253,NULL,NULL,NULL,NULL,'ACTIVE',1373,597),(6254,NULL,NULL,NULL,NULL,'ACTIVE',1373,600),(6255,NULL,NULL,NULL,NULL,'ACTIVE',1374,596),(6256,NULL,NULL,NULL,NULL,'ACTIVE',1374,598),(6257,NULL,NULL,NULL,NULL,'ACTIVE',1374,599),(6258,NULL,NULL,NULL,NULL,'ACTIVE',1375,596),(6259,NULL,NULL,NULL,NULL,'ACTIVE',1375,598),(6260,NULL,NULL,NULL,NULL,'ACTIVE',1375,600);
/*!40000 ALTER TABLE `giatrithuoctinhbienthe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `idkhachhang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrotib125snysssa1uiikkfj1b` (`idkhachhang`),
  CONSTRAINT `FKrotib125snysssa1uiikkfj1b` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (23,NULL,'2024-01-15 08:18:13',NULL,'nguyenthikhanhlinh1711','ACTIVE',3),(24,NULL,'2024-01-15 12:47:12',NULL,'dinhanhtuan0812','ACTIVE',2),(25,NULL,'2024-01-15 14:10:51',NULL,'doquochuy8173','ACTIVE',4),(26,NULL,'2024-01-15 15:53:37',NULL,'dangngocthanh0133','ACTIVE',1),(27,NULL,'2024-01-15 18:49:33',NULL,'dinhtuananh0183','ACTIVE',5);
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohangchitiet`
--

DROP TABLE IF EXISTS `giohangchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohangchitiet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `gia` double DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `idbienthe` bigint DEFAULT NULL,
  `idgiohang` bigint DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8j5vpdk26mdy519f0uoeh1dix` (`idbienthe`),
  KEY `FKrxrj4t2nvkmcprh4ee0ehbvwi` (`idgiohang`),
  KEY `FKpubdi51v0ipjgpy3hfa7egsjq` (`idsanpham`),
  CONSTRAINT `FK8j5vpdk26mdy519f0uoeh1dix` FOREIGN KEY (`idbienthe`) REFERENCES `bienthe` (`id`),
  CONSTRAINT `FKpubdi51v0ipjgpy3hfa7egsjq` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  CONSTRAINT `FKrxrj4t2nvkmcprh4ee0ehbvwi` FOREIGN KEY (`idgiohang`) REFERENCES `giohang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohangchitiet`
--

LOCK TABLES `giohangchitiet` WRITE;
/*!40000 ALTER TABLE `giohangchitiet` DISABLE KEYS */;
INSERT INTO `giohangchitiet` VALUES (196,'2024-01-15 17:54:06','2024-01-15 09:12:26','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,2,1312,23,80),(198,'2024-01-15 12:48:29','2024-01-15 12:47:12','dinhanhtuan0812','dinhanhtuan0812','ACTIVE',NULL,2,1306,24,79),(200,'2024-01-15 12:48:11','2024-01-15 12:47:59','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,1,1306,24,79),(204,'2024-01-15 17:53:43','2024-01-15 13:39:34','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1324,23,82),(205,'2024-01-15 13:40:00','2024-01-15 13:39:38','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1324,23,82),(206,'2024-01-15 14:07:59','2024-01-15 14:07:46','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,1,1351,24,83),(207,'2024-01-15 14:07:59','2024-01-15 14:07:50','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,1,1352,24,83),(208,'2024-01-15 14:08:30','2024-01-15 14:08:25','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,1,1323,24,82),(209,'2024-01-15 14:09:13','2024-01-15 14:09:06','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,1,1315,24,81),(210,'2024-01-15 14:11:29','2024-01-15 14:10:51','doquochuy8173','doquochuy8173','DELETE',NULL,1,1307,25,80),(211,'2024-01-15 14:11:09','2024-01-15 14:11:03','doquochuy8173','doquochuy8173','DELETE',NULL,1,1277,25,79),(215,'2024-01-15 19:27:24','2024-01-15 15:52:34','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,2,1268,24,77),(217,'2024-01-16 04:24:08','2024-01-15 15:52:40','dinhanhtuan0812','dinhanhtuan0812','DELETE',NULL,2,1269,24,77),(218,'2024-01-15 17:41:40','2024-01-15 15:53:38','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,1,1268,26,77),(219,'2024-01-15 17:46:26','2024-01-15 15:53:39','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,1,1270,26,77),(220,'2024-01-15 15:53:55','2024-01-15 15:53:42','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,1,1270,26,77),(221,'2024-01-15 17:27:51','2024-01-15 17:27:43','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,1,697,26,59),(222,'2024-01-15 19:22:18','2024-01-15 17:39:44','dangngocthanh0133','dangngocthanh0133','ACTIVE',NULL,2,68,26,12),(223,'2024-01-15 17:40:00','2024-01-15 17:39:50','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,1,69,26,12),(224,'2024-01-15 17:53:16','2024-01-15 17:53:00','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1323,23,82),(226,'2024-01-15 17:54:34','2024-01-15 17:54:27','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1320,23,81),(227,'2024-01-15 17:55:25','2024-01-15 17:55:21','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1272,23,78),(228,'2024-01-15 18:06:28','2024-01-15 18:05:57','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,68,23,12),(229,'2024-01-15 18:48:58','2024-01-15 18:06:12','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1364,23,14),(230,'2024-01-15 18:32:20','2024-01-15 18:06:19','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1367,23,14),(231,'2024-01-15 18:36:43','2024-01-15 18:36:38','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1367,23,14),(232,'2024-01-15 18:40:33','2024-01-15 18:40:29','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,641,23,69),(233,'2024-01-15 18:49:39','2024-01-15 18:49:33','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,1,1346,27,44),(234,'2024-01-15 18:51:30','2024-01-15 18:50:44','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,7,1249,27,76),(235,'2024-01-15 18:59:46','2024-01-15 18:52:13','dinhtuananh0183','dinhtuananh0183','ACTIVE',NULL,1,1249,27,76),(236,'2024-01-15 19:02:00','2024-01-15 18:53:16','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,10,1336,27,73),(237,'2024-01-15 18:55:36','2024-01-15 18:55:13','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,1,1272,27,78),(238,'2024-01-15 19:21:35','2024-01-15 19:21:27','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,2,1189,23,74),(239,'2024-01-16 06:13:04','2024-01-15 19:23:12','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,3,1339,27,73),(240,'2024-01-16 04:23:27','2024-01-16 04:23:20','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1315,23,81),(241,'2024-01-16 05:31:02','2024-01-16 05:22:30','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,2,1319,23,81),(242,'2024-01-16 05:22:54','2024-01-16 05:22:34','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,1,1322,23,81),(243,'2024-01-16 05:40:09','2024-01-16 05:39:44','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,2,1322,23,81),(245,'2024-01-16 06:05:14','2024-01-16 06:04:54','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,2,63,27,10),(246,'2024-01-16 06:11:37','2024-01-16 06:11:20','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','ACTIVE',NULL,2,1320,23,81),(247,NULL,'2024-01-16 06:11:27',NULL,'nguyenthikhanhlinh1711','ACTIVE',NULL,1,1315,23,81),(249,'2024-01-16 06:23:55','2024-01-16 06:11:33','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','DELETE',NULL,2,1321,23,81),(250,'2024-01-16 06:13:19','2024-01-16 06:12:33','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,1,1320,27,81),(251,NULL,'2024-01-16 06:12:35',NULL,'dinhtuananh0183','ACTIVE',NULL,1,1319,27,81),(252,NULL,'2024-01-16 06:12:39',NULL,'dinhtuananh0183','ACTIVE',NULL,1,1321,27,81),(253,'2024-01-16 06:12:50','2024-01-16 06:12:42','dinhtuananh0183','dinhtuananh0183','DELETE',NULL,1,1315,27,81),(254,'2024-01-16 06:48:34','2024-01-16 06:48:18','dangngocthanh0133','dangngocthanh0133','DELETE',NULL,2,63,26,10),(255,'2024-01-16 07:14:35','2024-01-16 06:50:58','dangngocthanh0133','dangngocthanh0133','ACTIVE',NULL,2,1323,26,82),(256,'2024-01-16 07:15:46','2024-01-16 07:15:41','dinhtuananh0183','dinhtuananh0183','ACTIVE',NULL,2,1375,27,7),(257,'2024-01-16 07:16:22','2024-01-16 07:16:13','dangngocthanh0133','dangngocthanh0133','ACTIVE',NULL,2,1374,26,7),(258,'2024-07-24 05:53:54','2024-07-24 05:53:32','dangngocthanh0133','dangngocthanh0133','PENDING',NULL,3,1320,26,81);
/*!40000 ALTER TABLE `giohangchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `diachi` varchar(255) DEFAULT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `mota` text,
  `ngaydat` timestamp NULL DEFAULT NULL,
  `ngaydukiengiaohang` timestamp NULL DEFAULT NULL,
  `ngaynhanhang` timestamp NULL DEFAULT NULL,
  `ngaythanhtoan` timestamp NULL DEFAULT NULL,
  `phuongthucthanhtoan` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `tennguoinhan` varchar(255) DEFAULT NULL,
  `tienkhachtra` double DEFAULT NULL,
  `tienship` double DEFAULT NULL,
  `tongtienhang` double DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  `idlydohuydon` bigint DEFAULT NULL,
  `idnhanvien` bigint DEFAULT NULL,
  `magiaohang` varchar(25) DEFAULT NULL,
  `loai` varchar(255) DEFAULT NULL,
  `ngaygiaohang` timestamp NULL DEFAULT NULL,
  `tiengiamgia` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_68t1eua0rqbalr8tduyigv0wf` (`ma`),
  KEY `FKlwt6og8a59ih2g8k9le1n7bpy` (`idkhachhang`),
  KEY `FKdwfy15k3xk5wta4dkl3ff0t9t` (`idlydohuydon`),
  KEY `FKotnlgqnkhi19yrgi907nev953` (`idnhanvien`),
  CONSTRAINT `FKdwfy15k3xk5wta4dkl3ff0t9t` FOREIGN KEY (`idlydohuydon`) REFERENCES `lydohuydon` (`id`),
  CONSTRAINT `FKlwt6og8a59ih2g8k9le1n7bpy` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `FKotnlgqnkhi19yrgi907nev953` FOREIGN KEY (`idnhanvien`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (557,'2024-01-16 05:58:58','2024-01-16 05:22:54','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','HUYDON','mầm non yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam','HD557','','2024-01-16 05:25:24',NULL,NULL,NULL,'THANHTOANNHANHANG','0979386056','Khánh Linh',175301,25301,150000,3,NULL,NULL,NULL,'Online',NULL,NULL),(558,NULL,'2024-01-16 05:26:49',NULL,'admin9193','TREO',NULL,'cJ4PJS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'OFFLINE',NULL,NULL),(559,'2024-01-16 06:03:31','2024-01-16 05:31:02','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','HUYDON','mầm non yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam','HD559','','2024-01-16 05:31:09',NULL,NULL,NULL,'THANHTOANNHANHANG','0979386056','Khánh Linh',325301,25301,300000,3,NULL,NULL,NULL,'Online',NULL,NULL),(561,'2024-01-16 05:59:56','2024-01-16 05:40:09','nguyenthikhanhlinh1711','nguyenthikhanhlinh1711','HUYDON','mầm non yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam','HD561','','2024-01-16 05:45:24',NULL,NULL,NULL,'THANHTOANNHANHANG','0979386056','Khánh Linh',365301,25301,340000,3,NULL,NULL,NULL,'Online',NULL,NULL),(562,'2024-01-16 05:58:03','2024-01-16 05:57:01','admin9193','nguyenthikhanhlinh1711','HUYDON','mầm non yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam','HD562','','2024-01-16 05:57:17',NULL,NULL,NULL,'THANHTOANNHANHANG','0979386056','Khánh Linh',817301,25301,792000,3,NULL,NULL,NULL,'Online',NULL,NULL),(563,'2024-01-16 06:06:39','2024-01-16 06:05:14','admin9193','dinhtuananh0183','HUYDON','12, Xã Yên Trị, Huyện Yên Thủy, Hòa Bình, Vietnam','HD563','','2024-01-16 06:05:58',NULL,NULL,NULL,'THANHTOANNHANHANG','0384082003','Tuấn',705301,25301,680000,5,NULL,NULL,NULL,'Online',NULL,NULL),(564,'2024-01-16 06:14:44','2024-01-16 06:12:50','dinhtuananh0183','dinhtuananh0183','HUYDON','12, Xã Yên Trị, Huyện Yên Thủy, Hòa Bình, Vietnam','HD564','','2024-01-16 06:12:56',NULL,NULL,NULL,'THANHTOANNHANHANG','0384082003','Tuấn',185301,25301,160000,5,NULL,NULL,NULL,'Online',NULL,NULL),(565,'2024-01-16 06:14:42','2024-01-16 06:13:04','dinhtuananh0183','dinhtuananh0183','HUYDON','12, Xã Yên Trị, Huyện Yên Thủy, Hòa Bình, Vietnam','HD565','','2024-01-16 06:13:09',NULL,NULL,NULL,'THANHTOANNHANHANG','0384082003','Tuấn',385301,25301,360000,5,NULL,NULL,NULL,'Online',NULL,NULL),(566,'2024-01-16 06:14:48','2024-01-16 06:13:19','dinhtuananh0183','dinhtuananh0183','HUYDON','12, Xã Yên Trị, Huyện Yên Thủy, Hòa Bình, Vietnam','HD566','','2024-01-16 06:13:25',NULL,NULL,NULL,'THANHTOANNHANHANG','0384082003','Tuấn',175301,25301,150000,5,NULL,NULL,NULL,'Online',NULL,NULL),(567,'2024-01-16 06:32:51','2024-01-16 06:23:55','admin9193','nguyenthikhanhlinh1711','HUYDON','xóm Yên Lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam','HD567','','2024-01-16 06:28:04',NULL,NULL,'2024-01-16 06:28:04','CHUYENKHOAN','0979386056','Khánh Linh',325301,25301,300000,3,NULL,NULL,NULL,'Online',NULL,NULL),(568,'2024-01-16 06:50:03','2024-01-16 06:48:34','dangngocthanh0133','dangngocthanh0133','HUYDON','số 12, Xã Tống Trân, Huyện Phù Cừ, Hưng Yên, Vietnam','HD568','','2024-01-16 06:49:54',NULL,NULL,NULL,'THANHTOANNHANHANG','0987654322','Tuấn',705301,25301,680000,1,NULL,NULL,NULL,'Online',NULL,NULL),(576,'2024-07-24 05:53:54','2024-07-24 05:53:54','dangngocthanh0133','dangngocthanh0133','CHUANBIDATHANG',NULL,'HD576',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Online',NULL,NULL);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonchitiet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `gia` double DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `thanhtien` double DEFAULT NULL,
  `idbienthe` bigint DEFAULT NULL,
  `idhoadon` bigint DEFAULT NULL,
  `idkhuyenmai` bigint DEFAULT NULL,
  `sotiengiam` double DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  `tenbienthe` varchar(400) DEFAULT NULL,
  `anhbienthe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8g5acmm1r0ha2hua47ul4rdia` (`idbienthe`),
  KEY `FK72nghe3o7s1prylbbnvfwub2k` (`idhoadon`),
  KEY `FKhv6nwlu151jpu9ikpe9fonvi6` (`idkhuyenmai`),
  KEY `FK560jg2blrioyu3qvoh6uunkk0` (`idsanpham`),
  CONSTRAINT `FK560jg2blrioyu3qvoh6uunkk0` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  CONSTRAINT `FK72nghe3o7s1prylbbnvfwub2k` FOREIGN KEY (`idhoadon`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `FK8g5acmm1r0ha2hua47ul4rdia` FOREIGN KEY (`idbienthe`) REFERENCES `bienthe` (`id`),
  CONSTRAINT `FKhv6nwlu151jpu9ikpe9fonvi6` FOREIGN KEY (`idkhuyenmai`) REFERENCES `khuyenmai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES (600,NULL,'2024-01-16 05:22:54',NULL,'nguyenthikhanhlinh1711',NULL,150000,1,150000,1322,557,NULL,0,81,'XXL,Trắng','4jSVQ1.jpg'),(601,NULL,'2024-01-16 05:27:07',NULL,'admin9193','ACTIVE',150000,1,150000,1322,558,NULL,NULL,81,'XXL,Trắng',NULL),(602,NULL,'2024-01-16 05:27:43',NULL,'admin9193','ACTIVE',160000,1,160000,1315,558,NULL,NULL,81,'X,Đen',NULL),(603,NULL,'2024-01-16 05:31:02',NULL,'nguyenthikhanhlinh1711',NULL,150000,2,300000,1319,559,NULL,0,81,'XL,Đen','4jSVQ1.jpg'),(605,NULL,'2024-01-16 05:40:09',NULL,'nguyenthikhanhlinh1711',NULL,170000,2,340000,1322,561,NULL,0,81,'XXL,Trắng','4jSVQ1.jpg'),(606,NULL,'2024-01-16 05:57:02',NULL,'nguyenthikhanhlinh1711',NULL,279000,3,792000,NULL,562,41,45000,7,'Be,M','SjTivi.jpg'),(607,NULL,'2024-01-16 06:05:14',NULL,'dinhtuananh0183',NULL,355000,2,680000,63,563,41,30000,10,'Đen,L','ycg5P2.jpg'),(608,NULL,'2024-01-16 06:12:50',NULL,'dinhtuananh0183',NULL,160000,1,160000,1315,564,NULL,0,81,'X,Đen','4jSVQ1.jpg'),(609,NULL,'2024-01-16 06:13:04',NULL,'dinhtuananh0183',NULL,120000,3,360000,1339,565,NULL,0,73,'M,Đen,Xuông,Dây chuyền','yFMqyQ.jpg'),(610,NULL,'2024-01-16 06:13:19',NULL,'dinhtuananh0183',NULL,150000,1,150000,1320,566,NULL,0,81,'XL,Trắng','4jSVQ1.jpg'),(611,NULL,'2024-01-16 06:23:55',NULL,'nguyenthikhanhlinh1711',NULL,150000,2,300000,1321,567,NULL,0,81,'XXL,Đen','4jSVQ1.jpg'),(612,NULL,'2024-01-16 06:48:34',NULL,'dangngocthanh0133',NULL,355000,2,680000,63,568,41,30000,10,'Đen,L','ycg5P2.jpg'),(620,NULL,'2024-07-24 05:53:54',NULL,'dangngocthanh0133',NULL,150000,3,NULL,1320,576,NULL,NULL,81,'XL,Trắng','4jSVQ1.jpg');
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `email` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL,
  `ma` varchar(255) NOT NULL,
  `matkhau` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `ngaysinh` timestamp NULL DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `expiretime` datetime DEFAULT NULL,
  `resttoken` varchar(255) DEFAULT NULL,
  `loai` varchar(255) DEFAULT NULL,
  `sodonhuytrongngay` int DEFAULT NULL,
  `solanhuydon` int DEFAULT NULL,
  `songaybiban` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jb5oqkftwr5hwaxh2exlh14xn` (`ma`),
  UNIQUE KEY `UK_h52m162a489iuk0ffo82aa16w` (`sodienthoai`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,NULL,'2023-11-19 16:57:34',NULL,'nguyenvana@gmail.com','ACTIVE','dangngocthanh@gmail.com','Nam','dangngocthanh0133','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,'2003-11-19 16:57:25','0372092723','Đặng Ngọc Thanh',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2023-12-16 16:01:30','2023-11-19 16:59:26','dinhanhtuan0812','dinhanhtuan0812','ACTIVE','dinhanhtuan@gmail.com','Nam','dinhanhtuan0812','$2a$10$nGSToRTIXfyL3lz0aG02mO0kQFMwxOVVMJlY4KJFb/F64.r7irDYW','','2003-12-08 00:00:00','0384082003','Đinh Anh Tuấn',NULL,NULL,NULL,NULL,NULL,NULL),(3,'2024-01-15 08:05:16','2023-11-19 17:01:05','nguyenthikhanhlinh1711','nguyenvana@gmail.com','ACTIVE','nguyenthikhanhlinh@gmail.com','Nữ','nguyenthikhanhlinh1711','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','','2003-11-20 00:00:00','0979386056','Nguyễn Thị Khánh Linh',NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'2023-11-19 17:01:13',NULL,'doquochuy8173','ACTIVE','doquochuy@gmail.com','Nam','doquochuy8173','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,'2003-11-19 17:01:26','0193838838','Đỗ Quốc Huy',NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'2023-11-19 17:02:12',NULL,'admin9193','ACTIVE','dinhtuananh@gmail.com','Nam','dinhtuananh0183','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,'2023-11-19 17:02:36','0381992939','Đinh Tuấn Anh',NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'2023-12-09 09:16:55',NULL,'anonymous','ACTIVE','huydo@gmail.com',NULL,'huydq8493','$2a$10$55iif1j6/xl5UuJjMPtpOOwoFH4glzlBmpxpiiTnMpY6SIEbcNaxC',NULL,NULL,'0389979874','huydq',NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'2023-12-09 09:27:35',NULL,'anonymous','ACTIVE','nhatminh@gmail.com',NULL,'nhatminh5731','$2a$10$mrYZeWuOsXAC3d4BkkWsR.s.4hmIib4GR.ZD.ZZrjW7HC7oUI0ghG',NULL,NULL,'0912876321','Nhật Minh',NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'2023-12-18 18:13:30',NULL,'anonymous','ACTIVE','viethoang@gmail.com',NULL,'viethoang8541','$2a$10$cEoUvYhmOptyiGDsEDnImOTr04B894tKmovgZdiwRi9.51aah4Kv2',NULL,NULL,'0987876542','Việt Hoàng',NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,'2023-12-19 09:01:13',NULL,'admin9193','ACTIVE','nguyenvv3@fpt.edu.vn',NULL,'nguyen6602','$2a$10$2qGhBk8v7Mn95Npu9ownouc7BQsiqKEyyl/RGI4qncV9Js0bKjdS.',NULL,NULL,'0345123481','Nguyên',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhangyeuthichsanpham`
--

DROP TABLE IF EXISTS `khachhangyeuthichsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhangyeuthichsanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `idkhachhang` bigint DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6xou0vpao86hx3cx1we1vbw53` (`idkhachhang`),
  KEY `FK46gya4ljueanopgjyga4bccna` (`idsanpham`),
  CONSTRAINT `FK46gya4ljueanopgjyga4bccna` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  CONSTRAINT `FK6xou0vpao86hx3cx1we1vbw53` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhangyeuthichsanpham`
--

LOCK TABLES `khachhangyeuthichsanpham` WRITE;
/*!40000 ALTER TABLE `khachhangyeuthichsanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhangyeuthichsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyenmai` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `giatri` varchar(255) DEFAULT NULL,
  `loai` varchar(255) DEFAULT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `mota` text,
  `ngaybatdau` timestamp NULL DEFAULT NULL,
  `ngayketthuc` timestamp NULL DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `tong` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qccppo5y398aj6n58grn9syop` (`ma`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyenmai`
--

LOCK TABLES `khuyenmai` WRITE;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
INSERT INTO `khuyenmai` VALUES (37,'2024-01-15 19:27:32','2024-01-15 13:58:29','dinhanhtuan0812','admin9193','EXPIRED','15.0','1','KOCS463','','2024-01-15 13:54:00','2024-01-29 13:57:00',0,'Noel 2023',12),(38,'2024-01-15 14:11:21','2024-01-15 14:01:04','doquochuy8173','admin9193','EXPIRED','20000.0','0','KOCS355','','2024-01-15 13:59:00','2024-01-24 13:59:00',0,'Valentine',1),(39,'2024-05-20 13:54:35','2024-01-15 14:04:29','anonymous','admin9193','EXPIRED','30.0','1','KOCS132','','2024-02-01 14:02:00','2024-02-14 14:03:00',2,'Black Firday',2),(40,'2024-05-20 13:54:35','2024-01-15 14:06:18','anonymous','admin9193','EXPIRED','10.0','1','KOCS554','','2024-01-16 14:05:00','2024-01-23 14:05:00',5,'Flash Sale 24h',5),(41,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED','15000.0','0','KOCS725','','2024-01-16 05:33:00','2024-01-17 05:33:00',48,'Noel',55);
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyenmaisanpham`
--

DROP TABLE IF EXISTS `khuyenmaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyenmaisanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `idbienthe` bigint DEFAULT NULL,
  `idkhuyenmai` bigint DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK71454sf3u6twd66e64ynbw3eh` (`idbienthe`),
  KEY `FK72ak37yxbdjl3b4ixb47kt2m` (`idkhuyenmai`),
  KEY `FK33tkasuvvky1oe63bc5097od4` (`idsanpham`),
  CONSTRAINT `FK33tkasuvvky1oe63bc5097od4` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  CONSTRAINT `FK71454sf3u6twd66e64ynbw3eh` FOREIGN KEY (`idbienthe`) REFERENCES `bienthe` (`id`),
  CONSTRAINT `FK72ak37yxbdjl3b4ixb47kt2m` FOREIGN KEY (`idkhuyenmai`) REFERENCES `khuyenmai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyenmaisanpham`
--

LOCK TABLES `khuyenmaisanpham` WRITE;
/*!40000 ALTER TABLE `khuyenmaisanpham` DISABLE KEYS */;
INSERT INTO `khuyenmaisanpham` VALUES (81,'2024-01-15 14:11:21','2024-01-15 14:01:04','doquochuy8173','admin9193','EXPIRED',NULL,38,80),(82,'2024-01-15 14:11:21','2024-01-15 14:01:04','doquochuy8173','admin9193','EXPIRED',NULL,38,79),(83,'2024-01-15 14:11:21','2024-01-15 14:01:04','doquochuy8173','admin9193','EXPIRED',NULL,38,34),(84,'2024-05-20 13:54:35','2024-01-15 14:04:29','anonymous','admin9193','EXPIRED',NULL,39,82),(85,'2024-05-20 13:54:35','2024-01-15 14:04:29','anonymous','admin9193','EXPIRED',NULL,39,8),(86,'2024-05-20 13:54:35','2024-01-15 14:06:18','anonymous','admin9193','EXPIRED',NULL,40,47),(87,'2024-05-20 13:54:35','2024-01-15 14:06:18','anonymous','admin9193','EXPIRED',NULL,40,3),(88,'2024-05-20 13:54:35','2024-01-15 14:06:18','anonymous','admin9193','EXPIRED',NULL,40,2),(89,'2024-01-15 19:27:32','2024-01-15 17:39:18','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,83),(90,'2024-01-15 19:27:32','2024-01-15 17:39:18','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,76),(91,'2024-01-15 19:27:32','2024-01-15 17:39:18','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,77),(92,'2024-01-15 19:27:32','2024-01-15 17:39:18','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,59),(93,'2024-01-15 19:27:32','2024-01-15 17:39:19','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,18),(94,'2024-01-15 19:27:32','2024-01-15 17:39:19','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,14),(95,'2024-01-15 19:27:32','2024-01-15 17:39:19','dinhanhtuan0812','admin9193','EXPIRED',NULL,37,12),(96,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED',NULL,41,1),(97,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED',NULL,41,4),(98,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED',NULL,41,7),(99,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED',NULL,41,9),(100,'2024-05-20 13:54:34','2024-01-16 05:33:52','anonymous','admin9193','EXPIRED',NULL,41,10);
/*!40000 ALTER TABLE `khuyenmaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichsutichdiem`
--

DROP TABLE IF EXISTS `lichsutichdiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichsutichdiem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `sodiemdung` int DEFAULT NULL,
  `sodiemtichduoc` int DEFAULT NULL,
  `idhoadon` bigint DEFAULT NULL,
  `idtichdiem` bigint DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  `sodiemhoan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKobdibrqqyn0p33ymjekbpbd1q` (`idhoadon`),
  KEY `FKo20v7m85j3ybwep3vv1lop3ik` (`idtichdiem`),
  KEY `FKrabwvgudhyvmny1diurrq8lo` (`idkhachhang`),
  CONSTRAINT `FKo20v7m85j3ybwep3vv1lop3ik` FOREIGN KEY (`idtichdiem`) REFERENCES `tichdiem` (`id`),
  CONSTRAINT `FKobdibrqqyn0p33ymjekbpbd1q` FOREIGN KEY (`idhoadon`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `FKrabwvgudhyvmny1diurrq8lo` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichsutichdiem`
--

LOCK TABLES `lichsutichdiem` WRITE;
/*!40000 ALTER TABLE `lichsutichdiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lichsutichdiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lydohuydon`
--

DROP TABLE IF EXISTS `lydohuydon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lydohuydon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `lydo` text,
  `mota` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lydohuydon`
--

LOCK TABLES `lydohuydon` WRITE;
/*!40000 ALTER TABLE `lydohuydon` DISABLE KEYS */;
INSERT INTO `lydohuydon` VALUES (60,NULL,'2024-01-15 14:21:38',NULL,'admin9193','ACTIVE','Tuột chỉ',NULL);
/*!40000 ALTER TABLE `lydohuydon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `anh` varchar(255) DEFAULT NULL,
  `cancuoccongdan` char(12) DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiretime` datetime DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL,
  `ma` varchar(255) NOT NULL,
  `matkhau` varchar(255) DEFAULT NULL,
  `ngaycap` timestamp NULL DEFAULT NULL,
  `ngaysinh` timestamp NULL DEFAULT NULL,
  `resttoken` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `idchucvu` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_skmbpcqtb6f3jgdqwqoopfsla` (`ma`),
  UNIQUE KEY `UK_23oxfttcyumkes0bfnli2cgme` (`sodienthoai`),
  KEY `FKdnln0piv4a38v23mqcbqmnii8` (`idchucvu`),
  CONSTRAINT `FKdnln0piv4a38v23mqcbqmnii8` FOREIGN KEY (`idchucvu`) REFERENCES `chucvu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'2023-12-16 16:08:08','2023-11-19 16:54:23','nguyenvana0183','admin9193','ACTIVE','KyqcTH.jpg','019383883131','Nam Từ Liêm, Hà Nội','nguyenvana@mail.com',NULL,'Nam','nguyenvana0183','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','2023-11-20 16:37:53','2003-11-20 16:38:10',NULL,'0198338312','Nguyễn Văn A',2),(2,'2023-12-13 14:16:00','2023-11-19 16:54:26','admin9193','admin9193','ACTIVE','KyqcTH.jpg','028484881331','Nam Từ Liêm, Hà Nội','admin@gmail.com',NULL,'Nam','admin9193','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','2023-11-19 16:56:13','1999-10-10 17:00:00',NULL,'0123456789','ADMIN',1),(3,NULL,'2023-11-20 16:12:45',NULL,'admin9193','ACTIVE','KyqcTH.jpg','029388313413','Bắc Từ Liêm, Hà Nội','nguyenvanb@gmail.com',NULL,'Nam','nguyenvanb9213','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','2023-11-20 16:12:21','2003-11-20 16:12:24',NULL,'0987654321','Nguyễn Văn B',2),(5,NULL,'2023-12-13 15:50:54',NULL,'admin9193','ACTIVE','XqBAdC.jpg','034203006527','Kiều Mai, Bắc Từ Liêm','dangngocthanh720@gmail.com',NULL,'Nam','dangngocthanh0386',NULL,'2023-12-06 00:00:00','2023-12-06 00:00:00',NULL,'0372012912','Đặng Ngọc Thanh',2),(6,'2023-12-17 12:25:11','2023-12-17 12:25:11','admin9193','admin9193','ACTIVE','XqBAdC.jpg','034291291241','Hòa Bình','khanhlinh@gmail.com',NULL,'Nữ','khanhlinh9959','$2a$10$nsl/5zwayirQDxxnwIX3jOUyUaFZ/b49CSYvnCuz4B3FOI3T/d8IO','2023-12-06 00:00:00','2023-11-26 00:00:00',NULL,'0921512582','Khánh Linh',2);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quydoidiem`
--

DROP TABLE IF EXISTS `quydoidiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quydoidiem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `diem` int DEFAULT NULL,
  `loai` varchar(255) DEFAULT NULL,
  `tien` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quydoidiem`
--

LOCK TABLES `quydoidiem` WRITE;
/*!40000 ALTER TABLE `quydoidiem` DISABLE KEYS */;
INSERT INTO `quydoidiem` VALUES (1,NULL,'2023-11-28 15:53:27',NULL,'admin9193','ACTIVE',1,'TIENQUYDIEM',100000),(2,'2023-12-16 14:41:28','2023-11-28 15:53:28','admin9193','admin9193','ACTIVE',1,'DIEMQUYTIEN',1000);
/*!40000 ALTER TABLE `quydoidiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nguoitao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  `gia` double DEFAULT NULL,
  `mota` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sanphammoi` int DEFAULT NULL,
  `sanphamnhieuluotxem` int DEFAULT NULL,
  `sanphamnoibat` int DEFAULT NULL,
  `sanphamphobien` int DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thongtinchitiet` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `iddanhmuc` bigint DEFAULT NULL,
  `idthuonghieu` bigint DEFAULT NULL,
  `sanphambanchay` int DEFAULT NULL,
  `experied_is_popular` datetime DEFAULT NULL,
  `experied_isnew` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mucuvhos7dm6xtbpt6l03201w` (`slug`),
  KEY `FKsus861gvf6ywadlvg0s2o3003` (`iddanhmuc`),
  KEY `FKsy6e9nghw4psfd0tt2vy232rb` (`idthuonghieu`),
  CONSTRAINT `FKsus861gvf6ywadlvg0s2o3003` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`id`),
  CONSTRAINT `FKsy6e9nghw4psfd0tt2vy232rb` FOREIGN KEY (`idthuonghieu`) REFERENCES `thuonghieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'2024-01-15 13:34:39','2023-11-22 16:26:00','admin9193','admin9193','INACTIVE',128000,'',0,NULL,NULL,NULL,'ao-polo-nam-big-size-3xl-90kg-marc-coun-phoi-mau-tre-trung-cotton-lanh-thoang-mat',NULL,'Áo polo nam big size 3xl 90kg Marc Coun phối màu trẻ trung - cotton lạnh thoáng mát','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n',3,1,NULL,NULL,NULL),(2,'2024-01-14 18:11:36','2023-11-22 16:30:53','admin9193','admin9193','ACTIVE',198000,'<p>- SHOP CHỈ NHẬN TIỀN KHI KHÁCH HÀNG HÀI LÒNG, NHẬN HÀNG KHÔNG ƯNG KHÔNG VỪA NHẮN TIN CHO SHOP ĐỂ ĐƯỢC PHỤC VỤ, XIN CẢM ƠN QUÝ KHÁCH</p>\n\n<p>TÙY ĐỘ SÁNG TỐI MÀU SẮC CỦA TỪNG DÒNG ĐIỆN THOẠI KHÁC NHAU SẼ CHO LÊN MÀU ĐẬM NHẠT CHÊNH LỆCH % KHÁC NHAU MONG QUÝ KHÁCH THÔNG CẢM</p>\n\n<p>- QUÝ KHÁCH LƯU Ý CHỌN SIZE ĐÚNG THEO THÔNG TIN SẢN PHẨM VÀ PHÂN LOẠI CẦN ĐẶT</p>\n\n<p>Dễ mua dễ mặc nhanh tay chọn ngay cho mình 1 size phù hợp</p>\n\n<p>Size M 44-54kg</p>\n\n<p>Size L khoản 55-63kg</p>\n\n<p>Size XL khoản 63_69kg</p>\n\n<p>Size XXL khoản 70-76kg</p>\n\n<p>- Tùy thể trạng và sở thích mặc ôm body hay rộng thoải mái chọn tăng giảm size</p>\n\n<p>- BÊN SHOP CÒN RẤT NHIỀU MẪU ĐẸP GIÁ RẺ QUÝ KHÁCH VÀO GIAN HÀNG ĐỂ XEM NHIỀU HƠN</p>\n',NULL,NULL,NULL,NULL,'ao-thun-nam-polo-thiet-ke-vai-ca-sau-cotton-cao-cap-ngan-tay',NULL,'Áo POLO nam thiết kế vải cá sấu cotton cao cấp ngắn tay','<p>Áo thun nam ngắn tay cổ bẻ phong cách Hàn Quốc</p>\n\n<p>Thiết kế đơn giãn thanh lịch trẻ đẹp phù hợp mọi lứa tuổi</p>\n\n<p>Trang phục cơ bản không thể thiếu của phái mạnh</p>\n\n<p>Chất thun dày mịn thoáng mát co dãn 4 chiều.</p>\n\n<p>Hàng may kỹ chắc chắn ( đường bảo hành đường may trong suốt thời gian mặc )</p>\n\n<p>Hỗ trợ đổi size khi mặc chật hoặc đổi mẫu khác khi không hợp ( tham khảo bảng chọn size )</p>\n\n<p>Sản phẩm đáng tiền không thể bỏ lỡ</p>\n',3,7,NULL,NULL,NULL),(3,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE',78000,'<p>ÁO THUN POLO</p>\n\n<p>Áo thun Cotton 100% co dãn 4 chiều</p>\n\n<p>&nbsp;</p>\n\n<p>Size sz M L XL XXL</p>\n\n<p>S: 42-50Kg</p>\n\n<p>Size M 51-56kg</p>\n\n<p>Size L 57-63kg</p>\n\n<p>Size XL 64-70kg</p>\n\n<p>Size XXL 71-80kg</p>\n\n<p>Tuỳ chiều cao nhích size cho phù hợp giúp em nha. Bảng cân nặng chỉ là tương đối ạ</p>\n\n<p>&nbsp;</p>\n\n<p>=========================================</p>\n\n<p>CAM KẾT - ĐẢM BẢO:</p>\n\n<p>- Đảm bảo vải chuẩn cotton chất lượng cao.</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn đặt hàng .</p>\n\n<p>- Hoàn tiền 100% nếu sản phẩm lỗi, nhầm hoặc không giống với mô tả.</p>\n\n<p>- Chấp nhận đổi hàng khi size không vừa (vui lòng nhắn tin riêng cho shop).</p>\n\n<p>- Giao hàng toàn quốc, thanh toán khi nhận hàng.</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee.</p>\n\n<p>&nbsp;</p>\n\n<p>ĐIỀU KIỆN ĐỔI TRẢ:</p>\n\n<p>- Hỗ trợ trong vòng 03 ngày từ khi nhận hàng.</p>\n\n<p>- Hàng hoá vẫn còn mới nguyên tem mác, chưa qua sử dụng.</p>\n\n<p>- Hàng hoá bị lỗi hoặc hư hỏng do vận chuyển hoặc do nhà sản xuất.</p>\n\n<p>&nbsp;</p>\n\n<p>LƯU Ý: Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá mà hãy chat liên hệ Shop để đc hỗ trợ 1 cách tốt nhất nhé.</p>\n\n<p>#aothun #aopolonam #polo #polonam #aocotron #aothunnam #aothuncotron #aocotton #aothundep #aophong #aophongnam #aophongcotron #aophongtayngan #aothuntayngan #aothunbody</p>\n',0,1,1,1,'ao-polo-nam-ao-thun-polo-nam-phoi-mau-co-ao-6-mau-tre-trung-thanh-lich',2019,'Áo Polo nam Áo thun polo nam phối màu cổ áo 6 màu trẻ trung thanh lịch','<p>Áo Thun Unisex Local Brand Lourents Signature Tee - TEE1 Đen</p>\n\n<p>BẢNG SIZE LOURENTS</p>\n\n<p>&nbsp;</p>\n\n<p>M : Dài 69 Rộng 53 | 1m50 - 1m63, 45 - 58Kg</p>\n\n<p>L : Dài 73 Rộng 56 | 1m60 - 1m73, 50 - 65Kg</p>\n\n<p>XL: Dài : 77 Rộng: 59 | 1m74 - 1m8, 65Kg - 80Kg</p>\n\n<p>Form áo được thiết kế theo tiêu chuẩn tương đối của người Việt Nam. Form oversize nên không cần nhảy size lớn hơn -</p>\n\n<p>Nếu bạn phân vân hãy inbox để được Lourents tư vấn kỹ hơn nhé!</p>\n',3,4,NULL,NULL,NULL),(4,'2024-01-16 06:40:23','2023-11-22 18:33:37','dangngocthanh0133','admin9193','ACTIVE',79000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',0,NULL,NULL,NULL,'ao-polo-basic-de-phoi-do-chat-thoang-mat-nam-nu-deu-mac-dep',NULL,'Áo Polo Basic Dễ Phối Đồ, Chất Thoáng Mát, Nam nữ đều mặc đẹp','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n',3,2,NULL,NULL,NULL),(5,NULL,'2023-11-27 02:21:58',NULL,'admin9193','ACTIVE',160000,'<p>Xuất xứ</p>\n\n<p>Việt Nam</p>\n',0,NULL,NULL,NULL,'ao-phong-local-brand-nam-nu-unisex-tay-lo-thun-form-rong-teen-co-tron-oversize-cotton-mau-den-trang-tee-cloudzy-crayon',1000,'Áo phông local brand nam nữ unisex tay lỡ thun form rộng teen cổ tròn oversize cotton màu đen trắng tee CLOUDZY CRAYON','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n',1,2,NULL,NULL,NULL),(7,'2024-01-16 06:47:43','2023-11-27 02:39:52','dangngocthanh0133','admin9193','ACTIVE',279000,'<p>Chiều dài tay áo</p>\n\n<p>Dài tay</p>\n\n<p>Mùa</p>\n\n<p>Mùa đông</p>\n\n<p>Chất liệu</p>\n\n<p>Cotton, Nỉ</p>\n\n<p>Mẫu</p>\n\n<p>In</p>\n',0,NULL,NULL,NULL,'ao-hoodie-nam-nu-local-brand-unisex-cap-doi-ni-ngoai-cotton-form-rong-co-mu-xam-den-day-oversize-cloudzy-hd-paint',NULL,'Áo hoodie nam nữ local brand unisex cặp đôi nỉ ngoại cotton form rộng có mũ xám đen dày oversize CLOUDZY HD PAINT','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n',4,1,NULL,NULL,NULL),(8,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE',259000,'<p>Rất lớn</p>\n\n<p>Có</p>\n\n<p>Xuất xứ</p>\n\n<p>Việt Nam</p>\n\n<p>Chiều dài tay áo</p>\n\n<p>Dài tay</p>\n\n<p>Chất liệu</p>\n\n<p>Cotton, Nỉ</p>\n\n<p>Mẫu</p>\n\n<p>In</p>\n\n<p>Tên tổ chức chịu trách nhiệm sản xuất</p>\n\n<p>Pandax</p>\n',0,NULL,1,NULL,'hoodie-nam-nu-local-brand-pandax-ai-cap-ao-khoac-ni-form-rong-unisex-chat-ni-chan-cua-tay-bong-oversize',1000,'Hoodie nam nữ local brand PANDAX Ai Cập , áo khoác nỉ form rộng unisex , chất nỉ chân cua tay bồng oversize','<p>Phong cách</p>\n\n<p>Cơ bản, Boho, Hàn Quốc, Retro, Đường phố</p>\n\n<p>Tall Fit</p>\n\n<p>Không</p>\n',4,8,NULL,NULL,NULL),(9,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE',345000,'<p>Chất liệu</p>\n\n<p>Nylon</p>\n\n<p>Chiều dài tay áo</p>\n\n<p>Khác</p>\n\n<p>Mẫu</p>\n\n<p>Trơn</p>\n\n<p>Phong cách</p>\n\n<p>Đường phố</p>\n\n<p>Tall Fit</p>\n\n<p>Có</p>\n\n<p>Rất lớn</p>\n\n<p>Có</p>\n\n<p>Xuất xứ</p>\n\n<p>Việt Nam</p>\n\n<p>Chiều dài áo khoác ngoài</p>\n\n<p>Dài</p>\n\n<p>Kiểu Áo khoác</p>\n\n<p>Áo gió</p>\n\n<p>Kiểu nút</p>\n\n<p>Dây kéo</p>\n',0,NULL,1,NULL,'ao-khoac-du-local-brand-big-size-nam-pandax-polime-anti-racing-chinh-hang-co-cao-day-dan-phan-quang-form-rong-unisex',1000,'Áo khoác dù local brand big size nam Pandax polime anti racing chính hãng cổ cao dày dặn phản quang form rộng unisex','<p>Áo khoác dù local brand big size nam Pandax polime anti racing chính hãng cổ cao dày dặn phản quang form rộng unisex</p>\n',5,2,NULL,NULL,NULL),(10,'2024-01-16 06:04:41','2023-11-27 02:48:58','dinhtuananh0183','admin9193','ACTIVE',345000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',0,NULL,NULL,NULL,'ao-khoac-du-racing-pandax-polime-jacket-nam-nu-windbreaker-local-brand-unisex-ao-gio-form-rong-chong-nang-khong-mu',NULL,'Áo khoác dù racing Pandax polime , jacket nam nữ , windbreaker local brand unisex , áo gió form rộng chống nắng không mũ','<p>Áo Thun Unisex Local Brand Lourents Signature Tee - TEE1 Đen</p>\n\n<p>BẢNG SIZE LOURENTS</p>\n\n<p>&nbsp;</p>\n\n<p>M : Dài 69 Rộng 53 | 1m50 - 1m63, 45 - 58Kg</p>\n\n<p>L : Dài 73 Rộng 56 | 1m60 - 1m73, 50 - 65Kg</p>\n\n<p>XL: Dài : 77 Rộng: 59 | 1m74 - 1m8, 65Kg - 80Kg</p>\n\n<p>Form áo được thiết kế theo tiêu chuẩn tương đối của người Việt Nam. Form oversize nên không cần nhảy size lớn hơn -</p>\n\n<p>Nếu bạn phân vân hãy inbox để được Lourents tư vấn kỹ hơn nhé!</p>\n',5,2,NULL,NULL,NULL),(11,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE',155000,'<p>✈ Form rộng Unisex cho cả nam và nữ</p>\n\n<p>Áo khoác dù; Áo khoác gió unisex</p>\n\n<p>? Hình Shop tự chụp, hàng được lựa chọn kỹ, đảm bảo mặc lên form đẹp như ảnh</p>\n\n<p>? Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát .</p>\n\n<p>Áo khoác dù Unisex chống tia UV cực tốt.</p>\n',NULL,1,1,NULL,'ao-khoac-gio-nam-nu-2-lop-ao-khoac-du-chat-lieu-vai-gio-cao-cap-khang-nuoc-full-tem-tag-phu-kien',1000,'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện','<p>Áo khoác dù, áo khoác gió Unisex - CHẤT DÙ SIÊU ĐẸP - 2 LỚP CHỐNG MƯA NẮNG ĐƯỢC HẾT</p>\n\n<p>? Size: M, L, XL, XXL ( 40-85kg )</p>\n\n<p>? Bảng SIZE: (Mang tính chất THAM KHẢO, các bạn có thể nhắn tin cho shop để được tư vấn size sau 1s nha)</p>\n\n<p>-Size M: 40 - 55kg, Cao dưới 1m60</p>\n\n<p>-Size L: từ 56 - 65kg , Cao 1m61 - 1m70</p>\n\n<p>-Size XL: từ 66 - 75 kg, Cao : 1m62 - 1m85</p>\n\n<p>-Size XXL: từ 76- 85 kg, Cao : 1m62 - 1m85</p>\n',5,7,NULL,NULL,NULL),(12,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE',169000,'<p>Đóng gói sản phẩm Lavi Studio/ Shark FULL BOX bao gồm: hộp, kèm giấy gói, card thankyou , giấy thơm, lavi shipping bag</p>\n\n<p>*Các ngày sale chúng mình xin phép gửi túi zip để gửi sản phẩm đến tay khách hàng sớm nhất ạ</p>\n',0,NULL,NULL,NULL,'ao-thun-local-brand-lavi-studio-shark',1000,'Áo thun Local Brand Lavi Studio/ Shark','<p>Đóng gói sản phẩm Lavi Studio/ Shark FULL BOX bao gồm: hộp, kèm giấy gói, card thankyou , giấy thơm, lavi shipping bag</p>\n\n<p>*Các ngày sale chúng mình xin phép gửi túi zip để gửi sản phẩm đến tay khách hàng sớm nhất ạ</p>\n',1,2,NULL,NULL,NULL),(14,'2024-01-15 18:06:09','2023-11-27 03:00:35','nguyenthikhanhlinh1711','admin9193','ACTIVE',179000,'<p>1. Điều kiện đổi trả</p>\n\n<p>- Mọi sản phẩm được đổi trả trong vòng 7 ngày kể từ ngày khách hàng nhận được bưu phẩm</p>\n\n<p>- Tình trạng sản phẩm: Sản phẩm đổi trả phải còn nguyên nhãn mác, chưa qua sử dụng và không có dấu hiệu của tác nhân bên ngoài.</p>\n\n<p>- Nếu sản phẩm đã bị cắt tag hãy vui lòng liên hệ lại với Lourents trong vòng 1 ngày để được giải quyết. Nếu sau 1 ngày Lourents có quyền không giải quyết đổi trả đơn hàng.</p>\n\n<p>- Trường hợp hoàn lại giá trị đơn hàng, Lourents sẽ hoàn tiền trong vòng 48h làm việc kể từ khi có yêu cầu hoàn trả.</p>\n',0,NULL,NULL,NULL,'ao-thun-unisex-local-brand-lourents-signature-tee-tee1',NULL,'Áo Thun Unisex Local Brand Lourents Signature Tee - TEE1','<p>Áo Thun Unisex Local Brand Lourents Signature Tee - TEE1 Đen</p>\n\n<p>BẢNG SIZE LOURENTS</p>\n\n<p>&nbsp;</p>\n\n<p>M : Dài 69 Rộng 53 | 1m50 - 1m63, 45 - 58Kg</p>\n\n<p>L : Dài 73 Rộng 56 | 1m60 - 1m73, 50 - 65Kg</p>\n\n<p>XL: Dài : 77 Rộng: 59 | 1m74 - 1m8, 65Kg - 80Kg</p>\n\n<p>Form áo được thiết kế theo tiêu chuẩn tương đối của người Việt Nam. Form oversize nên không cần nhảy size lớn hơn -</p>\n\n<p>Nếu bạn phân vân hãy inbox để được Lourents tư vấn kỹ hơn nhé!</p>\n',1,2,NULL,NULL,NULL),(18,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE',178000,'<p>----------------------------------------------------------</p>\n\n<p>MÔ TẢ CHI TIẾT SẢN PHẨM - ÁO THUN FORM RỘNG LOCAL BRAND ONTOP RIPPLE TEE:</p>\n\n<p>- Chất liệu: Áo thun form rộng Ripple Tee được&nbsp;sử dụng chất liệu thun cotton thoáng mát, mềm mại.</p>\n\n<p>- Kiểu dáng: Áo có kiểu dáng rộng rãi, nam nữ đều mang được</p>\n\n<p>- Tiện lợi: Thiết kế đơn giản dễ mang, dễ phối.</p>\n\n<p>- Màu sắc: Màu sắc đơn giản, tính ứng dụng cao …</p>\n\n<p>- Hình in artwork vệt sáng độc đáo tạo điểm nhấn</p>\n\n<p>----------------------------------------------------------</p>\n',NULL,NULL,NULL,NULL,'ao-thun-local-brand-nam-nu-mau-den-ripple-ontop-i-o21-t8',1000,'Áo thun local brand nam nữ màu đen Ripple ONTOP I O21-T8','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n',1,1,NULL,NULL,NULL),(19,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE',149000,'<p>Chất liệu</p>\n\n<p>Cotton</p>\n\n<p>Mẫu</p>\n\n<p>In</p>\n\n<p>Mùa</p>\n\n<p>Mùa hè</p>\n\n<p>Tên tổ chức chịu trách nhiệm sản xuất</p>\n\n<p>Công ty CLOUDZY</p>\n\n<p>Địa chỉ tổ chức chịu trách nhiệm sản xuất</p>\n\n<p>P. Đông Hưng Thuận, Q.12</p>\n\n<p>Gửi từ</p>\n\n<p>TP. Hồ Chí Minh</p>\n',0,NULL,1,NULL,'ao-thun-nu-nam-unisex-tay-lo-phong-local-brand-form-rong-teen-co-tron-oversize-cotton-mau-den-trang-tee-cloudzy-control',1000,'Áo thun nữ nam unisex tay lỡ phông local brand form rộng teen cổ tròn oversize cotton màu đen trắng tee CLOUDZY CONTROL','<p>Phong cách</p>\n\n<p>Thể thao, Cơ bản, Hàn Quốc, Đường phố, Nhiệt đới</p>\n\n<p>Tall Fit</p>\n\n<p>Có</p>\n\n<p>Chiều dài áo</p>\n\n<p>Dài</p>\n\n<p>Xuất xứ</p>\n\n<p>Việt Nam</p>\n\n<p>Chiều dài tay áo</p>\n\n<p>Dài 3/4</p>\n\n<p>Dáng kiểu áo</p>\n\n<p>Oversized</p>\n\n<p>Cổ áo</p>\n\n<p>Cổ tròn</p>\n',1,8,NULL,NULL,NULL),(22,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE',90000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',0,NULL,NULL,NULL,'ao-so-mi-nam-basic-chat-kaki-cao-cap-cuc-dep',1000,'Áo sơ mi nam Basic chất kaki cao cấp cực đẹp','<p>⭐Bảng size bên shop các bạn tham khảo ạ:</p>\n\n<p>Size M: Dành cho người nặng từ 42kg - 53kg &lt; 1m63</p>\n\n<p>Size L : Dành cho người nặng từ 54kg - 60kg &lt; 1m70</p>\n\n<p>Size XL: Dành cho người nặng từ 61kg - 69kg&lt;1m75</p>\n\n<p>Size XXL: Dành cho người nặng từ 70kg - 76kg&lt;1m80</p>\n\n<p>Size 3XL: Dành cho người nặng từ 77kg - 85kg &lt;1m85</p>\n\n<p>? Bảng size mang tính chất tham khảo bạn có thể lấy size to hơn hoặc nhỏ theo yêu cầu của bạn!</p>\n',2,8,NULL,NULL,NULL),(23,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE',129000,'<p>Áo Sweater Nam Form Rộng Phối Layer Chất Nỉ Unisex Thời Trang Trẻ Trung VESCA M10</p>\n\n<p>- Sản phẩm được thiết kế theo đúng form chuẩn của nam giới Việt Nam</p>\n\n<p>- Sản phẩm chính là mẫu thiết kế mới nhất của VESCA</p>\n',NULL,1,NULL,NULL,'ao-sweater-nam-form-rong-phoi-layer-chat-ni-unisex-thoi-trang-tre-trung-vesca-m10',1000,'Áo Sweater Nam Form Rộng Phối Layer Chất Nỉ Unisex Thời Trang Trẻ Trung VESCA M10','<p>------------------------------------</p>\n\n<p>THÔNG TIN CHI TIẾT</p>\n\n<p>? Chất liệu: Nỉ</p>\n\n<p>? Màu sắc: Đen - Xanh dương - Trắng</p>\n\n<p>? Thương hiệu: VESCA</p>\n\n<p>? Xuất xứ: Việt Nam</p>\n\n<p>&nbsp;</p>\n',4,9,NULL,NULL,NULL),(24,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE',299000,'<p>+ Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.</p>\n\n<p>+ Không được dùng hóa chất tẩy.</p>\n\n<p>+ Hạn chế sử dụng máy sấy và ủi ở nhiệt độ thích hợp.</p>\n\n<p>+ Lộn mặt trái khi phơi tránh bị nhanh phai màu</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-da-roway-chat-lieu-da-ep-cao-cap-da-cuc-bam-v2',1000,'Áo khoác dạ ROWAY chất liệu dạ ép cao cấp | Dạ cúc bấm V2','<p>- Chất liệu: dạ ép cao cấp</p>\n\n<p>- Phom dáng: suông mặc thoải mái</p>\n\n<p>- Hoàn thiện: tỉ mỉ cao</p>\n',5,4,NULL,NULL,NULL),(25,'2024-01-14 18:26:08','2023-11-27 03:29:29','admin9193','admin9193','ACTIVE',75000,'<p>- Giặt ở nhiệt độ bình thường, với đồ có màu tương tự, áo phối màu ko ngâm để tránh phai màu</p>\n\n<p>- Không được dùng hóa chất tẩy.</p>\n\n<p>- Hạn chế sử dụng máy sấy và ủi ở nhiệt độ thích hợp.</p>\n\n<p>- Lộn mặt trái khi phơi tránh bị phai màu</p>\n',NULL,NULL,NULL,NULL,'ao-polo-nam-ao-nam-tay-ngan-phoi-mau-theu-tay-dep-xuat-sac',NULL,'Áo Polo nam, áo nam tay ngắn Phối Màu, thêu tay đẹp xuất sắc','<p>- Chất vải Cá Sấu Cotton (95% cotton và 5% spandex)</p>\n\n<p>- Độ co dãn tốt, thấm hút, chóng nhăn và độ bền màu cao</p>\n\n<p>- Gồm 4 màu và Form regular fit thoải mái vận động</p>\n\n<p>- Tỉ mỉ tron từng đường may, sẽ không có chỉ thừa hay đường may khiến bạn khó chịu khi mặc</p>\n\n<p>- Khi giặt áo không bị xù lông hay bay màu, thấm hút mồ hôi tốt và thoải mái khi vận động mạnh</p>\n\n<p>- Thiết kế cấu trúc lỗ thoáng, mắt vải to tạo sự thoáng mát cho người mặc.</p>\n',3,2,NULL,NULL,NULL),(26,'2023-12-18 03:37:24','2023-11-27 03:36:20','khanhlinh4878','admin9193','INACTIVE',93870,'<p>- quý khách muốn đặt 2 sản phẩm mà chưa biết cách sẽ thao tác như sau ạ : bấm vào sản phẩm chọn cho vào giỏ hàng , rồi tiếp tục quay lại bấm vào sản phẩm cho vào giỏ hàng lần nữa , sau đó vào giỏ hàng bấm thanh toán 2 sản phẩm đó là sẽ thành một đơn hàng. + Ưu điểm: đứng form tôn dáng, mặc thoáng mát + Hướng dẫn Bảo quản: giũ trước khi phơi, hạn chế chất tẩy rửa, giặt dưới 30 độ và tránh phơi trực tiếp dưới ánh nắng mặt trời + Điểm nổi bật: -Khi mặc các sản phẩm từ vải đũi, bạn sẽ có cảm giác thoải mái, dễ chịu bởi trọng lượng vải khá nhẹ, chất vải mềm mịn, êm ái. -Vải đũi có chất liệu 100% từ thiên nhiên, có khả năng thấm hút tốt vì vậy có tác dụng giải nhiệt -Vải đũi được làm từ nguyên liệu có nguồn gốc từ tự nhiên nên rất an toàn cho da, không ảnh hưởng đến sức khỏe -giặt Áo máy giặt thoải không phai màu, không chảy ! + Phong cách kết hợp tham khảo: phù hợp với mặc đi chơi</p>\n',0,NULL,NULL,NULL,'ao-so-mi-dui-nam-coc-tay-phoi-tui-nguc-thoi-trang-store-na',1000,'Áo sơ mi đũi nam cộc tay phối túi ngực thời trang Store NA','<p>Size M 46-56 kg Size L 57-66 kg Size XL 67 - 73 Kg Size XXL 74 _77 kg Size 3XL 78 _86 kg =&gt; FORM NHỎ NÊN QUÝ KHÁCH ĐẶT TĂNG THÊM 1 SIZE SO VỚI QUẦN BÌNH THƯỜNG QUÝ KHÁCH ĐANG MẶC ĐỂ THOẢI MÁI VỪA VẶN HƠN Ạ . + Xuất xứ: Việt Nam</p>\n',2,10,NULL,NULL,NULL),(27,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE',145000,'<p>✔️ QUẦN JEANS BAGGY DÁNG ỐNG SUÔNG NAM CAO CẤP</p>\n\n<p>- Có phải bạn đang muốn tìm cho mình một chiếc quần jean baggy cao cấp mang style hàn quốc?</p>\n\n<p>May mắn là bạn đã tìm thấy chúng tôi.</p>\n\n<p>- Chiếc quần jean baggy dành cho nam này cửa hàng chúng tôi bán khoảng 600 chiếc mỗi tháng.</p>\n\n<p>Đã bán hơn 6.000 chiếc chỉ tính riêng trên hệ thống của Shopee Việt Nam, chưa kể đến những kênh bán khác!</p>\n\n<p>- Bạn cũng sẽ là một trong số những người sẽ sở hữu chiếc quần jean baggy mang phong cách hàn quốc này.</p>\n\n<p>Bởi vì đây là một chiếc quần jean mà cực kỳ dễ phối đồ từ áo thun, hoodie, áo khoác..cho đến các loại sneakers, boots..</p>\n',0,NULL,1,NULL,'quan-jean-nam-ong-suong-rong-tr01-quan-bo-nam-mau-xam-den-dang-baggy-20we-hottrend-han-quoc-2023',1000,'Quần jean nam ống suông rộng TR01, quần bò nam mầu xám đen dáng baggy 20WE hottrend hàn quốc 2023','<p>?Size 26 (Từ 36- 42kg Cao Dưới 1m71)</p>\n\n<p>?Size 27 (Từ 42 - 49kg Cao Dưới 1m71)</p>\n\n<p>? Size 28 (Từ 50 - 54kg Cao Dưới 1m75)</p>\n\n<p>? Size 29 (Từ 55 - 58 kg Cao Dưới 1m80)</p>\n\n<p>? Size 30 ( Từ 59- 62 kg Cao Dưới 1m80)</p>\n\n<p>? Size 31 (Từ 63 - 65 kg Cao Dưới 1m80)</p>\n\n<p>? Size 32 (Từ 66 - 69 kg Cao Dưới 1m80)</p>\n\n<p>? Size 33 (Từ 70- 73 kg Cao Dưới 1m85)</p>\n\n<p>? Size 34 (Từ 74 - 77 kg Cao Dưới 1m85)</p>\n\n<p>? Size 35 (Từ 78 - 85 kg Cao Dưới 1m89)</p>\n\n<p>? Size 36 (Từ 86 - 93 kg Cao Dưới 1m89)</p>\n\n<p>? Size 37 ( Từ 95kg-105kg Cao Dưới 1m89)</p>\n',6,5,NULL,NULL,NULL),(28,'2024-01-14 18:25:04','2023-11-27 15:27:15','admin9193','admin9193','ACTIVE',125000,'<p>&nbsp;</p>\n\n<p>➤ Chất liệu : Vải gió tráng bạc, mềm, lông cừ dày dặn ấm áp ➤ Độ Dày : Dày ấm, chống chịu đại hàn, gió tuyết ➤ Công dụng : che gió , chống nắng (bảo vệ da ) , giữ ấm cho ngày lạnh , rất thời trang ➤ Màu Sắc : Đen , Xanh than, Xanh cổ vịt, Ghi , Vàng ➤ Sản phẩm được thiết kế Đơn Giản mang lại vẻ sang trọng cho người mặc</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-gio-nam-nu-2-lop-lot-long-cuu-cao-cap-sieu-am-ao-gio-nam-nu-phu-nano-chong-gio-chong-tham-nuoc',NULL,'Áo khoác gió nam nữ 2 lớp lót lông cừu cao cấp siêu ấm, áo gió nam nữ phủ nano chống gió chống thấm nước','<p>Áo khoác nam lót lông 3 khoá chất vải gió tráng bạc chống nước, lót lông dày dặn * Tiếp nối sự thành công của mẫu áo gió nam lót lông 2021, mẫu áo lót lông nam năm nay được cải tiến tốt hơn. Cải tiến về form áo đảm bảo rộng rãi, về khoá chất lượng, bền và chắc chắn, bên trong lót lông ấm ám, dày dặn. * Một sự khác biệt giữa mẫu năm nay so với mẫu cũ ở thiết kế vải gió tráng bạc chống nước, chống gió tuyệt đối . Chất liệu lông của áo khoác nam lót lông được nhập khẩu trực tiếp, đảm bảo chất lượng và an toàn cho làn da của bạn. Lớp lót lông cừu dày dặn bên trong tạo cảm giác mềm mại và ấm áp, không xù và không rụng lông trong suốt quá trình sử dụng * Phong cách trẻ trung,dễ phối hợp với các loại quần áo khác nhau</p>\n',5,7,NULL,NULL,NULL),(29,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE',170000,'<p>- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) - Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất. 1. Trường hợp được chấp nhận: - Hàng giao sai size khách đã đặt hàng - Giao thiếu hàng 2. Trường hợp không đủ điều kiện áp dụng chính sách: - Quá 2 ngày kể từ khi Quý khách nhận hàng - Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của 20SILK - Không thích, không hợp, đặt nhầm mã, nhầm màu,...</p>\n',NULL,NULL,1,NULL,'ao-khoac-nam-nu-chat-da-han-cao-cap-form-rong-dai-tay-hop-moi-thoi-dai-phong-cach-han-quoc',1000,'Áo khoác nam nữ chất dạ Hàn cao cấp form rộng dài tay ,hợp mọi thời đại, phong cách Hàn Quốc','<p>- Sản phẩm Áo Khoác dạ giống mô tả 100% - Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế. - Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách - Hàng có sẵn, giao hàng ngay khi nhận được đơn - Hoàn tiền nếu sản phẩm không giống với mô tả - Chấp nhận đổi hàng khi size không vừa trong 3 ngày.</p>\n',5,6,NULL,NULL,NULL),(30,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE',380000,'<p>?[Hướng dẫn mua hàng]!!!!!!!!!!! 1. Tính toán tỷ lệ khác với quốc gia của bạn. Vui lòng cung cấp chiều cao và cân nặng của bạn khi đặt hàng, chúng tôi sẽ cung cấp cho bạn kích thước đề xuất để tránh mất mát không đáng có.</p>\n\n<p>&nbsp;</p>\n\n<p>2. Do các phương pháp đo lường khác nhau, sai số từ 2-5 cm được phép, và phạm vi sai số không phải là vấn đề chất lượng! Do góc chụp khác nhau nên sự khác biệt về màu sắc là không thể tránh khỏi. Vui lòng tham khảo sản phẩm thực tế càng nhiều càng tốt.</p>\n\n<p>&nbsp;</p>\n\n<p>3. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, vui lòng đánh giá 5 sao cho chúng tôi trong phần bình luận và tải ảnh lên quần áo của bạn để giúp những khách hàng khác giới thiệu và nâng cao danh tiếng của chính bạn.</p>\n',NULL,1,1,NULL,'ao-khoác-hoodie-gia-hai-lop-hai-manh-gia-dang-rong-chat-lieu-nhung-thiet-ke-day-keo-doi-áo-khoác-nam-có-mũ-thoi-trang-áo-khoác',1200,'Áo khoác Hoodie Giả Hai Lớp Hai mảnh giả Dáng Rộng Chất liệu nhung Thiết kế dây kéo đôi áo khoác nam có mũ Thời trang áo khoác','<p>Mặc những bộ quần áo yêu thích của tôi và trở thành nhân vật chính của cuộc đời tôi!!!</p>\n\n<p>&nbsp;</p>\n\n<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: thông thường</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',5,7,NULL,NULL,NULL),(31,'2024-01-13 17:28:48','2023-11-27 15:44:42','admin9193','admin9193','ACTIVE',360000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-unisex-tay-dai-dang-rong-ao-khoac-kaki-2-lop-day-keo-co-mu-don-gian-phong-cach-harajuku-chong-gio-chong-nuoc',NULL,'Áo khoác unisex Tay Dài Dáng Rộng áo khoác kaki 2 lớp dây kéo có mũ Đơn Giản Phong Cách harajuku Chống Gió Chống Nước','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',5,7,NULL,NULL,NULL),(32,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE',380000,'<p>?[Hướng dẫn mua hàng]!!!!!!!!!!! 1. Tính toán tỷ lệ khác với quốc gia của bạn. Vui lòng cung cấp chiều cao và cân nặng của bạn khi đặt hàng, chúng tôi sẽ cung cấp cho bạn kích thước đề xuất để tránh mất mát không đáng có.</p>\n\n<p>&nbsp;</p>\n\n<p>2. Do các phương pháp đo lường khác nhau, cho phép sai số 2-5cm và phạm vi lỗi không phải là vấn đề chất lượng! Do góc chụp khác nhau nên sự khác biệt về màu sắc là không thể tránh khỏi. Vui lòng tham khảo sản phẩm thực tế càng nhiều càng tốt.</p>\n\n<p>&nbsp;</p>\n\n<p>3. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, vui lòng đánh giá 5 sao cho chúng tôi trong phần bình luận và tải ảnh lên quần áo của bạn để giúp những khách hàng khác giới thiệu và nâng cao danh tiếng của chính bạn.</p>\n',0,NULL,NULL,1,'ao-khoac-co-lo-nam-nu-co-cao-dang-rong-ao-khoat-jacket-gio-unisex-phong-cach-my-thoi-trang-co-mu-khoa-keo-doi-chong-tham-nuoc',1000,'Áo khoác Cổ Lọ nam nữ cổ cao dáng rộng áo khoát jacket gió unisex phong cách Mỹ thời trang có mũ Khóa Kéo Đôi Chống Thấm Nước','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',5,4,NULL,NULL,NULL),(33,'2024-01-13 15:46:07','2023-11-27 15:55:39','admin9193','admin9193','INACTIVE',120000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',NULL,NULL,NULL,NULL,'quan-jogger-kaki-nam-chat-vai-co-gianthiet-ke-socthoang-mattham-hut-mo-hoikhong-xu',NULL,'Quần Jogger Kaki Nam Chất Vải Co Giãn,Thiết kế Sọc,Thoáng Mát,Thấm Hút Mồ Hôi,Không Xù','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',7,8,NULL,NULL,NULL),(34,'2024-01-14 16:15:22','2023-11-27 16:02:20','admin9193','admin9193','ACTIVE',149000,'<p>- Chất liệu: KAKI co dãn</p>\n\n<p>- Màu sắc: nhiều màu</p>\n\n<p>- Đường may tinh tế, tỉ mỉ trong từng chi tiết</p>\n\n<p>- Phong cách: thể thao, trẻ trung,..</p>\n\n<p>- Thiết kế dày dặn mặc rất thoải mái, dễ dàng vận động, phù hợp cho nhiều cân nặng khác nhau</p>\n',0,NULL,NULL,1,'quan-jogger-kaki-nam-co-dan-ong-bo-chun-cao-cap-hang-xuat-khau-vai-xin-j90',1200,'QUẦN JOGGER KAKI NAM CO DÃN ỐNG BO CHUN CAO CẤP HÀNG XUẤT KHẨU VẢI XỊN J90','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',7,2,NULL,NULL,NULL),(35,NULL,'2023-11-27 16:07:28',NULL,'admin9193','ACTIVE',145000,'<p>?Size 26 (Từ 36- 43kg Cao Dưới 1m65) ?Size 27 (Từ 40 - 50kg Cao Dưới 1m70) ? Size 28 (Từ 50 - 54kg Cao Dưới 1m75) ? Size 29 (Từ 54 - 58 kg Cao Dưới 1m80) ? Size 30 ( Từ 58- 63 kg Cao Dưới 1m80) ? Size 31 (Từ 63 - 68 kg Cao Dưới 1m80) ? Size 32 (Từ 68 - 73 kg Cao Dưới 1m80) ? Size 33 (Từ 73- 75 kg Cao Dưới 1m85) ? Size 34 (Từ 75 - 80 kg Cao Dưới 1m85) ? Size 35 (Từ 80 - 85 kg Cao Dưới 1m89) ? Size 36 (Từ 85 - 90 kg Cao Dưới 1m89) ? Size 37 ( Từ 90kg-100kg Cao Dưới 1m89)</p>\n',NULL,NULL,NULL,NULL,'quan-jean-baggy-nam-ong-suong-ong-rong-vua-hotrend-han-quoc-quan-bo-baggy-nam-dang-rong-maxstore-b014',1200,'Quần jean baggy nam ống suông ống rộng vừa hotrend Hàn Quốc, Quần bò baggy nam dáng rộng MAXSTORE B014','<p>- Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky. Xanh đậm, Xám khói, Đen - Chất liệu: jean cao cấp, ko phai mầu - Số lượng : hàng đủ size , xuất khẩu - gồm có đủ size: từ size 28 ( 40kg) -&gt; size 33 (78kg).</p>\n',6,6,NULL,NULL,NULL),(36,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE',140000,'<p>- Kiểu Dáng: Quần nhung tăm nam nữ ống rộng XMAX, Quần thể thao Unisex dáng suông cạp chun dây rút thời trang thu đông cao cấp B093</p>\n\n<p>- Mầu Sắc: Đen, Nâu, Be phối đen</p>\n\n<p>- Chất liệu: Nhung Tăm Cao Cấp</p>\n\n<p>- Số lượng : Hàng đủ size , xuất khẩu</p>\n\n<p>- Gồm có đủ size: S, M, L, XL.</p>\n',NULL,NULL,NULL,NULL,'quan-nhung-tam-nam-nu-ong-rong-xmax-quan-the-thao-unisex-dang-suong-cap-chun-day-rut-thoi-trang-thu-dong-cao-cap',1200,'Quần nhung tăm nam nữ ống rộng XMAX, Quần thể thao Unisex dáng suông cạp chun dây rút thời trang thu đông cao cấp','<p>* Ưu Điểm: Quần nhung tăm nam nữ ống rộng XMAX, Quần thể thao Unisex dáng suông cạp chun dây rút mang phong cách trẻ trung năng động \"BadBoy\" được sẵn đón rất nhiều trong thời điểm hiện tại.</p>\n\n<p>- Quần thể thao thu đông nhung tăm cao cấp được thiết kế 2 bên kẻ sọc phong cách thời trang đặc biệt được giới trẻ tìm kiếm rất nhiều và được biệt các bạn thích phong cách đường phố.</p>\n\n<p>- Nếu bạn không tự tin mình có một đôi chân cong hoặc chiều cao có hạn thì bạn yên tâm với chiếc Quần ống rộng nam unisex phôi kẻ sọc, cạp chun nhà XMAX được thiết kế với dáng quần suông ống rộng sẽ giúp bạn giải quyết những vấn đề trên. Và giúp bạn tự tin hơn với chiếc quần quần thể thao thu đông cao cấp.</p>\n',9,8,NULL,NULL,NULL),(37,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE',145000,'<p>✔️ THAM KHẢO SIZE QUẦN : ?Size 26 (Từ 36- 43kg Cao Dưới 1m65) ?Size 27 (Từ 40 - 50kg Cao Dưới 1m70) ? Size 28 (Từ 50 - 54kg Cao Dưới 1m75) ? Size 29 (Từ 54 - 58 kg Cao Dưới 1m80) ? Size 30 ( Từ 58- 63 kg Cao Dưới 1m80) ? Size 31 (Từ 63 - 68 kg Cao Dưới 1m80) ? Size 32 (Từ 68 - 73 kg Cao Dưới 1m80) ? Size 33 (Từ 73- 75 kg Cao Dưới 1m85) ? Size 34 (Từ 75 - 80 kg Cao Dưới 1m85) ? Size 35 (Từ 80 - 85 kg Cao Dưới 1m89) ? Size 36 (Từ 85 - 90 kg Cao Dưới 1m89) ? Size 37 ( Từ 90kg-100kg Cao Dưới 1m89) NOTE : Hãy nhắn tin cho shop để được tư vấn size chuẩn nhất với bạn.</p>\n',NULL,NULL,NULL,NULL,'quan-jean-nam-baggy-ong-suong-tui-cheo-ong-rong-vua-hotrend-han-quoc-quan-bo-baggy-nam-dang-rong-maxstore-b015',1200,'Quần jean nam baggy ống suông túi chéo ống rộng vừa hotrend Hàn Quốc, Quần bò baggy nam dáng rộng MAXSTORE B015','<p>✔️ Thông Tin Sản Phẩm: - Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky. Xanh đậm, Xám khói, Đen - Chất liệu: jean cao cấp, ko phai mầu - Số lượng : hàng đủ size , xuất khẩu - gồm có đủ size: từ size 28 ( 40kg) -&gt; size 33 (78kg).</p>\n',6,10,NULL,NULL,NULL),(38,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE',280000,'<p>Chiều dài tay: tay dài</p>\n\n<p>Kiểu cổ: có mũ trùm đầu</p>\n\n<p>Mùa thích hợp: thu và đông winter</p>\n\n<p>Phiên bản: tiêu chuẩn</p>\n\n<p>Độ dài: Thông thường</p>\n\n<p>Phong cách cơ bản: phổ biến thích hợp cho giới trẻ</p>\n\n<p>Cách mặc: Áo khoác ngoài</p>\n\n<p>Xử lý theo quy trình: xử lý không ủi</p>\n\n<p>Thích hợp cho: giải trí</p>\n\n<p>Thích hợp cho: thanh thiếu niên</p>\n\n<p>Mẫu: đơn giản</p>\n\n<p>&nbsp;</p>\n\n<p>✨✨✨✨✨ ✨✨✨✨✨</p>\n',NULL,1,NULL,NULL,'yipinyouyou-ao-khoac-bong-chay-co-mu-trum-dau-thoi-trang-xuan-thu-cho-nam',1200,'YIPINYOUYOU Áo khoác bóng chày có mũ trùm đầu thời trang xuân thu cho nam','<p>✅ ? Tất cả các sản phẩm đều được làm bằng vải chất lượng cao và tay nghề tinh tế để đảm bảo chất lượng sản phẩm.</p>\n\n<p>✅? Sản phẩm của chúng tôi là hàng mới 100%.</p>\n\n<p>✅ ? Hy vọng sẽ mang đến cho bạn trải nghiệm mua sắm tốt nhất.</p>\n',5,9,NULL,NULL,NULL),(39,NULL,'2023-11-27 16:29:03',NULL,'admin9193','ACTIVE',340000,'<p>Chi tiết kiểu dáng: in họa tiết</p>\n\n<p>Thiết kế viền áo: viền tròn</p>\n\n<p>Quy trình: xử lý không ủi</p>\n\n<p>Chiều dài: thông thường</p>\n\n<p>Kiểu túi áo: túi có đường may bên</p>\n\n<p>Cách mặc: Áo khoác ngoài</p>\n\n<p>Chiều dài tay: tay dài</p>\n\n<p>Màu sắc: mai</p>\n\n<p>&nbsp;</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-co-dung-dang-rong-thoi-trang-mua-thu-cho-nam',1200,'Áo khoác cổ đứng dáng rộng thời trang mùa thu cho nam','<p>Loại sản phẩm: Áo khoác</p>\n\n<p>Loại sản phẩm: Nhật Bản</p>\n\n<p>Kiểu cổ: cổ đứng</p>\n\n<p>Độ vừa vặn: Dáng rộng</p>\n\n<p>Túi: dây kéo</p>\n\n<p>Có trùm đầu: Không trùm đầu</p>\n\n<p>Độ dày: mỏng</p>\n\n<p>Hoa văn: trơn</p>\n\n<p>Mùa phù hợp: xuân và thu</p>\n\n<p>Thích hợp cho đối tượng: thanh thiếu niên</p>\n\n<p>Thành phần vải chính: sợi polyester (polyester)</p>\n\n<p>Hàm lượng của chất vải chính: 85 (%)</p>\n\n<p>Dịp thích hợp: giải trí</p>\n',5,9,NULL,NULL,NULL),(40,'2024-01-14 20:25:16','2023-11-27 16:34:33','anonymous','admin9193','ACTIVE',218400,'<p>M: Ngang áo: 102cm - Eo: 90cm - Dài tay: 64cm</p>\n\n<p>L: Ngang áo: 110cm - Eo: 98cm - Dài tay: 65cm</p>\n\n<p>XL: Ngang áo: 118cm - Eo: 107cm - Dài tay: 65.5cm</p>\n',0,NULL,NULL,NULL,'ao-khoac-jacket-local-brand-by-unispace-form-rong-unisex-nam-nu-freedom',1200,'Áo khoác jacket local brand By UniSpace form rộng unisex nam nữ Freedom','<p>Áo khoác dù Freedom được làm từ chất liệu vải dù thoáng mát, form oversize thoải mái cũng hình in full áo độc đáo, cá tính. Áo Jacket này tuy phá cách, bụi bặm nhưng vẫn unisex phù hợp với cả nam lẫn nữ nha, mặc đi học đi chơi thả ga luôn nhé. Nhanh tay đặt hàng để được tặng kèm quà và nhiều ưu đãi khác nha.</p>\n',5,7,NULL,NULL,NULL),(41,NULL,'2023-11-27 16:40:53',NULL,'admin9193','ACTIVE',350000,'<p>- Chất liệu được làm dạ 2 lớp và phối Tay da PU</p>\n\n<p>- Các chi tiết trên áo đều được THÊU cao cấp</p>\n\n<p>- DÁNG RỘNG TO OVERSIZE</p>\n\n<p>- Tay áo bo</p>\n',NULL,1,1,NULL,'ao-khoac-bomber-lv-varsity-jacket-ao-bomber-jacket-lv-tho-hinh-theu-kunshopunisex',1000,'Áo Khoác bomber Lv Varsity Jacket Áo bomber jacket Lv thỏ hình thêu kunshopunisex','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',5,7,NULL,NULL,NULL),(42,'2024-01-14 18:20:34','2023-11-27 16:48:18','admin9193','admin9193','ACTIVE',199000,'<p>Cách giặt: Nên giặt tay để giữ được fom dáng của áo. Lúc phơi cần lộn ngược áo từ trong ra ngoài để tránh tình trạng bị bay màu, phai màu do ánh sáng mặt trời tiếp xúc trực tiếp vào áo và các hình in</p>\n\n<p>Bảo quản nơi khô ráo, nên treo lên móc, giá để không bị nhăn</p>\n',NULL,NULL,NULL,NULL,'áo-thun-fafic-studio-boy-fa-áo-thun-tay-lõ-nam-nũ-oversize-chát-cotton-cao-cáp-kunshop-unisex',NULL,'Áo thun Fafic studio Boy FA áo thun tay lỡ nam nữ oversize Chất cotton cao cấp KunShop Unisex','<p>Có SIZE M L XL</p>\n\n<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-95kg : cao từ 1m8 trở xún</p>\n',1,7,NULL,NULL,NULL),(43,NULL,'2023-12-09 05:23:47',NULL,'admin9193','ACTIVE',379000,'<p>- Chất liệu được làm dạ 2 lớp và phối Tay da PU</p>\n\n<p>- Các chi tiết trên áo đều được THÊU cao cấp</p>\n\n<p>- DÁNG RỘNG TO OVERSIZE</p>\n\n<p>- Bo cổ , bo tay , gân dưới áo đều được dệt bo kim tuyến</p>\n',0,NULL,1,NULL,'ao-khoac-bomber-off-white-ac-milan-varsity-jacket-ao-bomber-jacket-ow-x-ac-milan-kunshopunisex',1200,'Áo Khoác bomber O.f.f White Ac Milan Varsity Jacket Áo bomber jacket OW x AC Milan kunshopunisex','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',5,7,NULL,NULL,NULL),(44,'2024-01-15 18:49:29','2023-12-09 05:27:29','dinhtuananh0183','admin9193','ACTIVE',225000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',0,NULL,NULL,NULL,'quan-jean-baggy-nam-unisex-han-quoc-quan-jeans-dang-suong-danh-cho-nam-nu-kunshop',NULL,'Quần jean baggy nam unisex Hàn Quốc quần jeans dáng suông dành cho nam nữ Kunshop','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',6,4,NULL,NULL,NULL),(45,'2024-01-13 16:17:54','2023-12-09 05:29:47','admin9193','admin9193','ACTIVE',120000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',NULL,NULL,NULL,NULL,'ao-giu-nhiet-nam-dai-tay-cao-cap-vesca-n',NULL,'Áo Giữ Nhiệt Nam Dài Tay Cao Cấp VESCA N','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',4,7,NULL,NULL,NULL),(46,'2024-01-11 17:43:34','2023-12-09 05:33:09','admin9193','admin9193','ACTIVE',249000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',NULL,NULL,NULL,NULL,'ao-thun-ao-thun-nam-thoi-trang-cao-cap-phong-cach-han-quoc-cuc-chat-va-ca-tinh-nang-dong-day-dan-thoang-mat',NULL,'Áo thun, áo thun nam thời trang cáo cấp phông cách Hàn quốc cực chất và cá tính, năng động, dày dặn thoáng mát','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',1,4,NULL,NULL,NULL),(47,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE',279000,'<p>- Điều kiện áp dụng (trong vòng 3 ngày kể từ khi nhận sản phẩm)</p>\n\n<p>- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.</p>\n\n<p>1. Trường hợp được chấp nhận:</p>\n\n<p>- Hàng giao sai size khách đã đặt hàng</p>\n\n<p>- Giao thiếu hàng</p>\n\n<p>2. Trường hợp không đủ điều kiện áp dụng chính sách:</p>\n\n<p>- Quá 2 ngày kể từ khi Quý khách nhận hàng</p>\n\n<p>- Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của Nice Clothes</p>\n\n<p>- Không thích, không hợp, đặt nhầm mã, nhầm màu,...</p>\n',0,1,NULL,NULL,'ao-polo-unisex-phoi-mau-tuong-phan-co-keo-khoa-theu-chu-b-nguc-hoac-polo-spion-3-logo-chat-to-ong-nice-clothe',1200,'Áo Polo unisex phối màu tương phản cổ kéo khóa + thêu chữ B ngực hoặc POLO SPION 3 LOGO chất tổ ong, Nice Clothé','<p>- Sản phẩm áo thun POLO tay lỡ xịn đét, form rộng giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế và chụp.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n\n<p>- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.</p>\n',3,7,NULL,NULL,NULL),(48,'2024-01-12 16:31:45','2023-12-09 05:42:31','admin9193','admin9193','ACTIVE',135000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',NULL,NULL,NULL,NULL,'ao-thun-dai-tay-ao-longsleeve-chat-cotton-in-chu-to-banyi-mac-thoang-tham-hut-mo-hoi-de-phoi-do',NULL,'Áo thun dài tay - Áo longsleeve chất cotton in chữ TO-BANYI mặc thoáng, thấm hút mồ hôi dễ phối đồ','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',1,2,NULL,NULL,NULL),(49,'2024-01-15 05:24:35','2023-12-09 05:47:44','dinhanhtuan0812','admin9193','ACTIVE',79000,'<p>I. SHOP CAM KẾT</p>\n\n<p>- Sản phẩm Áo sơ mi kaki basic giống mô tả 100%</p>\n\n<p>- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.</p>\n\n<p>- Kiểm tra cẩn thận trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả</p>\n',0,NULL,NULL,NULL,'ao-thun-dai-tay-ao-longsleeve-chat-cotton-in-chu-to-banyi-mac-thoang-tham-hut-mo-hoi-',NULL,'Áo thun tay lỡ thoáng mát và mềm mịn đi học ,đi chơi','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',1,2,NULL,NULL,NULL),(50,'2023-12-19 05:27:10','2023-12-17 06:14:05','admin9193','admin9193','INACTIVE',200000,'<p>Mô tả sản phẩm</p>\n',1,NULL,NULL,1,'ao-thun-moi',200,'Áo thun mới ','<p>Size M từ 55-60kg : cao từ 1m6-1m5</p>\n\n<p>Size L từ 60-70kg : cao từ 1m7</p>\n\n<p>Size Xl từ 70-90kg : cao từ 1m8 trở xún</p>\n',1,2,NULL,NULL,NULL),(51,'2024-01-12 16:29:59','2023-12-17 06:30:36','admin9193','admin9193','ACTIVE',200000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-thu-dong',NULL,'Áo khoác thu đông','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',2,3,NULL,NULL,NULL),(56,'2024-01-14 20:27:38','2023-12-18 07:46:17','anonymous','admin9193','ACTIVE',200000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,NULL,NULL,'ao-khoac-nam',200,'Áo khoác nam','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',1,3,NULL,NULL,NULL),(57,'2024-01-14 20:17:33','2023-12-19 04:44:28','anonymous','admin9193','ACTIVE',200000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,1,NULL,'ao-phong-nam-nu-form-rong-2N-Unisex-thun-cotton-in-noi-gatin-mau-trang-hong',200000,'Áo phông nam nữ form rộng 2N Unisex thun cotton in nổi Gatin màu trắng hồng','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',2,1,NULL,NULL,NULL),(58,'2024-01-14 20:17:44','2023-12-19 05:54:26','anonymous','admin9193','ACTIVE',300000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,1,NULL,'ao-vai-truyen-thong',500,'áo vải truyền thống ','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',1,7,NULL,NULL,NULL),(59,'2024-01-15 17:27:41','2023-12-19 07:41:57','dangngocthanh0133','admin9193','ACTIVE',120000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,NULL,NULL,'ao-polo-nam-ao-thun-polo-nam-phoi-ke-tre-trung-vai-ca-sau-cao-cap',NULL,'Áo Polo Nam áo thun polo nam phối kẻ trẻ trung vải Cá Sấu cao cấp','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',3,2,NULL,NULL,NULL),(60,'2024-01-11 17:51:11','2023-12-19 08:25:13','admin9193','admin9193','ACTIVE',200000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'quan-nam-phoi-ke-tre-trung-vai-ca-sau-cao-cap',NULL,'Quần Nam phối kẻ trẻ trung vải Cá Sấu cao cấp','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',2,2,NULL,NULL,NULL),(61,'2024-01-10 09:46:08','2023-12-19 08:38:08','admin9193','admin9193','INACTIVE',120000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,NULL,NULL,'ao-thun',2,'áo thun','<p>✔️ Thông Tin Sản Phẩm: - Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky. Xanh đậm, Xám khói, Đen - Chất liệu: jean cao cấp, ko phai mầu - Số lượng : hàng đủ size , xuất khẩu - gồm có đủ size: từ size 28 ( 40kg) -&gt; size 33 (78kg).</p>\n',3,2,NULL,NULL,NULL),(62,'2024-01-15 14:01:55','2023-12-19 08:51:40','admin9193','admin9193','INACTIVE',10000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',0,NULL,NULL,NULL,'quan-au',NULL,'quần âu','<p>✔️ Thông Tin Sản Phẩm: - Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky. Xanh đậm, Xám khói, Đen - Chất liệu: jean cao cấp, ko phai mầu - Số lượng : hàng đủ size , xuất khẩu - gồm có đủ size: từ size 28 ( 40kg) -&gt; size 33 (78kg).</p>\n',2,2,NULL,NULL,NULL),(63,'2024-01-12 17:02:35','2023-12-19 09:08:33','admin9193','admin9193','ACTIVE',120000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-phong',NULL,'áo phông','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',2,1,NULL,NULL,NULL),(64,'2024-01-15 07:31:30','2024-01-09 07:53:39','anonymous','admin9193','INACTIVE',150000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-lien-mu-chu-n-hoa-tiet-ngoi-sao-ben-tay-stylt-marven-ao-khoac-nam-002',NULL,'Áo khoác liền mũ chữ N họa tiết ngôi sao bên tay STYLT MARVEN - AO KHOAC NAM 002','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',5,5,NULL,NULL,NULL),(65,'2024-01-13 18:34:35','2024-01-09 08:13:33','admin9193','admin9193','ACTIVE',249000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-khoac-gio-nam-nu-2-lop-co-tui-trong-ao-khoac-du-chat-lieu-vai-gio-cao-cap-khang-nuoc-full-tem-tag-phu-kien',NULL,'Áo khoác gió nam-nữ 2 lớp có túi trong, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',5,9,NULL,NULL,NULL),(68,'2024-01-13 18:36:30','2024-01-09 15:20:04','admin9193','admin9193','ACTIVE',199000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-phong-nam-nu-tommy-hilfiger-in-vach-soc-den-trang-do-chu-ki-quanh-ao-ao-thun-unisex-form-unisex-sieu-hot-2023',NULL,'Áo phông nam nữ Tommy Hilfiger in vạch sọc đen trắng đỏ chữ kí quanh áo. Áo Thun Unisex Form Unisex Siêu Hot 2023','<p>- Shop cam kết không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa.</p>\n\n<p>- Sản phẩm cam kết như hình thật 100%</p>\n\n<p>- Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt.</p>\n\n<p>- Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng.</p>\n\n<p>- Hàng được kiểm tra kĩ càng, cẩn thận và tư vấn nhiệt tình trước khi gói hàng giao cho Quý Khách</p>\n\n<p>- Hàng có sẵn, giao hàng ngay khi nhận được đơn</p>\n\n<p>- Hoàn tiền nếu sản phẩm không giống với mô tả. Chấp nhận đổi hàng khi size không vừa</p>\n\n<p>- Giao hàng trên toàn quốc, nhận hàng trả tiền</p>\n\n<p>- Hỗ trợ đổi trả theo quy định của Shopee</p>\n',1,8,NULL,NULL,NULL),(69,'2024-01-15 18:40:27','2024-01-10 09:28:04','nguyenthikhanhlinh1711','admin9193','ACTIVE',169000,'<p>Áo len cho bố nam trung niên hàng quảng châu đẹp dày dặn mềm mịn quà tặng cho bố tặng ông lớn tuổi mặc mùa đôn</p>\n\n<p>Áo len nam trung niên loại đẹp dày dặn mềm mịn hàng quảng châu dành tặng cho bố tặng ông lớn tuổi mặc mùa đông</p>\n\n<p>Áo thun nam trung niên dày dặn ấm tặng bố Áo len nam trung niên cho bố hàng quảng châu áo thun nam trung niên thu đông ấm áp quà tặng cho bố ông lớn tuổi</p>\n\n<p>Chất len ko xù ko nhão mặc đẹp</p>\n\n<p>Các màu: chì sáng, chì tối, ghi, nâu</p>\n\n<p>- size L : 50 - 60kg</p>\n\n<p>- size XL.: 60 - 70kg</p>\n\n<p>- szie 2XL : 70 - 80kg</p>\n\n<p>LƯU Ý: GIẶT TRƯỚC KHI MẶC, VÌ LEN LẦN ĐẦU MẶC SẼ CẢM GIÁC HƠI KHÓ CHỊU, hơi dặm, CAM KẾT CHẤT ĐẸP LEN MỊN</p>\n\n<p>Áo Len Nam Trung Niên Cho Bố Cho Ông Lót Nỉ Dày Ấm.</p>\n\n<p>&nbsp;</p>\n\n<p>Áo len dày mặc bao ấm ạ! Khách cần nên e vẫn nhập thường xuyên nha mn!</p>\n\n<p>Màu dễ mặc, họa tiết nhã nhặn, rất hợp với người trung tuổi và cao tuổi ạ.</p>\n\n<p>Bảng size áo len trung niên&nbsp; tham khảo:</p>\n\n<p>Size L: 50-62kg</p>\n\n<p>Size XL: 62-72kg</p>\n\n<p>Size 2XL: 70-78kg.</p>\n\n<p>Áo len nam trung niên Form to nên mn đừng lấy trừ hao nhiều sẽ bị rộng ạ!</p>\n\n<p>&nbsp;</p>\n\n<p>? LƯU Ý KHI SỬ DỤNG CÁC SẢN PHẨM CỦA SHOP:</p>\n\n<p>? Đối với sản phẩm mới mua về, nên giặt nhẹ với ít bột (nước) giặt pha loãng, giặt riêng quần áo màu vì sản phẩm mới được nhuộm có thể sẽ ra màu làm loang sang quần áo khác nếu giặt chung.</p>\n\n<p>? Đối với sản phẩm thường có thể giặt máy thoải mái và nên phân loại sản phẩm cùng màu, cùng loại vải khi giặt. Nên dùng túi giặt cho các loại chất liệu mềm như len, đũi, lanh... để giữ được độ bền lâu hơn.</p>\n\n<p>? Đối với sản phẩm cao cấp, sang chảnh, đa dạng về chất liệu, kiểu dáng như tơ lụa, voan, ren... cách bảo quản sản phẩm tốt nhất là giặt tay với bột / nước giặt nhẹ để giữ được độ bền của vải, tránh bị phai màu, mất form dáng.</p>\n\n<p>? Nên phơi sản phẩm ở nơi thoáng mát, tránh để ẩm ướt kéo dài gây mốc, phơi ở những điểm đón gió, tránh ánh nắng trực tiếp sẽ giữ được màu sắc và độ bền tốt hơn.</p>\n\n<p>*****************************</p>\n\n<p>? Mọi thắc mắc xin Quý khách vui lòng nhắn tin để shop có thể tư vấn và hỗ trợ đổi trả hàng theo đúng quy định với những sản phẩm lỗi do nhà sản xuất.</p>\n\n<p>? ĐẶC BIỆT : Shop hỗ trợ đổi size, mẫu cho Khách hàng có nhu cầu.</p>\n\n<p>? Các bạn nhớ lấy mã giảm giá ở trong bài (nếu có) để được hỗ trợ tối đa nhé!</p>\n\n<p>? Nếu thấy sản phẩm chất lượng tốt hãy đánh giá cho shop 5 sao để shop có động lực phục vụ tốt hơn nữa nha!</p>\n',0,NULL,NULL,NULL,'ao-len-nam-trung-nien-cho-bo-hang-quang-chau-ao-thun-tay-dai-nam-trung-nien-thu-dong-am-ap-qua-tang-cho-bo-ong-lon-tuoi',NULL,'Áo len nam trung niên cho bố hàng quảng châu áo thun tay dài nam trung niên thu đông ấm áp quà tặng cho bố ông lớn tuổi','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',4,3,NULL,NULL,NULL),(70,'2024-01-13 18:49:35','2024-01-10 09:33:28','admin9193','admin9193','ACTIVE',299000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-giu-nhiet-co-cao-nam-ao-tay-dai-lot-ni-sieu-am-chat-day-dan-co-gian',NULL,'Áo giữ nhiệt cổ cao nam , áo tay dài lót nỉ siêu ấm chất dày dặn co giãn','<p>✔️ Thông Tin Sản Phẩm: - Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky. Xanh đậm, Xám khói, Đen - Chất liệu: jean cao cấp, ko phai mầu - Số lượng : hàng đủ size , xuất khẩu - gồm có đủ size: từ size 28 ( 40kg) -&gt; size 33 (78kg).</p>\n',1,4,NULL,NULL,NULL),(71,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE',298826,'<p>✅Theo dõi cửa hàng để được giảm giá 9999VND</p>\n\n<p>✅Chúng tôi chủ yếu bán quần áo nam giá rẻ, chất lượng tốt</p>\n\n<p>&nbsp;</p>\n\n<p>Vải / chất liệu: Polyester / Polyester (Sợi Polyester)</p>\n\n<p>Hàm lượng thành phần: 51% (bao gồm) -70% (bao gồm)</p>\n\n<p>Phiên bản: Loose</p>\n\n<p>Loại cổ áo: cổ áo vuông</p>\n\n<p>Chiều dài tay áo: Tay ngắn</p>\n\n<p>Chi tiết kiểu quần áo: in ấn</p>\n\n<p>Phong cách: bình thường</p>\n',NULL,NULL,NULL,NULL,'ao-so-mi-nam-tay-ngan-dang-rong-in-hoa-tiet-graffiti-phong-cach-moi-thoi-trang',NULL,'Áo Sơ Mi Nam Tay Ngắn Dáng Rộng In Họa Tiết Graffiti Phong Cách Mới Thời Trang','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',2,6,NULL,NULL,NULL),(72,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE',168668,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-so-mi-tay-ngan-thoi-trang-cho-nam',NULL,'Áo Sơ Mi Tay Ngắn Thời Trang Cho Nam','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',2,7,NULL,NULL,NULL),(73,'2024-01-15 19:22:53','2024-01-13 19:12:44','dinhtuananh0183','admin9193','ACTIVE',159000,'<p>Chào bạn! Rất vui được chào đón bạn đến với shop!</p>\n\n<p>Bạn nhớ ghé thăm shop mỗi ngày để cập nhật những sản phẩm mới nhất nha</p>\n\n<p>Shop luôn cam kết đảm bảo đạo đức kinh doanh với giá cả hợp lý, luôn mang đến cho bạn sự hài lòng với những sản phẩm chất lượng và được kiểm tra kỹ càng trước khi giao cho khách.</p>\n\n<p>Đừng ngần ngại mà hãy liên hệ ngay với shop nếu bạn có bất kỳ thắc mắc nào nha</p>\n\n<p>Chúc bạn một ngày tốt lành và đừng quên đánh giá 5 sao nếu bạn thích sản phẩm nhé</p>\n\n<p>Cám ơn bạn đã đến thăm! Hy vọng bạn có một trải nghiệm mua sắm tuyệt vời tại shop!</p>\n',0,NULL,NULL,NULL,'ao-so-mi-tay-lung-don-gian-thoi-trang-mua-he-moi-danh-cho-nam',NULL,'Áo Sơ Mi Tay Lửng Đơn Giản Thời Trang Mùa Hè Mới Dành Cho Nam','<p>Nếu bạn có bất kỳ câu hỏi mua hàng nào , vui lòng liên hệ với chúng tôi và chúng tôi sẽ cung cấp cho bạn câu trả lời thỏa đáng nhất .</p>\n\n<p>&nbsp;</p>\n\n<p>✨ Sản phẩm của chúng tôi là thương hiệu mới 100 \' .</p>\n\n<p>&nbsp;</p>\n\n<p>✨ Hy vọng sẽ mang lại cho bạn trải nghiệm mua sắm tốt nhất .</p>\n\n<p>&nbsp;</p>\n\n<p>✨ Chúng tôi có kinh nghiệm phong phú và sản phẩm chất lượng cao .</p>\n\n<p>&nbsp;</p>\n\n<p>✨ Chúng tôi tập trung vào chất lượng tốt và giá rẻ \"</p>\n\n<p>&nbsp;</p>\n\n<p>✨ Sản phẩm mới mọi lúc . Hãy tiếp tục chú ý đến những tin tức mới nhất của cửa hàng chúng tôi . Chúng tôi sẽ gửi cho bạn phiếu giảm giá và giảm giá sản phẩm .</p>\n',2,1,NULL,NULL,NULL),(74,'2024-01-15 19:21:23','2024-01-13 19:16:26','nguyenthikhanhlinh1711','admin9193','ACTIVE',99000,'<p>Áo Sơ Mi Nam Ngắn Tay dáng ôm body , chống nhăn cao cấp chính là gợi ý tuyệt vời cho nam giới mỗi khi lựa chọn trang phục mỗi ngày. Với những mẫu áo sơ mi nam thiết kế đơn giản và toát lên vẻ lịch lãm tinh tế, mang đến phong cách thời trang trẻ trung, năng động chắc chắn sẽ là lựa chọn hoàn hảo cho chàng trai hiện đại, nam tính. Những chiếc áo sơ mi dài tay dáng ôm body Hàn Quốc , chống nhăn cao cấp dù kết hợp với quần âu, quần jeans khi đi làm hay diện cùng quần ngố, quần short đi chơi đều NỔI BẬT, THOẢI MÁI và PHONG CÁCH.</p>\n',0,NULL,NULL,NULL,'ao-so-mi-nam-tay-ngan-chat-lua-chong-nhan-min-mat',NULL,'Áo sơ mi nam tay ngắn chất lụa chống nhăn, mịn, mát','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',2,2,NULL,NULL,NULL),(75,'2024-01-14 16:15:12','2024-01-13 19:19:31','admin9193','admin9193','ACTIVE',339998,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',NULL,NULL,NULL,NULL,'ao-cardigan-nam-nu-form-rong-unisex-sans23-kimono-nhat-ban-mong-tron-basic-bigsize-3xl-4xl-5xl-big-size-80kg-90kg-100kg',NULL,'Áo cardigan nam nữ form rộng unisex Sans23 kimono nhật bản mỏng trơn basic bigsize 3xl 4xl 5xl big size 80kg 90kg 100kg','<p>???Chào mừng bạn đến với cửa hàng của chúng tôi, nơi tập trung vào quần áo thời trang. Với khả năng thiết kế riêng và sức mạnh của nhà máy, chúng tôi cung cấp cho mỗi khách hàng những sản phẩm may mặc tiết kiệm chi phí.</p>\n\n<p>&nbsp;</p>\n\n<p>Chất liệu: Bông + Polyester</p>\n\n<p>&nbsp;</p>\n\n<p>Độ dày: Thường xuyên</p>\n\n<p>&nbsp;</p>\n\n<p>Tính năng sản phẩm: Xu hướng thời trang</p>\n\n<p>&nbsp;</p>\n\n<p>Phong cách: Giản dị, Thời trang</p>\n',4,2,NULL,NULL,NULL),(76,'2024-01-15 19:00:52','2024-01-14 10:10:07','admin9193','admin9193','ACTIVE',150000,'<p>❥(^ _ -) Các bạn nhớ chú ý đến đơn hàng của cửa hàng các sản phẩm yêu thích tìm hiểu về các kiểu dáng mới nhất và nhiều thông báo giảm giá mới nhất ~</p>\n\n<p>Xem tất cả các sản phẩm trong cửa hàng tại đây → _ →</p>\n\n<p>“Bingjian.ph</p>\n\n<p>&nbsp;</p>\n\n<p>Màu sắc: hồng</p>\n\n<p>Kích thước: M L XL 2XL 3XL</p>\n\n<p>Chất liệu: Polyester</p>\n\n<p>Phong cách cơ bản: Thời trang thanh niên</p>\n\n<p>Dày và mỏng: mỏng</p>\n\n<p>&nbsp;</p>\n\n<p>Mẹo mua hàng:</p>\n\n<p>1.Vui lòng tham khảo mẫu cuối cùng hoặc biểu đồ kích thước để biết chi tiết kích thước. Nếu bạn không chắc mình mặc bao nhiêu thước, bạn có thể cung cấp cho chúng tôi chiều cao và cân nặng, chúng tôi sẽ tư vấn chuyên nghiệp cho bạn</p>\n\n<p>2. Tất cả các sản phẩm sẽ được vận chuyển trong vòng 48 giờ sau khi đặt hàng, và hàng hóa sẽ đến nơi trong vòng 7-12 ngày. Vì vận chuyển từ Trung Quốc, chúng tôi cần đến trung tâm trung chuyển quốc tế trước, vì vậy lô hàng ngay lập tức sẽ không được hiển thị. Hãy kiên nhẫn ~ ~</p>\n\n<p>3.Nếu bạn không thể mở lỗ Nút của quần jean, vui lòng sử dụng tất cả quần jean mới từ Trung Quốc đại lục. Chúng không phải là những sản phẩm bị lỗi chưa hoàn thành, mà là để đảm bảo tính toàn vẹn của sản phẩm ở mức độ cao nhất ~ ~</p>\n\n<p>4.Có kiểm tra trước khi giao hàng trong cửa hàng của chúng tôi, nhưng đôi khi có những thiếu sót. Ví dụ, hàng hóa đã gửi sai, bỏ lỡ và các vấn đề chất lượng sau khi nhận được. Vui lòng liên hệ với chúng tôi ở lần đầu tiên để giải quyết chúng. Chúng tôi chân thành và có trách nhiệm ~ ~</p>\n\n<p>5. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, xin vui lòng cho chúng tôi 5 sao Cảm ơn bạn đã ủng hộ và có một cuộc sống tốt đẹp ~ ~</p>\n\n<p>&nbsp;</p>\n\n<p>Vì phương pháp đo khác với màn hình, lỗi và sự khác biệt về màu sắc không phải là vấn đề chất lượng! Lưu ý: Vận chuyển tại Trung Quốc, kích thước khác với Việt Nam. Khi đặt hàng, bạn có thể kiểm tra kích thước, và sản phẩm không thể bị hủy hoặc thay đổi sau khi giao hàng!!!</p>\n\n<p>Cảm ơn bạn!❤❤❤❤❤</p>\n',1,NULL,NULL,NULL,'ao-thun-dai-tay',NULL,'áo thun dài tay','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',1,1,NULL,NULL,NULL),(77,'2024-01-16 04:24:36','2024-01-04 19:49:10','dinhanhtuan0812','admin9193','ACTIVE',70200,'<p>Quần Short Thun Nam Mùa Hè Loang Màu Họa Tiết In Chữ Phong Cách Thể Thao Thời Trang Zenkonu SHORT NAM 054</p>\n\n<p>* THÔNG TIN SẢN PHẨM:</p>\n\n<p>?Chât liệu: vải thun mềm mại, thấm hút mồ hôi.</p>\n\n<p>? Kích thước: XS S M L XL</p>\n\n<p>? Xuất xứ: Việt Nam</p>\n\n<p>Với thiết kế trẻ trung năng động, phù hợp nhiều hoàn cảnh, phong cách Ulzzang cập nhập xu hướng mới nhất.</p>\n\n<p>* Chi tiết Size:</p>\n\n<p>Size XS: cho bạn có cân nặng từ 40 - 45kg tùy chiều cao</p>\n\n<p>Size S: cho bạn có cân nặng từ 45 - 50kg tùy chiều cao</p>\n\n<p>Size M: cho bạn có cân nặng từ 50 - 55kg tùy chiều cao</p>\n\n<p>Size L: cho bạn có cân nặng từ 55 - 60kg tùy chiều cao</p>\n\n<p>Size XL: cho bạn có cân nặng từ 60 - 65kg tùy chiều cao</p>\n',0,NULL,NULL,NULL,'quan-short-thun-nam-mua-he-loang-mau-hoa-tiet-in-chu-phong-cach-the-thao-thoi-trang-zenkonu-short-nam-054',NULL,'Quần Short Thun Nam Mùa Hè Loang Màu Họa Tiết In Chữ Phong Cách Thể Thao Thời Trang Zenkonu SHORT NAM 054','<p>- Để bảo quản áo cũng như chất liệu hình in, shop khuyên bạn lộn mặt trái khi giặt và ủi nha</p>\n\n<p>- Bảng size chỉ mang tính chất tham khảo, tùy thuộc hình thể mỗi người và chất liệu nên có chênh lệch. Hãy ibox cho shop khi cần tư vấn cụ thể nha ^^</p>\n\n<p>Hãy theo dõi để ủng hộ shop và cập nhập các chương trình khuyến mãi cũng như các mẫu sản phẩm mới nhất của shop nhé!</p>\n\n<p>? Lưu ý: Shop chỉ hỗ trợ xử lý đơn hàng đổi trả trong vòng 15 ngày kể từ khi giao hàng thành công!</p>\n',9,5,NULL,NULL,NULL),(78,'2024-01-15 17:55:17','2024-01-14 20:36:57','nguyenthikhanhlinh1711','admin9193','ACTIVE',399000,'<p>Áo chất nỉ bông các màu in logo WASK FORM dáng thụng</p>\n\n<p>Sản xuất tại: phuongmyt 0989401395</p>\n\n<p>Freesize</p>\n\n<p>nữ nam 40-65 kg cao 1m68 về mặc được</p>\n\n<p>???????????</p>\n\n<p>Các bạn chú ý đọc Thông tin sp trước khi đặt hàng</p>\n\n<p>Shop chỉ chuyển đơn theo đúng phân loại khách chọn trong đơn ..</p>\n\n<p>???</p>\n',1,NULL,NULL,NULL,'ao-khoa-ni-mu-hai-lop-logo-wask-ni-lot-bong-form-thung',NULL,'Áo khoá nỉ mũ hai lớp logo WASK nỉ lót bông form thụng','<p>? Chuyên sỉ lẻ các loại quần áo 4 mùa</p>\n\n<p>? Giá tại xưởng không qua trung gian</p>\n\n<p>? Mẫu mã đa dạng ,hợp thời trang</p>\n\n<p>? Các loại sản phẩm từ chất cotton,citi,lanh,thun....</p>\n\n<p>??</p>\n\n<p>???Cảm ơn khách đã tin dùng sản phẩm của phuongmyt</p>\n',4,3,NULL,NULL,NULL),(79,'2024-01-15 14:11:00','2024-01-14 20:57:14','doquochuy8173','admin9193','ACTIVE',499000,'<p>KIZAWA chuyên quần tây nam, áo sơ mi nam hân hạnh được phục vụ quý khách. Những sản phẩm mới nhất liên tục được cập nhật mỗi ngày. QUÝ KHÁCH NHỚ LIKE SẢN PHẨM VÀ THEO DÕI SHOP ĐỂ LUÔN CẬP NHẬT CHƯƠNG TRÌNH DEAL SỐC , KHUYẾN MÃI KHỦNG TRONG THÔNG BÁO CỦA QUÝ KHÁCH. CHÚC QUÝ KHÁCH CÓ MỘT NGÀY MUA SẮM VUI VẺ …</p>\n\n<p>&nbsp;</p>\n\n<p>1. GIỚI THIỆU SẢN PHẨM</p>\n\n<p>Quần tây nam chất vải chống nhăn chống xù cao cấp chính là gợi ý tuyệt vời cho nam giới mỗi khi lựa chọn trang phục mỗi ngày. Với những mẫu quần tây âu nam thiết kế đơn giản và toát lên vẻ lịch lãm tinh tế, mang đến phong cách thời trang trẻ trung, năng động chắc chắn sẽ là lựa chọn hoàn hảo cho chàng trai hiện đại.</p>\n',1,NULL,NULL,NULL,'quan-au-nam-quan-tay-nam-kizawa-cong-so-den-ca-tinh-dang-om-chuan-vai-mong-nhe-dep-khong-nhan-khong-xu',NULL,'Quần âu nam - quần tây nam KIZAWA Công Sở Đen Cá Tính Dáng Ôm Chuẩn Vải Mỏng Nhẹ Đẹp Không Nhăn Không Xù','<p>THÔNG TIN CHI TIẾT</p>\n\n<p>- Tên sản phẩm: quần tây âu nam dáng ôm</p>\n\n<p>- Chất liệu: kết hợp Cotton và PE thấm hút mồ hôi tốt, tạo nên sự thoải mái, mát mẻ khi mặc. Chất vải sờ mịn không bai, không nhăn, không xù giúp quần âu nam đứng phom</p>\n\n<p>- Thiết kế:</p>\n\n<p>+ Kiểu dáng đơn giản, dễ mặc, dễ phối đồ</p>\n\n<p>+ Quy cách, tiêu chuẩn đường may tinh tế, tỉ mỉ trong từng chi tiết</p>\n\n<p>+ Lót cạp chắc chắn, ảm bảo độ bền mặc lâu không bị mòn rách</p>\n\n<p>- Màu sắc: Đen | Xanh than | Ghi sáng | Ghi tối | Kem</p>\n\n<p>- Size: 28 - 29 - 30 - 31 - 32 - 33 - 34 - 35 - 36</p>\n\n<p>(Bạn có thể tham khảo bảng size quần tây nam của Shop. Trường hợp bạn muốn hướng dẫn chọn size, Bạn vui lòng inbox chiều cao, cân nặng để được Shop tư vấn chính xác nhất)</p>\n',7,9,NULL,NULL,NULL),(80,'2024-01-15 16:57:32','2024-01-14 21:04:39','anonymous','admin9193','ACTIVE',450000,'<p>Basic shop chuyên thời trang nam kiểu dáng phù hợp xu hướng , chất lượng sản phẩm đảm bảo , giá cả vừa phải chuyên quần tây nam , sơ mi nam , đồ thời trang nam * THÔNG TIN SẢN PHẨM: - Quần âu nam sẽ giúp các chàng trông chuẩn soái ca. - Trong tủ có e này thì cực dễ phối đồ: sơmi, thun, vest đều đẹp - Chất Liệu: vải tuyết mưa hơi co dãn, mềm , thoáng mát - Chất vải đảm bảo không nhăn nhàu, lên form đứng dáng - Form Chuẩn, khoá giữa, có túi dễ mặc và cực tiện dụng. Quần tây nam đủ size từ 28 đến 36 cho khách từ 45-85 kg mặc vừa</p>\n',1,NULL,NULL,NULL,'quan-au-nam-basic-chat-vai-tuyet-mua-co-gian-4-chieu-dang-om-body-chong-nhan',NULL,'Quần âu nam Basic chất vải tuyết mưa ,co giãn 4 chiều dáng ôm body chống nhăn','<p>HƯỚNG DẪN SỬ DỤNG VÀ BẢO QUẢN - Lần đầu đem về chỉ xả nước lạnh rồi phơi khô để sợi vải và màu không bị xù, phai màu nhé. - Không nên ngâm bột giặt quá lâu. - Lộn trái khi giặt và phơi. - Không sử dụng thuốc tẩy. * BASIC SHOP CAM KẾT: - Shop không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa. - Quần âunam 100% giống mô tả - Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt. - Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng. * Đổi trả theo đúng quy định của Shopee 1. Điều kiện áp dụng (trong vòng 07 ngày kể từ khi nhận sản phẩm): - Hàng hoá vẫn còn mới, chưa qua sử dụng - Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất. 2. Trường hợp được chấp nhận: - Hàng không đúng size, kiểu dáng như quý khách đặt hàng - Không đủ số lượng, không đủ bộ như trong đơn hàng 3. Trường hợp không đủ điều kiện áp dụng chính sách: - Quá 07 ngày kể từ khi Quý khách nhận hàng - Gửi lại hàng không đúng mẫu mã, không phải hàng của shop. - Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,... Ấn theo dõi để ủng hộ shop và tham khảo các sản phẩm mới của shop, rất hân hạnh được phục vụ quý khách. #quanauaosomi #quan #nam #ong #xuong #suong #cong #so #vai #quandai #dai #quannam #quantaynam #quanvai #quanaunam #quanau #quancongso #quanvest #baggynam #quantaynamdep #quantaydihoc #quantaycongso</p>\n',7,7,NULL,NULL,NULL),(81,'2024-01-16 05:29:42','2024-01-14 21:06:35','admin9193','admin9193','ACTIVE',179000,'<p>Tên sản phẩm :Áo Sơ Mi Nam ngắn tay BASIC chất vải cotton mềm mịn thoáng khí nhanh khô Basic shop chuyên thời trang nam kiểu dáng phù hợp xu hướng , chất lượng sản phẩm đảm bảo , giá cả vừa phải chuyên quần tây nam , sơ mi nam , đồ thời trang nam * THÔNG TIN SẢN PHẨM: - Áo sơ mi nam sẽ giúp các chàng trông chuẩn soái ca. - Trong tủ có e này thì cực dễ phối đồ: quần tây, thun, vest đều đẹp - Chất Liệu: Vải cotton co giãn nhẹ, mềm mịn , thoáng mát - Chất vải đảm bảo không nhăn nhàu, lên form đứng dáng Bảng size Áo sơ mi nam : các bạn tham khảo trong ảnh sản phẩm nha</p>\n',1,NULL,NULL,NULL,'ao-so-mi-nam-ngan-tay-basic-chat-vai-cotton-mem-min-thoang-khi-nhanh-kho',NULL,'Áo sơ mi nam ngắn tay BASIC chất vải cotton mềm mịn thoáng khí nhanh khô','<p>HƯỚNG DẪN SỬ DỤNG VÀ BẢO QUẢN - Lần đầu đem về chỉ xả nước lạnh rồi phơi khô để sợi vải và màu không bị xù, phai màu nhé. - Không nên ngâm bột giặt quá lâu. - Lộn trái khi giặt và phơi. - Không sử dụng thuốc tẩy. * BASIC SHOP CAM KẾT: - Shop không bán hàng giả, hàng nhái, chất lượng luôn là hàng đầu để shop có thể phát triển thương hiệu và vươn xa. - Áo sơ mi nam 100% giống mô tả - Tư vấn nhiệt tình, chu đáo luôn lắng nghe khách hàng để phục vụ tốt. - Giao hàng nhanh đúng tiến độ không phải để quý khách chờ đợi lâu để nhận hàng. * Đổi trả theo đúng quy định của Shopee 1. Điều kiện áp dụng (trong vòng 07 ngày kể từ khi nhận sản phẩm): - Hàng hoá vẫn còn mới, chưa qua sử dụng - Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất. 2. Trường hợp được chấp nhận: - Hàng không đúng size, kiểu dáng như quý khách đặt hàng - Không đủ số lượng, không đủ bộ như trong đơn hàng 3. Trường hợp không đủ điều kiện áp dụng chính sách: - Quá 07 ngày kể từ khi Quý khách nhận hàng - Gửi lại hàng không đúng mẫu mã, không phải hàng của shop. - Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,... Ấn theo dõi để ủng hộ shop và tham khảo các sản phẩm mới của shop, rất hân hạnh được phục vụ quý khách.</p>\n',2,10,NULL,NULL,NULL),(82,'2024-01-15 14:08:23','2024-01-14 21:09:56','dinhanhtuan0812','admin9193','ACTIVE',220000,'<p>&nbsp;</p>\n\n<p>♦ Size: S, M ,L , XL, XXL ⏩ Cách chọn size: Shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE • Áo size S dành cho các bạn tương ứng với số cân nặng từ 40 -48kg. • Áo size M dành cho các bạn tương ứng với số cân nặng từ 48 -56kg • Áo size L dành cho các bạn tương ứng với số cân nặng từ 56 -67kg. • Áo size XL dành cho các bạn tương ứng với số cân nặng từ 68 -75kg. • Áo size XXL dành cho các bạn tương ứng với số cân nặng từ 75 -84kg. ÁO HOODIE NỈ CHẤT DÀY DẶN - Chất liệu nỉ ngoại mềm mịn dày dặn, co giãn, thông thoáng, đảm bảo cảm giác thoải mái, dễ chịu khi mặc. - đường may tỉ mỉ, chắc chắn.</p>\n',1,NULL,NULL,NULL,'ao-hoodie-ni-form-rong-unisex-nam-nu-hoodie-zip-interbreak-nhieu-mau-form-rong-unisex-nam',NULL,'Áo Hoodie Nỉ Form Rộng Unisex Nam Nữ Hoodie Zip INTERBREAK Nhiều Màu Form Rộng Unisex Nam','<p>? LƯU Ý: ? Quý Khách vui lòng đọc kỹ Thông Tin Sản Phẩm trước khi đặt hàng, tránh đặt rồi hủy hàng nhé, hoặc có hủy thì hủy sớm trước khi đơn hàng đưa vận chuyển nhé. Vì sau khi đặt hàng, hàng sẽ được Shop gói và gửi đi liền trong ngày hoặc ngày hôm sau. Vì thế việc hủy hàng sẽ gây nhiều khó khăn cho Shop. Rất mong Quý Khách cảm thông và đắn đo giúp Shop!!! ? Theo quy định của Shopee Khách hàng sẽ KHÔNG ĐƯỢC XEM HÀNG trước khi thanh toán nhưng được đổi trả sau 24h nếu sản phẩm bị lỗi tính từ thời điểm nhận được hàng. Hãy chắc chắn nhận hàng và để thông tin chính xác khi ấn Mua hàng tránh trường hợp giao đi rồi lại quay về.</p>\n',4,3,NULL,NULL,NULL),(83,'2024-01-15 18:15:07','2024-01-15 13:46:34','nguyenthikhanhlinh1711','admin9193','ACTIVE',198000,'<p>- Áo phông nam là sự lựa chọn hoàn hảo cho các chàng trai. Áo màu trung tính rất dễ mặc, form áo vừa vặn cơ thể, thoải mái theo từng cử động.</p>\n\n<p>- Màu sắc trung tính và phối màu tuyệt vời mà rất ít áo có tạo nên sự dễ dàng trong việc phối đồ và tạo ra cho mình nhiều phong cách khác nhau.</p>\n\n<p>- Áo được làm từ chất liệu cotton co giãn với bề mặt vải mềm mại, thấm hút mồ hôi tốt tạo cảm giác thoải mái, thoáng mát cho người mặc. Đây cũng là chất liệu dễ giặt sạch, giúp bạn tiết kiệm một khoảng thời gian đáng kể.</p>\n\n<p>- Áo chống nhăn tốt, dễ giặt sạch, nhanh khô.</p>\n\n<p>-Giặt tay hay giặt máy thoải mái không sợ ra màu, nhăn , mất form</p>\n',1,NULL,NULL,NULL,'ao-thun-co-tron-thiet-ke-tay-ngan-chat-vai-mem-min-thoai-mai-cb02',NULL,'Áo Thun Cổ Tròn Thiết Kế Tay Ngắn Chất Vải Mềm Mịn Thoải Mái CB02','<p>- Chất liệu: 100% chất cotton cá sấu, thấm hút mồ hôi , giặt không ra màu , không mất form</p>\n\n<p>- Các Size M - L- XL- XXL</p>\n\n<p>&nbsp;</p>\n\n<p>+ Size M : 53 - 63 kg cao 1m55 - 1m67</p>\n\n<p>+ Size L : 64 - 70kg cao 1m63 - 1m75</p>\n\n<p>+ Size XL : 71- 78kg cao 1m65 - 1m77</p>\n\n<p>+ Size XXL : 79 - 87kg cao 1m68 - 1m85</p>\n\n<p>- Form áo regular dễ phối đồ</p>\n',1,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nguoitao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,NULL,'2023-12-12 17:10:41',NULL,'admin9193','ACTIVE','2L02kJ.jpg'),(2,NULL,'2023-12-12 17:10:52',NULL,'admin9193','ACTIVE','EPfLbE.jpg'),(3,'2023-12-18 03:41:56','2023-12-18 03:41:45','khanhlinh4878','khanhlinh4878','INACTIVE','Jl84hB.jpg');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thongtinmuahang`
--

DROP TABLE IF EXISTS `thongtinmuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongtinmuahang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `diachi` varchar(255) DEFAULT NULL,
  `idhuyen` int DEFAULT NULL,
  `idthanhpho` int DEFAULT NULL,
  `idxa` int DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `sonha` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdbn26ymw7iskh3x4obhqilti3` (`idkhachhang`),
  CONSTRAINT `FKdbn26ymw7iskh3x4obhqilti3` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongtinmuahang`
--

LOCK TABLES `thongtinmuahang` WRITE;
/*!40000 ALTER TABLE `thongtinmuahang` DISABLE KEYS */;
INSERT INTO `thongtinmuahang` VALUES (26,NULL,'2024-01-16 05:24:54',NULL,'nguyenthikhanhlinh1711','ACTIVE','mầm non yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam',2270,267,231010,'0979386056','mầm non yên lương','Khánh Linh',3),(27,NULL,'2024-01-16 06:05:50',NULL,'dinhtuananh0183','DEFAULT','12, Xã Yên Trị, Huyện Yên Thủy, Hòa Bình, Vietnam',2270,267,231013,'0384082003','12','Tuấn',5),(28,NULL,'2024-01-16 06:24:37',NULL,'nguyenthikhanhlinh1711',NULL,'yên lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam',2270,267,231010,'0979386056','yên lương','Linh',3),(29,NULL,'2024-01-16 06:25:17',NULL,'nguyenthikhanhlinh1711','DEFAULT','xóm Yên Lương, Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam',2270,267,231010,'0979386056','xóm Yên Lương','Khánh Linh',3),(30,NULL,'2024-01-16 06:49:08',NULL,'dangngocthanh0133','DEFAULT','mầm non , Xã Ngọc Lương, Huyện Yên Thủy, Hòa Bình, Vietnam',2270,267,231010,'0384082003','mầm non ','Linh',1),(31,NULL,'2024-01-16 06:49:32',NULL,'dangngocthanh0133','ACTIVE','số 12, Xã Tống Trân, Huyện Phù Cừ, Hưng Yên, Vietnam',2194,268,220714,'0987654322','số 12','Tuấn',1);
/*!40000 ALTER TABLE `thongtinmuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoctinh`
--

DROP TABLE IF EXISTS `thuoctinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoctinh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `idsanpham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpe2rbqisgm92mmclx5ddxr5te` (`idsanpham`),
  CONSTRAINT `FKpe2rbqisgm92mmclx5ddxr5te` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoctinh`
--

LOCK TABLES `thuoctinh` WRITE;
/*!40000 ALTER TABLE `thuoctinh` DISABLE KEYS */;
INSERT INTO `thuoctinh` VALUES (1,NULL,'2023-11-22 16:26:02',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',1),(2,NULL,'2023-11-22 16:26:03',NULL,'admin9193','ACTIVE','size','Size',1),(5,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',3),(6,NULL,'2023-11-22 16:34:35',NULL,'admin9193','ACTIVE','size','Size',3),(9,NULL,'2023-11-27 02:22:02',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',5),(10,NULL,'2023-11-27 02:22:06',NULL,'admin9193','ACTIVE','size','Size',5),(13,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',8),(14,NULL,'2023-11-27 02:43:46',NULL,'admin9193','ACTIVE','size','Size',8),(15,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',9),(16,NULL,'2023-11-27 02:46:17',NULL,'admin9193','ACTIVE','size','Size',9),(17,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',10),(18,NULL,'2023-11-27 02:48:58',NULL,'admin9193','ACTIVE','size','Size',10),(19,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',11),(20,NULL,'2023-11-27 02:53:09',NULL,'admin9193','ACTIVE','size','Size',11),(21,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',12),(22,NULL,'2023-11-27 02:56:20',NULL,'admin9193','ACTIVE','size','Size',12),(33,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',18),(34,NULL,'2023-11-27 03:03:37',NULL,'admin9193','ACTIVE','size','Size',18),(35,NULL,'2023-11-27 03:06:11',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',19),(40,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',22),(41,NULL,'2023-11-27 03:16:46',NULL,'admin9193','ACTIVE','size','Size',22),(42,NULL,'2023-11-27 03:20:51',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',23),(43,NULL,'2023-11-27 03:25:03',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',24),(47,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',26),(48,NULL,'2023-11-27 03:36:20',NULL,'admin9193','ACTIVE','size','Size',26),(49,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',27),(50,NULL,'2023-11-27 03:40:53',NULL,'admin9193','ACTIVE','size','Size',27),(51,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',28),(52,NULL,'2023-11-27 15:27:16',NULL,'admin9193','ACTIVE','size','Size',28),(53,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',29),(54,NULL,'2023-11-27 15:39:14',NULL,'admin9193','ACTIVE','size','Size',29),(55,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',30),(56,NULL,'2023-11-27 15:42:19',NULL,'admin9193','ACTIVE','size','Size',30),(57,NULL,'2023-11-27 15:44:42',NULL,'admin9193','ACTIVE','size','Size',31),(58,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',32),(59,NULL,'2023-11-27 15:47:45',NULL,'admin9193','ACTIVE','size','Size',32),(60,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',33),(61,NULL,'2023-11-27 15:55:39',NULL,'admin9193','ACTIVE','size','Size',33),(62,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',34),(63,NULL,'2023-11-27 16:02:20',NULL,'admin9193','ACTIVE','size','Size',34),(64,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',35),(65,NULL,'2023-11-27 16:07:29',NULL,'admin9193','ACTIVE','size','Size',35),(66,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',36),(67,NULL,'2023-11-27 16:11:30',NULL,'admin9193','ACTIVE','size','Size',36),(68,NULL,'2023-11-27 16:18:34',NULL,'admin9193','ACTIVE','size','Size',37),(69,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',38),(70,NULL,'2023-11-27 16:24:18',NULL,'admin9193','ACTIVE','size','Size',38),(71,NULL,'2023-11-27 16:29:04',NULL,'admin9193','ACTIVE','size','Size',39),(72,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','size','Size',41),(73,NULL,'2023-11-27 16:48:19',NULL,'admin9193','ACTIVE','size','Size',42),(74,NULL,'2023-12-09 05:23:48',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',43),(75,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','size','Size',43),(76,NULL,'2023-12-09 05:23:49',NULL,'admin9193','ACTIVE','mau-hinh','Mẫu Hình',43),(86,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',47),(87,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','size','Size',47),(88,NULL,'2023-12-09 05:35:35',NULL,'admin9193','ACTIVE','bieu-tuong','Biểu Tượng',47),(93,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',49),(94,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','size','Size',49),(95,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','chat-lieu','Chất Liệu',49),(96,NULL,'2023-12-09 05:47:44',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',49),(97,NULL,'2023-12-17 06:14:05',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',50),(100,NULL,'2023-12-18 07:46:17',NULL,'admin9193','ACTIVE','size','Size',56),(101,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','size','Size',57),(102,NULL,'2023-12-19 04:44:28',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',57),(103,NULL,'2023-12-19 05:54:26',NULL,'admin9193','ACTIVE','size','Size',58),(108,NULL,'2023-12-19 08:38:08',NULL,'admin9193','ACTIVE','phu-kien','Phụ kiện',61),(109,NULL,'2023-12-19 08:38:08',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',61),(116,NULL,'2024-01-01 03:33:46',NULL,'admin9193','ACTIVE','size','Size',62),(124,NULL,'2023-11-27 16:40:54',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',40),(127,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',69),(128,NULL,'2024-01-10 09:28:04',NULL,'admin9193','ACTIVE','kich-co','Kích cỡ',69),(139,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','size','Size',59),(140,NULL,'2024-01-11 15:57:37',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',59),(141,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',64),(142,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','size','Size',64),(143,NULL,'2024-01-11 16:43:01',NULL,'admin9193','ACTIVE','chat-lieu','Chất Liệu',64),(144,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',46),(145,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','size','Size',46),(146,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','chat-lieu','Chất Liệu',46),(147,NULL,'2024-01-11 17:43:34',NULL,'admin9193','ACTIVE','phu-kien','Phụ kiện',46),(148,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',60),(149,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','size','Size',60),(150,NULL,'2024-01-11 17:51:11',NULL,'admin9193','ACTIVE','mau-hinh','Mẫu Hình',60),(159,NULL,'2024-01-12 16:18:35',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',68),(160,NULL,'2024-01-12 16:18:36',NULL,'admin9193','ACTIVE','size','Size',68),(161,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',51),(162,NULL,'2024-01-12 16:29:59',NULL,'admin9193','ACTIVE','size','Size',51),(163,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',48),(164,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','size','Size',48),(165,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','chat-lieu','Chất Liệu',48),(166,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','mau-hinh','Mẫu Hình',48),(167,NULL,'2024-01-12 16:31:45',NULL,'admin9193','ACTIVE','kieu-co-ao','Kiểu Cổ Áo',48),(168,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','size','Size',63),(169,NULL,'2024-01-12 17:02:35',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',63),(173,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',70),(174,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','kich-co','Kích cỡ',70),(175,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','chat-lieu','Chất liệu',70),(176,NULL,'2024-01-12 18:08:54',NULL,'admin9193','ACTIVE','kieu-co-ao','Kiểu Cổ Áo',70),(177,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',65),(178,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','size','Size',65),(179,NULL,'2024-01-12 18:10:42',NULL,'admin9193','ACTIVE','chat-lieu','Chất Liệu',65),(180,NULL,'2024-01-13 13:59:50',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',45),(181,NULL,'2024-01-13 13:59:50',NULL,'admin9193','ACTIVE','size','Size',45),(182,NULL,'2024-01-13 13:59:50',NULL,'admin9193','ACTIVE','kieu-co-ao','Kiểu Cổ Áo',45),(183,NULL,'2024-01-13 13:59:50',NULL,'admin9193','ACTIVE','mau-hinh','Mẫu Hình',45),(184,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','size','Size',71),(185,NULL,'2024-01-13 19:08:29',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',71),(186,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',72),(187,NULL,'2024-01-13 19:10:48',NULL,'admin9193','ACTIVE','size','Size',72),(190,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','size','Size',74),(191,NULL,'2024-01-13 19:16:27',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',74),(192,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',75),(193,NULL,'2024-01-13 19:19:31',NULL,'admin9193','ACTIVE','size','Size',75),(200,NULL,'2024-01-14 09:12:32',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',2),(201,NULL,'2024-01-14 09:12:32',NULL,'admin9193','ACTIVE','size','Size',2),(202,NULL,'2024-01-14 09:12:32',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',2),(203,NULL,'2024-01-14 09:14:41',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',4),(204,NULL,'2024-01-14 09:14:41',NULL,'admin9193','ACTIVE','size','Size',4),(205,NULL,'2024-01-14 09:14:41',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',4),(206,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','size','Size',76),(207,NULL,'2024-01-14 10:10:07',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',76),(208,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',25),(209,NULL,'2024-01-14 18:26:08',NULL,'admin9193','ACTIVE','size','Size',25),(210,NULL,'2024-01-14 19:49:10',NULL,'admin9193','ACTIVE','mau-sac','Màu sắc',77),(211,NULL,'2024-01-14 19:49:11',NULL,'admin9193','ACTIVE','size','Size',77),(212,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',78),(213,NULL,'2024-01-14 20:36:57',NULL,'admin9193','ACTIVE','kich-co','Kích cỡ',78),(214,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',79),(215,NULL,'2024-01-14 20:57:14',NULL,'admin9193','ACTIVE','size','Size',79),(216,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','size','Size',80),(217,NULL,'2024-01-14 21:04:39',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',80),(218,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','size','Size',81),(219,NULL,'2024-01-14 21:06:35',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',81),(220,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','size','Size',82),(221,NULL,'2024-01-14 21:09:56',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',82),(222,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','size','Size',73),(223,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',73),(224,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',73),(225,NULL,'2024-01-15 07:25:49',NULL,'admin9193','ACTIVE','phu-kien','Phụ kiện',73),(226,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',44),(227,NULL,'2024-01-15 07:37:39',NULL,'admin9193','ACTIVE','size','Size',44),(228,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',83),(229,NULL,'2024-01-15 13:46:34',NULL,'admin9193','ACTIVE','size','Size',83),(230,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',14),(231,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','size','Size',14),(232,NULL,'2024-01-15 17:52:05',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',14),(233,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','mau-sac','Màu Sắc',7),(234,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','size','Size',7),(235,NULL,'2024-01-16 06:38:32',NULL,'admin9193','ACTIVE','kieu-dang','Kiểu Dáng',7);
/*!40000 ALTER TABLE `thuoctinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuonghieu`
--

DROP TABLE IF EXISTS `thuonghieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuonghieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `slug` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s0mvror9u635ragoc5rwiuueh` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuonghieu`
--

LOCK TABLES `thuonghieu` WRITE;
/*!40000 ALTER TABLE `thuonghieu` DISABLE KEYS */;
INSERT INTO `thuonghieu` VALUES (1,NULL,'2023-11-19 17:04:30',NULL,'admin9193','ACTIVE','lovito','Lovito'),(2,NULL,'2023-11-19 17:05:06',NULL,'admin9193','ACTIVE','miucho','Miucho'),(3,NULL,'2023-11-19 17:08:28',NULL,'admin9193','ACTIVE','tingoan','tingoan'),(4,NULL,'2023-11-19 17:08:28',NULL,'admin9193','ACTIVE','zhu-xia','Zhu Xia'),(5,'2023-12-18 03:25:14','2023-11-19 17:08:29','khanhlinh4878','admin9193','ACTIVE','boo','boo'),(6,NULL,'2023-11-19 17:08:30',NULL,'admin9193','ACTIVE','miaa','MIAA'),(7,'2023-12-18 04:12:05','2023-11-19 17:08:30','admin9193','admin9193','ACTIVE','avocado','AVOCADO'),(8,NULL,'2023-11-19 17:08:31',NULL,'admin9193','ACTIVE','choobe','Choobe'),(9,'2023-12-18 04:12:12','2023-11-19 17:08:32','admin9193','admin9193','ACTIVE','h-m','H&M'),(10,NULL,'2023-11-19 17:08:32',NULL,'admin9193','ACTIVE','m2','M2');
/*!40000 ALTER TABLE `thuonghieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tichdiem`
--

DROP TABLE IF EXISTS `tichdiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tichdiem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `sodiem` int DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3cn0i0s6nyyqp3m7fb1uwyqv0` (`idkhachhang`),
  CONSTRAINT `FK3cn0i0s6nyyqp3m7fb1uwyqv0` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tichdiem`
--

LOCK TABLES `tichdiem` WRITE;
/*!40000 ALTER TABLE `tichdiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tichdiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timkiemsanpham`
--

DROP TABLE IF EXISTS `timkiemsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timkiemsanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `timkiem` varchar(255) DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK161yq4goo29oj75tlqc3xkfq1` (`idkhachhang`),
  CONSTRAINT `FK161yq4goo29oj75tlqc3xkfq1` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timkiemsanpham`
--

LOCK TABLES `timkiemsanpham` WRITE;
/*!40000 ALTER TABLE `timkiemsanpham` DISABLE KEYS */;
INSERT INTO `timkiemsanpham` VALUES (1,NULL,'2023-11-21 04:39:08',NULL,'dangngocthanh0133','ACTIVE','áo thun',1),(2,NULL,'2023-11-21 04:39:59',NULL,'dangngocthanh0133','ACTIVE','áo khoác',1),(3,NULL,'2023-11-21 04:39:59',NULL,'dangngocthanh0133','ACTIVE','quần âu',1),(4,NULL,'2023-11-21 04:40:08',NULL,'dangngocthanh0133','ACTIVE','quần bó',1);
/*!40000 ALTER TABLE `timkiemsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trangthaigiaohang`
--

DROP TABLE IF EXISTS `trangthaigiaohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trangthaigiaohang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nguoitao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  `tentrangthai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idgiaohang` bigint DEFAULT NULL,
  `magiaohang` bigint DEFAULT NULL,
  `trangthaihoadon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5xq4329do0ec9v495gnmyv157` (`idgiaohang`),
  KEY `FKjjhu2d0nug7uqy9qqbaqjqf0a` (`magiaohang`),
  CONSTRAINT `FK5xq4329do0ec9v495gnmyv157` FOREIGN KEY (`idgiaohang`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `FKjjhu2d0nug7uqy9qqbaqjqf0a` FOREIGN KEY (`magiaohang`) REFERENCES `hoadon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trangthaigiaohang`
--

LOCK TABLES `trangthaigiaohang` WRITE;
/*!40000 ALTER TABLE `trangthaigiaohang` DISABLE KEYS */;
INSERT INTO `trangthaigiaohang` VALUES (252,NULL,'2024-01-16 05:25:24',NULL,'nguyenthikhanhlinh1711',NULL,'Đặt hàng',NULL,557,NULL),(253,NULL,'2024-01-16 05:31:09',NULL,'nguyenthikhanhlinh1711',NULL,'Đặt hàng',NULL,559,NULL),(254,NULL,'2024-01-16 05:45:24',NULL,'nguyenthikhanhlinh1711',NULL,'Đặt hàng',NULL,561,NULL),(255,NULL,'2024-01-16 05:57:17',NULL,'nguyenthikhanhlinh1711',NULL,'Đặt hàng',NULL,562,NULL),(256,NULL,'2024-01-16 06:03:31',NULL,'nguyenthikhanhlinh1711',NULL,'Đơn hàng đã huỷ',NULL,559,'Huỷ đơn'),(257,NULL,'2024-01-16 06:05:58',NULL,'dinhtuananh0183',NULL,'Đặt hàng',NULL,563,NULL),(258,NULL,'2024-01-16 06:06:39',NULL,'dinhtuananh0183',NULL,'Đơn hàng đã huỷ',NULL,563,'Huỷ đơn'),(259,NULL,'2024-01-16 06:12:56',NULL,'dinhtuananh0183',NULL,'Đặt hàng',NULL,564,NULL),(260,NULL,'2024-01-16 06:13:09',NULL,'dinhtuananh0183',NULL,'Đặt hàng',NULL,565,NULL),(261,NULL,'2024-01-16 06:13:25',NULL,'dinhtuananh0183',NULL,'Đặt hàng',NULL,566,NULL),(262,NULL,'2024-01-16 06:14:42',NULL,'',NULL,'Đơn hàng đã huỷ',NULL,565,'Huỷ đơn'),(263,NULL,'2024-01-16 06:14:44',NULL,'dinhtuananh0183',NULL,'Đơn hàng đã huỷ',NULL,564,'Huỷ đơn'),(264,NULL,'2024-01-16 06:14:48',NULL,'dinhtuananh0183',NULL,'Đơn hàng đã huỷ',NULL,566,'Huỷ đơn'),(265,NULL,'2024-01-16 06:28:04',NULL,'nguyenthikhanhlinh1711',NULL,'Đặt hàng',NULL,567,' '),(266,NULL,'2024-01-16 06:32:51',NULL,'admin9193',NULL,'Đơn hàng đã huỷ',NULL,567,'Huỷ đơn'),(267,NULL,'2024-01-16 06:49:54',NULL,'dangngocthanh0133',NULL,'Đặt hàng',NULL,568,' '),(268,NULL,'2024-01-16 06:50:03',NULL,'dangngocthanh0133',NULL,'Đơn hàng đã huỷ',NULL,568,'Huỷ đơn');
/*!40000 ALTER TABLE `trangthaigiaohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidientu`
--

DROP TABLE IF EXISTS `vidientu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidientu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) DEFAULT NULL,
  `nguoitao` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT 'ACTIVE',
  `sotien` double DEFAULT NULL,
  `idkhachhang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67k6ih1yc8wc22q9qxgly084r` (`idkhachhang`),
  CONSTRAINT `FK67k6ih1yc8wc22q9qxgly084r` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidientu`
--

LOCK TABLES `vidientu` WRITE;
/*!40000 ALTER TABLE `vidientu` DISABLE KEYS */;
INSERT INTO `vidientu` VALUES (17,'2024-01-16 06:32:51','2024-01-16 05:22:54','admin9193','nguyenthikhanhlinh1711','ACTIVE',325301,3),(18,NULL,'2024-01-16 06:05:14',NULL,'dinhtuananh0183','ACTIVE',0,5),(19,NULL,'2024-01-16 06:48:35',NULL,'dangngocthanh0133','ACTIVE',0,1);
/*!40000 ALTER TABLE `vidientu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_doanhthunam`
--

DROP TABLE IF EXISTS `vw_doanhthunam`;
/*!50001 DROP VIEW IF EXISTS `vw_doanhthunam`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_doanhthunam` AS SELECT 
 1 AS `DoanhThuOnline`,
 1 AS `DoanhThuOffline`,
 1 AS `TongSoSanPhamDaBan`,
 1 AS `SoLuongKhuyenMaiDaBan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_doanhthungay`
--

DROP TABLE IF EXISTS `vw_doanhthungay`;
/*!50001 DROP VIEW IF EXISTS `vw_doanhthungay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_doanhthungay` AS SELECT 
 1 AS `DoanhThuOnline`,
 1 AS `DoanhThuOffline`,
 1 AS `TongSoSanPhamDaBan`,
 1 AS `SoLuongKhuyenMaiDaBan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_doanhthuthang`
--

DROP TABLE IF EXISTS `vw_doanhthuthang`;
/*!50001 DROP VIEW IF EXISTS `vw_doanhthuthang`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_doanhthuthang` AS SELECT 
 1 AS `DoanhThuOnline`,
 1 AS `DoanhThuOffline`,
 1 AS `TongSoSanPhamDaBan`,
 1 AS `SoLuongKhuyenMaiDaBan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_doanhthutuan`
--

DROP TABLE IF EXISTS `vw_doanhthutuan`;
/*!50001 DROP VIEW IF EXISTS `vw_doanhthutuan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_doanhthutuan` AS SELECT 
 1 AS `DoanhThuOnline`,
 1 AS `DoanhThuOffline`,
 1 AS `TongSoSanPhamDaBan`,
 1 AS `SoLuongKhuyenMaiDaBan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_giohangchitiet_summary`
--

DROP TABLE IF EXISTS `vw_giohangchitiet_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_giohangchitiet_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_giohangchitiet_summary` AS SELECT 
 1 AS `id`,
 1 AS `giagoc`,
 1 AS `giagiam`,
 1 AS `thucte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_hoadonchitiet_summary`
--

DROP TABLE IF EXISTS `vw_hoadonchitiet_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_hoadonchitiet_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_hoadonchitiet_summary` AS SELECT 
 1 AS `idhoadon`,
 1 AS `giagoc`,
 1 AS `giagiam`,
 1 AS `thucte`,
 1 AS `tienship`,
 1 AS `tienkhachtra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pricesanpham`
--

DROP TABLE IF EXISTS `vw_pricesanpham`;
/*!50001 DROP VIEW IF EXISTS `vw_pricesanpham`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pricesanpham` AS SELECT 
 1 AS `bientheid`,
 1 AS `sanphamid`,
 1 AS `gia`,
 1 AS `sotiengiam`,
 1 AS `khuyenmaiid`,
 1 AS `thucte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_thongkedshoadon`
--

DROP TABLE IF EXISTS `vw_thongkedshoadon`;
/*!50001 DROP VIEW IF EXISTS `vw_thongkedshoadon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_thongkedshoadon` AS SELECT 
 1 AS `ngay`,
 1 AS `tonghoadonbanduoc`,
 1 AS `tongtienhang`,
 1 AS `soluong`,
 1 AS `soluongkhuyenmai`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_thongkedssp`
--

DROP TABLE IF EXISTS `vw_thongkedssp`;
/*!50001 DROP VIEW IF EXISTS `vw_thongkedssp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_thongkedssp` AS SELECT 
 1 AS `id`,
 1 AS `ten`,
 1 AS `tong`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xoabienthe`
--

DROP TABLE IF EXISTS `xoabienthe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xoabienthe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giagoc` double DEFAULT NULL,
  `giamua` double DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaysua` timestamp NULL DEFAULT NULL,
  `ngaytao` timestamp NULL DEFAULT NULL,
  `nguoisua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nguoitao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  `giatribienthe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mahoadon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `makhachhang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xoabienthe`
--

LOCK TABLES `xoabienthe` WRITE;
/*!40000 ALTER TABLE `xoabienthe` DISABLE KEYS */;
INSERT INTO `xoabienthe` VALUES (57,'SjTivi.jpg',279000,264000,'Áo hoodie nam nữ local brand unisex cặp đôi nỉ ngoại cotton form rộng có mũ xám đen dày oversize CLOUDZY HD PAINT',NULL,'2024-01-16 06:38:32',NULL,'admin9193',NULL,'Be,M','HD562',NULL,3,'ao-hoodie-nam-nu-local-brand-unisex-cap-doi-ni-ngoai-cotton-form-rong-co-mu-xam-den-day-oversize-cloudzy-hd-paint');
/*!40000 ALTER TABLE `xoabienthe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'duantotnghiep'
--

--
-- Dumping routines for database 'duantotnghiep'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_deletechuanbidathang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletechuanbidathang`(IN p_idsp INT)
BEGIN
    -- Delete records from hoadonchitiet and hoadon
      update  hoadon hd 
    JOIN hoadonchitiet hdct ON hdct.idhoadon = hd.id
    JOIN bienthe bt ON hdct.idbienthe = bt.id
	set hd.trangthai = 'CHUANBIXOA'
   WHERE bt.idsanpham = p_idsp AND hd.trangthai = 'CHUANBIDATHANG';
   
   DELETE hdct FROM hoadon hd 
    JOIN hoadonchitiet hdct ON hdct.idhoadon = hd.id where hd.trangthai = 'CHUANBIXOA';
    
    DELETE FROM hoadon hd  where hd.trangthai = 'CHUANBIXOA';

    -- Update records in giohang
    UPDATE giohang gh join giohangchitiet ghct on gh.id = ghct.idgiohang
    SET ghct.trangthai = 'ACTIVE'
    WHERE ghct.idsanpham = p_idsp AND ghct.trangthai = 'PENDING';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_price_hdct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_price_hdct`(IN p_idhd INT, IN p_idkh INT)
BEGIN
    UPDATE hoadonchitiet hdct 
    JOIN vw_pricesanpham sp ON hdct.idbienthe = sp.bientheid
    SET hdct.sotiengiam = IFNULL(sp.sotiengiam, 0)*hdct.soluong, hdct.gia = sp.gia
    WHERE hdct.idhoadon = p_idhd;

    UPDATE hoadonchitiet hdct 
    JOIN vw_pricesanpham sp ON hdct.idbienthe = sp.bientheid
    SET hdct.idkhuyenmai = sp.khuyenmaiid
    WHERE hdct.idhoadon = p_idhd;

    UPDATE hoadonchitiet hdct 
    JOIN vw_pricesanpham sp ON hdct.idbienthe = sp.bientheid
    SET thanhtien = thucte * soluong
    WHERE hdct.idhoadon = p_idhd;

    UPDATE giohangchitiet ghct
    JOIN giohang gh ON gh.id = ghct.idgiohang
    SET ghct.trangthai = 'DELETE'
    WHERE ghct.TRANGTHAI = 'PENDING' AND gh.idkhachhang = p_idkh;
        update bienthe bt
	 join hoadonchitiet hdct on bt.id = hdct.idbienthe 
	 set bt.soluong = (bt.soluong-hdct.soluong)
	where idhoadon = p_idhd;
    
     update khuyenmai km join vw_pricesanpham spkm on km.id = spkm.khuyenmaiid 
 join hoadonchitiet hdct on spkm.bientheid = hdct.idbienthe set km.soluong = km.soluong-hdct.soluong where hdct.idhoadon = p_idhd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_doanhthunam`
--

/*!50001 DROP VIEW IF EXISTS `vw_doanhthunam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_doanhthunam` AS select `doanhthu`.`DoanhThuOnline` AS `DoanhThuOnline`,`doanhthu`.`DoanhThuOffline` AS `DoanhThuOffline`,`soluong`.`TongSoSanPhamDaBan` AS `TongSoSanPhamDaBan`,`soluong`.`SoLuongKhuyenMaiDaBan` AS `SoLuongKhuyenMaiDaBan` from ((select sum((case when (`hd`.`loai` = 'Online') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOnline`,sum((case when (`hd`.`loai` = 'Offline') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOffline` from `hoadon` `hd` where ((year(`hd`.`ngaythanhtoan`) = year(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `doanhthu` join (select sum(`hdct`.`soluong`) AS `TongSoSanPhamDaBan`,sum((case when (`hdct`.`idkhuyenmai` is not null) then `hdct`.`soluong` else 0 end)) AS `SoLuongKhuyenMaiDaBan` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hdct`.`idhoadon` = `hd`.`id`))) where ((year(`hd`.`ngaythanhtoan`) = year(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `soluong`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_doanhthungay`
--

/*!50001 DROP VIEW IF EXISTS `vw_doanhthungay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_doanhthungay` AS select `doanhthu`.`DoanhThuOnline` AS `DoanhThuOnline`,`doanhthu`.`DoanhThuOffline` AS `DoanhThuOffline`,`soluong`.`TongSoSanPhamDaBan` AS `TongSoSanPhamDaBan`,`soluong`.`SoLuongKhuyenMaiDaBan` AS `SoLuongKhuyenMaiDaBan` from ((select sum((case when (`hd`.`loai` = 'Online') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOnline`,sum((case when (`hd`.`loai` = 'Offline') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOffline` from `hoadon` `hd` where ((cast(`hd`.`ngaythanhtoan` as date) = cast(curdate() as date)) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `doanhthu` join (select sum(`hdct`.`soluong`) AS `TongSoSanPhamDaBan`,sum((case when (`hdct`.`idkhuyenmai` is not null) then `hdct`.`soluong` else 0 end)) AS `SoLuongKhuyenMaiDaBan` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hdct`.`idhoadon` = `hd`.`id`))) where ((cast(`hd`.`ngaythanhtoan` as date) = cast(curdate() as date)) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `soluong`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_doanhthuthang`
--

/*!50001 DROP VIEW IF EXISTS `vw_doanhthuthang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_doanhthuthang` AS select `doanhthu`.`DoanhThuOnline` AS `DoanhThuOnline`,`doanhthu`.`DoanhThuOffline` AS `DoanhThuOffline`,`soluong`.`TongSoSanPhamDaBan` AS `TongSoSanPhamDaBan`,`soluong`.`SoLuongKhuyenMaiDaBan` AS `SoLuongKhuyenMaiDaBan` from ((select sum((case when (`hd`.`loai` = 'Online') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOnline`,sum((case when (`hd`.`loai` = 'Offline') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOffline` from `hoadon` `hd` where ((month(`hd`.`ngaythanhtoan`) = month(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `doanhthu` join (select sum(`hdct`.`soluong`) AS `TongSoSanPhamDaBan`,sum((case when (`hdct`.`idkhuyenmai` is not null) then `hdct`.`soluong` else 0 end)) AS `SoLuongKhuyenMaiDaBan` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hdct`.`idhoadon` = `hd`.`id`))) where ((month(`hd`.`ngaythanhtoan`) = month(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `soluong`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_doanhthutuan`
--

/*!50001 DROP VIEW IF EXISTS `vw_doanhthutuan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_doanhthutuan` AS select `doanhthu`.`DoanhThuOnline` AS `DoanhThuOnline`,`doanhthu`.`DoanhThuOffline` AS `DoanhThuOffline`,`soluong`.`TongSoSanPhamDaBan` AS `TongSoSanPhamDaBan`,`soluong`.`SoLuongKhuyenMaiDaBan` AS `SoLuongKhuyenMaiDaBan` from ((select sum((case when (`hd`.`loai` = 'Online') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOnline`,sum((case when (`hd`.`loai` = 'Offline') then `hd`.`tongtienhang` else 0 end)) AS `DoanhThuOffline` from `hoadon` `hd` where ((yearweek(`hd`.`ngaythanhtoan`,0) = yearweek(curdate(),0)) and (month(`hd`.`ngaythanhtoan`) = month(curdate())) and (year(`hd`.`ngaythanhtoan`) = year(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `doanhthu` join (select sum(`hdct`.`soluong`) AS `TongSoSanPhamDaBan`,sum((case when (`hdct`.`idkhuyenmai` is not null) then `hdct`.`soluong` else 0 end)) AS `SoLuongKhuyenMaiDaBan` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hdct`.`idhoadon` = `hd`.`id`))) where ((yearweek(`hd`.`ngaythanhtoan`,0) = yearweek(curdate(),0)) and (month(`hd`.`ngaythanhtoan`) = month(curdate())) and (year(`hd`.`ngaythanhtoan`) = year(curdate())) and (`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG')))) `soluong`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_giohangchitiet_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_giohangchitiet_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_giohangchitiet_summary` AS select `ghct`.`id` AS `id`,sum((`sp`.`gia` * `ghct`.`soluong`)) AS `giagoc`,sum((`sp`.`sotiengiam` * `ghct`.`soluong`)) AS `giagiam`,sum((`sp`.`thucte` * `ghct`.`soluong`)) AS `thucte` from (`giohangchitiet` `ghct` join (select `vw_pricesanpham`.`bientheid` AS `bientheid`,`vw_pricesanpham`.`sanphamid` AS `sanphamid`,`vw_pricesanpham`.`gia` AS `gia`,`vw_pricesanpham`.`sotiengiam` AS `sotiengiam`,`vw_pricesanpham`.`thucte` AS `thucte` from `vw_pricesanpham`) `sp` on((`sp`.`bientheid` = `ghct`.`idbienthe`))) group by `ghct`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hoadonchitiet_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_hoadonchitiet_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hoadonchitiet_summary` AS select `hd`.`idhoadon` AS `idhoadon`,sum(`hd`.`giagoc`) AS `giagoc`,sum(`hd`.`giagiam`) AS `giagiam`,sum(`hd`.`thucte`) AS `thucte`,`ho`.`tienship` AS `tienship`,(sum(`hd`.`thucte`) + `ho`.`tienship`) AS `tienkhachtra` from ((select `hdct`.`idhoadon` AS `idhoadon`,sum((`sp`.`gia` * `hdct`.`soluong`)) AS `giagoc`,ifnull(sum((`sp`.`sotiengiam` * `hdct`.`soluong`)),0) AS `giagiam`,sum((`sp`.`thucte` * `hdct`.`soluong`)) AS `thucte` from (`hoadonchitiet` `hdct` join `vw_pricesanpham` `sp` on((`sp`.`bientheid` = `hdct`.`idbienthe`))) group by `hdct`.`idhoadon`) `hd` left join `hoadon` `ho` on((`hd`.`idhoadon` = `ho`.`id`))) group by `hd`.`idhoadon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pricesanpham`
--

/*!50001 DROP VIEW IF EXISTS `vw_pricesanpham`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pricesanpham` AS select `outer_query`.`bientheid` AS `bientheid`,`outer_query`.`sanphamid` AS `sanphamid`,`outer_query`.`gia` AS `gia`,`outer_query`.`sotiengiam` AS `sotiengiam`,`outer_query`.`khuyenmaiid` AS `khuyenmaiid`,(case when (`outer_query`.`sotiengiam` is null) then `outer_query`.`gia` else (`outer_query`.`gia` - `outer_query`.`sotiengiam`) end) AS `thucte` from (select `inner_query`.`bientheid` AS `bientheid`,`inner_query`.`sanphamid` AS `sanphamid`,`inner_query`.`gia` AS `gia`,(case when (`inner_query`.`khuyenmaiid` is null) then NULL when (`inner_query`.`loai` = 1) then (`inner_query`.`gia` * (`inner_query`.`giatri` / 100)) else (`inner_query`.`gia` - (`inner_query`.`gia` - `inner_query`.`giatri`)) end) AS `sotiengiam`,`inner_query`.`khuyenmaiid` AS `khuyenmaiid` from (select `bt`.`id` AS `bientheid`,`sp`.`id` AS `sanphamid`,(case when (`bt`.`gia` is null) then `sp`.`gia` else `bt`.`gia` end) AS `gia`,`km`.`id` AS `khuyenmaiid`,`km`.`giatri` AS `giatri`,`km`.`loai` AS `loai` from (((`bienthe` `bt` join `sanpham` `sp` on((`sp`.`id` = `bt`.`idsanpham`))) left join `khuyenmaisanpham` `kmsp` on(((`kmsp`.`idsanpham` = `sp`.`id`) and (`kmsp`.`trangthai` not in ('DELETE','EXPIRED'))))) left join `khuyenmai` `km` on(((`km`.`id` = `kmsp`.`idkhuyenmai`) and (`km`.`ngaybatdau` <= now()) and (`km`.`ngayketthuc` >= now()) and (`km`.`soluong` > 0) and (`km`.`trangthai` not in ('DELETE','EXPIRED')))))) `inner_query`) `outer_query` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_thongkedshoadon`
--

/*!50001 DROP VIEW IF EXISTS `vw_thongkedshoadon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_thongkedshoadon` AS select `quer`.`ngay` AS `ngay`,sum(`quer`.`tonghoadonbanduoc`) AS `tonghoadonbanduoc`,sum(`quer`.`tongtienhang`) AS `tongtienhang`,sum(`quer`.`soluong`) AS `soluong`,sum(`quer`.`soluongkhuyenmai`) AS `soluongkhuyenmai` from (select count(`hd`.`id`) AS `tonghoadonbanduoc`,sum(`hd`.`tongtienhang`) AS `tongtienhang`,`hdct`.`TongSoSanPhamDaBan` AS `soluong`,`hdct`.`SoLuongKhuyenMaiDaBan` AS `soluongkhuyenmai`,cast(`hd`.`ngaythanhtoan` as date) AS `ngay` from (`hoadon` `hd` join (select sum(`hdct`.`soluong`) AS `TongSoSanPhamDaBan`,sum((case when (`hdct`.`idkhuyenmai` is not null) then `hdct`.`soluong` else 0 end)) AS `SoLuongKhuyenMaiDaBan`,`hdct`.`idhoadon` AS `idhd` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hdct`.`idhoadon` = `hd`.`id`))) group by `hdct`.`idhoadon`) `hdct` on((`hd`.`id` = `hdct`.`idhd`))) where ((`hd`.`trangthai` not in ('HUYDON','TREO')) and ((`hd`.`phuongthucthanhtoan` in ('VIDIENTU','CHUYENKHOAN','TIENMAT')) or (`hd`.`trangthai` = 'DANHANHANG') or (`hd`.`trangthai` = 'THANHCONG'))) group by `ngay`,`hdct`.`TongSoSanPhamDaBan`,`hdct`.`SoLuongKhuyenMaiDaBan`) `quer` group by `quer`.`ngay` order by `quer`.`ngay` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_thongkedssp`
--

/*!50001 DROP VIEW IF EXISTS `vw_thongkedssp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_thongkedssp` AS select `sp`.`id` AS `id`,`sp`.`ten` AS `ten`,sum(`hdct`.`soluong`) AS `tong` from ((((`hoadonchitiet` `hdct` join `bienthe` `bt` on((`hdct`.`idbienthe` = `bt`.`id`))) join `sanpham` `sp` on((`sp`.`id` = `bt`.`idsanpham`))) join `hoadon` `hd` on((`hd`.`id` = `hdct`.`idhoadon`))) join (select count(`hdct`.`soluong`) AS `tongsospban`,`hdct`.`idsanpham` AS `idsp` from (`hoadonchitiet` `hdct` join `hoadon` `hd` on((`hd`.`id` = `hdct`.`idhoadon`))) group by `hdct`.`idsanpham` order by `tongsospban` desc) `spbannhieunhat` on((`sp`.`id` = `spbannhieunhat`.`idsp`))) group by `sp`.`id`,`sp`.`ten` order by `tong` desc */;
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

-- Dump completed on 2024-08-12 19:01:41
