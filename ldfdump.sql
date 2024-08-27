-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: ldf
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),(2,0,2,'Admin','fa-tasks','',NULL,NULL,NULL),(3,2,3,'Users','fa-users','auth/users',NULL,NULL,NULL),(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL,NULL),(5,2,5,'Permission','fa-ban','auth/permissions',NULL,NULL,NULL),(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL,NULL),(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL,NULL),(8,0,0,'Breeds','fa-drupal','breeds',NULL,'2023-10-02 06:34:43','2023-10-02 06:34:43'),(9,0,0,'Farms','fa-location-arrow','farmers',NULL,'2023-10-02 06:36:01','2023-10-02 06:36:01'),(10,0,0,'Farmers','fa-users','farmers',NULL,'2023-10-02 06:36:34','2023-10-02 06:36:34'),(11,0,0,'Animals','fa-certificate','animals',NULL,'2023-10-02 06:37:00','2023-10-02 06:37:00'),(12,0,0,'Health Records','fa-sticky-note-o','animal-health-records',NULL,'2023-10-02 06:37:49','2023-10-02 06:37:49'),(13,0,0,'Vectors & Diseases','fa-bug','vector-and-diseases',NULL,'2023-10-02 06:40:59','2023-10-02 06:40:59'),(14,0,0,'Vets & Para Vets','fa-user-md','vets',NULL,'2023-10-02 06:41:31','2023-10-02 06:41:31'),(15,0,0,'Service Providers','fa-anchor','service-providers',NULL,'2023-10-02 06:42:22','2023-10-02 06:42:22'),(16,0,0,'Production Records','fa-balance-scale','production-records',NULL,'2023-10-02 06:46:02','2023-10-02 06:46:02'),(17,0,0,'Financial Records','fa-money','financial-records',NULL,'2023-10-02 06:46:29','2023-10-02 06:46:29'),(18,0,0,'Farm Activities','fa-braille','farm-activities',NULL,'2023-10-02 06:49:41','2023-10-02 06:49:41');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'/','GET','127.0.0.1','[]','2023-10-02 06:24:28','2023-10-02 06:24:28'),(2,1,'/','GET','127.0.0.1','[]','2023-10-02 06:30:37','2023-10-02 06:30:37'),(3,1,'/','GET','127.0.0.1','[]','2023-10-02 06:30:57','2023-10-02 06:30:57'),(4,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:21','2023-10-02 06:31:21'),(5,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:33','2023-10-02 06:31:33'),(6,1,'/','GET','127.0.0.1','[]','2023-10-02 06:31:55','2023-10-02 06:31:55'),(7,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:32:17','2023-10-02 06:32:17'),(8,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Breeds\",\"icon\":\"fa-drupal\",\"uri\":\"breeds\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:34:43','2023-10-02 06:34:43'),(9,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:34:43','2023-10-02 06:34:43'),(10,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farms\",\"icon\":\"fa-location-arrow\",\"uri\":\"farmers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:36:01','2023-10-02 06:36:01'),(11,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:36:01','2023-10-02 06:36:01'),(12,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farmers\",\"icon\":\"fa-users\",\"uri\":\"farmers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:36:34','2023-10-02 06:36:34'),(13,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:36:35','2023-10-02 06:36:35'),(14,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Animals\",\"icon\":\"fa-certificate\",\"uri\":\"animals\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:37:00','2023-10-02 06:37:00'),(15,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:37:00','2023-10-02 06:37:00'),(16,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Health Records\",\"icon\":\"fa-sticky-note-o\",\"uri\":\"animal-health-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:37:49','2023-10-02 06:37:49'),(17,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:37:49','2023-10-02 06:37:49'),(18,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Vectors & Diseases\",\"icon\":\"fa-bug\",\"uri\":\"vector-and-diseases\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:40:59','2023-10-02 06:40:59'),(19,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:41:00','2023-10-02 06:41:00'),(20,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Vets & Para Vets\",\"icon\":\"fa-user-md\",\"uri\":\"vets\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:41:30','2023-10-02 06:41:30'),(21,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:41:31','2023-10-02 06:41:31'),(22,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Service Providers\",\"icon\":\"fa-anchor\",\"uri\":\"service-providers\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:42:21','2023-10-02 06:42:21'),(23,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:42:22','2023-10-02 06:42:22'),(24,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Production Records\",\"icon\":\"fa-balance-scale\",\"uri\":\"production-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:46:02','2023-10-02 06:46:02'),(25,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:46:02','2023-10-02 06:46:02'),(26,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Financial Records\",\"icon\":\"fa-money\",\"uri\":\"financial-records\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:46:29','2023-10-02 06:46:29'),(27,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:46:30','2023-10-02 06:46:30'),(28,1,'auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Farm Activities\",\"icon\":\"fa-braille\",\"uri\":\"farm-activities\",\"roles\":[null],\"permission\":null,\"_token\":\"stiCwRfkqaq6HvXxSsozpWihA7E8LFYTTLEyEb88\"}','2023-10-02 06:49:41','2023-10-02 06:49:41'),(29,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:49:42','2023-10-02 06:49:42'),(30,1,'auth/menu','GET','127.0.0.1','[]','2023-10-02 06:49:44','2023-10-02 06:49:44'),(31,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:49:58','2023-10-02 06:49:58'),(32,1,'service-providers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:02','2023-10-02 06:50:02'),(33,1,'vets','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:05','2023-10-02 06:50:05'),(34,1,'vector-and-diseases','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:06','2023-10-02 06:50:06'),(35,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:07','2023-10-02 06:50:07'),(36,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:27','2023-10-02 06:50:27'),(37,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:41','2023-10-02 06:50:41'),(38,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:43','2023-10-02 06:50:43'),(39,1,'financial-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:50:45','2023-10-02 06:50:45'),(40,1,'farmers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:01','2023-10-02 06:51:01'),(41,1,'farmers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:03','2023-10-02 06:51:03'),(42,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:14','2023-10-02 06:51:14'),(43,1,'farm-activities/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:51:18','2023-10-02 06:51:18'),(44,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 06:59:17','2023-10-02 06:59:17'),(45,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 06:59:29','2023-10-02 06:59:29'),(46,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:47','2023-10-02 06:59:47'),(47,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:48','2023-10-02 06:59:48'),(48,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:50','2023-10-02 06:59:50'),(49,1,'farm-activities/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 06:59:53','2023-10-02 06:59:53'),(50,1,'farm-activities/create','GET','127.0.0.1','[]','2023-10-02 07:00:32','2023-10-02 07:00:32'),(51,1,'farm-activities','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:55','2023-10-02 07:01:55'),(52,1,'financial-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:56','2023-10-02 07:01:56'),(53,1,'financial-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:01:58','2023-10-02 07:01:58'),(54,1,'financial-records/create','GET','127.0.0.1','[]','2023-10-02 07:03:09','2023-10-02 07:03:09'),(55,1,'financial-records/create','GET','127.0.0.1','[]','2023-10-02 07:03:28','2023-10-02 07:03:28'),(56,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:03:37','2023-10-02 07:03:37'),(57,1,'production-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:03:43','2023-10-02 07:03:43'),(58,1,'production-records/create','GET','127.0.0.1','[]','2023-10-02 07:05:04','2023-10-02 07:05:04'),(59,1,'production-records','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:24','2023-10-02 07:05:24'),(60,1,'production-records/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:27','2023-10-02 07:05:27'),(61,1,'service-providers','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:30','2023-10-02 07:05:30'),(62,1,'service-providers/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:33','2023-10-02 07:05:33'),(63,1,'breeds','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:54','2023-10-02 07:05:54'),(64,1,'breeds/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2023-10-02 07:05:56','2023-10-02 07:05:56');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
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
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
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
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2023-10-02 06:01:37','2023-10-02 06:01:37');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$Kk9r91nlCHBJ1mOOEnfiiuEjSC6nTjAbKwK3hi6FRBYZFmMBKAYVa','Administrator',NULL,'MYeAcBsingxsqwvbSFKNhM0TMJtGnLwxHdQwWtmS2CLV8S8oEz8mu0mfvM3H','2023-10-02 06:01:34','2023-10-02 06:01:34');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_health_records`
--

DROP TABLE IF EXISTS `animal_health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_health_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `record_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_id` bigint unsigned NOT NULL,
  `diagnosis` text COLLATE utf8mb4_unicode_ci,
  `treatment` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint unsigned NOT NULL,
  `breed_id` bigint unsigned NOT NULL,
  `parents` json DEFAULT NULL,
  `dob` timestamp NULL DEFAULT NULL,
  `date_of_weaning` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animals_farm_id_foreign` (`farm_id`),
  KEY `animals_breed_id_foreign` (`breed_id`),
  CONSTRAINT `animals_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`),
  CONSTRAINT `animals_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `given_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_dependants` int DEFAULT NULL COMMENT 'Number of dependants / other farmers',
  `farmer_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_land_owner` tinyint(1) NOT NULL DEFAULT '0',
  `production_scale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_to_credit` tinyint(1) NOT NULL DEFAULT '0',
  `date_started_farming` date DEFAULT NULL,
  `highest_level_of_education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farms`
--

DROP TABLE IF EXISTS `farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `livestock_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Milk, eggs, meat, etc',
  `date_of_establishment` date DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_livestock` int DEFAULT NULL,
  `number_of_workers` int DEFAULT NULL,
  `land_ownership` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `general_remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farms`
--

LOCK TABLES `farms` WRITE;
/*!40000 ALTER TABLE `farms` DISABLE KEYS */;
/*!40000 ALTER TABLE `farms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_records`
--

DROP TABLE IF EXISTS `financial_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` bigint unsigned NOT NULL,
  `farmer_id` bigint unsigned NOT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Income, expenditure, etc',
  `transaction_date` date DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `amount` double(12,2) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `party` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment made to or from',
  `party_tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reciept_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Reciept file path',
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` bigint unsigned NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2023_10_01_200152_create_statuses_table',1),(7,'2023_10_01_200335_create_farmers_table',1),(8,'2023_10_01_200351_create_vets_table',1),(9,'2023_10_01_200415_create_service_providers_table',2),(10,'2023_10_01_200537_create_farms_table',3),(11,'2023_10_01_200427_create_breeds_table',4),(12,'2023_10_01_200626_create_production_records_table',5),(13,'2023_10_01_200645_create_financial_records_table',5),(14,'2023_10_01_201350_create_farm_activities_table',5),(16,'2023_10_01_202409_create_animals_table',5),(17,'2023_10_01_202450_create_animal_health_records_table',5),(18,'2023_10_02_071915_create_media_table',5),(19,'2023_10_01_202312_create_vector_and_diseases_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `breed_id` bigint unsigned NOT NULL,
  `farm_id` bigint unsigned NOT NULL,
  `production_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Milk, eggs, meat, etc',
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daily_weight_gain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_ratios` int DEFAULT NULL COMMENT 'Input ratios',
  `value_addition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_profile` text COLLATE utf8mb4_unicode_ci,
  `class_of_service` text COLLATE utf8mb4_unicode_ci,
  `date_of_registration` date DEFAULT NULL,
  `physical_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_services` json DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distroict_of_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NDA_registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_number_business` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_number_owner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_documents` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` smallint NOT NULL,
  `statusable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vector_and_diseases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vector_and_diseases`
--

LOCK TABLES `vector_and_diseases` WRITE;
/*!40000 ALTER TABLE `vector_and_diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `vector_and_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vets`
--

DROP TABLE IF EXISTS `vets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `given_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_or_practice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_registration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief_profile` text COLLATE utf8mb4_unicode_ci,
  `primary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_offered` json DEFAULT NULL,
  `ares_of_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_of_registration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_documents` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vets`
--

LOCK TABLES `vets` WRITE;
/*!40000 ALTER TABLE `vets` DISABLE KEYS */;
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

-- Dump completed on 2023-10-02 13:17:18
