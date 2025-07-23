-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: mysql:3306
-- Thời gian đã tạo: Th7 23, 2025 lúc 11:39 AM
-- Phiên bản máy phục vụ: 8.0.42
-- Phiên bản PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `smarthome_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributegroups`
--

CREATE TABLE `attributegroups` (
  `group_id` int NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `logo_url`, `description`) VALUES
(1, 'samsung', NULL, NULL),
(2, 'sony', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartitems`
--

CREATE TABLE `cartitems` (
  `cartitem_id` int NOT NULL,
  `cart_id` int DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_item_services`
--

CREATE TABLE `cart_item_services` (
  `cart_item_service_id` int NOT NULL,
  `cartitem_id` int NOT NULL,
  `package_service_item_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `display_order`) VALUES
(1, 'Tủ lạnh', 100000),
(2, 'Tivi', 200000),
(3, 'Máy lạnh', 300000),
(4, 'Điện thoại', 400000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `option_id` int NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `is_filterable` tinyint(1) DEFAULT '0',
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `is_filterable`, `category_id`) VALUES
(1, 'Dung tích', 1, 1),
(2, 'Số lượng ngăn', 1, 1),
(3, 'Vị trí ngăn', 1, 1),
(4, 'Kích thước màn hình', 1, 2),
(6, 'Mã lực', 1, 3),
(7, 'Màu', 1, 4),
(8, 'Bộ nhớ trong', 1, 4),
(9, 'Ram', 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `optionvalues`
--

CREATE TABLE `optionvalues` (
  `option_value_id` int NOT NULL,
  `option_id` int NOT NULL,
  `option_value_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `optionvalues`
--

INSERT INTO `optionvalues` (`option_value_id`, `option_id`, `option_value_name`) VALUES
(1, 6, '200hp'),
(2, 6, '300hp'),
(3, 6, '400hp'),
(4, 6, '600hp'),
(11, 6, '350hp'),
(12, 6, '850hp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderitems`
--

CREATE TABLE `orderitems` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `total_item_price` decimal(10,2) NOT NULL,
  `item_status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
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
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item_services`
--

CREATE TABLE `order_item_services` (
  `order_item_service_id` int NOT NULL,
  `order_item_id` int NOT NULL,
  `package_service_item_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packageserviceitems`
--

CREATE TABLE `packageserviceitems` (
  `package_service_item_id` int NOT NULL,
  `package_id` int NOT NULL,
  `service_id` int NOT NULL,
  `item_price_impact` decimal(10,2) NOT NULL,
  `at_least_one` tinyint(1) NOT NULL DEFAULT '0',
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `packageserviceitems`
--

INSERT INTO `packageserviceitems` (`package_service_item_id`, `package_id`, `service_id`, `item_price_impact`, `at_least_one`, `selectable`, `created_at`, `updated_at`) VALUES
(1, 2, 11, 0.00, 0, 0, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(2, 3, 11, 0.00, 0, 0, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(3, 3, 2, 1000000.00, 1, 1, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(4, 3, 9, 1400000.00, 1, 1, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(5, 4, 11, 0.00, 0, 0, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(6, 5, 11, 0.00, 0, 0, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(7, 5, 2, 1200000.00, 1, 1, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(8, 5, 9, 1600000.00, 1, 1, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(9, 6, 11, 0.00, 0, 0, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(10, 7, 11, 0.00, 0, 0, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(11, 7, 2, 500000.00, 1, 1, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(12, 7, 9, 800000.00, 1, 1, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(13, 8, 11, 0.00, 0, 0, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(14, 9, 11, 0.00, 0, 0, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(15, 9, 2, 550000.00, 1, 1, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(16, 9, 9, 900000.00, 1, 1, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(17, 10, 11, 0.00, 0, 0, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(18, 11, 11, 0.00, 0, 0, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(19, 11, 9, 500000.00, 1, 1, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(20, 11, 2, 600000.00, 1, 1, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(21, 12, 11, 0.00, 0, 0, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(22, 13, 11, 0.00, 0, 0, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(23, 13, 9, 600000.00, 1, 1, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(24, 13, 2, 700000.00, 1, 1, '2025-07-16 14:05:52', '2025-07-16 14:05:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productattributes`
--

CREATE TABLE `productattributes` (
  `attribute_id` int NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `is_filterable` tinyint(1) DEFAULT '0',
  `group_id` int DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productimages`
--

CREATE TABLE `productimages` (
  `img_id` int NOT NULL,
  `product_id` int NOT NULL,
  `display_order` int DEFAULT NULL,
  `image_url` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `productimages`
--

INSERT INTO `productimages` (`img_id`, `product_id`, `display_order`, `image_url`, `created_at`, `updated_at`) VALUES
(10, 7, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658512289_jnebcc3x8r9.jpg?alt=media&token=150bf0e6-acc0-4aa8-92fe-3f4d234b157d', '2025-07-16 09:35:24', '2025-07-16 09:35:24'),
(11, 7, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658515376_lre7uq5d1fg.webp?alt=media&token=777ac31f-09ca-4e6a-9832-9420b9b75105', '2025-07-16 09:35:24', '2025-07-16 09:35:24'),
(12, 7, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658518056_yxcq33dtdf8.png?alt=media&token=bed2d375-576a-46af-877e-56cc7c337ac0', '2025-07-16 09:35:24', '2025-07-16 09:35:24'),
(19, 10, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658942002_1i4cu2gnrj8.jpg?alt=media&token=07627d05-b6a2-4d9e-bdfc-353463e3766c', '2025-07-16 09:42:29', '2025-07-16 09:42:29'),
(20, 10, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658945111_af0s5oegbyr.webp?alt=media&token=4963e79f-353a-453b-9c2d-e017b8ca07b8', '2025-07-16 09:42:29', '2025-07-16 09:42:29'),
(21, 10, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752658947362_v01ntf057v.png?alt=media&token=b25a375f-f660-40b0-bf60-cfaf6c431f5a', '2025-07-16 09:42:29', '2025-07-16 09:42:29'),
(22, 11, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659019616_f0cotvgenw.jpg?alt=media&token=2f057bcd-8b41-45cc-bd7f-3079efc7ffc6', '2025-07-16 09:43:48', '2025-07-16 09:43:48'),
(23, 11, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659022559_09skih6l9wpn.webp?alt=media&token=c6ce7147-5fc7-49ed-ab8b-ad43bd56d776', '2025-07-16 09:43:48', '2025-07-16 09:43:48'),
(24, 11, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659025399_bbs85waav2l.png?alt=media&token=6ed22486-2ab2-4cc5-8533-128a43b93bd3', '2025-07-16 09:43:48', '2025-07-16 09:43:48'),
(34, 15, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659564087_4q0waufvs4i.jpg?alt=media&token=26e5fc05-1527-4703-bde3-f12868ac81b3', '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(35, 15, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659567769_39ont98ed3h.webp?alt=media&token=8c72109a-c7e4-44a1-96b9-93ca5629e829', '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(36, 15, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752659571287_p5y3a8wdxe.png?alt=media&token=d6eabde7-80af-4272-bc3c-5379ce8a0a21', '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(37, 16, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674154592_t1xt6hud1oq.jpg?alt=media&token=bedbc84d-7d36-4dc8-8695-30ef23d3ec46', '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(38, 16, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674155987_j7ahwc9x6j.jpg?alt=media&token=090bd978-efb4-4b92-8ece-3494a508071e', '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(39, 16, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674157184_e2qjgzhg1c.jpg?alt=media&token=d957f47e-14c8-4c69-a3d6-f810ed826fa9', '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(40, 16, 4, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674158517_5f5suxwkexk.jpg?alt=media&token=90d262c1-27de-4a37-850b-efa645b94403', '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(41, 17, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674744825_4ftnnrztek8.jpg?alt=media&token=ea3bc0c5-3380-4bae-8980-84efa5791d72', '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(42, 17, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674746774_zcbek0sc1ae.jpg?alt=media&token=f3c20cb2-c230-4481-86df-6224d7619fc3', '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(43, 17, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674748512_3jkwd8qmjg2.jpg?alt=media&token=87e25f9e-b1f6-43c3-94ed-171888440469', '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(44, 17, 4, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674750354_mmssi4r826f.jpg?alt=media&token=21bdaa73-18f0-418e-bcc1-ee639df42711', '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(45, 18, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674929128_kqy9et5klnb.jpg?alt=media&token=c3d6edd1-1b77-47ca-b592-612aefafe44b', '2025-07-16 14:08:57', '2025-07-16 14:08:57'),
(46, 18, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674931328_q83rixpokwc.jpg?alt=media&token=5eac37d3-240d-42ec-aa0b-c49d5197b784', '2025-07-16 14:08:57', '2025-07-16 14:08:57'),
(47, 18, 3, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674933049_wk60rptm86.jpg?alt=media&token=1462695b-5460-4f5f-b691-59ffae35d7d7', '2025-07-16 14:08:57', '2025-07-16 14:08:57'),
(48, 18, 4, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fbasic%2F1752674934691_wxsnlh5ooxc.jpg?alt=media&token=eb829562-3a2f-4301-bf7a-9ed22062a420', '2025-07-16 14:08:57', '2025-07-16 14:08:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'smartguy', 1, 3, 1, '2025-07-16 08:40:00', '2025-07-16 08:40:00'),
(7, 'smartguy', 1, 3, 1, '2025-07-16 09:35:24', '2025-07-16 09:35:24'),
(10, 'smartguy', 1, 3, 1, '2025-07-16 09:42:29', '2025-07-16 09:42:29'),
(11, 'smartguy', 1, 3, 1, '2025-07-16 09:43:48', '2025-07-16 09:43:48'),
(15, 'smartguy', 1, 3, 1, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(16, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSV', 1, 3, 1, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(17, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSv', 1, 3, 1, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(18, 'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV', 1, 3, 1, '2025-07-16 14:08:57', '2025-07-16 14:08:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productspecifications`
--

CREATE TABLE `productspecifications` (
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `attribute_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productvariants`
--

CREATE TABLE `productvariants` (
  `variant_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_sku` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `item_status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `variant_name` varchar(255) NOT NULL DEFAULT 'Unknow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `productvariants`
--

INSERT INTO `productvariants` (`variant_id`, `product_id`, `variant_sku`, `price`, `stock_quantity`, `image_url`, `item_status`, `created_at`, `updated_at`, `variant_name`) VALUES
(1, 3, 'smartguy_200hp', 10000000.00, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752655196542_petvhm7s5l.png?alt=media&token=a230f315-efbc-4a73-8a81-8053a64a6ea5', 'in_stock', '2025-07-16 08:40:00', '2025-07-16 08:40:00', 'Unknow'),
(2, 3, 'smartguy_300hp', 20000000.00, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752655196542_ks2eyj02z4.jpg?alt=media&token=ec62f88b-80af-4b6d-bb50-87942146a1ef', 'in_stock', '2025-07-16 08:40:01', '2025-07-16 08:40:01', 'Unknow'),
(6, 7, 'smartguy_200hp-4eee4b8d-492661', 10000000.00, 1, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752658520679_cjc92ztdp1c.png?alt=media&token=56e1ae9a-fbd5-4a7e-9908-9b7aeaedc876', 'in_stock', '2025-07-16 09:35:24', '2025-07-16 09:35:24', 'Unknow'),
(7, 7, 'smartguy_300hp-4eee4b8d-492661', 20000000.00, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752658520680_andjcspxwfa.jpg?alt=media&token=a2a083ea-a173-4d4d-af4e-221099cec4ae', 'in_stock', '2025-07-16 09:35:24', '2025-07-16 09:35:24', 'Unknow'),
(10, 10, 'smartguy_200hp-d127acca-934473', 10000000.00, 1, NULL, 'in_stock', '2025-07-16 09:42:29', '2025-07-16 09:42:29', 'Unknow'),
(11, 11, 'smartguy_400hp-0acaf2f6-002577', 10000000.00, 3, NULL, 'in_stock', '2025-07-16 09:43:48', '2025-07-16 09:43:48', 'Unknow'),
(12, 11, 'smartguy_600hp-0acaf2f6-002577', 20000000.00, 0, NULL, 'in_stock', '2025-07-16 09:43:48', '2025-07-16 09:43:48', 'Unknow'),
(19, 15, 'smartguy_350hp-102a0c9d-061849', 10000000.00, 200, NULL, 'in_stock', '2025-07-16 09:52:54', '2025-07-16 09:52:54', 'Unknow'),
(20, 15, 'smartguy_850hp-102a0c9d-061849', 10000000.00, 200, NULL, 'in_stock', '2025-07-16 09:52:54', '2025-07-16 09:52:54', 'Unknow'),
(21, 16, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSV_200hp-605e8fa8-015671', 10000000.00, 5, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674159954_d1hrzn5ceof.jpg?alt=media&token=8c052243-af21-47e0-a9ee-cd8b8b520478', 'in_stock', '2025-07-16 13:56:01', '2025-07-16 13:56:01', 'Máy lạnh Samsung Inverter AR10DYHZAWKNSV 200hp'),
(22, 16, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSV_300hp-605e8fa8-015671', 20000000.00, 8, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674159956_o1zt3577vh.jpg?alt=media&token=2345d67a-2919-49b7-b29b-38807718bd99', 'in_stock', '2025-07-16 13:56:01', '2025-07-16 13:56:01', 'Máy lạnh Samsung Inverter AR10DYHZAWKNSV 300hp'),
(23, 17, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSv_200hp-75f727b6-626446', 10000000.00, 6, NULL, 'in_stock', '2025-07-16 14:05:52', '2025-07-16 14:05:52', 'Máy lạnh Samsung Inverter AR10DYHZAWKNSv 200hp'),
(24, 17, 'Máy lạnh Samsung Inverter AR10DYHZAWKNSv_300hp-a39b5d69-626446', 20000000.00, 11, NULL, 'in_stock', '2025-07-16 14:05:52', '2025-07-16 14:05:52', 'Máy lạnh Samsung Inverter AR10DYHZAWKNSv 300hp'),
(25, 18, 'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV_200hp-13ae0666-915637', 10000000.00, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674936022_0uk7skstn3af.jpg?alt=media&token=1b48096e-cb10-4759-a724-897f5d58d609', 'in_stock', '2025-07-16 14:08:58', '2025-07-16 14:08:58', 'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV200hp'),
(26, 18, 'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV_300hp-82be7343-915637', 10000000.00, 2, 'https://firebasestorage.googleapis.com/v0/b/smarthome-img-storage.firebasestorage.app/o/product%2Fvariant%2F1752674936023_2l4d6qaujfx.jpg?alt=media&token=e20d6aa8-cd89-4448-b6d2-adcc6c2cd093', 'in_stock', '2025-07-16 14:08:58', '2025-07-16 14:08:58', 'Máy lạnh Samsung Inverter 1 HP AR10DYHZAWKNSV300hp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `rating_value` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_approved` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`) VALUES
(1, 'admin', NULL),
(2, 'customer', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `servicepackages`
--

CREATE TABLE `servicepackages` (
  `package_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `display_order` int DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `servicepackages`
--

INSERT INTO `servicepackages` (`package_id`, `variant_id`, `package_name`, `display_order`, `description`, `created_at`, `updated_at`) VALUES
(2, 19, 'GÓI 1', NULL, NULL, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(3, 19, 'GÓI 2', NULL, NULL, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(4, 20, 'GÓI 1', NULL, NULL, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(5, 20, 'GÓI 2', NULL, NULL, '2025-07-16 09:52:54', '2025-07-16 09:52:54'),
(6, 21, 'GÓI 1', NULL, NULL, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(7, 21, 'GÓI 2', NULL, NULL, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(8, 22, 'GÓI 1', NULL, NULL, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(9, 22, 'GÓI 2', NULL, NULL, '2025-07-16 13:56:01', '2025-07-16 13:56:01'),
(10, 23, 'GÓI 1', NULL, NULL, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(11, 23, 'GÓI 2', NULL, NULL, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(12, 24, 'GÓI 1', NULL, NULL, '2025-07-16 14:05:52', '2025-07-16 14:05:52'),
(13, 24, 'GÓI 2', NULL, NULL, '2025-07-16 14:05:52', '2025-07-16 14:05:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Gói bảo dưỡng trọn đời: 4 năm vệ sinh máy lạnh (8 lần giá ưu đãi)', NULL, 3, '2025-07-13 05:24:25', '2025-07-13 05:25:53'),
(3, 'Bộ vật tư (5m ống đồng dày 0.7mm + dây điện đôi + ống nước mềm + băng keo + ốc vít)', NULL, 3, '2025-07-13 05:25:53', '2025-07-13 05:25:53'),
(4, 'Miễn phí công lắp đặt và hút chân không', NULL, 3, '2025-07-13 05:25:53', '2025-07-13 05:25:53'),
(5, 'Cặp EKE sơn tĩnh điện 45cm nặng 1,8kg', NULL, 3, '2025-07-13 05:25:53', '2025-07-13 05:25:53'),
(6, 'CB Panasonic 30A', NULL, 3, '2025-07-13 05:25:53', '2025-07-13 05:25:53'),
(9, 'Gói bảo hành 4 năm (2 năm chính hãng, 2 năm smarthome thực hiện)', NULL, NULL, '2025-07-13 11:12:55', '2025-07-13 11:20:26'),
(10, 'Gói tiêu chuẩn, chỉ giao hàng', NULL, 3, '2025-07-14 04:14:56', '2025-07-14 04:14:56'),
(11, 'Gói tiêu chuẩn', NULL, NULL, '2025-07-14 04:14:56', '2025-07-14 04:14:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
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
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `password_hash`, `email`, `full_name`, `phone_number`, `address`, `created_at`, `updated_at`, `role_id`, `login_method`, `google_sub_id`, `is_email_verified`, `is_profile_complete`, `avatar`) VALUES
(1, '$2b$10$kFGhbnpC6rnVnfY0EAvfW.5f.zENRMJPYLlU91KW2QDvscgyKpXXq', 'admin@gmail.com', 'admin', NULL, NULL, '2025-07-03 04:46:44', '2025-07-04 01:44:18', 1, 'traditional', NULL, 0, 0, NULL),
(2, '$2b$10$t2bLnQV3UlSMlXi7HVeSeu5HwlWXHgA/xsaF/JFLEhRnuVyg9gLJ2', 'customer@gmail.com', 'customer', NULL, NULL, '2025-07-03 04:46:44', '2025-07-04 01:44:18', 2, 'traditional', NULL, 0, 0, NULL),
(13, '$2b$10$JwnEKUffYpjAcll5gmHR/OoFGFy7xS392/dXBDl.JbiSSNCu2dfHe', 'sinanju@gmail.com', 'sinanju', NULL, NULL, '2025-07-04 08:17:25', '2025-07-04 08:17:25', 2, 'traditional', NULL, 0, 0, NULL),
(14, NULL, 'khoai.t0302@gmail.com', 'Ngọc Khoa', NULL, NULL, '2025-07-08 04:57:05', '2025-07-08 04:57:05', 2, 'google', '112812320001408877501', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variantoptionselections`
--

CREATE TABLE `variantoptionselections` (
  `variant_id` int NOT NULL,
  `option_value_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `variantoptionselections`
--

INSERT INTO `variantoptionselections` (`variant_id`, `option_value_id`) VALUES
(1, 1),
(6, 1),
(10, 1),
(21, 1),
(23, 1),
(25, 1),
(2, 2),
(7, 2),
(22, 2),
(24, 2),
(26, 2),
(11, 3),
(12, 4),
(19, 11),
(20, 12);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributegroups`
--
ALTER TABLE `attributegroups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Chỉ mục cho bảng `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`cartitem_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`,`variant_id`),
  ADD UNIQUE KEY `session_id` (`session_id`,`variant_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `session_id` (`session_id`),
  ADD KEY `carts_ibfk_1` (`user_id`);

--
-- Chỉ mục cho bảng `cart_item_services`
--
ALTER TABLE `cart_item_services`
  ADD PRIMARY KEY (`cart_item_service_id`),
  ADD KEY `cartitem_id` (`cartitem_id`),
  ADD KEY `package_service_item_id` (`package_service_item_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `optionvalues`
--
ALTER TABLE `optionvalues`
  ADD PRIMARY KEY (`option_value_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Chỉ mục cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_item_services`
--
ALTER TABLE `order_item_services`
  ADD PRIMARY KEY (`order_item_service_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `package_service_item_id` (`package_service_item_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `packageserviceitems`
--
ALTER TABLE `packageserviceitems`
  ADD PRIMARY KEY (`package_service_item_id`),
  ADD UNIQUE KEY `package_id` (`package_id`,`service_id`),
  ADD KEY `fk_packageitem_service` (`service_id`);

--
-- Chỉ mục cho bảng `productattributes`
--
ALTER TABLE `productattributes`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Chỉ mục cho bảng `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `productspecifications`
--
ALTER TABLE `productspecifications`
  ADD PRIMARY KEY (`product_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Chỉ mục cho bảng `productvariants`
--
ALTER TABLE `productvariants`
  ADD PRIMARY KEY (`variant_id`),
  ADD UNIQUE KEY `variant_sku` (`variant_sku`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Chỉ mục cho bảng `servicepackages`
--
ALTER TABLE `servicepackages`
  ADD PRIMARY KEY (`package_id`),
  ADD UNIQUE KEY `variant_id` (`variant_id`,`package_name`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_name` (`service_name`),
  ADD KEY `idx_service_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `google_sub_id` (`google_sub_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `variantoptionselections`
--
ALTER TABLE `variantoptionselections`
  ADD PRIMARY KEY (`variant_id`,`option_value_id`),
  ADD KEY `option_value_id` (`option_value_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributegroups`
--
ALTER TABLE `attributegroups`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `cartitem_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_item_services`
--
ALTER TABLE `cart_item_services`
  MODIFY `cart_item_service_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `option_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `optionvalues`
--
ALTER TABLE `optionvalues`
  MODIFY `option_value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_item_services`
--
ALTER TABLE `order_item_services`
  MODIFY `order_item_service_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `packageserviceitems`
--
ALTER TABLE `packageserviceitems`
  MODIFY `package_service_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `productattributes`
--
ALTER TABLE `productattributes`
  MODIFY `attribute_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `productimages`
--
ALTER TABLE `productimages`
  MODIFY `img_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `productvariants`
--
ALTER TABLE `productvariants`
  MODIFY `variant_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `servicepackages`
--
ALTER TABLE `servicepackages`
  MODIFY `package_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `attributegroups`
--
ALTER TABLE `attributegroups`
  ADD CONSTRAINT `attributegroups_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ràng buộc cho bảng `cart_item_services`
--
ALTER TABLE `cart_item_services`
  ADD CONSTRAINT `cart_item_services_ibfk_1` FOREIGN KEY (`cartitem_id`) REFERENCES `cartitems` (`cartitem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_services_ibfk_2` FOREIGN KEY (`package_service_item_id`) REFERENCES `packageserviceitems` (`package_service_item_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_services_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `optionvalues`
--
ALTER TABLE `optionvalues`
  ADD CONSTRAINT `optionvalues_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `order_item_services`
--
ALTER TABLE `order_item_services`
  ADD CONSTRAINT `order_item_services_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `orderitems` (`order_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_services_ibfk_2` FOREIGN KEY (`package_service_item_id`) REFERENCES `packageserviceitems` (`package_service_item_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_services_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `packageserviceitems`
--
ALTER TABLE `packageserviceitems`
  ADD CONSTRAINT `fk_packageitem_package` FOREIGN KEY (`package_id`) REFERENCES `servicepackages` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_packageitem_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `productattributes`
--
ALTER TABLE `productattributes`
  ADD CONSTRAINT `productattributes_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `attributegroups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `productspecifications`
--
ALTER TABLE `productspecifications`
  ADD CONSTRAINT `productspecifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productspecifications_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `productattributes` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `productvariants`
--
ALTER TABLE `productvariants`
  ADD CONSTRAINT `productvariants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `servicepackages`
--
ALTER TABLE `servicepackages`
  ADD CONSTRAINT `fk_servicepackage_variant` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Ràng buộc cho bảng `variantoptionselections`
--
ALTER TABLE `variantoptionselections`
  ADD CONSTRAINT `variantoptionselections_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `variantoptionselections_ibfk_2` FOREIGN KEY (`option_value_id`) REFERENCES `optionvalues` (`option_value_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
