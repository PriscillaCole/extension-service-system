-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ldf
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES
(1,0,16,'Dashboard','fa-bar-chart','/',NULL,NULL,'2023-10-14 03:19:55'),
(2,0,17,'Admin','fa-tasks','',NULL,NULL,'2023-10-14 03:19:55'),
(3,2,18,'Users','fa-users','users',NULL,NULL,'2023-10-18 05:26:15'),
(4,2,19,'Roles','fa-user','auth/roles',NULL,NULL,'2023-10-14 03:19:55'),
(5,2,20,'Permission','fa-ban','auth/permissions',NULL,NULL,'2023-10-14 03:19:55'),
(6,2,21,'Menu','fa-bars','auth/menu',NULL,NULL,'2023-10-14 03:19:55'),
(7,2,22,'Operation log','fa-history','auth/logs',NULL,NULL,'2023-10-14 03:19:55'),
(8,20,14,'Breeds','fa-drupal','breeds',NULL,'2023-10-02 06:34:43','2023-10-14 03:19:55'),
(9,0,3,'Farms','fa-location-arrow','farms',NULL,'2023-10-02 06:36:01','2023-10-14 03:19:55'),
(10,0,4,'Farmers','fa-users','farmers',NULL,'2023-10-02 06:36:34','2023-10-14 03:19:55'),
(11,0,5,'Animals','fa-certificate','animals',NULL,'2023-10-02 06:37:00','2023-10-14 03:19:55'),
(12,0,6,'Health Records','fa-sticky-note-o','animal-health-records',NULL,'2023-10-02 06:37:49','2023-10-14 03:19:55'),
(13,0,7,'Vectors & Diseases','fa-bug','vector-and-diseases',NULL,'2023-10-02 06:40:59','2023-10-14 03:19:55'),
(14,0,8,'Vets & Para Vets','fa-user-md','vets',NULL,'2023-10-02 06:41:31','2023-10-14 03:19:55'),
(15,0,9,'Service Providers','fa-anchor','service-providers',NULL,'2023-10-02 06:42:22','2023-10-14 03:19:55'),
(16,0,10,'Production Records','fa-balance-scale','production-records',NULL,'2023-10-02 06:46:02','2023-10-14 03:19:55'),
(17,0,11,'Financial Records','fa-money','financial-records',NULL,'2023-10-02 06:46:29','2023-10-14 03:19:55'),
(18,0,12,'Farm Activities','fa-braille','farm-activities',NULL,'2023-10-02 06:49:41','2023-10-14 03:19:55'),
(19,20,15,'Livestock Types','fa-adjust','livestock-types',NULL,'2023-10-10 09:01:25','2023-10-14 03:19:55'),
(20,0,13,'Configurations','fa-cogs',NULL,NULL,'2023-10-10 09:02:08','2023-10-14 03:19:55'),
(21,0,1,'Registration Forms','fa-pencil-square-o',NULL,NULL,'2023-10-14 03:16:28','2023-10-14 03:19:55'),
(22,21,2,'Farmer Form','fa-user-plus','farmers/create',NULL,'2023-10-14 03:19:10','2023-10-14 03:19:55'),
(23,21,0,'Vet & Para Vet Form','fa-user-md','vets/create',NULL,'2023-10-14 03:21:17','2023-10-14 03:21:17'),
(24,21,0,'Farm Form','fa-map','farms/create',NULL,'2023-10-14 03:22:39','2023-10-14 03:22:39');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `input` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES
(1,1,'/','GET','127.0.0.1','[]','2023-10-02 06:24:28','2023-10-02 06:24:28'),
(2,1,'/','GET','127.0.0.1','[]','2023-10-02 06:30:37','2023-10-02 06:30:37'),
(3,1,'/','GET','127.0.0.1','[]','2023-10-02 06:30:57','2023-10-02 06:30:57'),
(4,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:21','2023-10-02 06:31:21'),
(5,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:33','2023-10-02 06:31:33'),
(6,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:55','2023-10-02 06:31:55'),
(7,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:32:17','2023-10-02 06:32:17'),
(8,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Breeds\",\"icon\":\"fa-drupal\",\"uri\":\"breeds\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:34:43','2023-10-02 06:34:43'),
(9,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:34:43','2023-10-02 06:34:43'),
(10,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farms\",\"icon\":\"fa-location-arrow\",\"uri\":\"farmers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:36:01','2023-10-02 06:36:01'),
(11,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:36:01','2023-10-02 06:36:01'),
(12,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farmers\",\"icon\":\"fa-users\",\"uri\":\"farmers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:36:34','2023-10-02 06:36:34'),
(13,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:36:35','2023-10-02 06:36:35'),
(14,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Animals\",\"icon\":\"fa-certificate\",\"uri\":\"animals\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:37:00','2023-10-02 06:37:00'),
(15,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:37:00','2023-10-02 06:37:00'),
(16,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Health Records\",\"icon\":\"fa-sticky-note-o\",\"uri\":\"animal-health-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:37:49','2023-10-02 06:37:49'),
(17,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:37:49','2023-10-02 06:37:49'),
(18,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Vectors & Diseases\",\"icon\":\"fa-bug\",\"uri\":\"vector-and-diseases\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:40:59','2023-10-02 06:40:59'),
(19,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:41:00','2023-10-02 06:41:00'),
(20,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Vets & Para Vets\",\"icon\":\"fa-user-md\",\"uri\":\"vets\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:41:30','2023-10-02 06:41:30'),
(21,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:41:31','2023-10-02 06:41:31'),
(22,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Service Providers\",\"icon\":\"fa-anchor\",\"uri\":\"service-providers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:42:21','2023-10-02 06:42:21'),
(23,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:42:22','2023-10-02 06:42:22'),
(24,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Production Records\",\"icon\":\"fa-balance-scale\",\"uri\":\"production-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:46:02','2023-10-02 06:46:02'),
(25,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:46:02','2023-10-02 06:46:02'),
(26,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Financial Records\",\"icon\":\"fa-money\",\"uri\":\"financial-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:46:29','2023-10-02 06:46:29'),
(27,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:46:30','2023-10-02 06:46:30'),
(28,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farm Activities\",\"icon\":\"fa-braille\",\"uri\":\"farm-activities\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:49:41','2023-10-02 06:49:41'),
(29,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:49:42','2023-10-02 06:49:42'),
(30,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:49:44','2023-10-02 06:49:44'),
(31,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:49:58','2023-10-02 06:49:58'),
(32,1,'service-providers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:02','2023-10-02 06:50:02'),
(33,1,'vets','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:05','2023-10-02 06:50:05'),
(34,1,'vector-and-diseases','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:06','2023-10-02 06:50:06'),
(35,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:07','2023-10-02 06:50:07'),
(36,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:27','2023-10-02 06:50:27'),
(37,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:41','2023-10-02 06:50:41'),
(38,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:43','2023-10-02 06:50:43'),
(39,1,'financial-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:45','2023-10-02 06:50:45'),
(40,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:01','2023-10-02 06:51:01'),
(41,1,'farmers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:03','2023-10-02 06:51:03'),
(42,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:14','2023-10-02 06:51:14'),
(43,1,'farm-activities/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:18','2023-10-02 06:51:18'),
(44,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 06:59:17','2023-10-02 06:59:17'),
(45,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 06:59:29','2023-10-02 06:59:29'),
(46,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:47','2023-10-02 06:59:47'),
(47,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:48','2023-10-02 06:59:48'),
(48,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:50','2023-10-02 06:59:50'),
(49,1,'farm-activities/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:53','2023-10-02 06:59:53'),
(50,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 07:00:32','2023-10-02 07:00:32'),
(51,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:55','2023-10-02 07:01:55'),
(52,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:56','2023-10-02 07:01:56'),
(53,1,'financial-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:58','2023-10-02 07:01:58'),
(54,1,'financial-records/create','GET','127.0.0.1','[]','2023-10-02 07:03:09','2023-10-02 07:03:09'),
(55,1,'financial-records/create','GET','127.0.0.1','[]','2023-10-02 07:03:28','2023-10-02 07:03:28'),
(56,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:03:37','2023-10-02 07:03:37'),
(57,1,'production-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:03:43','2023-10-02 07:03:43'),
(58,1,'production-records/create','GET','127.0.0.1','[]','2023-10-02 07:05:04','2023-10-02 07:05:04'),
(59,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:24','2023-10-02 07:05:24'),
(60,1,'production-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:27','2023-10-02 07:05:27'),
(61,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:30','2023-10-02 07:05:30'),
(62,1,'service-providers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:33','2023-10-02 07:05:33'),
(63,1,'breeds','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:54','2023-10-02 07:05:54'),
(64,1,'breeds/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:56','2023-10-02 07:05:56'),
(65,1,'/','GET','144.76.168.245','[]','2023-10-02 08:42:18','2023-10-02 08:42:18'),
(66,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 08:42:31','2023-10-02 08:42:31'),
(67,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 08:42:46','2023-10-02 08:42:46'),
(68,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 08:43:01','2023-10-02 08:43:01'),
(69,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 08:43:03','2023-10-02 08:43:03'),
(70,1,'animals/create','GET','144.76.168.245','[]','2023-10-02 08:55:22','2023-10-02 08:55:22'),
(71,1,'/','GET','144.76.168.245','[]','2023-10-02 08:56:52','2023-10-02 08:56:52'),
(72,1,'/','GET','144.76.168.245','[]','2023-10-02 08:57:34','2023-10-02 08:57:34'),
(73,1,'vets','GET','144.76.168.245','[]','2023-10-02 08:58:25','2023-10-02 08:58:25'),
(74,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 08:58:28','2023-10-02 08:58:28'),
(75,1,'/','GET','144.76.168.245','[]','2023-10-02 11:39:56','2023-10-02 11:39:56'),
(76,1,'/','GET','144.76.168.245','[]','2023-10-02 11:45:02','2023-10-02 11:45:02'),
(77,1,'auth/logout','GET','144.76.168.245','[]','2023-10-02 11:45:07','2023-10-02 11:45:07'),
(78,1,'/','GET','144.76.168.245','[]','2023-10-02 11:54:06','2023-10-02 11:54:06'),
(79,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 11:55:01','2023-10-02 11:55:01'),
(80,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 11:55:03','2023-10-02 11:55:03'),
(81,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 11:55:04','2023-10-02 11:55:04'),
(82,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 11:55:05','2023-10-02 11:55:05'),
(83,1,'/','GET','144.76.168.245','[]','2023-10-02 12:16:49','2023-10-02 12:16:49'),
(84,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:17:03','2023-10-02 12:17:03'),
(85,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:18:45','2023-10-02 12:18:45'),
(86,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:18:49','2023-10-02 12:18:49'),
(87,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:18:52','2023-10-02 12:18:52'),
(88,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:18:55','2023-10-02 12:18:55'),
(89,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:18:58','2023-10-02 12:18:58'),
(90,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:19:04','2023-10-02 12:19:04'),
(91,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:19:06','2023-10-02 12:19:06'),
(92,1,'/','GET','144.76.168.245','[]','2023-10-02 12:26:20','2023-10-02 12:26:20'),
(93,1,'/','GET','144.76.168.245','[]','2023-10-02 12:29:46','2023-10-02 12:29:46'),
(94,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:07','2023-10-02 12:30:07'),
(95,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:09','2023-10-02 12:30:09'),
(96,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:18','2023-10-02 12:30:18'),
(97,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:20','2023-10-02 12:30:20'),
(98,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:22','2023-10-02 12:30:22'),
(99,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:23','2023-10-02 12:30:23'),
(100,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:24','2023-10-02 12:30:24'),
(101,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:27','2023-10-02 12:30:27'),
(102,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:28','2023-10-02 12:30:28'),
(103,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:30','2023-10-02 12:30:30'),
(104,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:31','2023-10-02 12:30:31'),
(105,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:34','2023-10-02 12:30:34'),
(106,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:36','2023-10-02 12:30:36'),
(107,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:40','2023-10-02 12:30:40'),
(108,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:30:42','2023-10-02 12:30:42'),
(109,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:12','2023-10-02 12:31:12'),
(110,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:15','2023-10-02 12:31:15'),
(111,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:28','2023-10-02 12:31:28'),
(112,1,'animal-health-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:30','2023-10-02 12:31:30'),
(113,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:40','2023-10-02 12:31:40'),
(114,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:42','2023-10-02 12:31:42'),
(115,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:55','2023-10-02 12:31:55'),
(116,1,'animal-health-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:31:59','2023-10-02 12:31:59'),
(117,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:32:02','2023-10-02 12:32:02'),
(118,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:32:07','2023-10-02 12:32:07'),
(119,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:38:57','2023-10-02 12:38:57'),
(120,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:39:40','2023-10-02 12:39:40'),
(121,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:39:46','2023-10-02 12:39:46'),
(122,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:40:26','2023-10-02 12:40:26'),
(123,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-02 12:40:28','2023-10-02 12:40:28'),
(124,1,'vets','GET','144.76.168.245','[]','2023-10-03 05:23:08','2023-10-03 05:23:08'),
(125,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 06:03:36','2023-10-03 06:03:36'),
(126,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 06:03:38','2023-10-03 06:03:38'),
(127,1,'farmers','POST','144.76.168.245','{\"profile_picture\":null,\"surname\":null,\"given_name\":null,\"date_of_birth\":\"2023-10-03\",\"nin\":null,\"physical_address\":null,\"gender\":null,\"marital_status\":null,\"number_of_dependants\":null,\"farmer_group\":null,\"primary_phone_number\":null,\"secondary_phone_number\":null,\"is_land_owner\":\"off\",\"production_scale\":null,\"access_to_credit\":\"off\",\"date_started_farming\":\"2023-10-03\",\"highest_level_of_education\":null,\"_token\":\"BIR0307HdNqy92JXBzIYxNm2kPQWCyGiwA5914Qb\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/farmers\"}','2023-10-03 06:03:58','2023-10-03 06:03:58'),
(128,1,'farmers/create','GET','144.76.168.245','[]','2023-10-03 06:03:58','2023-10-03 06:03:58'),
(129,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 06:05:18','2023-10-03 06:05:18'),
(130,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 06:05:22','2023-10-03 06:05:22'),
(131,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:52:01','2023-10-03 08:52:01'),
(132,1,'service-providers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:52:06','2023-10-03 08:52:06'),
(133,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:54:44','2023-10-03 08:54:44'),
(134,1,'financial-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:54:46','2023-10-03 08:54:46'),
(135,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:54:58','2023-10-03 08:54:58'),
(136,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:55:04','2023-10-03 08:55:04'),
(137,1,'production-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 08:55:06','2023-10-03 08:55:06'),
(138,1,'service-providers','GET','144.76.168.245','[]','2023-10-03 09:45:34','2023-10-03 09:45:34'),
(139,1,'production-records/create','GET','144.76.168.245','[]','2023-10-03 10:24:27','2023-10-03 10:24:27'),
(140,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:24:51','2023-10-03 10:24:51'),
(141,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:24:54','2023-10-03 10:24:54'),
(142,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:25:01','2023-10-03 10:25:01'),
(143,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:25:11','2023-10-03 10:25:11'),
(144,1,'animal-health-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:25:14','2023-10-03 10:25:14'),
(145,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:55:55','2023-10-03 10:55:55'),
(146,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:55:59','2023-10-03 10:55:59'),
(147,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:56:00','2023-10-03 10:56:00'),
(148,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:56:05','2023-10-03 10:56:05'),
(149,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:56:07','2023-10-03 10:56:07'),
(150,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:56:09','2023-10-03 10:56:09'),
(151,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 10:56:12','2023-10-03 10:56:12'),
(152,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:15:20','2023-10-03 11:15:20'),
(153,1,'farm-activities/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:15:23','2023-10-03 11:15:23'),
(154,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:15:50','2023-10-03 11:15:50'),
(155,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:15:52','2023-10-03 11:15:52'),
(156,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:16:01','2023-10-03 11:16:01'),
(157,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 11:45:16','2023-10-03 11:45:16'),
(158,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 12:02:13','2023-10-03 12:02:13'),
(159,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 12:02:14','2023-10-03 12:02:14'),
(160,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 12:02:19','2023-10-03 12:02:19'),
(161,1,'farmers/create','GET','144.76.168.245','[]','2023-10-03 12:46:28','2023-10-03 12:46:28'),
(162,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 12:47:33','2023-10-03 12:47:33'),
(163,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-03 12:47:39','2023-10-03 12:47:39'),
(164,1,'farmers/create','GET','144.76.168.245','[]','2023-10-04 03:06:37','2023-10-04 03:06:37'),
(165,1,'farmers/create','GET','144.76.168.245','[]','2023-10-04 07:16:15','2023-10-04 07:16:15'),
(166,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:55:53','2023-10-04 09:55:53'),
(167,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:55:57','2023-10-04 09:55:57'),
(168,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:55:58','2023-10-04 09:55:58'),
(169,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:00','2023-10-04 09:56:00'),
(170,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:10','2023-10-04 09:56:10'),
(171,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:12','2023-10-04 09:56:12'),
(172,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:14','2023-10-04 09:56:14'),
(173,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:16','2023-10-04 09:56:16'),
(174,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 09:56:16','2023-10-04 09:56:16'),
(175,1,'farmers/create','GET','144.76.168.245','[]','2023-10-04 10:22:40','2023-10-04 10:22:40'),
(176,1,'farmers','POST','144.76.168.245','{\"profile_picture\":\"Maxime voluptate qui\",\"surname\":\"Britt\",\"given_name\":\"Alika Jordan\",\"date_of_birth\":\"2023-10-04\",\"nin\":\"Assumenda maxime ull\",\"physical_address\":\"In officia vel enim\",\"gender\":\"male\",\"marital_status\":\"single\",\"number_of_dependants\":\"3\",\"farmer_group\":\"Magni velit iste quo\",\"primary_phone_number\":\"+1 (418) 208-7579\",\"secondary_phone_number\":\"+1 (418) 208-7579\",\"is_land_owner\":\"off\",\"production_scale\":\"Quas est maxime esse\",\"access_to_credit\":\"off\",\"date_started_farming\":\"2023-10-04\",\"highest_level_of_education\":\"Consequatur Natus e\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"3\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/farmers\"}','2023-10-04 10:26:34','2023-10-04 10:26:34'),
(177,1,'farmers/1','GET','144.76.168.245','[]','2023-10-04 10:26:35','2023-10-04 10:26:35'),
(178,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 10:26:42','2023-10-04 10:26:42'),
(179,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 10:26:44','2023-10-04 10:26:44'),
(180,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:28','2023-10-04 11:06:28'),
(181,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:30','2023-10-04 11:06:30'),
(182,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:41','2023-10-04 11:06:41'),
(183,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:43','2023-10-04 11:06:43'),
(184,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:46','2023-10-04 11:06:46'),
(185,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:06:48','2023-10-04 11:06:48'),
(186,1,'vector-and-diseases','GET','144.76.168.245','[]','2023-10-04 11:15:13','2023-10-04 11:15:13'),
(187,1,'vector-and-diseases/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:15:15','2023-10-04 11:15:15'),
(188,1,'vector-and-diseases','POST','144.76.168.245','{\"name\":\"McKenzie Barr\",\"description\":\"Ipsum mollit commodi\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"2\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/vector-and-diseases\"}','2023-10-04 11:15:22','2023-10-04 11:15:22'),
(189,1,'vector-and-diseases/create','GET','144.76.168.245','[]','2023-10-04 11:15:23','2023-10-04 11:15:23'),
(190,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:15:34','2023-10-04 11:15:34'),
(191,1,'vector-and-diseases/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:15:43','2023-10-04 11:15:43'),
(192,1,'vector-and-diseases','POST','144.76.168.245','{\"name\":\"Lyle Strickland\",\"description\":\"Ex irure illum volu\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"2\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/vector-and-diseases\"}','2023-10-04 11:17:57','2023-10-04 11:17:57'),
(193,1,'vector-and-diseases/create','GET','144.76.168.245','[]','2023-10-04 11:17:57','2023-10-04 11:17:57'),
(194,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:18:05','2023-10-04 11:18:05'),
(195,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:18:55','2023-10-04 11:18:55'),
(196,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:18:56','2023-10-04 11:18:56'),
(197,1,'vets','POST','144.76.168.245','{\"profile_picture\":\"Dolore voluptatibus\",\"title\":\"Accusantium recusand\",\"surname\":\"Melendez\",\"given_name\":\"Brielle Strong\",\"nin\":\"Do id ullam quo id\",\"physical_address\":\"Eos nulla nemo odit\",\"group_or_practice\":\"Perspiciatis rerum\",\"license_number\":\"23\",\"license_expiry_date\":\"02-Oct-2026\",\"date_of_registration\":\"09-Mar-2019\",\"brief_profile\":\"Ea et aliqua Autem\",\"primary_phone_number\":\"+1 (337) 458-8078\",\"secondary_phone_number\":\"+1 (337) 458-8078\",\"email\":\"wigowa@mailinator.com\",\"postal_address\":\"Praesentium vitae ea\",\"services_offered\":\"Omnis cillum nobis i\",\"ares_of_operation\":\"Quis cumque ipsum se\",\"certificate_of_registration\":\"Aut dolor numquam in\",\"license\":\"Dolorem similique la\",\"other_documents\":\"Temporibus voluptas\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"3\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/vets\"}','2023-10-04 11:23:02','2023-10-04 11:23:02'),
(198,1,'vets/1','GET','144.76.168.245','[]','2023-10-04 11:23:02','2023-10-04 11:23:02'),
(199,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:10','2023-10-04 11:23:10'),
(200,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:14','2023-10-04 11:23:14'),
(201,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:20','2023-10-04 11:23:20'),
(202,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:23','2023-10-04 11:23:23'),
(203,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:31','2023-10-04 11:23:31'),
(204,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:33','2023-10-04 11:23:33'),
(205,1,'breeds','POST','144.76.168.245','{\"name\":\"Verno\",\"description\":\"Dignissimos et tempo\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/breeds\"}','2023-10-04 11:23:46','2023-10-04 11:23:46'),
(206,1,'breeds','GET','144.76.168.245','[]','2023-10-04 11:23:46','2023-10-04 11:23:46'),
(207,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:23:49','2023-10-04 11:23:49'),
(208,1,'breeds','POST','144.76.168.245','{\"name\":\"Timon Combs\",\"description\":\"Est et excepturi vo\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"1\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/breeds\"}','2023-10-04 11:23:56','2023-10-04 11:23:56'),
(209,1,'breeds/2/edit','GET','144.76.168.245','[]','2023-10-04 11:23:56','2023-10-04 11:23:56'),
(210,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:04','2023-10-04 11:24:04'),
(211,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:06','2023-10-04 11:24:06'),
(212,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:09','2023-10-04 11:24:09'),
(213,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:11','2023-10-04 11:24:11'),
(214,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:15','2023-10-04 11:24:15'),
(215,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:24:59','2023-10-04 11:24:59'),
(216,1,'service-providers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:25:01','2023-10-04 11:25:01'),
(217,1,'service-providers','POST','144.76.168.245','{\"name\":\"Zachery Bray\",\"owner_name\":\"Brennan Hickman\",\"owner_profile\":\"Voluptatum dignissim\",\"class_of_service\":\"Repudiandae numquam\",\"date_of_registration\":\"2023-10-04\",\"physical_address\":\"Voluptatem nihil ut\",\"primary_phone_number\":\"+1 (943) 939-3012\",\"secondary_phone_number\":\"+1 (943) 939-3012\",\"email\":\"rihefi@mailinator.com\",\"postal_address\":\"Fuga Aliquam accusa\",\"other_services\":\"Placeat nisi adipis\",\"logo\":\"Est aut voluptatem\",\"distroict_of_operation\":\"Voluptate vitae cons\",\"NDA_registration_number\":\"824\",\"tin_number_business\":\"5\",\"tin_number_owner\":\"78\",\"license\":\"Doloribus atque aliq\",\"other_documents\":\"Dolorum dolor sint\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"3\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/service-providers\"}','2023-10-04 11:25:08','2023-10-04 11:25:08'),
(218,1,'service-providers/1','GET','144.76.168.245','[]','2023-10-04 11:25:08','2023-10-04 11:25:08'),
(219,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:25:16','2023-10-04 11:25:16'),
(220,1,'service-providers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:25:29','2023-10-04 11:25:29'),
(221,1,'service-providers','POST','144.76.168.245','{\"name\":\"Graham Day\",\"owner_name\":\"Kelly Wilder\",\"owner_profile\":\"Ipsum qui quia illo\",\"class_of_service\":\"Minim quis iste ut d\",\"date_of_registration\":\"2023-10-04\",\"physical_address\":\"Cillum aut quo tempo\",\"primary_phone_number\":\"+1 (899) 218-7883\",\"secondary_phone_number\":\"+1 (899) 218-7883\",\"email\":\"hakebinig@mailinator.com\",\"postal_address\":\"Voluptate excepturi\",\"other_services\":\"Iste officia quia mo\",\"logo\":\"Rerum asperiores cil\",\"distroict_of_operation\":\"Laborum Quia volupt\",\"NDA_registration_number\":\"224\",\"tin_number_business\":\"297\",\"tin_number_owner\":\"715\",\"license\":\"Eius odio veniam lo\",\"other_documents\":\"Totam ullam doloremq\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/service-providers\"}','2023-10-04 11:25:36','2023-10-04 11:25:36'),
(222,1,'service-providers','GET','144.76.168.245','[]','2023-10-04 11:25:36','2023-10-04 11:25:36'),
(223,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:25:49','2023-10-04 11:25:49'),
(224,1,'production-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:25:52','2023-10-04 11:25:52'),
(225,1,'production-records','POST','144.76.168.245','{\"farm_id\":null,\"breed_id\":\"1\",\"production_type\":\"Assumenda quam sed q\",\"weight\":\"Doloremque ipsum nat\",\"daily_weight_gain\":\"Veniam dignissimos\",\"quantity\":\"459\",\"quality\":\"Laudantium earum ve\",\"input_ratios\":\"3\",\"value_addition\":\"Quia consequatur quo\",\"_token\":\"BZqWzZzH2PsialrsU08XfPBPHKV0czA7rRh8JOEW\",\"after-save\":\"3\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/production-records\"}','2023-10-04 11:26:14','2023-10-04 11:26:14'),
(226,1,'production-records/create','GET','144.76.168.245','[]','2023-10-04 11:26:15','2023-10-04 11:26:15'),
(227,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:26:26','2023-10-04 11:26:26'),
(228,1,'financial-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:26:29','2023-10-04 11:26:29'),
(229,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:26:33','2023-10-04 11:26:33'),
(230,1,'farm-activities/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:26:37','2023-10-04 11:26:37'),
(231,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:28:17','2023-10-04 11:28:17'),
(232,1,'animal-health-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:28:19','2023-10-04 11:28:19'),
(233,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:28:26','2023-10-04 11:28:26'),
(234,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:30:22','2023-10-04 11:30:22'),
(235,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:30:23','2023-10-04 11:30:23'),
(236,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:30:57','2023-10-04 11:30:57'),
(237,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:32:01','2023-10-04 11:32:01'),
(238,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:32:05','2023-10-04 11:32:05'),
(239,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:32:17','2023-10-04 11:32:17'),
(240,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:32:20','2023-10-04 11:32:20'),
(241,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:32:22','2023-10-04 11:32:22'),
(242,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:34:15','2023-10-04 11:34:15'),
(243,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:34:17','2023-10-04 11:34:17'),
(244,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:35:47','2023-10-04 11:35:47'),
(245,1,'service-providers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:35:49','2023-10-04 11:35:49'),
(246,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:36:30','2023-10-04 11:36:30'),
(247,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:36:31','2023-10-04 11:36:31'),
(248,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:36:32','2023-10-04 11:36:32'),
(249,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:36:32','2023-10-04 11:36:32'),
(250,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-04 11:36:32','2023-10-04 11:36:32'),
(251,1,'/','GET','144.76.168.245','[]','2023-10-04 12:04:52','2023-10-04 12:04:52'),
(252,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 04:11:38','2023-10-05 04:11:38'),
(253,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 04:11:41','2023-10-05 04:11:41'),
(254,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 04:11:43','2023-10-05 04:11:43'),
(255,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 04:41:59','2023-10-05 04:41:59'),
(256,1,'/','GET','144.76.168.245','[]','2023-10-05 05:53:32','2023-10-05 05:53:32'),
(257,1,'breeds','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:53:40','2023-10-05 05:53:40'),
(258,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:53:51','2023-10-05 05:53:51'),
(259,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:54:01','2023-10-05 05:54:01'),
(260,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:54:06','2023-10-05 05:54:06'),
(261,1,'auth/login','GET','144.76.168.245','[]','2023-10-05 05:54:10','2023-10-05 05:54:10'),
(262,1,'/','GET','144.76.168.245','[]','2023-10-05 05:54:11','2023-10-05 05:54:11'),
(263,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:54:17','2023-10-05 05:54:17'),
(264,1,'auth/menu','GET','144.76.168.245','[]','2023-10-05 05:54:24','2023-10-05 05:54:24'),
(265,1,'auth/menu/9/edit','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:54:44','2023-10-05 05:54:44'),
(266,1,'auth/menu/9','PUT','144.76.168.245','{\"parent_id\":\"0\",\"title\":\"Farms\",\"icon\":\"fa-location-arrow\",\"uri\":\"farms\",\"roles\":[null],\"permission\":null,\"_token\":\"3sUuygFIhEkPQ8Dke3qRqDqhMK52zkIlTWnTyd05\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/menu\"}','2023-10-05 05:54:51','2023-10-05 05:54:51'),
(267,1,'auth/menu','GET','144.76.168.245','[]','2023-10-05 05:54:51','2023-10-05 05:54:51'),
(268,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:54:55','2023-10-05 05:54:55'),
(269,1,'farmers','GET','144.76.168.245','[]','2023-10-05 05:54:58','2023-10-05 05:54:58'),
(270,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:55:03','2023-10-05 05:55:03'),
(271,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:55:05','2023-10-05 05:55:05'),
(272,1,'auth/logout','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 05:55:48','2023-10-05 05:55:48'),
(273,1,'breeds','GET','144.76.168.245','[]','2023-10-05 06:10:07','2023-10-05 06:10:07'),
(274,1,'breeds/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 06:10:12','2023-10-05 06:10:12'),
(275,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 06:11:31','2023-10-05 06:11:31'),
(276,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-05 06:11:33','2023-10-05 06:11:33'),
(277,1,'/','GET','144.76.168.245','[]','2023-10-10 03:56:44','2023-10-10 03:56:44'),
(278,1,'/','GET','144.76.168.245','[]','2023-10-10 06:36:01','2023-10-10 06:36:01'),
(279,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:36:15','2023-10-10 06:36:15'),
(280,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:36:20','2023-10-10 06:36:20'),
(281,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:36:25','2023-10-10 06:36:25'),
(282,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:36:28','2023-10-10 06:36:28'),
(283,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:36:29','2023-10-10 06:36:29'),
(284,1,'farms','POST','144.76.168.245','{\"name\":\"Jordan cattle\",\"location\":\"mbarara\",\"livestock_type\":\"cattle\",\"production_type\":\"small\",\"date_of_establishment\":\"2023-10-02\",\"size\":\"large\",\"profile_picture\":\"Enim blanditiis aliq\",\"number_of_livestock\":\"907\",\"number_of_workers\":\"10\",\"land_ownership\":\"Voluptatibus adipisi\",\"general_remarks\":\"Quibusdam culpa et\",\"_token\":\"Ge0R1PENRPmmSAE4KcxleL7J425JVgPy3Ru2ygnw\",\"after-save\":\"2\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/farms\"}','2023-10-10 06:37:48','2023-10-10 06:37:48'),
(285,1,'farms/create','GET','144.76.168.245','[]','2023-10-10 06:37:48','2023-10-10 06:37:48'),
(286,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:37:54','2023-10-10 06:37:54'),
(287,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:37:59','2023-10-10 06:37:59'),
(288,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 06:38:01','2023-10-10 06:38:01'),
(289,1,'animals','POST','144.76.168.245','{\"farm_id\":\"1\",\"breed_id\":\"1\",\"parents\":\"verno one\",\"dob\":\"2023-07-10 08:38:01\",\"date_of_weaning\":\"2023-10-10\",\"_token\":\"Ge0R1PENRPmmSAE4KcxleL7J425JVgPy3Ru2ygnw\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/animals\"}','2023-10-10 06:50:08','2023-10-10 06:50:08'),
(290,1,'animals','GET','144.76.168.245','[]','2023-10-10 06:50:08','2023-10-10 06:50:08'),
(291,1,'auth/login','GET','144.76.168.245','[]','2023-10-10 07:55:30','2023-10-10 07:55:30'),
(292,1,'/','GET','144.76.168.245','[]','2023-10-10 07:55:30','2023-10-10 07:55:30'),
(293,1,'auth/logout','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 07:55:36','2023-10-10 07:55:36'),
(294,1,'/','GET','144.76.168.245','[]','2023-10-10 09:00:44','2023-10-10 09:00:44'),
(295,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:00:57','2023-10-10 09:00:57'),
(296,1,'auth/menu','POST','144.76.168.245','{\"parent_id\":\"0\",\"title\":\"Livestock Types\",\"icon\":\"fa-adjust\",\"uri\":\"livestock-types\",\"roles\":[null],\"permission\":null,\"_token\":\"8zUeqQPn1vUgLXimtKqgqCR3Ri1hCy5MFiRRrZx7\"}','2023-10-10 09:01:25','2023-10-10 09:01:25'),
(297,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:01:26','2023-10-10 09:01:26'),
(298,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:01:34','2023-10-10 09:01:34'),
(299,1,'livestock-types','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:01:38','2023-10-10 09:01:38'),
(300,1,'auth/menu','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:01:44','2023-10-10 09:01:44'),
(301,1,'auth/menu','POST','144.76.168.245','{\"parent_id\":\"0\",\"title\":\"Configurations\",\"icon\":\"fa-cogs\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"8zUeqQPn1vUgLXimtKqgqCR3Ri1hCy5MFiRRrZx7\"}','2023-10-10 09:02:08','2023-10-10 09:02:08'),
(302,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:02:09','2023-10-10 09:02:09'),
(303,1,'auth/menu/19/edit','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:02:19','2023-10-10 09:02:19'),
(304,1,'auth/menu/19','PUT','144.76.168.245','{\"parent_id\":\"20\",\"title\":\"Livestock Types\",\"icon\":\"fa-adjust\",\"uri\":\"livestock-types\",\"roles\":[null],\"permission\":null,\"_token\":\"8zUeqQPn1vUgLXimtKqgqCR3Ri1hCy5MFiRRrZx7\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/menu\"}','2023-10-10 09:02:36','2023-10-10 09:02:36'),
(305,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:02:36','2023-10-10 09:02:36'),
(306,1,'auth/menu/8/edit','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:02:43','2023-10-10 09:02:43'),
(307,1,'auth/menu/8','PUT','144.76.168.245','{\"parent_id\":\"20\",\"title\":\"Breeds\",\"icon\":\"fa-drupal\",\"uri\":\"breeds\",\"roles\":[null],\"permission\":null,\"_token\":\"8zUeqQPn1vUgLXimtKqgqCR3Ri1hCy5MFiRRrZx7\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/menu\"}','2023-10-10 09:02:56','2023-10-10 09:02:56'),
(308,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:02:56','2023-10-10 09:02:56'),
(309,1,'/','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:03:05','2023-10-10 09:03:05'),
(310,1,'auth/menu','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 09:03:08','2023-10-10 09:03:08'),
(311,1,'auth/menu','GET','144.76.168.245','[]','2023-10-10 09:03:26','2023-10-10 09:03:26'),
(312,1,'/','GET','144.76.168.245','[]','2023-10-10 11:57:30','2023-10-10 11:57:30'),
(313,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-10 11:58:21','2023-10-10 11:58:21'),
(314,1,'/','GET','144.76.168.245','[]','2023-10-11 10:22:18','2023-10-11 10:22:18'),
(315,1,'/','GET','41.75.184.136','[]','2023-10-13 05:08:08','2023-10-13 05:08:08'),
(316,1,'/','GET','41.210.155.90','[]','2023-10-13 06:21:55','2023-10-13 06:21:55'),
(317,1,'farmers','GET','41.210.155.90','{\"_pjax\":\"#pjax-container\"}','2023-10-13 06:22:53','2023-10-13 06:22:53'),
(318,1,'/','GET','41.75.177.56','[]','2023-10-14 03:11:17','2023-10-14 03:11:17'),
(319,1,'auth/logout','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:11:22','2023-10-14 03:11:22'),
(320,1,'/','GET','41.75.177.56','[]','2023-10-14 03:14:01','2023-10-14 03:14:01'),
(321,1,'auth/roles','GET','41.75.177.56','[]','2023-10-14 03:14:10','2023-10-14 03:14:10'),
(322,1,'auth/roles/create','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:14:13','2023-10-14 03:14:13'),
(323,1,'auth/roles','POST','41.75.177.56','{\"slug\":\"basic-user\",\"name\":\"Basic User\",\"permissions\":[\"1\",null],\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-14 03:14:48','2023-10-14 03:14:48'),
(324,1,'auth/roles','GET','41.75.177.56','[]','2023-10-14 03:14:49','2023-10-14 03:14:49'),
(325,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:15:36','2023-10-14 03:15:36'),
(326,1,'auth/menu','POST','41.75.177.56','{\"parent_id\":\"0\",\"title\":\"Registration Forms\",\"icon\":\"fa-pencil-square-o\",\"uri\":null,\"roles\":[\"1\",\"2\",null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\"}','2023-10-14 03:16:28','2023-10-14 03:16:28'),
(327,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:16:29','2023-10-14 03:16:29'),
(328,1,'auth/menu','POST','41.75.177.56','{\"parent_id\":\"21\",\"title\":\"Farmer Form\",\"icon\":\"fa-user-plus\",\"uri\":\"farmers\\/create\",\"roles\":[\"2\",null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\"}','2023-10-14 03:19:10','2023-10-14 03:19:10'),
(329,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:19:11','2023-10-14 03:19:11'),
(330,1,'auth/menu/21/edit','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:19:26','2023-10-14 03:19:26'),
(331,1,'auth/menu/21','PUT','41.75.177.56','{\"parent_id\":\"0\",\"title\":\"Registration Forms\",\"icon\":\"fa-pencil-square-o\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/menu\"}','2023-10-14 03:19:43','2023-10-14 03:19:43'),
(332,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:19:44','2023-10-14 03:19:44'),
(333,1,'auth/menu','POST','41.75.177.56','{\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\",\"_order\":\"[{\\\"id\\\":21,\\\"children\\\":[{\\\"id\\\":22}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":17},{\\\"id\\\":18},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":8},{\\\"id\\\":19}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2023-10-14 03:19:55','2023-10-14 03:19:55'),
(334,1,'auth/menu','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:19:56','2023-10-14 03:19:56'),
(335,1,'auth/menu','POST','41.75.177.56','{\"parent_id\":\"21\",\"title\":\"Vet & Para Vet Form\",\"icon\":\"fa-user-md\",\"uri\":\"vets\\/create\",\"roles\":[\"1\",\"2\",null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\"}','2023-10-14 03:21:17','2023-10-14 03:21:17'),
(336,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:21:17','2023-10-14 03:21:17'),
(337,1,'auth/menu/22/edit','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:21:23','2023-10-14 03:21:23'),
(338,1,'auth/menu/22','PUT','41.75.177.56','{\"parent_id\":\"21\",\"title\":\"Farmer Form\",\"icon\":\"fa-user-plus\",\"uri\":\"farmers\\/create\",\"roles\":[\"1\",\"2\",null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/menu\"}','2023-10-14 03:21:33','2023-10-14 03:21:33'),
(339,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:21:35','2023-10-14 03:21:35'),
(340,1,'auth/menu','POST','41.75.177.56','{\"parent_id\":\"21\",\"title\":\"Farm Form\",\"icon\":\"fa-map\",\"uri\":\"farms\\/create\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"AFaJfeEGPUiJxXUt2cebkOaRpwgtC3ekeBWBh7s2\"}','2023-10-14 03:22:39','2023-10-14 03:22:39'),
(341,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:22:39','2023-10-14 03:22:39'),
(342,1,'auth/menu','GET','41.75.177.56','[]','2023-10-14 03:22:46','2023-10-14 03:22:46'),
(343,1,'vets/create','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:01','2023-10-14 03:23:01'),
(344,1,'farmers/create','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:03','2023-10-14 03:23:03'),
(345,1,'farms/create','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:05','2023-10-14 03:23:05'),
(346,1,'service-providers','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:36','2023-10-14 03:23:36'),
(347,1,'farms','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:40','2023-10-14 03:23:40'),
(348,1,'farmers','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:42','2023-10-14 03:23:42'),
(349,1,'farms','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:43','2023-10-14 03:23:43'),
(350,1,'auth/logout','GET','41.75.177.56','{\"_pjax\":\"#pjax-container\"}','2023-10-14 03:23:49','2023-10-14 03:23:49'),
(351,1,'/','GET','41.75.174.227','[]','2023-10-14 05:49:49','2023-10-14 05:49:49'),
(352,1,'farmers/create','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:50:08','2023-10-14 05:50:08'),
(353,1,'vets/create','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:50:20','2023-10-14 05:50:20'),
(354,1,'farms/create','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:50:27','2023-10-14 05:50:27'),
(355,1,'animals','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:50:38','2023-10-14 05:50:38'),
(356,1,'animals/create','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:50:40','2023-10-14 05:50:40'),
(357,1,'livestock-types','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:51:04','2023-10-14 05:51:04'),
(358,1,'breeds','GET','41.75.174.227','{\"_pjax\":\"#pjax-container\"}','2023-10-14 05:51:08','2023-10-14 05:51:08'),
(359,1,'/','GET','144.76.168.245','[]','2023-10-16 08:00:20','2023-10-16 08:00:20'),
(360,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:27','2023-10-16 08:00:27'),
(361,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:29','2023-10-16 08:00:29'),
(362,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:31','2023-10-16 08:00:31'),
(363,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:32','2023-10-16 08:00:32'),
(364,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:33','2023-10-16 08:00:33'),
(365,1,'farm-activities','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:49','2023-10-16 08:00:49'),
(366,1,'financial-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:50','2023-10-16 08:00:50'),
(367,1,'production-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:51','2023-10-16 08:00:51'),
(368,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:53','2023-10-16 08:00:53'),
(369,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:54','2023-10-16 08:00:54'),
(370,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:55','2023-10-16 08:00:55'),
(371,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:00:57','2023-10-16 08:00:57'),
(372,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:01:00','2023-10-16 08:01:00'),
(373,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:01:05','2023-10-16 08:01:05'),
(374,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 08:01:07','2023-10-16 08:01:07'),
(375,1,'auth/login','GET','144.76.168.245','[]','2023-10-16 11:57:34','2023-10-16 11:57:34'),
(376,1,'/','GET','144.76.168.245','[]','2023-10-16 11:57:34','2023-10-16 11:57:34'),
(377,1,'auth/logout','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:01:48','2023-10-16 12:01:48'),
(378,1,'/','GET','144.76.168.245','[]','2023-10-16 12:11:09','2023-10-16 12:11:09'),
(379,1,'/','GET','144.76.168.245','[]','2023-10-16 12:14:40','2023-10-16 12:14:40'),
(380,1,'auth/menu','GET','144.76.168.245','[]','2023-10-16 12:18:08','2023-10-16 12:18:08'),
(381,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:18:37','2023-10-16 12:18:37'),
(382,1,'auth/roles/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:18:43','2023-10-16 12:18:43'),
(383,1,'auth/roles','POST','144.76.168.245','{\"slug\":\"farmer\",\"name\":\"Farmer\",\"permissions\":[\"1\",null],\"_token\":\"ufaxPokp3HcAb2mLJoX2k7TK4Dlz9oFxFm0DbeOs\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-16 12:19:00','2023-10-16 12:19:00'),
(384,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:19:01','2023-10-16 12:19:01'),
(385,1,'auth/roles/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:19:06','2023-10-16 12:19:06'),
(386,1,'auth/roles','POST','144.76.168.245','{\"slug\":\"vet\",\"name\":\"Vet\",\"permissions\":[\"1\",null],\"_token\":\"ufaxPokp3HcAb2mLJoX2k7TK4Dlz9oFxFm0DbeOs\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-16 12:19:20','2023-10-16 12:19:20'),
(387,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:19:20','2023-10-16 12:19:20'),
(388,1,'auth/roles/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:19:38','2023-10-16 12:19:38'),
(389,1,'auth/roles','POST','144.76.168.245','{\"slug\":\"agent\",\"name\":\"Agent\",\"permissions\":[\"1\",null],\"_token\":\"ufaxPokp3HcAb2mLJoX2k7TK4Dlz9oFxFm0DbeOs\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-16 12:19:52','2023-10-16 12:19:52'),
(390,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:19:52','2023-10-16 12:19:52'),
(391,1,'auth/roles/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:20:26','2023-10-16 12:20:26'),
(392,1,'auth/roles','POST','144.76.168.245','{\"slug\":\"service_provider\",\"name\":\"Service Provider\",\"permissions\":[\"1\",null],\"_token\":\"ufaxPokp3HcAb2mLJoX2k7TK4Dlz9oFxFm0DbeOs\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-16 12:20:52','2023-10-16 12:20:52'),
(393,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:20:53','2023-10-16 12:20:53'),
(394,1,'auth/roles/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:21:32','2023-10-16 12:21:32'),
(395,1,'auth/roles','POST','144.76.168.245','{\"slug\":\"ldf_admin\",\"name\":\"LDF ADMIN\",\"permissions\":[\"1\",null],\"_token\":\"ufaxPokp3HcAb2mLJoX2k7TK4Dlz9oFxFm0DbeOs\",\"_previous_\":\"https:\\/\\/ldf.8technologies.cloud\\/auth\\/roles\"}','2023-10-16 12:21:46','2023-10-16 12:21:46'),
(396,1,'auth/roles','GET','144.76.168.245','[]','2023-10-16 12:21:46','2023-10-16 12:21:46'),
(397,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:22:32','2023-10-16 12:22:32'),
(398,1,'vector-and-diseases/2/edit','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:22:42','2023-10-16 12:22:42'),
(399,1,'vector-and-diseases','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:22:46','2023-10-16 12:22:46'),
(400,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:22:54','2023-10-16 12:22:54'),
(401,1,'service-providers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:22:55','2023-10-16 12:22:55'),
(402,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:18','2023-10-16 12:23:18'),
(403,1,'vets/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:24','2023-10-16 12:23:24'),
(404,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:26','2023-10-16 12:23:26'),
(405,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:28','2023-10-16 12:23:28'),
(406,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:30','2023-10-16 12:23:30'),
(407,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:23:34','2023-10-16 12:23:34'),
(408,1,'farmers/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:24:16','2023-10-16 12:24:16'),
(409,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:24:56','2023-10-16 12:24:56'),
(410,1,'animal-health-records/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:25:00','2023-10-16 12:25:00'),
(411,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:25:03','2023-10-16 12:25:03'),
(412,1,'animal-health-records/create','GET','144.76.168.245','[]','2023-10-16 12:25:03','2023-10-16 12:25:03'),
(413,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:25:13','2023-10-16 12:25:13'),
(414,1,'animal-health-records/create','GET','144.76.168.245','[]','2023-10-16 12:25:13','2023-10-16 12:25:13'),
(415,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:25:21','2023-10-16 12:25:21'),
(416,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:25:22','2023-10-16 12:25:22'),
(417,1,'animal-health-records','GET','144.76.168.245','[]','2023-10-16 12:25:22','2023-10-16 12:25:22'),
(418,1,'auth/menu','GET','144.76.168.245','[]','2023-10-16 12:25:32','2023-10-16 12:25:32'),
(419,1,'auth/menu','GET','144.76.168.245','[]','2023-10-16 12:25:52','2023-10-16 12:25:52'),
(420,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:00','2023-10-16 12:26:00'),
(421,1,'auth/menu','GET','144.76.168.245','[]','2023-10-16 12:26:00','2023-10-16 12:26:00'),
(422,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:02','2023-10-16 12:26:02'),
(423,1,'auth/menu','GET','144.76.168.245','[]','2023-10-16 12:26:02','2023-10-16 12:26:02'),
(424,1,'farmers','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:06','2023-10-16 12:26:06'),
(425,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:08','2023-10-16 12:26:08'),
(426,1,'farmers','GET','144.76.168.245','[]','2023-10-16 12:26:08','2023-10-16 12:26:08'),
(427,1,'animal-health-records','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:09','2023-10-16 12:26:09'),
(428,1,'vets','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:26:10','2023-10-16 12:26:10'),
(429,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:27:34','2023-10-16 12:27:34'),
(430,1,'vets','GET','144.76.168.245','[]','2023-10-16 12:27:34','2023-10-16 12:27:34'),
(431,1,'farms','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:36:41','2023-10-16 12:36:41'),
(432,1,'farms/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:36:45','2023-10-16 12:36:45'),
(433,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:39:22','2023-10-16 12:39:22'),
(434,1,'farms/create','GET','144.76.168.245','[]','2023-10-16 12:39:22','2023-10-16 12:39:22'),
(435,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:49:20','2023-10-16 12:49:20'),
(436,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:49:38','2023-10-16 12:49:38'),
(437,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:55:23','2023-10-16 12:55:23'),
(438,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:55:28','2023-10-16 12:55:28'),
(439,1,'animals','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:56:23','2023-10-16 12:56:23'),
(440,1,'animals/create','GET','144.76.168.245','{\"_pjax\":\"#pjax-container\"}','2023-10-16 12:56:27','2023-10-16 12:56:27'),
(441,1,'/','GET','127.0.0.1','[]','2023-10-18 02:57:42','2023-10-18 02:57:42'),
(442,1,'farms','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 02:58:15','2023-10-18 02:58:15'),
(443,1,'auth/roles','GET','127.0.0.1','[]','2023-10-18 02:58:25','2023-10-18 02:58:25'),
(444,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:36:35','2023-10-18 03:36:35'),
(445,1,'farmers','GET','127.0.0.1','[]','2023-10-18 03:37:11','2023-10-18 03:37:11'),
(446,1,'farmers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:37:14','2023-10-18 03:37:14'),
(447,1,'farmers/create','GET','127.0.0.1','[]','2023-10-18 03:38:42','2023-10-18 03:38:42'),
(448,1,'farmers','POST','127.0.0.1','{\"surname\":\"Sanchez\",\"given_name\":\"Carter Zamora\",\"date_of_birth\":\"2023-10-01\",\"nin\":\"Excepturi ad labore\",\"physical_address\":\"Ipsam esse quia ea\",\"gender\":\"F\",\"marital_status\":\"S\",\"number_of_dependants\":\"276\",\"farmer_group\":\"Facere impedit exer\",\"primary_phone_number\":\"+1 (451) 338-4555\",\"secondary_phone_number\":\"+1 (451) 338-4555\",\"is_land_owner\":\"1\",\"production_scale\":\"Ex pariatur A illum\",\"access_to_credit\":\"0\",\"date_started_farming\":\"2023-10-18\",\"highest_level_of_education\":\"Eos dolore temporibu\",\"applicatant_id\":\"1\",\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"after-save\":\"3\",\"_previous_\":\"http:\\/\\/localhost:8000\\/farmers\"}','2023-10-18 03:39:05','2023-10-18 03:39:05'),
(449,1,'farmers/1','GET','127.0.0.1','[]','2023-10-18 03:39:05','2023-10-18 03:39:05'),
(450,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:39:10','2023-10-18 03:39:10'),
(451,1,'farmers','GET','127.0.0.1','[]','2023-10-18 03:42:16','2023-10-18 03:42:16'),
(452,1,'farmers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:42:17','2023-10-18 03:42:17'),
(453,1,'farmers','POST','127.0.0.1','{\"surname\":\"Mosley\",\"given_name\":\"Ria Calderon\",\"date_of_birth\":\"2023-10-09\",\"nin\":\"Quia minus quis sit\",\"physical_address\":\"Numquam sit iste qu\",\"gender\":\"F\",\"marital_status\":\"S\",\"number_of_dependants\":\"928\",\"farmer_group\":\"Debitis officiis rec\",\"primary_phone_number\":\"+1 (858) 927-2213\",\"secondary_phone_number\":\"+1 (858) 927-2213\",\"is_land_owner\":\"1\",\"production_scale\":\"Suscipit velit accu\",\"access_to_credit\":\"1\",\"date_started_farming\":\"2023-10-18\",\"highest_level_of_education\":\"Impedit quo sint eo\",\"applicatant_id\":\"1\",\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"after-save\":\"3\",\"_previous_\":\"http:\\/\\/localhost:8000\\/farmers\"}','2023-10-18 03:42:39','2023-10-18 03:42:39'),
(454,1,'farmers/1','GET','127.0.0.1','[]','2023-10-18 03:42:39','2023-10-18 03:42:39'),
(455,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:42:41','2023-10-18 03:42:41'),
(456,1,'farmers','GET','127.0.0.1','[]','2023-10-18 03:54:02','2023-10-18 03:54:02'),
(457,1,'farmers','GET','127.0.0.1','[]','2023-10-18 03:54:45','2023-10-18 03:54:45'),
(458,1,'farmers/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:54:51','2023-10-18 03:54:51'),
(459,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 03:55:19','2023-10-18 03:55:19'),
(460,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:09:00','2023-10-18 04:09:00'),
(461,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:09:28','2023-10-18 04:09:28'),
(462,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:10:41','2023-10-18 04:10:41'),
(463,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:10:54','2023-10-18 04:10:54'),
(464,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:11:27','2023-10-18 04:11:27'),
(465,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:11:58','2023-10-18 04:11:58'),
(466,1,'auth/roles','GET','127.0.0.1','[]','2023-10-18 04:18:46','2023-10-18 04:18:46'),
(467,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:19:03','2023-10-18 04:19:03'),
(468,1,'farmers','GET','127.0.0.1','[]','2023-10-18 04:20:13','2023-10-18 04:20:13'),
(469,1,'auth/users','GET','127.0.0.1','[]','2023-10-18 04:20:54','2023-10-18 04:20:54'),
(470,1,'auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 04:20:58','2023-10-18 04:20:58'),
(471,1,'auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 04:23:25','2023-10-18 04:23:25'),
(472,1,'users','GET','127.0.0.1','[]','2023-10-18 04:33:36','2023-10-18 04:33:36'),
(473,1,'users','GET','127.0.0.1','[]','2023-10-18 04:33:59','2023-10-18 04:33:59'),
(474,1,'users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 04:34:02','2023-10-18 04:34:02'),
(475,1,'users/create','GET','127.0.0.1','[]','2023-10-18 04:34:25','2023-10-18 04:34:25'),
(476,1,'users','POST','127.0.0.1','{\"name\":\"Moses Kapo\",\"email\":\"filler@hmsils.ddd\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"username\":null,\"roles\":[\"5\",null],\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"_previous_\":\"http:\\/\\/localhost:8000\\/users\"}','2023-10-18 04:35:11','2023-10-18 04:35:11'),
(477,1,'users','GET','127.0.0.1','[]','2023-10-18 04:35:11','2023-10-18 04:35:11'),
(478,1,'users','GET','127.0.0.1','[]','2023-10-18 04:36:25','2023-10-18 04:36:25'),
(479,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 04:36:29','2023-10-18 04:36:29'),
(480,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:01:43','2023-10-18 05:01:43'),
(481,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:11:55','2023-10-18 05:11:55'),
(482,1,'_handle_action_','POST','127.0.0.1','{\"agent_id\":\"2\",\"_key\":\"1\",\"_model\":\"App_Models_Farmer\",\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"_action\":\"App_Admin_Actions_Farmer_Inspect\"}','2023-10-18 05:12:07','2023-10-18 05:12:07'),
(483,1,'_handle_action_','POST','127.0.0.1','{\"agent_id\":\"2\",\"_key\":\"1\",\"_model\":\"App_Models_Farmer\",\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"_action\":\"App_Admin_Actions_Farmer_Inspect\"}','2023-10-18 05:12:39','2023-10-18 05:12:39'),
(484,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:12:39','2023-10-18 05:12:39'),
(485,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:12:42','2023-10-18 05:12:42'),
(486,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:12:56','2023-10-18 05:12:56'),
(487,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:14:38','2023-10-18 05:14:38'),
(488,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:18:16','2023-10-18 05:18:16'),
(489,1,'_handle_action_','POST','127.0.0.1','{\"agent_id\":\"2\",\"_key\":\"1\",\"_model\":\"App_Models_Farmer\",\"_token\":\"345pfHEUlCEKvfHVh9abrB0IpPBEzaGIxmo0wATq\",\"_action\":\"App_Admin_Actions_Farmer_Inspect\"}','2023-10-18 05:18:29','2023-10-18 05:18:29'),
(490,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:18:29','2023-10-18 05:18:29'),
(491,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:19:55','2023-10-18 05:19:55'),
(492,1,'farmers','GET','127.0.0.1','[]','2023-10-18 05:22:33','2023-10-18 05:22:33'),
(493,1,'auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:24:15','2023-10-18 05:24:15'),
(494,1,'/','GET','127.0.0.1','[]','2023-10-18 05:25:27','2023-10-18 05:25:27'),
(495,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:35','2023-10-18 05:25:35'),
(496,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:36','2023-10-18 05:25:36'),
(497,1,'vector-and-diseases','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:37','2023-10-18 05:25:37'),
(498,1,'animals','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:38','2023-10-18 05:25:38'),
(499,1,'vector-and-diseases','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:39','2023-10-18 05:25:39'),
(500,1,'farms','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:40','2023-10-18 05:25:40'),
(501,1,'vets/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:42','2023-10-18 05:25:42'),
(502,1,'auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:25:55','2023-10-18 05:25:55'),
(503,1,'auth/menu','GET','127.0.0.1','[]','2023-10-18 05:26:00','2023-10-18 05:26:00'),
(504,1,'auth/menu/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:26:04','2023-10-18 05:26:04'),
(505,1,'auth/menu/3','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"Users\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"Re2WOo6X6oC4XTDDVNgOBpjR6WxChRRdcH3Dc0rQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/auth\\/menu\"}','2023-10-18 05:26:15','2023-10-18 05:26:15'),
(506,1,'auth/menu','GET','127.0.0.1','[]','2023-10-18 05:26:15','2023-10-18 05:26:15'),
(507,1,'/','GET','127.0.0.1','[]','2023-10-18 05:26:23','2023-10-18 05:26:23'),
(508,1,'users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:26:30','2023-10-18 05:26:30'),
(509,1,'users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-18 05:26:32','2023-10-18 05:26:32');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES
(1,'All permission','*','','*',NULL,NULL),
(2,'Dashboard','dashboard','GET','/',NULL,NULL),
(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES
(1,2,NULL,NULL),
(2,22,NULL,NULL),
(1,23,NULL,NULL),
(2,23,NULL,NULL),
(1,22,NULL,NULL),
(1,24,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES
(1,1,NULL,NULL),
(2,1,NULL,NULL),
(3,1,NULL,NULL),
(4,1,NULL,NULL),
(5,1,NULL,NULL),
(6,1,NULL,NULL),
(7,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES
(1,1,NULL,NULL),
(5,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES
(1,'Administrator','administrator','2023-10-02 06:01:37','2023-10-02 06:01:37'),
(2,'Basic User','basic-user','2023-10-14 03:14:48','2023-10-14 03:14:48'),
(3,'Farmer','farmer','2023-10-16 12:19:00','2023-10-16 12:19:00'),
(4,'Vet','vet','2023-10-16 12:19:20','2023-10-16 12:19:20'),
(5,'Agent','agent','2023-10-16 12:19:52','2023-10-16 12:19:52'),
(6,'Service Provider','service_provider','2023-10-16 12:20:52','2023-10-16 12:20:52'),
(7,'LDF ADMIN','ldf_admin','2023-10-16 12:21:46','2023-10-16 12:21:46');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES
(1,'admin@ldf.org','admin@ldf.org','$2y$10$Kk9r91nlCHBJ1mOOEnfiiuEjSC6nTjAbKwK3hi6FRBYZFmMBKAYVa','Administrator',NULL,'glHpSacSa95cvf1XH2fdDdWaXw17Yh4lq9yO7xFOkOOnGULElVOxYIDIYywj','2023-10-02 06:01:34','2023-10-02 06:01:34'),
(2,'filler@hmsils.ddd','filler@hmsils.ddd','$2y$10$dTf1FqIPBDfJvyoJ4i/yfO1XcbE36VapknHZ/LjWiNROKeawCddfi','Moses Kapo','images/1-min.jpg',NULL,'2023-10-18 04:35:11','2023-10-18 04:35:11');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_health_records`
--

DROP TABLE IF EXISTS `animal_health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal_health_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(255) NOT NULL,
  `animal_id` bigint(20) unsigned NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_health_records_animal_id_foreign` (`animal_id`),
  KEY `animal_health_records_user_id_foreign` (`user_id`),
  CONSTRAINT `animal_health_records_animal_id_foreign` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`),
  CONSTRAINT `animal_health_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_health_records`
--

LOCK TABLES `animal_health_records` WRITE;
/*!40000 ALTER TABLE `animal_health_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_health_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint(20) unsigned NOT NULL,
  `breed_id` bigint(20) unsigned NOT NULL,
  `parents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` timestamp NULL DEFAULT NULL,
  `date_of_weaning` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animals_farm_id_foreign` (`farm_id`),
  KEY `animals_breed_id_foreign` (`breed_id`),
  CONSTRAINT `animals_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`),
  CONSTRAINT `animals_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES
(1,1,1,'verno one','2023-07-10 06:38:01','2023-10-10','2023-10-10 06:50:08','2023-10-10 06:50:08');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed_farm`
--

DROP TABLE IF EXISTS `breed_farm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breed_farm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `breed_id` bigint(20) unsigned NOT NULL,
  `farm_id` bigint(20) unsigned NOT NULL,
  `number_of_livestock` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breed_farm_breed_id_foreign` (`breed_id`),
  KEY `breed_farm_farm_id_foreign` (`farm_id`),
  CONSTRAINT `breed_farm_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `breed_farm_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed_farm`
--

LOCK TABLES `breed_farm` WRITE;
/*!40000 ALTER TABLE `breed_farm` DISABLE KEYS */;
/*!40000 ALTER TABLE `breed_farm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `livestock_type_id` bigint(20) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breeds_livestock_type_id_foreign` (`livestock_type_id`),
  CONSTRAINT `breeds_livestock_type_id_foreign` FOREIGN KEY (`livestock_type_id`) REFERENCES `livestock_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm_activities`
--

DROP TABLE IF EXISTS `farm_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farm_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farm_activities_farm_id_foreign` (`farm_id`),
  KEY `farm_activities_user_id_foreign` (`user_id`),
  CONSTRAINT `farm_activities_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`),
  CONSTRAINT `farm_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_activities`
--

LOCK TABLES `farm_activities` WRITE;
/*!40000 ALTER TABLE `farm_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `farm_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmers`
--

DROP TABLE IF EXISTS `farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile_picture` varchar(255) DEFAULT NULL,
  `surname` varchar(255) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nin` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `number_of_dependants` int(11) DEFAULT NULL COMMENT 'Number of dependants / other farmers',
  `farmer_group` varchar(255) DEFAULT NULL,
  `primary_phone_number` varchar(255) DEFAULT NULL,
  `secondary_phone_number` varchar(255) DEFAULT NULL,
  `is_land_owner` tinyint(1) NOT NULL DEFAULT 0,
  `production_scale` varchar(255) DEFAULT NULL,
  `access_to_credit` tinyint(1) NOT NULL DEFAULT 0,
  `date_started_farming` date DEFAULT NULL,
  `highest_level_of_education` varchar(255) DEFAULT NULL,
  `applicatant_id` int(10) unsigned DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `agent_remarks` text DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `admin_remarks` text DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmers_applicatant_id_foreign` (`applicatant_id`),
  KEY `farmers_agent_id_foreign` (`agent_id`),
  KEY `farmers_admin_id_foreign` (`admin_id`),
  CONSTRAINT `farmers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admin_users` (`id`),
  CONSTRAINT `farmers_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `admin_users` (`id`),
  CONSTRAINT `farmers_applicatant_id_foreign` FOREIGN KEY (`applicatant_id`) REFERENCES `admin_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
INSERT INTO `farmers` VALUES
(1,NULL,'Mosley','Ria Calderon','2023-10-09','Quia minus quis sit','Numquam sit iste qu','F','S',928,'Debitis officiis rec','+1 (858) 927-2213','+1 (858) 927-2213',1,'Suscipit velit accu',1,'2023-10-18','Impedit quo sint eo',1,0,NULL,2,NULL,NULL,'2023-10-18 03:42:39','2023-10-18 05:18:29');
/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farms`
--

DROP TABLE IF EXISTS `farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `livestock_type` varchar(255) DEFAULT NULL,
  `production_type` varchar(255) DEFAULT NULL COMMENT 'Milk, eggs, meat, etc',
  `date_of_establishment` date DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `number_of_livestock` int(11) DEFAULT NULL,
  `number_of_workers` int(11) DEFAULT NULL,
  `land_ownership` varchar(255) DEFAULT NULL,
  `general_remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farms`
--

LOCK TABLES `farms` WRITE;
/*!40000 ALTER TABLE `farms` DISABLE KEYS */;
INSERT INTO `farms` VALUES
(1,'Jordan cattle','mbarara','cattle','small','2023-10-02','large','Enim blanditiis aliq',907,10,'Voluptatibus adipisi','Quibusdam culpa et','2023-10-10 06:37:48','2023-10-10 06:37:48');
/*!40000 ALTER TABLE `farms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_records`
--

DROP TABLE IF EXISTS `financial_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint(20) unsigned NOT NULL,
  `farmer_id` bigint(20) unsigned NOT NULL,
  `transaction_type` varchar(255) DEFAULT NULL COMMENT 'Income, expenditure, etc',
  `transaction_date` date DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `party` varchar(255) DEFAULT NULL COMMENT 'Payment made to or from',
  `party_tin` varchar(255) DEFAULT NULL,
  `payment_reference` varchar(255) DEFAULT NULL,
  `reciept_file` varchar(255) DEFAULT NULL COMMENT 'Reciept file path',
  `remarks` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financial_records_farm_id_foreign` (`farm_id`),
  KEY `financial_records_farmer_id_foreign` (`farmer_id`),
  CONSTRAINT `financial_records_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`),
  CONSTRAINT `financial_records_farmer_id_foreign` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_records`
--

LOCK TABLES `financial_records` WRITE;
/*!40000 ALTER TABLE `financial_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livestock_types`
--

DROP TABLE IF EXISTS `livestock_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livestock_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livestock_types`
--

LOCK TABLES `livestock_types` WRITE;
/*!40000 ALTER TABLE `livestock_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `livestock_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `mediable_type` varchar(255) NOT NULL,
  `mediable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_mediable_type_mediable_id_index` (`mediable_type`,`mediable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2016_01_04_173148_create_admin_tables',1),
(4,'2019_08_19_000000_create_failed_jobs_table',1),
(5,'2019_12_14_000001_create_personal_access_tokens_table',1),
(6,'2023_10_01_200152_create_statuses_table',1),
(8,'2023_10_01_200351_create_vets_table',1),
(9,'2023_10_01_200415_create_service_providers_table',2),
(10,'2023_10_01_200537_create_farms_table',3),
(11,'2023_10_01_200427_create_breeds_table',4),
(12,'2023_10_01_200626_create_production_records_table',5),
(13,'2023_10_01_200645_create_financial_records_table',5),
(14,'2023_10_01_201350_create_farm_activities_table',5),
(16,'2023_10_01_202409_create_animals_table',5),
(17,'2023_10_01_202450_create_animal_health_records_table',5),
(18,'2023_10_02_071915_create_media_table',5),
(19,'2023_10_01_202312_create_vector_and_diseases_table',6),
(25,'2023_10_01_200335_create_farmers_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_records`
--

DROP TABLE IF EXISTS `production_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `breed_id` bigint(20) unsigned NOT NULL,
  `farm_id` bigint(20) unsigned NOT NULL,
  `production_type` varchar(255) DEFAULT NULL COMMENT 'Milk, eggs, meat, etc',
  `weight` varchar(255) DEFAULT NULL,
  `daily_weight_gain` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `input_ratios` int(11) DEFAULT NULL COMMENT 'Input ratios',
  `value_addition` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_records_breed_id_foreign` (`breed_id`),
  KEY `production_records_farm_id_foreign` (`farm_id`),
  CONSTRAINT `production_records_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`),
  CONSTRAINT `production_records_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_records`
--

LOCK TABLES `production_records` WRITE;
/*!40000 ALTER TABLE `production_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_providers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_profile` text DEFAULT NULL,
  `class_of_service` text DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `primary_phone_number` varchar(255) DEFAULT NULL,
  `secondary_phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `postal_address` varchar(255) DEFAULT NULL,
  `other_services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `distroict_of_operation` varchar(255) DEFAULT NULL,
  `NDA_registration_number` varchar(255) DEFAULT NULL,
  `tin_number_business` varchar(255) DEFAULT NULL,
  `tin_number_owner` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `other_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
INSERT INTO `service_providers` VALUES
(1,'Zachery Bray','Brennan Hickman','Voluptatum dignissim','Repudiandae numquam','2023-10-04','Voluptatem nihil ut','+1 (943) 939-3012','+1 (943) 939-3012','rihefi@mailinator.com','Fuga Aliquam accusa','Placeat nisi adipis','Est aut voluptatem','Voluptate vitae cons','824','5','78','Doloribus atque aliq','Dolorum dolor sint','2023-10-04 11:25:08','2023-10-04 11:25:08'),
(2,'Graham Day','Kelly Wilder','Ipsum qui quia illo','Minim quis iste ut d','2023-10-04','Cillum aut quo tempo','+1 (899) 218-7883','+1 (899) 218-7883','hakebinig@mailinator.com','Voluptate excepturi','Iste officia quia mo','Rerum asperiores cil','Laborum Quia volupt','224','297','715','Eius odio veniam lo','Totam ullam doloremq','2023-10-04 11:25:36','2023-10-04 11:25:36');
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `statusable_type` varchar(255) NOT NULL,
  `statusable_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_statusable_type_statusable_id_index` (`statusable_type`,`statusable_id`),
  KEY `statuses_user_id_foreign` (`user_id`),
  CONSTRAINT `statuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vector_and_diseases`
--

DROP TABLE IF EXISTS `vector_and_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vector_and_diseases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vector_and_diseases`
--

LOCK TABLES `vector_and_diseases` WRITE;
/*!40000 ALTER TABLE `vector_and_diseases` DISABLE KEYS */;
INSERT INTO `vector_and_diseases` VALUES
(1,'McKenzie Barr',NULL,'Ipsum mollit commodi','2023-10-04 11:15:22','2023-10-04 11:15:22'),
(2,'Lyle Strickland','images/caterpillar.jpg','Ex irure illum volu','2023-10-04 11:17:57','2023-10-04 11:17:57');
/*!40000 ALTER TABLE `vector_and_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vets`
--

DROP TABLE IF EXISTS `vets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile_picture` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `nin` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `group_or_practice` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `license_expiry_date` varchar(255) DEFAULT NULL,
  `date_of_registration` varchar(255) DEFAULT NULL,
  `brief_profile` text DEFAULT NULL,
  `primary_phone_number` varchar(255) DEFAULT NULL,
  `secondary_phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `postal_address` varchar(255) DEFAULT NULL,
  `services_offered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ares_of_operation` varchar(255) DEFAULT NULL,
  `certificate_of_registration` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `other_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vets`
--

LOCK TABLES `vets` WRITE;
/*!40000 ALTER TABLE `vets` DISABLE KEYS */;
INSERT INTO `vets` VALUES
(1,'Dolore voluptatibus','Accusantium recusand','Melendez','Brielle Strong','Do id ullam quo id','Eos nulla nemo odit','Perspiciatis rerum','23','02-Oct-2026','09-Mar-2019','Ea et aliqua Autem','+1 (337) 458-8078','+1 (337) 458-8078','wigowa@mailinator.com','Praesentium vitae ea','Omnis cillum nobis i','Quis cumque ipsum se','Aut dolor numquam in','Dolorem similique la','Temporibus voluptas','2023-10-04 11:23:02','2023-10-04 11:23:02');
/*!40000 ALTER TABLE `vets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 11:33:07
