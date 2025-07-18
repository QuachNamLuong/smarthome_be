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
CREATE DATABASE `smarthome_db`;
USE `smarthome_db`;

DROP TABLE IF EXISTS `attributegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributegroups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `attributegroups_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributegroups`
--

LOCK TABLES `attributegroups` WRITE;
/*!40000 ALTER TABLE `attributegroups` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'samsung',NULL,NULL),(2,'sony',NULL,NULL);
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
  `user_id` int DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_id`),
  UNIQUE KEY `user_id` (`user_id`,`variant_id`),
  UNIQUE KEY `session_id` (`session_id`,`variant_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
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
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tủ lạnh',100000),(2,'Tivi',200000),(3,'Máy lạnh',300000),(4,'Điện thoại',400000);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Dung tích',1,1),(2,'Số lượng ngăn',1,1),(3,'Vị trí ngăn',1,1),(4,'Kích thước màn hình',1,2),(6,'Mã lực',1,3),(7,'Màu',1,4),(8,'Bộ nhớ trong',1,4),(9,'Ram',1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionvalues`
--

LOCK TABLES `optionvalues` WRITE;
/*!40000 ALTER TABLE `optionvalues` DISABLE KEYS */;
INSERT INTO `optionvalues` VALUES (1,6,'200hp'),(2,6,'300hp'),(3,6,'400hp'),(4,6,'600hp'),(11,6,'350hp'),(12,6,'850hp');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageserviceitems`
--

LOCK TABLES `packageserviceitems` WRITE;
/*!40000 ALTER TABLE `packageserviceitems` DISABLE KEYS */;
INSERT INTO `packageserviceitems` VALUES (1,2,11,0.00,0,0,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(2,3,11,0.00,0,0,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(3,3,2,1000000.00,1,1,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(4,3,9,1400000.00,1,1,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(5,4,11,0.00,0,0,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(6,5,11,0.00,0,0,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(7,5,2,1200000.00,1,1,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(8,5,9,1600000.00,1,1,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(9,6,11,0.00,0,0,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(10,7,11,0.00,0,0,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(11,7,2,500000.00,1,1,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(12,7,9,800000.00,1,1,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(13,8,11,0.00,0,0,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(14,9,11,0.00,0,0,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(15,9,2,550000.00,1,1,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(16,9,9,900000.00,1,1,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(17,10,11,0.00,0,0,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(18,11,11,0.00,0,0,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(19,11,9,500000.00,1,1,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(20,11,2,600000.00,1,1,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(21,12,11,0.00,0,0,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(22,13,11,0.00,0,0,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(23,13,9,600000.00,1,1,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(24,13,2,700000.00,1,1,'2025-07-16 14:05:52','2025-07-16 14:05:52');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattributes`
--

LOCK TABLES `productattributes` WRITE;
/*!40000 ALTER TABLE `productattributes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (10,7,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658512289_jnebcc3x8r9.jpg?alt=media&token=150bf0e6-acc0-4aa8-92fe-3f4d234b157d','2025-07-16 09:35:24','2025-07-16 09:35:24'),(11,7,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658515376_lre7uq5d1fg.webp?alt=media&token=777ac31f-09ca-4e6a-9832-9420b9b75105','2025-07-16 09:35:24','2025-07-16 09:35:24'),(12,7,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658518056_yxcq33dtdf8.png?alt=media&token=bed2d375-576a-46af-877e-56cc7c337ac0','2025-07-16 09:35:24','2025-07-16 09:35:24'),(19,10,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658942002_1i4cu2gnrj8.jpg?alt=media&token=07627d05-b6a2-4d9e-bdfc-353463e3766c','2025-07-16 09:42:29','2025-07-16 09:42:29'),(20,10,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658945111_af0s5oegbyr.webp?alt=media&token=4963e79f-353a-453b-9c2d-e017b8ca07b8','2025-07-16 09:42:29','2025-07-16 09:42:29'),(21,10,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658947362_v01ntf057v.png?alt=media&token=b25a375f-f660-40b0-bf60-cfaf6c431f5a','2025-07-16 09:42:29','2025-07-16 09:42:29'),(22,11,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659019616_f0cotvgenw.jpg?alt=media&token=2f057bcd-8b41-45cc-bd7f-3079efc7ffc6','2025-07-16 09:43:48','2025-07-16 09:43:48'),(23,11,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659022559_09skih6l9wpn.webp?alt=media&token=c6ce7147-5fc7-49ed-ab8b-ad43bd56d776','2025-07-16 09:43:48','2025-07-16 09:43:48'),(24,11,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659025399_bbs85waav2l.png?alt=media&token=6ed22486-2ab2-4cc5-8533-128a43b93bd3','2025-07-16 09:43:48','2025-07-16 09:43:48'),(34,15,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659564087_4q0waufvs4i.jpg?alt=media&token=26e5fc05-1527-4703-bde3-f12868ac81b3','2025-07-16 09:52:54','2025-07-16 09:52:54'),(35,15,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659567769_39ont98ed3h.webp?alt=media&token=8c72109a-c7e4-44a1-96b9-93ca5629e829','2025-07-16 09:52:54','2025-07-16 09:52:54'),(36,15,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659571287_p5y3a8wdxe.png?alt=media&token=d6eabde7-80af-4272-bc3c-5379ce8a0a21','2025-07-16 09:52:54','2025-07-16 09:52:54'),(37,16,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674154592_t1xt6hud1oq.jpg?alt=media&token=bedbc84d-7d36-4dc8-8695-30ef23d3ec46','2025-07-16 13:56:01','2025-07-16 13:56:01'),(38,16,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674155987_j7ahwc9x6j.jpg?alt=media&token=090bd978-efb4-4b92-8ece-3494a508071e','2025-07-16 13:56:01','2025-07-16 13:56:01'),(39,16,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674157184_e2qjgzhg1c.jpg?alt=media&token=d957f47e-14c8-4c69-a3d6-f810ed826fa9','2025-07-16 13:56:01','2025-07-16 13:56:01'),(40,16,4,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674158517_5f5suxwkexk.jpg?alt=media&token=90d262c1-27de-4a37-850b-efa645b94403','2025-07-16 13:56:01','2025-07-16 13:56:01'),(41,17,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674744825_4ftnnrztek8.jpg?alt=media&token=ea3bc0c5-3380-4bae-8980-84efa5791d72','2025-07-16 14:05:52','2025-07-16 14:05:52'),(42,17,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674746774_zcbek0sc1ae.jpg?alt=media&token=f3c20cb2-c230-4481-86df-6224d7619fc3','2025-07-16 14:05:52','2025-07-16 14:05:52'),(43,17,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674748512_3jkwd8qmjg2.jpg?alt=media&token=87e25f9e-b1f6-43c3-94ed-171888440469','2025-07-16 14:05:52','2025-07-16 14:05:52'),(44,17,4,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674750354_mmssi4r826f.jpg?alt=media&token=21bdaa73-18f0-418e-bcc1-ee639df42711','2025-07-16 14:05:52','2025-07-16 14:05:52'),(45,18,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674929128_kqy9et5klnb.jpg?alt=media&token=c3d6edd1-1b77-47ca-b592-612aefafe44b','2025-07-16 14:08:57','2025-07-16 14:08:57'),(46,18,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674931328_q83rixpokwc.jpg?alt=media&token=5eac37d3-240d-42ec-aa0b-c49d5197b784','2025-07-16 14:08:57','2025-07-16 14:08:57'),(47,18,3,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674933049_wk60rptm86.jpg?alt=media&token=1462695b-5460-4f5f-b691-59ffae35d7d7','2025-07-16 14:08:57','2025-07-16 14:08:57'),(48,18,4,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674934691_wxsnlh5ooxc.jpg?alt=media&token=eb829562-3a2f-4301-bf7a-9ed22062a420','2025-07-16 14:08:57','2025-07-16 14:08:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'smartguy',1,3,1,'2025-07-16 08:40:00','2025-07-16 08:40:00'),(7,'smartguy',1,3,1,'2025-07-16 09:35:24','2025-07-16 09:35:24'),(10,'smartguy',1,3,1,'2025-07-16 09:42:29','2025-07-16 09:42:29'),(11,'smartguy',1,3,1,'2025-07-16 09:43:48','2025-07-16 09:43:48'),(15,'smartguy',1,3,1,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(16,'Máy lạnh Samsung Inverter AR10DYHZAWKNSV',1,3,1,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(17,'Máy lạnh Samsung Inverter AR10DYHZAWKNSv',1,3,1,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(18,'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV',1,3,1,'2025-07-16 14:08:57','2025-07-16 14:08:57');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productspecifications`
--

DROP TABLE IF EXISTS `productspecifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productspecifications` (
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `productspecifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productspecifications_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `productattributes` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productspecifications`
--

LOCK TABLES `productspecifications` WRITE;
/*!40000 ALTER TABLE `productspecifications` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productvariants`
--

LOCK TABLES `productvariants` WRITE;
/*!40000 ALTER TABLE `productvariants` DISABLE KEYS */;
INSERT INTO `productvariants` VALUES (1,3,'smartguy_200hp',10000000.00,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752655196542_petvhm7s5l.png?alt=media&token=a230f315-efbc-4a73-8a81-8053a64a6ea5','in_stock','2025-07-16 08:40:00','2025-07-16 08:40:00','Unknow'),(2,3,'smartguy_300hp',20000000.00,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752655196542_ks2eyj02z4.jpg?alt=media&token=ec62f88b-80af-4b6d-bb50-87942146a1ef','in_stock','2025-07-16 08:40:01','2025-07-16 08:40:01','Unknow'),(6,7,'smartguy_200hp-4eee4b8d-492661',10000000.00,1,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752658520679_cjc92ztdp1c.png?alt=media&token=56e1ae9a-fbd5-4a7e-9908-9b7aeaedc876','in_stock','2025-07-16 09:35:24','2025-07-16 09:35:24','Unknow'),(7,7,'smartguy_300hp-4eee4b8d-492661',20000000.00,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752658520680_andjcspxwfa.jpg?alt=media&token=a2a083ea-a173-4d4d-af4e-221099cec4ae','in_stock','2025-07-16 09:35:24','2025-07-16 09:35:24','Unknow'),(10,10,'smartguy_200hp-d127acca-934473',10000000.00,1,NULL,'in_stock','2025-07-16 09:42:29','2025-07-16 09:42:29','Unknow'),(11,11,'smartguy_400hp-0acaf2f6-002577',10000000.00,3,NULL,'in_stock','2025-07-16 09:43:48','2025-07-16 09:43:48','Unknow'),(12,11,'smartguy_600hp-0acaf2f6-002577',20000000.00,0,NULL,'in_stock','2025-07-16 09:43:48','2025-07-16 09:43:48','Unknow'),(19,15,'smartguy_350hp-102a0c9d-061849',10000000.00,200,NULL,'in_stock','2025-07-16 09:52:54','2025-07-16 09:52:54','Unknow'),(20,15,'smartguy_850hp-102a0c9d-061849',10000000.00,200,NULL,'in_stock','2025-07-16 09:52:54','2025-07-16 09:52:54','Unknow'),(21,16,'Máy lạnh Samsung Inverter AR10DYHZAWKNSV_200hp-605e8fa8-015671',10000000.00,5,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674159954_d1hrzn5ceof.jpg?alt=media&token=8c052243-af21-47e0-a9ee-cd8b8b520478','in_stock','2025-07-16 13:56:01','2025-07-16 13:56:01','Máy lạnh Samsung Inverter AR10DYHZAWKNSV 200hp'),(22,16,'Máy lạnh Samsung Inverter AR10DYHZAWKNSV_300hp-605e8fa8-015671',20000000.00,8,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674159956_o1zt3577vh.jpg?alt=media&token=2345d67a-2919-49b7-b29b-38807718bd99','in_stock','2025-07-16 13:56:01','2025-07-16 13:56:01','Máy lạnh Samsung Inverter AR10DYHZAWKNSV 300hp'),(23,17,'Máy lạnh Samsung Inverter AR10DYHZAWKNSv_200hp-75f727b6-626446',10000000.00,6,NULL,'in_stock','2025-07-16 14:05:52','2025-07-16 14:05:52','Máy lạnh Samsung Inverter AR10DYHZAWKNSv 200hp'),(24,17,'Máy lạnh Samsung Inverter AR10DYHZAWKNSv_300hp-a39b5d69-626446',20000000.00,11,NULL,'in_stock','2025-07-16 14:05:52','2025-07-16 14:05:52','Máy lạnh Samsung Inverter AR10DYHZAWKNSv 300hp'),(25,18,'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV_200hp-13ae0666-915637',10000000.00,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674936022_0uk7skstn3af.jpg?alt=media&token=1b48096e-cb10-4759-a724-897f5d58d609','in_stock','2025-07-16 14:08:58','2025-07-16 14:08:58','Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV200hp'),(26,18,'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV_300hp-82be7343-915637',10000000.00,2,'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674936023_2l4d6qaujfx.jpg?alt=media&token=e20d6aa8-cd89-4448-b6d2-adcc6c2cd093','in_stock','2025-07-16 14:08:58','2025-07-16 14:08:58','Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV300hp');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicepackages`
--

LOCK TABLES `servicepackages` WRITE;
/*!40000 ALTER TABLE `servicepackages` DISABLE KEYS */;
INSERT INTO `servicepackages` VALUES (2,19,'GÓI 1',NULL,NULL,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(3,19,'GÓI 2',NULL,NULL,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(4,20,'GÓI 1',NULL,NULL,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(5,20,'GÓI 2',NULL,NULL,'2025-07-16 09:52:54','2025-07-16 09:52:54'),(6,21,'GÓI 1',NULL,NULL,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(7,21,'GÓI 2',NULL,NULL,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(8,22,'GÓI 1',NULL,NULL,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(9,22,'GÓI 2',NULL,NULL,'2025-07-16 13:56:01','2025-07-16 13:56:01'),(10,23,'GÓI 1',NULL,NULL,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(11,23,'GÓI 2',NULL,NULL,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(12,24,'GÓI 1',NULL,NULL,'2025-07-16 14:05:52','2025-07-16 14:05:52'),(13,24,'GÓI 2',NULL,NULL,'2025-07-16 14:05:52','2025-07-16 14:05:52');
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
INSERT INTO `variantoptionselections` VALUES (1,1),(6,1),(10,1),(21,1),(23,1),(25,1),(2,2),(7,2),(22,2),(24,2),(26,2),(11,3),(12,4),(19,11),(20,12);
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

-- Dump completed on 2025-07-17 11:58:04
