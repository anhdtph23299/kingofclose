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

-- Dump completed on 2024-08-12 19:23:15
