-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: smarthome_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `attributegroups`
--

DROP TABLE IF EXISTS `attributegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributegroups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `fk_attributegroup_category` (`category_id`),
  CONSTRAINT `fk_attributegroup_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributegroups`
--

LOCK TABLES `attributegroups` WRITE;
/*!40000 ALTER TABLE `attributegroups` DISABLE KEYS */;
INSERT INTO `attributegroups` VALUES (1,'Thông tin sản phẩm',100000,3),(2,'Mức tiêu thụ điện năng',200000,3),(3,'Khả năng lọc không khí',300000,3),(4,'Công nghệ làm lạnh',400000,3),(5,'Tiện ích',500000,3),(6,'Thông số kichthước/lắp đặt',600000,3),(7,'Tổng quan',100000,5),(8,'Mức tiêu thụ điện năng',200000,5),(9,'Công nghệ giặc',300000,5),(10,'Bảng điều khiển và tiện ích',400000,5),(11,'Thông tin lắp đặt',500000,5),(12,'Tổng quan',100000,1),(13,'Mức tiêu thụ điện năng',200000,1),(14,'Công nghệ bảo quản và làm lạnh',300000,1),(15,'Tiện ích',400000,1),(16,'Thông tin lắp đặt',500000,1);
/*!40000 ALTER TABLE `attributegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'samsung','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2Fsamsung.png?alt=media&token=b27565ec-cec4-451b-b3aa-062909a36b6c',NULL),(2,'sony','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2Fsony.png?alt=media&token=b645df7f-0dae-4296-aee4-6fdcc832819f',NULL),(3,'aqua','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752981259506_wojkn0rp1f.png?alt=media&token=6e9889c9-da66-4488-a73b-af4297b3f0cd',NULL),(4,'toshiba','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752981513267_xrhrdgf50kc.png?alt=media&token=fc2e3ab2-1a24-4780-bee9-abd3ec9585d8',NULL),(5,'lg','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752981634886_0rnwc0mhulk.png?alt=media&token=f4aab511-579f-4294-94da-868fa7d30a98',NULL),(6,'senko','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752989055055_bxtdrmxcoga.png?alt=media&token=01c9bf64-7cca-4d51-955f-6bc7a71ea00e',NULL),(7,'sharp','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752989149198_cnzjy0kyf8j.png?alt=media&token=e25202f9-1b0b-4f3a-89c4-d056d822e393',NULL),(8,'tlc','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752989191421_ffdih54uj3l.png?alt=media&token=03ec2d3f-e594-4df4-827b-0ff326522757',NULL),(9,'hitachi','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752989226004_bbpj3hh5gqa.png?alt=media&token=fca9af12-9cef-4305-9bd5-081d274a6e65',NULL),(10,'misubishi','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1752989423363_kk2h10usd5c.png?alt=media&token=ae7a12cb-b213-42fc-a4fa-3248fe61361d',NULL),(11,'AUX','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbrand%2F1753251728608_9zvylvmo23p.png?alt=media&token=5ef26406-75fb-4507-96f9-b0a26ad32074',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_id`),
  KEY `fk_cart_items_variant_id` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (16,7,37,1,6940000.00,'2025-07-25 11:16:33','2025-07-25 11:16:33'),(17,7,37,1,6990000.00,'2025-07-25 11:16:46','2025-07-25 11:16:46'),(18,7,37,1,7780000.00,'2025-07-25 11:16:59','2025-07-25 11:16:59'),(19,7,37,1,7830000.00,'2025-07-25 11:17:09','2025-07-25 11:17:09'),(20,7,37,1,7490000.00,'2025-07-25 11:18:39','2025-07-25 11:19:02'),(21,7,37,5,7040000.00,'2025-07-25 11:19:58','2025-07-25 11:34:10'),(22,10,37,1,7040000.00,'2025-07-25 11:20:41','2025-07-25 11:20:41'),(23,11,37,1,7040000.00,'2025-07-25 11:24:57','2025-07-25 11:24:57'),(24,12,37,1,7040000.00,'2025-07-25 11:26:47','2025-07-25 11:26:47');
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitemservices`
--

DROP TABLE IF EXISTS `cartitemservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitemservices` (
  `cart_item_service_id` int NOT NULL AUTO_INCREMENT,
  `cart_item_id` int NOT NULL,
  `package_service_item_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_service_id`),
  UNIQUE KEY `uc_cart_item_package_service_item` (`cart_item_id`,`package_service_item_id`),
  KEY `fk_cart_item_services_package_service_item_id` (`package_service_item_id`),
  CONSTRAINT `fk_cart_item_services_cart_item_id` FOREIGN KEY (`cart_item_id`) REFERENCES `cartitems` (`cart_item_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_item_services_package_service_item_id` FOREIGN KEY (`package_service_item_id`) REFERENCES `packageserviceitems` (`package_service_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitemservices`
--

LOCK TABLES `cartitemservices` WRITE;
/*!40000 ALTER TABLE `cartitemservices` DISABLE KEYS */;
INSERT INTO `cartitemservices` VALUES (33,16,44,350000.00,'2025-07-25 11:16:33','2025-07-25 11:16:33'),(34,17,44,350000.00,'2025-07-25 11:16:46','2025-07-25 11:16:46'),(35,17,45,50000.00,'2025-07-25 11:16:46','2025-07-25 11:16:46'),(36,18,51,200000.00,'2025-07-25 11:16:59','2025-07-25 11:16:59'),(37,18,47,350000.00,'2025-07-25 11:16:59','2025-07-25 11:16:59'),(38,18,52,640000.00,'2025-07-25 11:16:59','2025-07-25 11:16:59'),(39,19,51,200000.00,'2025-07-25 11:17:09','2025-07-25 11:17:09'),(40,19,47,350000.00,'2025-07-25 11:17:09','2025-07-25 11:17:09'),(41,19,50,50000.00,'2025-07-25 11:17:09','2025-07-25 11:17:09'),(42,19,52,640000.00,'2025-07-25 11:17:09','2025-07-25 11:17:09'),(43,20,43,550000.00,'2025-07-25 11:18:39','2025-07-25 11:18:39'),(44,20,44,350000.00,'2025-07-25 11:18:39','2025-07-25 11:18:39'),(45,21,44,350000.00,'2025-07-25 11:19:58','2025-07-25 11:19:58'),(46,21,45,50000.00,'2025-07-25 11:19:58','2025-07-25 11:19:58'),(47,21,46,50000.00,'2025-07-25 11:19:58','2025-07-25 11:19:58'),(48,22,44,350000.00,'2025-07-25 11:20:41','2025-07-25 11:20:41'),(49,22,45,50000.00,'2025-07-25 11:20:41','2025-07-25 11:20:41'),(50,22,46,50000.00,'2025-07-25 11:20:41','2025-07-25 11:20:41'),(51,23,44,350000.00,'2025-07-25 11:24:57','2025-07-25 11:24:57'),(52,23,45,50000.00,'2025-07-25 11:24:57','2025-07-25 11:24:57'),(53,23,46,50000.00,'2025-07-25 11:24:57','2025-07-25 11:24:57'),(54,24,44,350000.00,'2025-07-25 11:26:47','2025-07-25 11:26:47'),(55,24,45,50000.00,'2025-07-25 11:26:47','2025-07-25 11:26:47'),(56,24,46,50000.00,'2025-07-25 11:26:47','2025-07-25 11:26:47');
/*!40000 ALTER TABLE `cartitemservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cart_id` int NOT NULL AUTO_INCREMENT COMMENT 'ID tự động tăng cho giỏ hàng',
  `user_id` int DEFAULT NULL COMMENT 'ID của người dùng nếu giỏ hàng thuộc về người dùng đã đăng nhập',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'ID của session nếu là giỏ hàng tạm thời cho khách chưa đăng nhập',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `uc_user_cart` (`user_id`),
  UNIQUE KEY `uc_session_cart` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (7,2,NULL,'2025-07-25 11:16:33','2025-07-25 11:16:33');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `slogan` text,
  `banner` varchar(255) DEFAULT NULL,
  `showable` tinyint(1) DEFAULT '1',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tủ lạnh',100000,NULL,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2FGemini_Generated_Image_y853pay853pay853.png?alt=media&token=8b30ae0f-eaa1-4852-a705-5d6a26f44c81',1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2Fsvgviewer-png-output.png?alt=media&token=ca27675b-e53b-4f90-93af-924ac12429ea'),(2,'Tivi',200000,NULL,NULL,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2Fsvgviewer-png-output%20(3).png?alt=media&token=9a7c7b35-12d4-4dfa-99b0-458c827a942e'),(3,'Máy lạnh',300000,NULL,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2FGemini_Generated_Image_x3x7ibx3x7ibx3x7.png?alt=media&token=685f8ce6-7e98-4ba7-821c-f07f5c1b09fb',1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2Fsvgviewer-png-output%20(1).png?alt=media&token=2ee6fa12-724c-4842-a327-ea796af9ab3b'),(4,'Điện thoại',400000,NULL,NULL,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2Fsvgviewer-png-output%20(6).png?alt=media&token=a8bd3a60-fb95-445b-9c9c-16ba59d30be2'),(5,'Máy giặc',500000,'Giặc giũ nhẹ nhàng cuộc sống thảnh thơi','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2F1753110752200_eqj1o343xm.png?alt=media&token=0a8edf17-7378-4a32-b6db-faab02f340af',1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2F1753110749797_vjo79mx4x9p.png?alt=media&token=a535e048-35fd-4959-9877-72c4dd361f1f'),(6,'Quạt',600000,'Hơi thở của gió, thổi bùng năng lượng.','https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2F1753111020985_jt95nqoiiq9.png?alt=media&token=b914df98-c72b-49a2-972e-da18e33965e0',1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fcategory%2F1753111019595_h2z26dg0x5.png?alt=media&token=941990a3-aac4-406b-9f1d-2314dea9d422');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_comment_id` (`parent_comment_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `is_filterable` tinyint(1) DEFAULT '0',
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Dung tích',1,1),(2,'Số lượng ngăn',1,1),(3,'Vị trí ngăn',1,1),(4,'Kích thước màn hình',1,2),(6,'Mã lực',1,3),(7,'Màu',1,4),(8,'Bộ nhớ trong',1,4),(9,'Ram',1,4),(10,'Khối lượng',1,5);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionvalues`
--

DROP TABLE IF EXISTS `optionvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionvalues` (
  `option_value_id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `option_value_name` varchar(255) NOT NULL,
  PRIMARY KEY (`option_value_id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `optionvalues_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionvalues`
--

LOCK TABLES `optionvalues` WRITE;
/*!40000 ALTER TABLE `optionvalues` DISABLE KEYS */;
INSERT INTO `optionvalues` VALUES (17,10,'8.5 KG'),(18,10,'9.5 KG'),(19,6,'1HP'),(20,6,'1.5HP'),(21,6,'2HP'),(22,6,'2.5HP');
/*!40000 ALTER TABLE `optionvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `total_item_price` decimal(10,2) NOT NULL,
  `item_status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `guest_email` varchar(255) DEFAULT NULL,
  `shipping_address` text NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  `order_total` decimal(10,2) NOT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'unpaid',
  `shipping_cost` decimal(10,2) DEFAULT '0.00',
  `coupon_code` varchar(50) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `ordered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tracking_number` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packageserviceitems`
--

DROP TABLE IF EXISTS `packageserviceitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packageserviceitems` (
  `package_service_item_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `service_id` int NOT NULL,
  `item_price_impact` decimal(10,2) NOT NULL,
  `at_least_one` tinyint(1) NOT NULL DEFAULT '0',
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`package_service_item_id`),
  UNIQUE KEY `package_id` (`package_id`,`service_id`),
  KEY `fk_packageitem_service` (`service_id`),
  CONSTRAINT `fk_packageitem_package` FOREIGN KEY (`package_id`) REFERENCES `servicepackages` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_packageitem_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageserviceitems`
--

LOCK TABLES `packageserviceitems` WRITE;
/*!40000 ALTER TABLE `packageserviceitems` DISABLE KEYS */;
INSERT INTO `packageserviceitems` VALUES (38,22,11,0.00,0,0,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(39,23,9,500000.00,1,1,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(40,24,11,0.00,0,0,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(41,25,9,500000.00,1,1,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(42,26,11,0.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(43,27,3,550000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(44,27,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(45,27,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(46,27,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(47,28,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(48,28,3,550000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(49,28,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 08:28:59'),(50,28,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(51,28,9,200000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(52,28,2,640000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(53,29,10,0.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(54,30,3,550000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(55,30,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(56,30,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(57,30,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(58,31,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(59,31,3,500000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(60,31,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(61,31,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(62,31,9,200000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(63,31,2,640000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(64,32,10,0.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(65,33,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(66,33,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(67,33,3,550000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(68,33,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(69,34,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(70,34,3,550000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(71,34,5,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(72,34,6,50000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(73,34,9,300000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(74,34,2,700000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(75,35,10,0.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(76,36,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(77,36,3,600000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(78,36,5,70000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(79,36,6,70000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(80,37,4,350000.00,0,0,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(81,37,3,750000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(82,37,5,75000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(83,37,6,75000.00,0,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(84,37,2,800000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(85,37,9,400000.00,1,1,'2025-07-23 06:44:18','2025-07-23 06:44:18');
/*!40000 ALTER TABLE `packageserviceitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productattributes`
--

DROP TABLE IF EXISTS `productattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productattributes` (
  `attribute_id` int NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `is_filterable` tinyint(1) DEFAULT '0',
  `group_id` int DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `productattributes_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `attributegroups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattributes`
--

LOCK TABLES `productattributes` WRITE;
/*!40000 ALTER TABLE `productattributes` DISABLE KEYS */;
INSERT INTO `productattributes` VALUES (1,'Loại máy',100000,1,1,NULL),(2,'Inverter',200000,1,1,NULL),(3,'Công suất làm lạnh',300000,0,1,NULL),(4,'Phạm vi làm lạnh hiệu quả',400000,0,1,NULL),(5,'Dòng sản phẩm',500000,0,1,NULL),(6,'Sản xuất tại',600000,0,1,NULL),(7,'Thời gian bảo hành cục lạnh, cục nóng',700000,0,1,NULL),(8,'Thời gian bảo hành máy nén',800000,0,1,NULL),(9,'Chất liệu dàn tản nhiệt',900000,0,1,NULL),(10,'Loại Gas',1000000,0,1,NULL),(11,'Tiêu thụ điện',100000,0,2,NULL),(12,'Nhãn năng lượng ',200000,0,2,NULL),(13,'Công nghệ tiết kiệm',300000,0,2,NULL),(14,'Lọc bụi, kháng khuẩn, khử mùi',100000,0,3,NULL),(15,'Chế độ gió',100000,0,4,NULL),(16,'Công nghệ làm lạnh nhanh',200000,0,4,NULL),(17,'Tiện ích',100000,0,5,NULL),(18,'Kích thước dàn lạnh',100000,0,6,NULL),(19,'Khối lượng dàn lạnh',200000,0,6,NULL),(20,'Kích thước dàn nóng',300000,0,6,NULL),(21,'Kiểu tủ',100000,1,12,NULL),(22,'Dung tích tổng',200000,0,12,'Lít'),(23,'Dung tích sử dụng',300000,0,12,'Lít'),(24,'Dung tích ngăn đá',400000,0,12,'Lít'),(25,'Dung tích ngăn lạnh',500000,0,12,'Lít'),(26,'Chất liệu cửa tủ lạnh',600000,0,12,NULL),(27,'Chất liệu khay ngăn lạnh',700000,0,12,NULL),(28,'Chất liệu ống dẫn gas, dàn lạnh',800000,0,12,NULL),(29,'Năm ra mắt',900000,0,12,NULL),(30,'Sản xuất tại',1000000,0,12,NULL),(31,'Công suất tiêu thụ công bố theo TCVN',100000,0,13,NULL),(32,'Công nghệ tiết kiệm điện',200000,0,13,NULL),(33,'Công nghệ làm lạnh',100000,0,14,NULL),(34,'Công nghệ bảo quản thực phẩm',200000,0,14,NULL),(35,'Công nghệ kháng khuẩn, khử mùi',300000,0,14,NULL),(36,'Tiện ích',100000,0,15,NULL),(37,'Kích thước - Khối lượng',100000,0,16,NULL),(38,'Hãng',200000,0,16,NULL),(39,'Loại máy giặt',100000,1,7,NULL),(40,'Lồng giặt',200000,0,7,NULL),(41,'Khối lượng giặt',300000,0,7,'Kg'),(42,'Số người sử dụng',400000,0,7,NULL),(43,'Kiểu động cơ',500000,0,7,NULL),(44,'Tốc độ quay vắt tối đa',600000,0,7,'vòng/phút'),(45,'Chất liệu lồng giặt',700000,0,7,NULL),(46,'Chất liệu vỏ máy',800000,0,7,NULL),(47,'Chất liệu cửa máy',900000,0,7,NULL),(48,'Sản xuất tại',1000000,0,7,NULL),(49,'Năm ra mắt',1100000,0,7,NULL),(50,'Thời gian bảo hành động cơ',1200000,0,7,'năm'),(51,'Kích thước - Khối lượng',100000,0,11,NULL),(52,'Chiều dài ống cấp nước',200000,0,11,'m'),(53,'Chiều dài ống thoát nước',300000,0,11,'m'),(54,'Hãng',400000,0,11,NULL),(55,'Hiệu suất sử dụng điện',100000,0,8,NULL),(56,'Loại inverter',200000,0,8,NULL),(57,'Chương trình',100000,0,9,NULL),(58,'Công nghệ giặc',200000,0,9,NULL),(59,'Bảng điều khiển',100000,0,10,NULL),(60,'Tiện ích',200000,0,10,NULL);
/*!40000 ALTER TABLE `productattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `display_order` int DEFAULT NULL,
  `image_url` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`img_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (60,23,100000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114661253_3vjne846kfs.jpg?alt=media&token=1349b0d1-7328-4d4e-a9a7-885d902af9c3','2025-07-21 16:18:01','2025-07-21 16:18:01'),(61,23,200000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114665363_w22dp8b0hs.jpg?alt=media&token=a1f90a07-a742-4fb2-9c37-4052b08b775a','2025-07-21 16:18:01','2025-07-21 16:18:01'),(62,23,300000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114666996_lkcirorjbbc.jpg?alt=media&token=717fe43c-14e4-492b-863c-392b0b0cc6e8','2025-07-21 16:18:01','2025-07-21 16:18:01'),(63,23,400000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114668825_pohl04x6c8n.jpg?alt=media&token=187955bc-a85c-4a75-aac3-442e633892e9','2025-07-21 16:18:01','2025-07-21 16:18:01'),(64,23,500000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114670241_qjfj95sbcea.jpg?alt=media&token=4d52ed04-019e-4b54-b413-f097bddae9e7','2025-07-21 16:18:01','2025-07-21 16:18:01'),(65,23,400000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114672592_jjs7lm7k6eo.jpg?alt=media&token=2871e20e-e85c-4aa7-ad34-1fd5df1a7633','2025-07-21 16:18:01','2025-07-22 13:52:27'),(66,23,300000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114674436_9ra3dquo97u.jpg?alt=media&token=6562a9d6-d400-4097-be21-6492ee092572','2025-07-21 16:18:01','2025-07-22 13:52:27'),(67,23,200000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114675888_n1crjuuiqsh.jpg?alt=media&token=4633ac24-3704-42f6-8d62-688401eabfa3','2025-07-21 16:18:01','2025-07-22 13:52:27'),(68,23,100000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753114677610_j9bzgy2fej.jpg?alt=media&token=32803cc3-fb32-437b-9939-42834be7fc41','2025-07-21 16:18:01','2025-07-22 13:52:27'),(69,24,100000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753253045259_haout7i61bs.jpg?alt=media&token=4cef467e-2e84-41eb-9b03-711b6f8d3994','2025-07-23 06:44:18','2025-07-23 06:44:18'),(70,24,200000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753253047362_cmyg1sku2k6.jpg?alt=media&token=760b90ab-3f64-4cec-be17-6b8958e65205','2025-07-23 06:44:18','2025-07-23 06:44:18'),(71,24,300000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753253049236_wrrd6l8u6y.jpg?alt=media&token=223ed703-9dd6-45af-9dd8-8a92a678f8f5','2025-07-23 06:44:18','2025-07-23 06:44:18'),(72,24,400000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753253050939_cnqx88laa1h.jpg?alt=media&token=e59552ae-02a2-4f0a-ac09-49be99042c77','2025-07-23 06:44:18','2025-07-23 06:44:18'),(73,24,500000,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1753253054420_0eqxp39m1ubj.png?alt=media&token=b23c16bf-042f-483d-ba0c-d42063f4f4c9','2025-07-23 06:44:18','2025-07-23 06:44:18');
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (23,'Máy giặt Aqua Inverter AQD-A952J BK',3,5,1,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(24,'Máy lạnh AUX Inverter AW10CAA4DI-3VN',11,3,1,'2025-07-23 06:44:18','2025-07-23 06:44:18');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productspecifications`
--

DROP TABLE IF EXISTS `productspecifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productspecifications` (
  `specification_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`specification_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  CONSTRAINT `fk_product_spec_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `productattributes` (`attribute_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_product_spec_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productspecifications`
--

LOCK TABLES `productspecifications` WRITE;
/*!40000 ALTER TABLE `productspecifications` DISABLE KEYS */;
INSERT INTO `productspecifications` VALUES (7,23,39,'Cửa trước'),(8,23,40,'Lồng ngang'),(9,23,41,'9.5 Kg'),(10,23,42,'Từ 5 - 7 người'),(11,23,43,'Truyền động gián tiếp (dây Curoa)'),(12,23,44,'1400 vòng/phút'),(13,23,45,'Thép không gỉ'),(14,23,46,'Kim loại sơn tĩnh điện'),(15,23,47,'Kính chịu lực'),(16,23,48,'Việt Nam'),(17,23,49,'2023'),(18,23,50,'10 năm'),(19,23,55,'14.1 Wh/kg'),(20,23,56,'BLDC Inverter'),(21,23,57,'Sợi tổng hợp'),(22,23,57,'Refresh'),(23,23,57,'Đồ trẻ em'),(24,23,57,'Đồ thể thao'),(25,23,57,'Đồ jeans'),(26,23,57,'Đồ hổn hợp'),(27,23,57,'Đồ cotton'),(28,23,57,'Vệ sinh lồng giặc'),(29,23,57,'Vắt'),(30,23,57,'Giặt tiêu chuẩn'),(31,23,57,'Giặt nhẹ'),(32,23,57,'Giặt nhanh 15 phút'),(33,23,57,'Diệt khuẩn'),(34,23,57,'Chăn lông vũ'),(35,23,58,'Lồng giặt lớn 525 mm'),(36,23,58,'Làm mới quần áo bằng hơi nước'),(37,23,58,'Refresh'),(38,23,58,'Giặt nước nóng'),(39,23,58,'Công nghệ giặt hơi nước Steam Wash'),(40,23,58,'Công nghệ cân bằng AI DBT'),(41,23,58,'Vòng đệm cửa kháng khuẩn ABT'),(42,23,58,'Smart Dual Spray tự làm sạch mặt trong cửa'),(43,23,58,'Lồng giặt Pillow'),(44,23,59,'Song ngữ Anh - Việt có núm xoay, nút nhấn và màn hình hiển thị'),(45,23,60,'Khóa trẻ em'),(46,23,60,'Hẹn giờ'),(47,23,60,'Giặc nhanh trong 15p'),(48,23,60,'Chỉnh số vòng vắt'),(49,23,60,'Chỉnh nhiệt độ nước'),(50,23,60,'Xả tăng cường'),(51,23,51,'Cao 85 cm - Ngang 59.5 cm - Sâu 51.8 cm - Nặng 58 kg'),(52,23,52,'127 cm'),(53,23,53,'160 cm'),(54,23,54,'Aqua'),(55,24,1,'1 chiều'),(56,24,2,'có Inverter'),(57,24,3,'1.5HP -> 2.5HP'),(58,24,4,'từ 30 - 120 m³'),(59,24,5,'2025'),(60,24,6,'Thái Lan'),(61,24,7,'3 năm'),(62,24,8,'12 năm'),(63,24,9,'Ống dẫn gas bằng Đồng - Lá tản nhiệt bằng Nhôm'),(64,24,10,'R-32'),(65,24,11,'0.9kWh-> 2.59kWh'),(66,24,12,'3 sao (Hiệu suất năng lượng 4.78)'),(67,24,13,'DC Inverter'),(68,24,14,'Lưới lọc bụi'),(69,24,15,'Đảo gió lên xuống tự động'),(70,24,16,'Turbo'),(71,24,17,'Lớp phủ chống ăn mòn mạ vàng Golden Fin'),(72,24,17,'Khóa trẻ em'),(73,24,17,'Cảm biến nhiệt độ I Feel'),(74,24,17,'Chức năng tự làm sạch dàn lạnh Self Clean'),(75,24,17,'Chức năng tự chẩn đoán lỗi'),(76,24,17,'Chế độ ngủ đêm Sleep cho người già, trẻ nhỏ'),(77,24,17,'Màn hình hiển thị nhiệt độ trên dàn lạnh'),(78,24,17,'Hẹn giờ bật, tắt máy'),(79,24,17,'Nhắc nhở vệ sinh bộ lọc'),(80,24,18,'Dài 77.6 cm - Cao 29.8 cm - Dày 20.2 cm'),(81,24,19,'7.5 kg'),(82,24,20,'Dài 72 cm - Cao 45.5 cm - Dày 27.5 cm');
/*!40000 ALTER TABLE `productspecifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productvariants`
--

DROP TABLE IF EXISTS `productvariants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productvariants` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `variant_sku` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `item_status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `variant_name` varchar(255) NOT NULL DEFAULT 'Unknow',
  PRIMARY KEY (`variant_id`),
  UNIQUE KEY `variant_sku` (`variant_sku`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `productvariants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productvariants`
--

LOCK TABLES `productvariants` WRITE;
/*!40000 ALTER TABLE `productvariants` DISABLE KEYS */;
INSERT INTO `productvariants` VALUES (35,23,'Máy giặt Aqua Inverter AQD-A952J BK_8.5 KG-49a1df34-120446',6490000.00,10,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753114679453_36f1o1jviyi.jpg?alt=media&token=32000ada-9adb-41c5-aa79-14c07c04243b','in_stock','2025-07-21 16:18:01','2025-07-21 16:18:01','Máy giặt Aqua Inverter 8.5 KG AQD-A952J BK'),(36,23,'Máy giặt Aqua Inverter AQD-A952J BK_9.5 KG-f6dd0b69-120446',7890000.00,11,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753114679454_fhl42y73hgt.jpg?alt=media&token=4253aac1-b197-4703-a231-1735924c7fb7','in_stock','2025-07-21 16:18:01','2025-07-21 16:18:01','Máy giặt Aqua Inverter 9.5 KG AQD-A952J BK'),(37,24,'Máy lạnh AUX Inverter AW10CAA4DI-3VN_1HP-36153999-763797',6590000.00,10,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753253055986_jnd3nb4nsr.jpg?alt=media&token=e43f35e4-afb8-4520-8416-f8e3ba8e04f6','in_stock','2025-07-23 06:44:18','2025-07-23 06:44:18','Máy lạnh AUX Inverter 1HP AW10CAA4DI-3VN'),(38,24,'Máy lạnh AUX Inverter AW10CAA4DI-3VN_1.5HP-3cc98b3c-763797',7590000.00,10,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753253055987_50vvl65bhh3.jpg?alt=media&token=6e255164-7f42-474b-b58d-643ce54bc819','in_stock','2025-07-23 06:44:18','2025-07-23 06:44:18','Máy lạnh AUX Inverter 1.5HP AW10CAA4DI-3VN'),(39,24,'Máy lạnh AUX Inverter AW10CAA4DI-3VN_2HP-3a99055a-763797',14690000.00,10,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753253055988_yb557mbkwkg.jpg?alt=media&token=a69b564e-4020-4610-8985-7e868b0fbbef','in_stock','2025-07-23 06:44:18','2025-07-23 06:44:18','Máy lạnh AUX Inverter 2HP AW10CAA4DI-3VN'),(40,24,'Máy lạnh AUX Inverter AW10CAA4DI-3VN_2.5HP-6f63facb-763797',17590000.00,10,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1753253055988_52hqz15ange.jpg?alt=media&token=a6edfd09-cb9b-43c2-9e4e-3eb45bb6ad41','in_stock','2025-07-23 06:44:18','2025-07-23 06:44:18','Máy lạnh AUX Inverter 2.5HP AW10CAA4DI-3VN');
/*!40000 ALTER TABLE `productvariants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `rating_value` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',NULL),(2,'customer',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicepackages`
--

DROP TABLE IF EXISTS `servicepackages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicepackages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `variant_id` int NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`package_id`),
  UNIQUE KEY `variant_id` (`variant_id`,`package_name`),
  CONSTRAINT `fk_servicepackage_variant` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicepackages`
--

LOCK TABLES `servicepackages` WRITE;
/*!40000 ALTER TABLE `servicepackages` DISABLE KEYS */;
INSERT INTO `servicepackages` VALUES (22,35,'GÓI 1',100000,NULL,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(23,35,'GÓI 2',200000,NULL,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(24,36,'GÓI 1',100000,NULL,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(25,36,'GÓI 2',200000,NULL,'2025-07-21 16:18:01','2025-07-21 16:18:01'),(26,37,'GÓI 1',100000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(27,37,'GÓI 2',200000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(28,37,'GÓI 3',300000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(29,38,'GÓI 1',100000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(30,38,'GÓI 2',200000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(31,38,'GÓI 3',300000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(32,39,'GÓI 1',100000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(33,39,'GÓI 2',200000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(34,39,'GÓI 3',300000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(35,40,'GÓI 1',100000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(36,40,'GÓI 2',200000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18'),(37,40,'GÓI 3',300000,NULL,'2025-07-23 06:44:18','2025-07-23 06:44:18');
/*!40000 ALTER TABLE `servicepackages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_name` (`service_name`),
  KEY `idx_service_category_id` (`category_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (2,'Gói bảo dưỡng trọn đời: 4 năm vệ sinh máy lạnh (8 lần giá ưu đãi)',NULL,3,'2025-07-13 05:24:25','2025-07-13 05:25:53'),(3,'Bộ vật tư (5m ống đồng dày 0.7mm + dây điện đôi + ống nước mềm + băng keo + ốc vít)',NULL,3,'2025-07-13 05:25:53','2025-07-13 05:25:53'),(4,'Miễn phí công lắp đặt và hút chân không',NULL,3,'2025-07-13 05:25:53','2025-07-13 05:25:53'),(5,'Cặp EKE sơn tĩnh điện 45cm nặng 1,8kg',NULL,3,'2025-07-13 05:25:53','2025-07-13 05:25:53'),(6,'CB Panasonic 30A',NULL,3,'2025-07-13 05:25:53','2025-07-13 05:25:53'),(9,'Gói bảo hành 4 năm (2 năm chính hãng, 2 năm smarthome thực hiện)',NULL,NULL,'2025-07-13 11:12:55','2025-07-13 11:20:26'),(10,'Gói tiêu chuẩn, chỉ giao hàng',NULL,3,'2025-07-14 04:14:56','2025-07-14 04:14:56'),(11,'Gói tiêu chuẩn',NULL,NULL,'2025-07-14 04:14:56','2025-07-14 04:14:56');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int DEFAULT NULL,
  `login_method` varchar(50) NOT NULL DEFAULT 'traditional',
  `google_sub_id` varchar(255) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `google_sub_id` (`google_sub_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2b$10$kFGhbnpC6rnVnfY0EAvfW.5f.zENRMJPYLlU91KW2QDvscgyKpXXq','admin@gmail.com','admin',NULL,NULL,'2025-07-03 04:46:44','2025-07-04 01:44:18',1,'traditional',NULL,0,0,NULL),(2,'$2b$10$t2bLnQV3UlSMlXi7HVeSeu5HwlWXHgA/xsaF/JFLEhRnuVyg9gLJ2','customer@gmail.com','customer',NULL,NULL,'2025-07-03 04:46:44','2025-07-04 01:44:18',2,'traditional',NULL,0,0,NULL),(13,'$2b$10$JwnEKUffYpjAcll5gmHR/OoFGFy7xS392/dXBDl.JbiSSNCu2dfHe','sinanju@gmail.com','sinanju',NULL,NULL,'2025-07-04 08:17:25','2025-07-04 08:17:25',2,'traditional',NULL,0,0,NULL),(14,NULL,'khoai.t0302@gmail.com','Ngọc Khoa',NULL,NULL,'2025-07-08 04:57:05','2025-07-08 04:57:05',2,'google','112812320001408877501',1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variantoptionselections`
--

DROP TABLE IF EXISTS `variantoptionselections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variantoptionselections` (
  `variant_id` int NOT NULL,
  `option_value_id` int NOT NULL,
  PRIMARY KEY (`variant_id`,`option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  CONSTRAINT `variantoptionselections_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `variantoptionselections_ibfk_2` FOREIGN KEY (`option_value_id`) REFERENCES `optionvalues` (`option_value_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variantoptionselections`
--

LOCK TABLES `variantoptionselections` WRITE;
/*!40000 ALTER TABLE `variantoptionselections` DISABLE KEYS */;
INSERT INTO `variantoptionselections` VALUES (35,17),(36,18),(37,19),(38,20),(39,21),(40,22);
/*!40000 ALTER TABLE `variantoptionselections` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-25 18:43:37
