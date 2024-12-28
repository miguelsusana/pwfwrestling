-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: pwfwrestling
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add superstars',7,'add_superstars'),(26,'Can change superstars',7,'change_superstars'),(27,'Can delete superstars',7,'delete_superstars'),(28,'Can view superstars',7,'view_superstars');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'pwfweb','superstars'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-01 15:50:38.692013'),(2,'auth','0001_initial','2024-06-01 15:50:39.198163'),(3,'admin','0001_initial','2024-06-01 15:50:39.294316'),(4,'admin','0002_logentry_remove_auto_add','2024-06-01 15:50:39.300360'),(5,'admin','0003_logentry_add_action_flag_choices','2024-06-01 15:50:39.300360'),(6,'contenttypes','0002_remove_content_type_name','2024-06-01 15:50:39.348343'),(7,'auth','0002_alter_permission_name_max_length','2024-06-01 15:50:39.391588'),(8,'auth','0003_alter_user_email_max_length','2024-06-01 15:50:39.413630'),(9,'auth','0004_alter_user_username_opts','2024-06-01 15:50:39.413630'),(10,'auth','0005_alter_user_last_login_null','2024-06-01 15:50:39.456882'),(11,'auth','0006_require_contenttypes_0002','2024-06-01 15:50:39.456882'),(12,'auth','0007_alter_validators_add_error_messages','2024-06-01 15:50:39.461031'),(13,'auth','0008_alter_user_username_max_length','2024-06-01 15:50:39.505989'),(14,'auth','0009_alter_user_last_name_max_length','2024-06-01 15:50:39.546410'),(15,'auth','0010_alter_group_name_max_length','2024-06-01 15:50:39.562656'),(16,'auth','0011_update_proxy_permissions','2024-06-01 15:50:39.562656'),(17,'auth','0012_alter_user_first_name_max_length','2024-06-01 15:50:39.612447'),(18,'sessions','0001_initial','2024-06-01 15:50:39.636092'),(19,'pwfweb','0001_initial','2024-06-01 16:16:24.493582');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `month` enum('January','February','March','April','May','June','July','August','September','October','November','December') NOT NULL,
  `year` int NOT NULL,
  `season` int NOT NULL,
  `instance_number` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'RAW','January',1,1,1),(2,'SmackDown','January',1,1,1),(3,'ECW','January',1,1,1),(4,'Royal Rumble','January',1,1,1),(5,'RAW','February',1,1,1),(6,'SmackDown','February',1,1,1),(7,'Superstars','February',1,1,1),(8,'No Way Out','February',1,1,1),(9,'RAW','March',1,1,1),(10,'SmackDown','March',1,1,1),(11,'Superstars','March',1,1,1),(12,'WrestleMania','March',1,1,1),(13,'RAW','April',1,1,1),(14,'SmackDown','April',1,1,1),(15,'Superstars','April',1,1,1),(16,'Backlash','March',1,1,1),(17,'RAW','May',1,1,1),(18,'SmackDown','May',1,1,1),(19,'Superstars','May',1,1,1),(20,'Extreme Rules','March',1,1,1),(21,'RAW','June',1,1,1),(22,'SmackDown','June',1,1,1),(23,'Superstars','June',1,1,1),(24,'The Bash','June',1,1,1),(25,'RAW','July',1,1,1),(26,'SmackDown','July',1,1,1),(27,'Superstars','July',1,1,1),(28,'Night of Champions','July',1,1,1),(29,'RAW','August',1,1,1),(30,'SmackDown','August',1,1,1),(31,'Superstars','August',1,1,1),(32,'Summerslam','August',1,1,1),(33,'RAW','September',1,1,1),(34,'SmackDown','September',1,1,1),(35,'Superstars','September',1,1,1),(36,'Hell In A Cell','September',1,1,1),(37,'RAW','October',1,1,1),(38,'SmackDown','October',1,1,1),(39,'Superstars','October',1,1,1),(40,'Bragging Rights','October',1,1,1),(41,'RAW','November',1,1,1),(42,'SmackDown','November',1,1,1),(43,'Superstars','November',1,1,1),(44,'Survivor Series','November',1,1,1),(45,'RAW','December',1,1,1),(46,'SmackDown','December',1,1,1),(47,'Superstars','December',1,1,1),(48,'TLC','December',1,1,1),(49,'RAW','January',1,2,1),(50,'SmackDown','January',1,2,1),(51,'ECW','January',1,2,1),(52,'Royal Rumble','January',1,2,1),(53,'RAW','February',1,2,1),(54,'SmackDown','February',1,2,1),(55,'Superstars','February',1,2,1),(56,'No Way Out','February',1,2,1),(57,'RAW','March',1,2,1),(58,'SmackDown','March',1,2,1),(59,'Superstars','March',1,2,1),(60,'WrestleMania','March',1,2,1),(61,'RAW','April',1,2,1),(62,'SmackDown','April',1,2,1),(63,'Superstars','April',1,2,1),(64,'Backlash','March',1,2,1),(65,'RAW','May',1,2,1),(66,'SmackDown','May',1,2,1),(67,'Superstars','May',1,2,1),(68,'Extreme Rules','March',1,2,1),(69,'RAW','June',1,2,1),(70,'SmackDown','June',1,2,1),(71,'Superstars','June',1,2,1),(72,'The Bash','June',1,2,1),(73,'RAW','July',1,2,1),(74,'SmackDown','July',1,2,1),(75,'Superstars','July',1,2,1),(76,'Night of Champions','July',1,2,1),(77,'RAW','August',1,2,1),(78,'SmackDown','August',1,2,1),(79,'Superstars','August',1,2,1),(80,'Summerslam','August',1,2,1),(81,'RAW','September',1,2,1),(82,'SmackDown','September',1,2,1),(83,'Superstars','September',1,2,1),(84,'Hell In A Cell','September',1,2,1),(85,'RAW','October',1,2,1),(86,'SmackDown','October',1,2,1),(87,'Superstars','October',1,2,1),(88,'Bragging Rights','October',1,2,1),(89,'RAW','November',1,2,1),(90,'SmackDown','November',1,2,1),(91,'Superstars','November',1,2,1),(92,'Survivor Series','November',1,2,1),(93,'RAW','December',1,2,1),(94,'SmackDown','December',1,2,1),(95,'Superstars','December',1,2,1),(96,'TLC','December',1,2,1),(97,'NXT','January',3,6,1),(98,'SmackDown','January',3,6,1),(99,'RAW','January',3,6,1),(100,'Royal Rumble','January',3,6,1),(101,'NXT Parque Mayer','January',3,6,1),(102,'RAW','January',3,6,2),(103,'SmackDown','January',3,6,2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_participants`
--

DROP TABLE IF EXISTS `match_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `wrestler_id` int NOT NULL,
  `is_competitor` tinyint(1) NOT NULL DEFAULT '1',
  `accompanied_by` int DEFAULT NULL,
  `team_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  KEY `wrestler_id` (`wrestler_id`),
  KEY `accompanied_by` (`accompanied_by`),
  CONSTRAINT `match_participants_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `match_participants_ibfk_2` FOREIGN KEY (`wrestler_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  CONSTRAINT `match_participants_ibfk_3` FOREIGN KEY (`accompanied_by`) REFERENCES `roster` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_participants`
--

LOCK TABLES `match_participants` WRITE;
/*!40000 ALTER TABLE `match_participants` DISABLE KEYS */;
INSERT INTO `match_participants` VALUES (1,1,282,1,NULL,1),(2,1,293,1,NULL,2),(3,1,498,0,NULL,NULL),(4,1,260,0,NULL,NULL),(5,2,24,1,NULL,1),(6,2,293,1,NULL,2),(7,2,282,0,NULL,NULL),(8,3,140,1,NULL,1),(9,3,261,1,NULL,2),(10,4,135,1,NULL,1),(11,4,34,1,NULL,2),(12,4,238,1,NULL,3),(13,4,233,1,NULL,4),(14,5,293,1,NULL,1),(15,5,270,1,NULL,1),(16,5,168,1,NULL,2),(17,5,281,1,NULL,2),(18,6,24,1,NULL,1),(19,6,293,1,NULL,2),(20,7,498,1,NULL,1),(21,7,273,1,NULL,1),(22,7,135,1,NULL,2),(23,7,213,1,NULL,2),(24,8,260,1,NULL,1),(25,8,255,1,NULL,2),(26,8,261,1,NULL,3),(27,8,222,1,NULL,4),(28,9,260,1,NULL,1),(29,9,286,1,NULL,2),(30,10,110,1,NULL,1),(31,10,233,1,NULL,2),(32,11,222,1,NULL,1),(33,11,261,1,NULL,2),(34,12,238,1,NULL,1),(35,12,261,1,NULL,2),(36,13,24,1,NULL,1),(37,13,293,1,NULL,2),(38,14,24,1,NULL,1),(39,14,222,1,NULL,2),(40,15,260,1,498,1),(41,15,498,0,NULL,1),(42,15,222,1,NULL,2),(43,16,286,1,NULL,1),(44,16,255,1,NULL,2),(45,17,293,1,NULL,1),(46,17,281,1,NULL,2),(47,18,222,1,NULL,1),(48,18,238,1,NULL,2),(49,18,261,1,NULL,3),(50,18,260,1,NULL,4),(51,18,220,1,NULL,5),(52,18,273,1,NULL,6),(53,18,213,1,NULL,7),(54,18,255,1,NULL,8),(55,18,34,1,NULL,9),(56,18,140,1,NULL,10),(57,18,282,1,NULL,11),(58,18,179,1,NULL,12),(59,18,293,1,NULL,13),(60,18,498,1,NULL,14),(61,18,36,1,NULL,15),(62,18,7,1,NULL,16),(63,18,281,1,NULL,17),(64,18,233,1,NULL,18),(65,18,87,1,NULL,19),(66,18,116,1,NULL,20),(67,18,276,1,NULL,21),(68,18,168,1,NULL,22),(69,18,270,1,NULL,23),(70,18,226,1,NULL,24),(71,18,286,1,NULL,25),(72,18,269,1,NULL,26),(73,18,84,1,NULL,27),(74,18,278,1,NULL,28),(75,18,135,1,NULL,29),(76,18,188,1,NULL,30),(89,25,532,1,NULL,1),(90,25,524,1,NULL,2),(91,26,501,1,NULL,1),(92,26,507,1,NULL,2),(93,27,500,1,NULL,1),(94,27,506,1,NULL,2),(95,28,512,1,NULL,1),(96,28,511,1,NULL,1),(97,28,503,1,NULL,2),(98,28,509,1,NULL,2),(99,29,494,1,NULL,1),(100,29,495,1,NULL,1),(101,29,492,1,NULL,2),(102,29,493,1,NULL,2),(103,30,210,1,NULL,1),(104,30,531,1,NULL,1),(105,30,530,1,NULL,2),(106,30,529,1,NULL,2),(107,31,497,1,NULL,1),(108,31,489,1,NULL,2),(109,32,485,1,NULL,1),(110,32,487,1,NULL,2),(111,32,486,1,NULL,2),(112,33,496,1,NULL,1),(113,33,491,1,NULL,2),(114,33,269,1,NULL,3),(115,33,484,1,NULL,4),(141,44,481,1,NULL,1),(142,44,285,1,NULL,2),(143,45,486,1,NULL,1),(144,45,487,1,NULL,1),(145,45,494,1,NULL,2),(146,45,495,1,NULL,2),(147,46,290,1,NULL,1),(148,46,195,1,NULL,1),(149,46,210,1,NULL,2),(150,46,531,1,NULL,2),(151,47,490,1,NULL,1),(152,47,484,1,NULL,1),(153,49,488,1,NULL,1),(154,49,496,1,NULL,1),(155,50,467,1,NULL,1),(156,50,468,1,NULL,1),(157,50,479,1,NULL,2),(158,50,480,1,NULL,2),(159,51,475,1,NULL,1),(160,51,478,1,NULL,2),(167,48,482,1,NULL,1),(168,52,496,1,NULL,1),(169,55,171,1,NULL,1),(170,55,285,1,NULL,1),(171,55,481,1,NULL,2),(172,55,483,1,NULL,2),(173,56,470,1,NULL,1),(174,56,474,1,NULL,2),(175,57,293,1,NULL,1),(176,57,205,1,NULL,2),(177,58,471,1,NULL,1),(178,58,473,1,NULL,2),(179,59,467,1,NULL,1),(180,59,468,1,NULL,1),(181,59,475,1,NULL,2),(182,59,478,1,NULL,2),(183,60,171,1,285,1),(184,60,285,0,NULL,1),(185,60,529,1,NULL,2),(186,61,489,1,NULL,1),(187,61,493,1,NULL,2),(188,62,269,1,NULL,1),(189,62,492,1,NULL,2),(190,63,484,1,NULL,1),(191,63,491,1,NULL,2),(192,64,488,1,NULL,1),(193,64,496,1,NULL,2),(194,65,481,1,469,1),(195,65,469,0,NULL,1),(196,65,483,1,NULL,2),(197,66,290,1,NULL,1),(198,66,195,1,NULL,1),(199,66,293,1,NULL,2),(200,66,205,1,NULL,2),(201,67,472,1,NULL,1),(202,67,474,1,NULL,1),(203,67,479,1,NULL,2),(204,67,480,1,NULL,2),(205,68,470,1,NULL,1),(206,68,476,1,NULL,2),(207,69,478,1,NULL,1),(208,69,469,1,NULL,2),(209,70,532,1,NULL,1),(210,70,526,1,NULL,2),(211,71,511,1,NULL,1),(212,71,512,1,NULL,1),(213,71,467,1,NULL,2),(214,71,468,1,NULL,2),(215,72,525,1,NULL,1),(216,72,527,1,NULL,2),(217,73,505,1,NULL,1),(218,73,508,1,NULL,2),(219,73,513,1,NULL,3),(220,73,515,1,NULL,4),(221,73,517,1,NULL,5),(222,73,518,1,NULL,6),(223,73,522,1,NULL,7),(224,73,523,1,NULL,8),(225,74,504,1,NULL,1),(226,74,503,1,NULL,2),(227,75,500,1,NULL,1),(228,75,501,1,NULL,2),(229,75,507,1,NULL,3);
/*!40000 ALTER TABLE `match_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_titles`
--

DROP TABLE IF EXISTS `match_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_titles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `title_id` int NOT NULL,
  `title_changed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  KEY `title_id` (`title_id`),
  CONSTRAINT `match_titles_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `match_titles_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_titles`
--

LOCK TABLES `match_titles` WRITE;
/*!40000 ALTER TABLE `match_titles` DISABLE KEYS */;
INSERT INTO `match_titles` VALUES (1,1,7,1),(2,2,4,1),(3,5,5,1),(4,6,3,1),(5,9,12,1),(6,12,1,1),(7,13,3,0),(8,14,4,0),(9,15,2,1),(10,16,12,0),(11,17,7,0),(12,28,18,0),(13,44,33,0),(14,45,35,0),(15,47,1,0),(16,49,3,0),(17,50,5,0),(18,51,36,0),(19,55,34,0),(20,59,5,0),(21,64,3,0),(22,69,4,0),(23,70,19,0),(24,71,18,0),(25,74,39,0),(26,75,17,0);
/*!40000 ALTER TABLE `match_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_winners`
--

DROP TABLE IF EXISTS `match_winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_winners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `wrestler_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  KEY `wrestler_id` (`wrestler_id`),
  CONSTRAINT `match_winners_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `match_winners_ibfk_2` FOREIGN KEY (`wrestler_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_winners`
--

LOCK TABLES `match_winners` WRITE;
/*!40000 ALTER TABLE `match_winners` DISABLE KEYS */;
INSERT INTO `match_winners` VALUES (1,1,293),(2,2,24),(3,4,238),(4,5,293),(5,5,270),(6,6,24),(7,7,498),(8,7,273),(9,8,261),(10,9,286),(11,10,233),(12,11,261),(13,12,238),(14,13,24),(15,14,24),(16,15,260),(17,16,286),(18,17,293),(19,18,233),(20,25,532),(21,26,507),(22,27,500),(23,28,512),(24,28,511),(25,29,494),(26,29,495),(27,30,210),(28,30,531),(29,31,489),(30,32,487),(31,33,484),(43,44,481),(44,45,486),(45,45,487),(46,46,290),(47,46,195),(48,47,490),(49,48,482),(50,49,488),(51,50,467),(52,50,468),(53,51,475),(54,52,496),(57,55,171),(58,55,285),(59,56,470),(60,57,293),(61,58,471),(62,59,467),(63,59,468),(64,60,171),(65,61,489),(66,62,269),(67,63,484),(68,65,481),(69,66,290),(70,66,195),(71,67,474),(72,67,472),(73,68,470),(74,69,478),(75,70,532),(76,71,511),(77,71,512),(78,72,525),(79,73,508),(80,74,504),(81,75,500),(82,3,261);
/*!40000 ALTER TABLE `match_winners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `match_type` varchar(255) NOT NULL,
  `special_stipulation` varchar(255) DEFAULT NULL,
  `championship_match` tinyint(1) DEFAULT '0',
  `match_description` text NOT NULL,
  `result_type` enum('Victory','DQ Victory','No Contest','Draw','Other') DEFAULT NULL,
  `notes` text,
  `is_main_event` tinyint(1) DEFAULT '0',
  `is_pre_show` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,1,'Special Referee',NULL,1,'Guida vs. Vera (Mike Silva & Rafael)','Victory',NULL,0,0),(2,1,'Special Referee',NULL,1,'Carlos vs. Vera (Guida)','Victory',NULL,0,0),(3,1,'Single',NULL,0,'Sérgio Ferreira vs. Reinaldo','Victory',NULL,0,0),(4,1,'Fatal-4-Way','Winner is added to WWE Championship match at Royal Rumble 1',0,'Rúben Pinheiro vs. Daniel Filipe vs. Hugo vs. Fábio','Victory',NULL,1,0),(5,2,'Normal Tag',NULL,1,'Vera & Vitor vs. Claudia & Daniela Lopes','Victory',NULL,0,0),(6,2,'Single',NULL,1,'Carlos vs. Vera','Victory',NULL,0,0),(7,2,'Tornado Tag',NULL,0,'Mike Silva & Ana Catarina vs. Rúben Pinheiro & Sofia Cunha','Victory',NULL,0,0),(8,2,'Fatal-4-Way','Winner is added to WWE Championship match at Royal Rumble 1',0,'Rafael vs. Pedro vs. Reinaldo vs. Alexandre','Victory',NULL,1,0),(9,3,'Single',NULL,1,'Rafael vs. Liliana','Victory',NULL,0,0),(10,3,'Single',NULL,0,'Miguel Neto vs. Fábio','Victory',NULL,0,0),(11,3,'Single',NULL,0,'Alexandre vs. Reinaldo','Victory',NULL,1,0),(12,4,'Single',NULL,1,'Hugo vs. Reinaldo','Victory',NULL,0,0),(13,4,'Single',NULL,1,'Carlos (c) vs. Vera','Victory',NULL,0,0),(14,4,'Single',NULL,1,'Carlos (c) vs. Alexandre','Victory',NULL,0,0),(15,4,'Single',NULL,1,'Rafael w/ Mike Silva vs. Alexandre','Victory',NULL,0,0),(16,4,'Single',NULL,1,'Liliana (c) vs. Pedro','Victory',NULL,0,0),(17,4,'Single',NULL,1,'Vera (c) vs. Daniela Lopes','Victory',NULL,0,0),(18,4,'Royal Rumble',NULL,0,'Royal Rumble Match','Victory',NULL,1,0),(25,97,'Singles',NULL,0,'NÃªs vs. Marine Riga','Victory',NULL,0,0),(26,97,'Singles',NULL,0,'Rafael Pedras vs. PÃ©gaso','Victory',NULL,0,0),(27,97,'Singles',NULL,0,'\'Goldenboy\' Santos vs. Didi','Victory',NULL,0,0),(28,97,'Normal Tag',NULL,1,'Stefan Stu & Michael Stu (c) vs Ricky Boy & Roddy Flow','Victory','The WWE World Tag Team Champions Nelson Pereira & Luis Mestre show up. and show respect to the current NXT Tag Team Champions. They then challenge the NXT Tag Team Champions at NXT Parque Mayer.',1,0),(29,98,'Normal Tag','#1 Contender WWE Tag Team Championship',0,'Isaac Vitorino & AurÃ©lio vs Nuvas & Blitz','Victory',NULL,0,0),(30,98,'Normal Tag',NULL,0,'Silvana Branco & TÃ¢nia vs. Lara Alexandra & JÃ©ssica Sousa','Victory',NULL,0,0),(31,98,'Single',NULL,0,'Drew Minnear vs. Grandorman','Victory',NULL,0,0),(32,98,'Single',NULL,0,'Pedro Soares vs. Lobo IbÃ©rico w/ AndrÃ© Gomes','Victory',NULL,0,0),(33,98,'Fatal-4-Way','#1 Contender Undisputed WWE Championship',0,'Luis Mira vs. Andy Hendrix vs. Tiago Rodrigues vs. Jan','Victory','Jan scores a huge upset by pinning Tiago Rodrigues. Luis Mira is screwed out of his opportunity by Zuko.',1,0),(44,100,'Single',NULL,1,'ClÃ¡udia Bradstone (c) vs. Julia','Victory','Daniela accidentally costs Julia the championship.',0,0),(45,100,'Normal Tag',NULL,1,'AndrÃ© Gomes & Lobo IbÃ©rico (c) vs. Isaac Vitorino & AurÃ©lio','Victory',NULL,0,0),(46,100,'Normal Tag','#1 Contender Women\'s Tag Team Championship',0,'Raquel & Marta vs. Silvana Branco & TÃ¢nia','Victory',NULL,0,0),(47,100,'Single',NULL,1,'Twista (c) vs. Jan','Victory','Twista shuts down Jan\'s momentum.',0,0),(48,100,'30-Women Royal Rumble',NULL,0,'30-Women Royal Rumble Match','Victory','Jay Pay\'s story to get the Women\'s World Championship back from ClÃ¡udia Bradstone begins.',0,0),(49,100,'Single',NULL,1,'Zuko (c) vs Luis Mira','Victory','Twista costs Luis Mira the championship yet again.',0,0),(50,100,'Normal Tag',NULL,1,'Nelson Pereira & Luis Mestre (c) vs Filipe Henriques & Alexandre Rodrigues','Victory',NULL,0,0),(51,100,'Single',NULL,1,'Leo Rossi (c) vs JoÃ£o Pereira','Victory','Standing ovation for both competitors.',0,0),(52,100,'30-Man Royal Rumble Match',NULL,0,'Luis Mira wins the 30-Man Royal Rumble Match.','Victory','Luis Mira finally has the chance to get payback on Twista. Mike Silva enters #1 and Daniel Facine enters #2, in a shocker since they had IRL beef that caused Daniel Facine to walkout of the company.',1,0),(55,102,'Normal Tag',NULL,1,'Daniela & Julia (c) vs. ClÃ¡udia Bradstone & Ivar Nyx','Victory','Daniela & Julia focus on Ivar Nyx and win that way, frustration grows on ClÃ¡udia Bradstone.',0,0),(56,102,'Single',NULL,0,'Ravioli vs. Flix','Victory',NULL,0,0),(57,102,'Single',NULL,0,'Vera vs. Rebeca Facine','Victory','The mini-feud is dissolved.',0,0),(58,102,'Single',NULL,0,'Ozzy vs. Takarin','Victory',NULL,0,0),(59,102,'Normal Tag',NULL,1,'Nelson Pereira & Luis Mestre (c) vs. Leo Rossi & JoÃ£o Pereira','Victory','Tension rises between Leo Rossi and JoÃ£o Pereira ahead of their championship match at Royal Rumble 3, and they couldn\'t co-exist.',1,0),(60,103,'Single',NULL,0,'Daniela w/ Julia vs. JÃ©ssica Sousa','Victory',NULL,0,0),(61,103,'Single',NULL,0,'Grandorman vs. Blitz','Victory',NULL,0,0),(62,103,'Single',NULL,0,'Tiago Rodrigues vs. Nuvas','Victory',NULL,0,0),(63,103,'Single',NULL,0,'Jan vs. Andy Hendrix','Victory','Jan scores another huge upset on Andy Hendrix.',0,0),(64,103,'Single',NULL,1,'Zuko (c) vs. Luis Mira','No Contest','The match never starts as Luis Mira is angry and immediately assaults Zuko.',1,0),(65,99,'Single',NULL,0,'Cláudia Bradstone w/ João Milão vs Ivar Nyx','Victory','Julia appears and lets Cláudia Bradstone know she chose her for Royal Rumble 3.',0,0),(66,99,'Normal Tag',NULL,0,'Raquel & Marta vs. Rebeca Facine & Vera','Victory','Vera & Rebeca Facine get in an argument after losing the match.',0,0),(67,99,'Normal Tag','#1 Contender WWE World Tag Team Championship',0,'Drothdarr & Flix vs. Filipe Henriques & Alexandre Rodrigues','Victory',NULL,0,0),(68,99,'Single',NULL,0,'Ravioli vs. Sagres','Victory',NULL,0,0),(69,99,'Single',NULL,1,'João Pereira (c) vs. João Milão','Victory','Leo Rossi neutralizes The Reckoning interference, allowing the match to happen without distractions. Leo Rossi and João Pereira nod at each other in agreement',1,0),(70,101,'Single',NULL,1,'Nês (c) vs. Marie Lumière','Victory',NULL,0,0),(71,101,'Normal Tag',NULL,1,'Michael Stu & Stefan Stu (c) vs. Nelson Pereira & Luis Mestre','Victory','Standing ovation for the NXT Tag Team Champions after an amazing showdown and respect is shown between the two teams.',0,0),(72,101,'Single',NULL,0,'Carla vs. Nena','Victory',NULL,0,0),(73,101,'Battle Royal','#1 Contender NXT North American Championship at Stand & Deliver',0,'Francisco Mata vs. Nuno Ferreira vs. Digos vs. Freeze vs. Gon Vieira vs. Frame vs. Fábio Gueifão vs. Brave','Victory',NULL,0,0),(74,101,'Single',NULL,1,'Fausto (c) vs. Ricky Boy','Victory',NULL,0,0),(75,101,'Single',NULL,1,'\"Goldenboy\" Santos (c) vs. Rafael Pedras vs. Pégaso','Victory',NULL,1,0);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roster`
--

DROP TABLE IF EXISTS `roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('Active','Inactive','Free Agent','Deceased') NOT NULL,
  `gender` enum('Men','Women') NOT NULL,
  `brand` enum('RAW','SmackDown','NXT') DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster`
--

LOCK TABLES `roster` WRITE;
/*!40000 ALTER TABLE `roster` DISABLE KEYS */;
INSERT INTO `roster` VALUES (1,'\"Jokeyboy\" Nelson Andrade','Inactive','Men',NULL,'PWF Alumni'),(2,'ABREU','Inactive','Men',NULL,'PWF Alumni'),(3,'Adam','Inactive','Men',NULL,'PWF Alumni'),(4,'Agostinho','Inactive','Men',NULL,'PWF Alumni'),(5,'Alexandre Coutinho','Inactive','Men',NULL,'PWF Alumni'),(6,'Alfredo','Inactive','Men',NULL,'PWF Alumni'),(7,'André Aleixo','Inactive','Men',NULL,'PWF Alumni'),(8,'André Coutinho','Inactive','Men',NULL,'PWF Alumni'),(9,'André Couto','Inactive','Men',NULL,'PWF Alumni'),(10,'André Gomes (6º)','Inactive','Men',NULL,'PWF Alumni'),(11,'André Pimenta','Inactive','Men',NULL,'PWF Alumni'),(12,'André Prata','Inactive','Men',NULL,'PWF Alumni'),(13,'António Afonso','Inactive','Men',NULL,'PWF Alumni'),(14,'Barbosa','Inactive','Men',NULL,'PWF Alumni'),(15,'Bernardo Carvalho','Inactive','Men',NULL,'PWF Alumni'),(16,'Bernas','Inactive','Men',NULL,'PWF Alumni'),(17,'Bertolucci','Inactive','Men',NULL,'PWF Alumni'),(18,'Bruno Alves','Inactive','Men',NULL,'PWF Alumni'),(19,'Bruno Fátima','Inactive','Men',NULL,'PWF Alumni'),(20,'Bruno Guerreiro','Inactive','Men',NULL,'PWF Alumni'),(21,'Bruno Pedro','Inactive','Men',NULL,'PWF Alumni'),(22,'Bruno Pinho','Inactive','Men',NULL,'PWF Alumni'),(23,'Bryngela','Inactive','Men',NULL,'PWF Alumni'),(24,'Carlos','Inactive','Men',NULL,'PWF Alumni'),(25,'Carlos Miguel','Inactive','Men',NULL,'PWF Alumni'),(27,'César Bourdain','Inactive','Men',NULL,'PWF Alumni'),(28,'Cláudio','Inactive','Men',NULL,'PWF Alumni'),(29,'Comandante','Inactive','Men',NULL,'PWF Alumni'),(30,'Condoriano','Inactive','Men',NULL,'PWF Alumni'),(31,'Coxo','Inactive','Men',NULL,'PWF Alumni'),(32,'Cristiano Martins','Inactive','Men',NULL,'PWF Alumni'),(33,'Dani Lopes','Inactive','Men',NULL,'PWF Alumni'),(34,'Daniel Filipe','Inactive','Men',NULL,'PWF Alumni'),(35,'Daniel Julio','Inactive','Men',NULL,'PWF Alumni'),(36,'Daniel Mota','Inactive','Men',NULL,'PWF Alumni'),(37,'Daniel Oliveira','Inactive','Men',NULL,'PWF Alumni'),(38,'Daniel Pereira','Inactive','Men',NULL,'PWF Alumni'),(39,'Daniel Rodrigues','Inactive','Men',NULL,'PWF Alumni'),(40,'Daniel Tomás','Inactive','Men',NULL,'PWF Alumni'),(41,'Danny Silva','Inactive','Men',NULL,'PWF Alumni'),(42,'Davez','Inactive','Men',NULL,'PWF Alumni'),(43,'David Conde','Inactive','Men',NULL,'PWF Alumni'),(44,'David Moreira','Inactive','Men',NULL,'PWF Alumni'),(45,'David Pinhal','Inactive','Men',NULL,'PWF Alumni'),(46,'Dinarte de Abreu','Inactive','Men',NULL,'PWF Alumni'),(47,'Diogo Barbosa','Inactive','Men',NULL,'PWF Alumni'),(48,'Diogo Machado','Inactive','Men',NULL,'PWF Alumni'),(49,'Diogo Matos','Inactive','Men',NULL,'PWF Alumni'),(50,'Diogo Moreira','Inactive','Men',NULL,'PWF Alumni'),(51,'Diogo Oliveira','Inactive','Men',NULL,'PWF Alumni'),(52,'Diogo Ramos','Inactive','Men',NULL,'PWF Alumni'),(53,'Diogo Silva','Inactive','Men',NULL,'PWF Alumni'),(54,'Diogo Silva (6º)','Inactive','Men',NULL,'PWF Alumni'),(55,'Diogo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(56,'Eduardo','Inactive','Men',NULL,'PWF Alumni'),(57,'Eduardo Sousa','Inactive','Men',NULL,'PWF Alumni'),(58,'Fabiano','Inactive','Men',NULL,'PWF Alumni'),(59,'Fábio Lopes','Inactive','Men',NULL,'PWF Alumni'),(60,'Filipe Nora','Inactive','Men',NULL,'PWF Alumni'),(61,'Filipe Valente','Inactive','Men',NULL,'PWF Alumni'),(62,'Flake','Inactive','Men',NULL,'PWF Alumni'),(63,'Francisco Barral','Inactive','Men',NULL,'PWF Alumni'),(64,'FreeDom','Inactive','Men',NULL,'PWF Alumni'),(65,'Gali','Inactive','Men',NULL,'PWF Alumni'),(66,'Gonçalo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(67,'Henrique Silva','Inactive','Men',NULL,'PWF Alumni'),(68,'Henrique Sousa','Inactive','Men',NULL,'PWF Alumni'),(69,'Hugo Silva','Inactive','Men',NULL,'PWF Alumni'),(70,'Invictus','Inactive','Men',NULL,'PWF Alumni'),(71,'Isaque Rocha','Inactive','Men',NULL,'PWF Alumni'),(72,'James Hamilton','Inactive','Men',NULL,'PWF Alumni'),(73,'João Alberto','Inactive','Men',NULL,'PWF Alumni'),(74,'João Alves','Inactive','Men',NULL,'PWF Alumni'),(75,'João Cunha','Inactive','Men',NULL,'PWF Alumni'),(76,'João Filipe','Inactive','Men',NULL,'PWF Alumni'),(77,'João Gomes','Inactive','Men',NULL,'PWF Alumni'),(78,'João Lopes','Inactive','Men',NULL,'PWF Alumni'),(79,'João Maia','Inactive','Men',NULL,'PWF Alumni'),(80,'João Marques','Inactive','Men',NULL,'PWF Alumni'),(81,'João Paulo','Inactive','Men',NULL,'PWF Alumni'),(82,'João Santos','Inactive','Men',NULL,'PWF Alumni'),(83,'João Santos','Inactive','Men',NULL,'PWF Alumni'),(84,'Joca','Inactive','Men',NULL,'PWF Alumni'),(85,'Jondesu','Inactive','Men',NULL,'PWF Alumni'),(86,'Jorge Vilarinho','Inactive','Men',NULL,'PWF Alumni'),(87,'José Diogo','Inactive','Men',NULL,'PWF Alumni'),(88,'José Ricardo','Inactive','Men',NULL,'PWF Alumni'),(89,'José Xarez','Inactive','Men',NULL,'PWF Alumni'),(90,'Josh Curley','Inactive','Men',NULL,'PWF Alumni'),(91,'Julio Simão','Inactive','Men',NULL,'PWF Alumni'),(92,'Kazh','Inactive','Men',NULL,'PWF Alumni'),(93,'Keyframe','Inactive','Men',NULL,'PWF Alumni'),(94,'Lino','Inactive','Men',NULL,'PWF Alumni'),(95,'Luis Alão','Inactive','Men',NULL,'PWF Alumni'),(96,'Luis Magina','Inactive','Men',NULL,'PWF Alumni'),(97,'Luis Manuel','Inactive','Men',NULL,'PWF Alumni'),(98,'Luis Miguel','Inactive','Men',NULL,'PWF Alumni'),(99,'Manuel','Inactive','Men',NULL,'PWF Alumni'),(100,'Marco Couto','Inactive','Men',NULL,'PWF Alumni'),(101,'Marco Ribeiro','Inactive','Men',NULL,'PWF Alumni'),(102,'Mário','Inactive','Men',NULL,'PWF Alumni'),(103,'Mário Rui','Inactive','Men',NULL,'PWF Alumni'),(104,'Martim Bento','Inactive','Men',NULL,'PWF Alumni'),(105,'Matador','Inactive','Men',NULL,'PWF Alumni'),(106,'Micha','Inactive','Men',NULL,'PWF Alumni'),(107,'Miguel Carvalho','Inactive','Men',NULL,'PWF Alumni'),(108,'Miguel Chaves','Inactive','Men',NULL,'PWF Alumni'),(109,'Miguel Monteiro','Inactive','Men',NULL,'PWF Alumni'),(110,'Miguel Neto','Inactive','Men',NULL,'PWF Alumni'),(111,'Miguel Oliveira','Inactive','Men',NULL,'PWF Alumni'),(112,'Miguel Soro','Inactive','Men',NULL,'PWF Alumni'),(113,'Nuno Cardoso (Vitag)','Inactive','Men',NULL,'PWF Alumni'),(114,'Nuno Marinho','Inactive','Men',NULL,'PWF Alumni'),(115,'Nuno Philipp','Inactive','Men',NULL,'PWF Alumni'),(116,'Nuno Pinto','Inactive','Men',NULL,'PWF Alumni'),(117,'Nuno Shinigami','Inactive','Men',NULL,'PWF Alumni'),(118,'Oliver','Inactive','Men',NULL,'PWF Alumni'),(119,'Pacheco','Inactive','Men',NULL,'PWF Alumni'),(120,'Paulo Andrade','Inactive','Men',NULL,'PWF Alumni'),(121,'Paulo Naressi','Inactive','Men',NULL,'PWF Alumni'),(122,'Pedro Alves','Inactive','Men',NULL,'PWF Alumni'),(123,'Pedro Fonseca','Inactive','Men',NULL,'PWF Alumni'),(124,'Pedro Marques','Inactive','Men',NULL,'PWF Alumni'),(125,'Queldreya','Inactive','Men',NULL,'PWF Alumni'),(126,'Rafael Castro','Inactive','Men',NULL,'PWF Alumni'),(127,'Rafael Ferreira','Inactive','Men',NULL,'PWF Alumni'),(128,'Ravage','Inactive','Men',NULL,'PWF Alumni'),(129,'Red Eagle','Inactive','Men',NULL,'PWF Alumni'),(130,'Ricardo Cardoso','Inactive','Men',NULL,'PWF Alumni'),(131,'Ricardo Nunes','Inactive','Men',NULL,'PWF Alumni'),(132,'Ricardo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(133,'Rodrigo','Inactive','Men',NULL,'PWF Alumni'),(134,'Rodrigo Santos','Inactive','Men',NULL,'PWF Alumni'),(135,'Rúben Pinheiro','Inactive','Men',NULL,'PWF Alumni'),(136,'Rui Almeida','Inactive','Men',NULL,'PWF Alumni'),(137,'Rui Horta','Inactive','Men',NULL,'PWF Alumni'),(138,'Rui Murteira','Inactive','Men',NULL,'PWF Alumni'),(139,'Samuel Vicente','Inactive','Men',NULL,'PWF Alumni'),(140,'Sérgio Ferreira','Inactive','Men',NULL,'PWF Alumni'),(141,'Sérgio Oliveira','Inactive','Men',NULL,'PWF Alumni'),(142,'Sérgio Sousa','Inactive','Men',NULL,'PWF Alumni'),(143,'Simão','Inactive','Men',NULL,'PWF Alumni'),(144,'Tiago Costa','Inactive','Men',NULL,'PWF Alumni'),(145,'Tiago Martins','Inactive','Men',NULL,'PWF Alumni'),(146,'Toga','Inactive','Men',NULL,'PWF Alumni'),(147,'Tulio Sales','Inactive','Men',NULL,'PWF Alumni'),(148,'Valkirius','Inactive','Men',NULL,'PWF Alumni'),(149,'Ventura','Inactive','Men',NULL,'PWF Alumni'),(150,'Vitor Pascoal','Inactive','Men',NULL,'PWF Alumni'),(151,'Vitor Pinto','Inactive','Men',NULL,'PWF Alumni'),(152,'Wolf','Inactive','Men',NULL,'PWF Alumni'),(153,'Zé Pedro','Inactive','Men',NULL,'PWF Alumni'),(154,'Zekita','Inactive','Men',NULL,'PWF Alumni'),(155,'Amaral','Inactive','Women',NULL,'PWF Alumni'),(156,'Ana Costa','Inactive','Women',NULL,'PWF Alumni'),(157,'Ana Silva','Inactive','Women',NULL,'PWF Alumni'),(158,'Andreia','Inactive','Women',NULL,'PWF Alumni'),(159,'Bárbara','Inactive','Women',NULL,'PWF Alumni'),(160,'Beatriz','Inactive','Women',NULL,'PWF Alumni'),(161,'Bia Russo','Inactive','Women',NULL,'PWF Alumni'),(162,'Bitta','Active','Women','RAW','PWF Alumni'),(163,'Camila','Inactive','Women',NULL,'PWF Alumni'),(164,'Carlota','Inactive','Women',NULL,'PWF Alumni'),(165,'Catarina Ferraz','Inactive','Women',NULL,'PWF Alumni'),(166,'Catarina Flores','Inactive','Women',NULL,'PWF Alumni'),(167,'Catarina Rainho','Inactive','Women',NULL,'PWF Alumni'),(168,'Claudia','Inactive','Women',NULL,'PWF Alumni'),(169,'Cláudia Pascoal','Inactive','Women',NULL,'PWF Alumni'),(170,'Cristiana Queiróz','Inactive','Women',NULL,'PWF Alumni'),(171,'Daniela','Active','Women','SmackDown',NULL),(172,'Diana Neto','Inactive','Women',NULL,'PWF Alumni'),(173,'Eliana','Inactive','Women',NULL,'PWF Alumni'),(174,'Filipa Barros','Inactive','Women',NULL,'PWF Alumni'),(175,'Flávia','Inactive','Women',NULL,'PWF Alumni'),(176,'Herzeleid','Inactive','Women',NULL,'PWF Alumni'),(177,'Inês Leal','Inactive','Women',NULL,'PWF Alumni'),(178,'Isabel','Active','Women','SmackDown','PWF Alumni'),(179,'Jéssica Fontes','Inactive','Women',NULL,'PWF Alumni'),(180,'Jéssica Rodrigues','Inactive','Women',NULL,'PWF Alumni'),(181,'Joana Brandão','Inactive','Women',NULL,'PWF Alumni'),(182,'Joana Hamrol','Inactive','Women',NULL,'PWF Alumni'),(183,'Joana Oliveira','Inactive','Women',NULL,'PWF Alumni'),(184,'Joana Vieira','Inactive','Women',NULL,'PWF Alumni'),(185,'Juliana Gonçalves','Inactive','Women',NULL,'PWF Alumni'),(186,'Leonor','Inactive','Women',NULL,'PWF Alumni'),(187,'Lina','Inactive','Women',NULL,'PWF Alumni'),(188,'Luma','Inactive','Women',NULL,'PWF Alumni'),(189,'Mafalda','Inactive','Women',NULL,'PWF Alumni'),(190,'Maria Iglésias','Inactive','Women',NULL,'PWF Alumni'),(191,'Maria Macedo','Inactive','Women',NULL,'PWF Alumni'),(192,'Mariana','Inactive','Women',NULL,'PWF Alumni'),(193,'Mariana Ramos','Inactive','Women',NULL,'PWF Alumni'),(194,'Marlene Veiga','Inactive','Women',NULL,'PWF Alumni'),(195,'Marta','Active','Women','RAW',NULL),(196,'Marta Carvalho','Inactive','Women',NULL,'PWF Alumni'),(197,'Nádia Oliveira','Inactive','Women',NULL,'PWF Alumni'),(198,'Nair','Inactive','Women',NULL,'PWF Alumni'),(199,'Nyuu','Inactive','Women',NULL,'PWF Alumni'),(200,'Patrícia','Inactive','Women',NULL,'PWF Alumni'),(201,'Patrícia Sendas','Inactive','Women',NULL,'PWF Alumni'),(202,'Paula Castro','Inactive','Women',NULL,'PWF Alumni'),(203,'Peralta','Inactive','Women',NULL,'PWF Alumni'),(204,'Raquel Sá Carneiro','Inactive','Women',NULL,'PWF Alumni'),(205,'Rebeca Facine','Active','Women','RAW',NULL),(206,'Rita','Inactive','Women',NULL,'PWF Alumni'),(207,'Rita Soares','Inactive','Women',NULL,'PWF Alumni'),(208,'Sandy Afonso','Inactive','Women',NULL,'PWF Alumni'),(209,'Silvana','Inactive','Women',NULL,'PWF Alumni'),(210,'Silvana Branco','Active','Women','SmackDown',NULL),(211,'Sky','Inactive','Women',NULL,'PWF Alumni'),(212,'Sofia','Inactive','Women',NULL,'PWF Alumni'),(213,'Sofia Cunha','Inactive','Women',NULL,'PWF Alumni'),(214,'Sophie','Active','Women','SmackDown','PWF Alumni'),(215,'Soraia Filipa','Inactive','Women',NULL,'PWF Alumni'),(216,'Soraia Patrícia','Inactive','Women',NULL,'PWF Alumni'),(217,'Tânia','Inactive','Women',NULL,'PWF Alumni'),(218,'Tixa','Inactive','Women',NULL,'PWF Alumni'),(219,'Vanessa','Active','Women','RAW','PWF Alumni'),(220,'Verinha','Inactive','Women',NULL,'PWF Alumni'),(221,'Alex','Inactive','Men',NULL,'PWF Hall of Fame'),(222,'Alexandre','Inactive','Men',NULL,'PWF Hall of Fame'),(223,'André','Inactive','Men',NULL,'PWF Hall of Fame'),(224,'António','Inactive','Men',NULL,'PWF Hall of Fame'),(225,'Bernardo','Inactive','Men',NULL,'PWF Hall of Fame'),(226,'Bruno','Inactive','Men',NULL,'PWF Hall of Fame'),(227,'Carlos Santos','Active','Men','SmackDown','PWF Hall of Fame'),(228,'César','Inactive','Men',NULL,'PWF Hall of Fame'),(229,'David','Inactive','Men',NULL,'PWF Hall of Fame'),(230,'Diogo','Inactive','Men',NULL,'PWF Hall of Fame'),(231,'Duarte','Inactive','Men',NULL,'PWF Hall of Fame'),(232,'Emanuel','Inactive','Men',NULL,'PWF Hall of Fame'),(233,'Fábio','Inactive','Men',NULL,'PWF Hall of Fame'),(234,'Fábio Arantes','Inactive','Men',NULL,'PWF Hall of Fame'),(235,'Fernando Rafael','Inactive','Men',NULL,'PWF Hall of Fame'),(236,'Filipe Leesee','Inactive','Men',NULL,'PWF Hall of Fame'),(237,'Gonçalo','Inactive','Men',NULL,'PWF Hall of Fame'),(238,'Hugo','Inactive','Men',NULL,'PWF Hall of Fame'),(239,'Hugo Rodrigues','Inactive','Men',NULL,'PWF Hall of Fame'),(240,'Ivani Ca','Inactive','Men',NULL,'PWF Hall of Fame'),(241,'João Carlos','Inactive','Men',NULL,'PWF Hall of Fame'),(242,'João Dias','Inactive','Men',NULL,'PWF Hall of Fame'),(243,'João Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(244,'Joel','Inactive','Men',NULL,'PWF Hall of Fame'),(245,'Jorge Soares','Deceased','Men',NULL,'PWF Hall of Fame'),(246,'José Bernardo','Inactive','Men',NULL,'PWF Hall of Fame'),(247,'José João','Inactive','Men',NULL,'PWF Hall of Fame'),(248,'Kevin','Inactive','Men',NULL,'PWF Hall of Fame'),(249,'Luis Lowden','Inactive','Men',NULL,'PWF Hall of Fame'),(250,'Luis Silva','Inactive','Men',NULL,'PWF Hall of Fame'),(251,'Manuel Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(252,'Marcelo','Inactive','Men',NULL,'PWF Hall of Fame'),(253,'Mário Nunes','Inactive','Men',NULL,'PWF Hall of Fame'),(254,'Paulo Durbeck','Inactive','Men',NULL,'PWF Hall of Fame'),(255,'Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(256,'Pedro Cunha','Inactive','Men',NULL,'PWF Hall of Fame'),(257,'Pedro Miguel','Inactive','Men',NULL,'PWF Hall of Fame'),(258,'Pedro Reis','Inactive','Men',NULL,'PWF Hall of Fame'),(259,'Pedro Teixeira','Inactive','Men',NULL,'PWF Hall of Fame'),(260,'Rafael','Inactive','Men',NULL,'PWF Hall of Fame'),(261,'Reinaldo','Inactive','Men',NULL,'PWF Hall of Fame'),(262,'Ricardo Melo','Inactive','Men',NULL,'PWF Hall of Fame'),(263,'Ricardo Soares','Inactive','Men',NULL,'PWF Hall of Fame'),(264,'Rui Daniel','Deceased','Men',NULL,'PWF Hall of Fame'),(265,'Rui Leal','Inactive','Men',NULL,'PWF Hall of Fame'),(266,'Rui Peixoto','Inactive','Men',NULL,'PWF Hall of Fame'),(267,'Sérgio Pires','Inactive','Men',NULL,'PWF Hall of Fame'),(268,'Tiago Jesus','Deceased','Men',NULL,'PWF Hall of Fame'),(269,'Tiago Rodrigues','Active','Men','SmackDown','PWF Hall of Fame'),(270,'Vitor','Inactive','Men',NULL,'PWF Hall of Fame'),(271,'Xavier','Inactive','Men',NULL,'PWF Hall of Fame'),(272,'Alexandra Correia','Inactive','Women',NULL,'PWF Hall of Fame'),(273,'Ana Catarina','Inactive','Women',NULL,'PWF Hall of Fame'),(274,'Ana Rita','Inactive','Women',NULL,'PWF Hall of Fame'),(275,'Angi Silva','Active','Women','SmackDown','PWF Hall of Fame'),(276,'Bianca','Inactive','Women',NULL,'PWF Hall of Fame'),(277,'Carolina Andrade','Inactive','Women',NULL,'PWF Hall of Fame'),(278,'Catarina Alexandra','Inactive','Women',NULL,'PWF Hall of Fame'),(279,'Catarina Oliveira','Inactive','Women',NULL,'PWF Hall of Fame'),(280,'Catarina Silva','Inactive','Women',NULL,'PWF Hall of Fame'),(281,'Daniela Lopes','Inactive','Women',NULL,'PWF Hall of Fame'),(282,'Guida','Inactive','Women',NULL,'PWF Hall of Fame'),(283,'Inês Gonçalves','Inactive','Women',NULL,'PWF Hall of Fame'),(284,'Inês Lima','Inactive','Women',NULL,'PWF Hall of Fame'),(285,'Julia','Active','Women','SmackDown','PWF Hall of Fame'),(286,'Liliana','Inactive','Women',NULL,'PWF Hall of Fame'),(287,'Lucia','Inactive','Women',NULL,'PWF Hall of Fame'),(288,'Maria','Active','Women','RAW','PWF Hall of Fame'),(289,'Mónica Ferreira','Inactive','Women',NULL,'PWF Hall of Fame'),(290,'Raquel','Active','Women','RAW','PWF Hall of Fame'),(291,'Sara Gonçalves','Inactive','Women',NULL,'PWF Hall of Fame'),(292,'Sara Vedor','Active','Women','SmackDown','PWF Hall of Fame'),(293,'Vera','Active','Women','RAW','PWF Hall of Fame'),(294,'Adir Amiel','Inactive','Men',NULL,'NXT Alumni'),(295,'Álvaro Magalhães','Inactive','Men',NULL,'NXT Alumni'),(296,'Alex Ace','Inactive','Men',NULL,'NXT Alumni'),(297,'Alvin','Inactive','Men',NULL,'NXT Alumni'),(298,'Amauri','Inactive','Men',NULL,'NXT Alumni'),(299,'André Jesus (AndreNero4)','Inactive','Men',NULL,'NXT Alumni'),(300,'André Nascimento (uizard)','Inactive','Men',NULL,'NXT Alumni'),(301,'André Nunes (Maxnunes)','Inactive','Men',NULL,'NXT Alumni'),(302,'André Soares','Inactive','Men',NULL,'NXT Alumni'),(303,'Azorea','Inactive','Men',NULL,'NXT Alumni'),(304,'Brendo Costa','Inactive','Men',NULL,'NXT Alumni'),(305,'Brendo Silva','Inactive','Men',NULL,'NXT Alumni'),(306,'Bruno Borges','Inactive','Men',NULL,'NXT Alumni'),(307,'Bruno Duarte','Inactive','Men',NULL,'NXT Alumni'),(308,'Bruno Malheiro','Inactive','Men',NULL,'NXT Alumni'),(309,'Carlos Figueira','Inactive','Men',NULL,'NXT Alumni'),(310,'Carlos Francisco','Inactive','Men',NULL,'NXT Alumni'),(311,'Carlos Gonçalves','Inactive','Men',NULL,'NXT Alumni'),(312,'Carlos Medeiros','Active','Men','SmackDown',NULL),(313,'Carlos Pereira','Inactive','Men',NULL,'NXT Alumni'),(314,'Carlos Sylvester','Inactive','Men',NULL,'NXT Alumni'),(315,'Cláudio Lopes','Inactive','Men',NULL,'NXT Alumni'),(316,'Daniel Serrado (Patanás)','Inactive','Men',NULL,'NXT Alumni'),(317,'David Moscoso','Inactive','Men',NULL,'NXT Alumni'),(318,'Diego Silva','Inactive','Men',NULL,'NXT Alumni'),(319,'Diogo Araújo','Inactive','Men',NULL,'NXT Alumni'),(320,'Diogo Guerreiro','Inactive','Men',NULL,'NXT Alumni'),(321,'Diogo Martins','Inactive','Men',NULL,'NXT Alumni'),(322,'Diogo Moreira (TNDR)','Inactive','Men',NULL,'NXT Alumni'),(323,'Diogo Rodrigues','Inactive','Men',NULL,'NXT Alumni'),(324,'Duff','Inactive','Men',NULL,'NXT Alumni'),(325,'El Matador','Inactive','Men',NULL,'NXT Alumni'),(326,'Enzosam','Inactive','Men',NULL,'NXT Alumni'),(327,'Erick','Inactive','Men',NULL,'NXT Alumni'),(328,'Fergus','Inactive','Men',NULL,'NXT Alumni'),(329,'Filipe Elviro','Inactive','Men',NULL,'NXT Alumni'),(330,'Francisco','Inactive','Men',NULL,'NXT Alumni'),(331,'Gavin Murray','Inactive','Men',NULL,'NXT Alumni'),(332,'Gonçalo Hipólito','Inactive','Men',NULL,'NXT Alumni'),(333,'Gonçalo Moreira','Inactive','Men',NULL,'NXT Alumni'),(334,'Gonçalo Santos','Inactive','Men',NULL,'NXT Alumni'),(335,'Gonçalo Sousa (Cremonezzi)','Inactive','Men',NULL,'NXT Alumni'),(336,'Guilherme','Inactive','Men',NULL,'NXT Alumni'),(337,'Gustavo','Inactive','Men',NULL,'NXT Alumni'),(338,'Hélio','Inactive','Men',NULL,'NXT Alumni'),(339,'Hugo Azevedo','Inactive','Men',NULL,'NXT Alumni'),(340,'Hugo Pereira','Inactive','Men',NULL,'NXT Alumni'),(341,'Igor','Inactive','Men',NULL,'NXT Alumni'),(342,'Ivan','Inactive','Men',NULL,'NXT Alumni'),(343,'Jacinto Carrilho','Inactive','Men',NULL,'NXT Alumni'),(344,'João Barbosa','Inactive','Men',NULL,'NXT Alumni'),(345,'João Cansado','Inactive','Men',NULL,'NXT Alumni'),(346,'João Rey','Inactive','Men',NULL,'NXT Alumni'),(347,'João Veloso','Inactive','Men',NULL,'NXT Alumni'),(348,'Joel Silva','Inactive','Men',NULL,'NXT Alumni'),(349,'José Lameirinhas','Inactive','Men',NULL,'NXT Alumni'),(350,'José Teles','Inactive','Men',NULL,'NXT Alumni'),(351,'Júlio Serqueira','Inactive','Men',NULL,'NXT Alumni'),(352,'Kraken','Inactive','Men',NULL,'NXT Alumni'),(353,'Leandro Mendonça','Inactive','Men',NULL,'NXT Alumni'),(354,'Leonardo Silva','Inactive','Men',NULL,'NXT Alumni'),(355,'Lewis Reid','Inactive','Men',NULL,'NXT Alumni'),(356,'Luciano Florêncio','Inactive','Men',NULL,'NXT Alumni'),(357,'Luyy','Active','Men',NULL,NULL),(358,'Nate Maddox','Inactive','Men',NULL,'NXT Alumni'),(359,'Manuel Cabages','Inactive','Men',NULL,'NXT Alumni'),(360,'Marco António','Inactive','Men',NULL,'NXT Alumni'),(361,'Marco Cunha','Inactive','Men',NULL,'NXT Alumni'),(362,'Marco Silva','Inactive','Men',NULL,'NXT Alumni'),(363,'Miguel Elviro','Inactive','Men',NULL,'NXT Alumni'),(364,'Miguel Fonseca (Crink3d)','Inactive','Men',NULL,'NXT Alumni'),(365,'Miguel Maia','Inactive','Men',NULL,'NXT Alumni'),(366,'Miguel Vicente','Inactive','Men',NULL,'NXT Alumni'),(367,'Neph','Inactive','Men',NULL,'NXT Alumni'),(368,'Nuno Teixeira','Inactive','Men',NULL,'NXT Alumni'),(369,'Nuno Vicente (Th3samie)','Inactive','Men',NULL,'NXT Alumni'),(370,'Nuno Vieira (V2)','Inactive','Men',NULL,'NXT Alumni'),(371,'Orlando','Inactive','Men',NULL,'NXT Alumni'),(372,'Queta','Inactive','Men',NULL,'NXT Alumni'),(373,'Paulo Tavares','Inactive','Men',NULL,'NXT Alumni'),(374,'Pedro Brochado','Inactive','Men',NULL,'NXT Alumni'),(375,'Pedro Maia','Inactive','Men',NULL,'NXT Alumni'),(376,'Pedro Martins','Inactive','Men',NULL,'NXT Alumni'),(377,'Pedro Tribuzi','Inactive','Men',NULL,'NXT Alumni'),(378,'Rahul Saxena','Inactive','Men',NULL,'NXT Alumni'),(379,'Reinventing','Inactive','Men',NULL,'NXT Alumni'),(380,'Rex','Inactive','Men',NULL,'NXT Alumni'),(381,'Ricardo Ermida (Killerrik99)','Inactive','Men',NULL,'NXT Alumni'),(382,'Ricardo Silva (Locust)','Inactive','Men',NULL,'NXT Alumni'),(383,'Ricky Barceló','Inactive','Men',NULL,'NXT Alumni'),(384,'Robson','Inactive','Men',NULL,'NXT Alumni'),(385,'Rubby Silva','Inactive','Men',NULL,'NXT Alumni'),(386,'Ruben Carvalho','Inactive','Men',NULL,'NXT Alumni'),(387,'Rui Duarte','Inactive','Men',NULL,'NXT Alumni'),(388,'Rui Gomes','Inactive','Men',NULL,'NXT Alumni'),(389,'Rui Graça','Inactive','Men',NULL,'NXT Alumni'),(390,'Rui Lopes','Inactive','Men',NULL,'NXT Alumni'),(391,'Rui Nunes','Inactive','Men',NULL,'NXT Alumni'),(392,'Shidoki','Inactive','Men',NULL,'NXT Alumni'),(393,'Silveira','Inactive','Men',NULL,'NXT Alumni'),(394,'Smiley','Inactive','Men',NULL,'NXT Alumni'),(395,'Suresh','Inactive','Men',NULL,'NXT Alumni'),(396,'Suto','Inactive','Men',NULL,'NXT Alumni'),(397,'Tejan','Inactive','Men',NULL,'NXT Alumni'),(398,'Tiago Ferreira','Inactive','Men',NULL,'NXT Alumni'),(399,'Tiago Leite','Inactive','Men',NULL,'NXT Alumni'),(400,'Tiago Moura','Inactive','Men',NULL,'NXT Alumni'),(401,'Tiago Vieira','Active','Men','RAW','NXT Alumni'),(402,'Tim','Inactive','Men',NULL,'NXT Alumni'),(403,'Vigilante','Inactive','Men',NULL,'NXT Alumni'),(404,'Zenboy','Inactive','Men',NULL,'NXT Alumni'),(405,'Zup','Inactive','Men',NULL,'NXT Alumni'),(406,'Ana Luisa Pinhal','Inactive','Women',NULL,'NXT Alumni'),(407,'Ana Machado','Inactive','Women',NULL,'NXT Alumni'),(408,'Ana Sousa','Inactive','Women',NULL,'NXT Alumni'),(409,'Andreia Coelho','Inactive','Women',NULL,'NXT Alumni'),(410,'Ângela Sofia','Inactive','Women',NULL,'NXT Alumni'),(411,'Bárbara Tinoco','Inactive','Women',NULL,'NXT Alumni'),(412,'Bebiana Cardoso','Inactive','Women',NULL,'NXT Alumni'),(413,'Benny','Inactive','Women',NULL,'NXT Alumni'),(414,'Bessie','Inactive','Women',NULL,'NXT Alumni'),(415,'Carina','Inactive','Women',NULL,'NXT Alumni'),(416,'Carolina Matos','Inactive','Women',NULL,'NXT Alumni'),(417,'Catarina Brito','Inactive','Women',NULL,'NXT Alumni'),(418,'Catarina Dias','Inactive','Women',NULL,'NXT Alumni'),(419,'Cláudia Lopes','Inactive','Women',NULL,'NXT Alumni'),(420,'Daisy','Inactive','Women',NULL,'NXT Alumni'),(421,'Emna Khemira','Inactive','Women',NULL,'NXT Alumni'),(422,'Francisca Cardoso','Inactive','Women',NULL,'NXT Alumni'),(423,'Francisca Falcão','Inactive','Women',NULL,'NXT Alumni'),(424,'Inês Portela','Inactive','Women',NULL,'NXT Alumni'),(425,'Joana','Inactive','Women',NULL,'NXT Alumni'),(426,'Kalisheedra','Inactive','Women',NULL,'NXT Alumni'),(427,'Lena','Inactive','Women',NULL,'NXT Alumni'),(428,'Lucia Guerra','Inactive','Women',NULL,'NXT Alumni'),(429,'Margarida Maia','Inactive','Women',NULL,'NXT Alumni'),(430,'Maria Belo','Inactive','Women',NULL,'NXT Alumni'),(431,'Maria Claro','Inactive','Women',NULL,'NXT Alumni'),(432,'Mariana Conceição','Inactive','Women',NULL,'NXT Alumni'),(433,'Patrícia Ribeiro','Inactive','Women',NULL,'NXT Alumni'),(434,'Patrícia Vieira','Inactive','Women',NULL,'NXT Alumni'),(435,'Pipa Matos','Inactive','Women',NULL,'NXT Alumni'),(436,'Raquel Cardoso','Inactive','Women',NULL,'NXT Alumni'),(437,'Raquel Silva','Inactive','Women',NULL,'NXT Alumni'),(438,'Rita Azevedo','Inactive','Women',NULL,'NXT Alumni'),(439,'Rita Moreira','Inactive','Women',NULL,'NXT Alumni'),(440,'Rita Silva','Inactive','Women',NULL,'NXT Alumni'),(441,'Rita Sofia','Inactive','Women',NULL,'NXT Alumni'),(442,'Salma','Inactive','Women',NULL,'NXT Alumni'),(443,'Sara \"ymna\" R.','Inactive','Women',NULL,'NXT Alumni'),(444,'Sofia Sousa','Inactive','Women',NULL,'NXT Alumni'),(445,'Sónia Ferreira','Inactive','Women',NULL,'NXT Alumni'),(446,'Teresa','Inactive','Women',NULL,'NXT Alumni'),(447,'Daisuke Kanehira','Inactive','Men',NULL,'NXT UK Alumni'),(448,'Tamura','Inactive','Men',NULL,'NXT UK Alumni'),(449,'Nick Powers','Inactive','Men',NULL,'NXT UK Alumni'),(450,'Leon Jackson','Inactive','Men',NULL,'NXT UK Alumni'),(451,'Cal Silva','Inactive','Men',NULL,'NXT UK Alumni'),(452,'Mad Dog Maxx','Inactive','Men',NULL,'NXT UK Alumni'),(453,'Kurt Simmons','Inactive','Men',NULL,'NXT UK Alumni'),(454,'Val Eden','Inactive','Men',NULL,'NXT UK Alumni'),(455,'Matt Fox','Inactive','Men',NULL,'NXT UK Alumni'),(456,'Alex Cuevas','Inactive','Men',NULL,'NXT UK Alumni'),(457,'Tajiri','Inactive','Men',NULL,'NXT UK Alumni'),(458,'Mike Bailey','Inactive','Men',NULL,'NXT UK Alumni'),(459,'Eric Walker','Inactive','Men',NULL,'NXT UK Alumni'),(460,'Jay Knox','Inactive','Men',NULL,'NXT UK Alumni'),(461,'Cam Wellington','Deceased','Men',NULL,'NXT UK Alumni'),(462,'Aleah James','Inactive','Women',NULL,'NXT UK Alumni'),(463,'Anastasia','Inactive','Women',NULL,'NXT UK Alumni'),(464,'Flo Riley','Inactive','Women',NULL,'NXT UK Alumni'),(465,'Killer Kelly','Inactive','Women',NULL,'NXT UK Alumni'),(466,'Armina Lily','Inactive','Women',NULL,'NXT UK Alumni'),(467,'Nelson Pereira','Active','Men','RAW',NULL),(468,'Luis Mestre','Active','Men','RAW',NULL),(469,'João Milão','Active','Men','RAW',NULL),(470,'Ravioli','Active','Men','RAW',NULL),(471,'Ozzy','Active','Men','RAW',NULL),(472,'Drothdarr','Active','Men','RAW',NULL),(473,'Takarin','Active','Men','RAW',NULL),(474,'Flix','Active','Men','RAW',NULL),(475,'Leo Rossi','Active','Men','RAW',NULL),(476,'Sagres','Active','Men','RAW',NULL),(477,'Daniel Facine','Active','Men','RAW',NULL),(478,'João Pereira','Active','Men','RAW',NULL),(479,'Filipe Henriques','Active','Men','RAW',NULL),(480,'Alexandre Rodrigues','Active','Men','RAW',NULL),(481,'Cláudia Bradstone','Active','Women','RAW',NULL),(482,'Jay Pay','Active','Women','RAW',NULL),(483,'Ivar Nyx','Active','Women','RAW',NULL),(484,'Jan','Active','Men','SmackDown',NULL),(485,'Pedro Soares','Active','Men','SmackDown',NULL),(486,'André Gomes','Active','Men','SmackDown',NULL),(487,'Lobo Ibérico','Active','Men','SmackDown',NULL),(488,'Zuko','Active','Men','SmackDown',NULL),(489,'Grandorman','Active','Men','SmackDown',NULL),(490,'Twista','Active','Men','SmackDown',NULL),(491,'Andy Hendrix','Active','Men','SmackDown',NULL),(492,'Nuvas','Active','Men','SmackDown',NULL),(493,'Blitz','Active','Men','SmackDown',NULL),(494,'Isaac Vitorino','Active','Men','SmackDown',NULL),(495,'Aurélio','Active','Men','SmackDown',NULL),(496,'Luis Mira','Active','Men','SmackDown',NULL),(497,'Drew Minnear','Active','Men','SmackDown',NULL),(498,'Mike Silva','Active','Men','SmackDown',NULL),(499,'Damião','Active','Men','NXT',NULL),(500,'\"Goldenboy\" Santos','Active','Men','NXT',NULL),(501,'Rafael Pedras','Active','Men','SmackDown',NULL),(502,'Paulo \"Knockout\" Cruz','Active','Men','RAW',NULL),(503,'Ricky Boy','Active','Men','NXT',NULL),(504,'Fausto','Active','Men','SmackDown',NULL),(505,'Digos','Active','Men','NXT',NULL),(506,'Didi','Active','Men','NXT',NULL),(507,'Pégaso','Active','Men','NXT',NULL),(508,'Francisco Mata','Active','Men','NXT',NULL),(509,'Roddy Flow','Active','Men','NXT',NULL),(510,'Darthus','Active','Men','NXT',NULL),(511,'Michael Stu','Active','Men','NXT',NULL),(512,'Stefan Stu','Active','Men','NXT',NULL),(513,'Freeze','Inactive','Men',NULL,NULL),(514,'Zadarkus','Inactive','Men',NULL,'NXT Alumni'),(515,'Gon Vieira','Active','Men','NXT',NULL),(516,'José Almeida','Active','Men','NXT',NULL),(517,'Nuno Ferreira','Active','Men','RAW',NULL),(518,'Frame','Active','Men','NXT',NULL),(519,'Chiote','Active','Men','NXT',NULL),(520,'Sonic','Inactive','Men',NULL,'NXT Alumni'),(521,'João Lino','Inactive','Men',NULL,'NXT Alumni'),(522,'Fábio Gueifão','Inactive','Men',NULL,'NXT Alumni'),(523,'Brave','Active','Men','NXT',NULL),(524,'Marine Riga','Active','Women','RAW',NULL),(525,'Carla','Active','Women','SmackDown',NULL),(526,'Marie Lumière','Active','Women','NXT',NULL),(527,'Nena','Active','Women','NXT',NULL),(528,'Eevoh','Inactive','Men',NULL,NULL),(529,'Jéssica Sousa','Active','Women','SmackDown',NULL),(530,'Lara Alexandra','Active','Women','SmackDown',NULL),(531,'Tânia','Active','Women','SmackDown',NULL),(532,'Nês','Active','Women','RAW',NULL),(533,'Yuki','Active','Men','NXT',NULL),(534,'Aqua','Active','Men','NXT',NULL),(535,'Akshay Tiwari','Active','Men','NXT',NULL),(536,'Oleksii','Active','Men','NXT',NULL),(537,'Miguel Mendes','Active','Men','NXT',NULL),(538,'Ricardo Morgado','Active','Men','NXT',NULL),(539,'Cédrine Barandon','Active','Women','NXT',NULL),(540,'Stephan van Kalmthout','Active','Men','NXT',NULL),(541,'Tarte','Active','Men','NXT',NULL),(542,'Hee_HO','Active','Men','NXT',NULL),(543,'Nox','Active','Men','NXT',NULL),(544,'Yamcher','Active','Men','NXT',NULL),(545,'Bules','Active','Men','NXT',NULL),(546,'Keron','Active','Men','NXT',NULL),(547,'Sir Shadows','Active','Men','NXT',NULL),(548,'THE VIGILANTE','Active','Men','NXT',NULL),(549,'Esqueiro','Active','Men','NXT',NULL),(550,'Snoopy','Active','Men','NXT',NULL),(551,'Baltazar','Active','Men','NXT',NULL),(552,'Foxx','Active','Men','NXT',NULL);
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superstars`
--

DROP TABLE IF EXISTS `superstars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superstars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superstars`
--

LOCK TABLES `superstars` WRITE;
/*!40000 ALTER TABLE `superstars` DISABLE KEYS */;
INSERT INTO `superstars` VALUES (1,'\"Jokeyboy\" Nelson Andrade','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(2,'ABREU','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(3,'Adam','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(4,'Agostinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(5,'Alexandre Coutinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(6,'Alfredo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(7,'André Aleixo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(8,'André Coutinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(9,'André Couto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(10,'André Gomes (6º)','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(11,'André Pimenta','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(12,'André Prata','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(13,'António Afonso','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(14,'Barbosa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(15,'Bernardo Carvalho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(16,'Bernas','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(17,'Bertolucci','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(18,'Bruno Alves','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(19,'Bruno Fátima','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(20,'Bruno Guerreiro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(21,'Bruno Pedro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(22,'Bruno Pinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(23,'Bryngela','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(24,'Carlos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(25,'Carlos Miguel','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(27,'César Bourdain','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(28,'Cláudio','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(29,'Comandante','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(30,'Condoriano','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(31,'Coxo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(32,'Cristiano Martins','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(33,'Dani Lopes','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(34,'Daniel Filipe','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(35,'Daniel Julio','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(36,'Daniel Mota','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(37,'Daniel Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(38,'Daniel Pereira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(39,'Daniel Rodrigues','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(40,'Daniel Tomás','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(41,'Danny Silva','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(42,'Davez','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(43,'David Conde','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(44,'David Moreira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(45,'David Pinhal','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(46,'Dinarte de Abreu','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(47,'Diogo Barbosa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(48,'Diogo Machado','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(49,'Diogo Matos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(50,'Diogo Moreira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(51,'Diogo Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(52,'Diogo Ramos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(53,'Diogo Silva','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(54,'Diogo Silva (6º)','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(55,'Diogo Teixeira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(56,'Eduardo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(57,'Eduardo Sousa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(58,'Fabiano','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(59,'Fábio Lopes','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(60,'Filipe Nora','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(61,'Filipe Valente','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(62,'Flake','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(63,'Francisco Barral','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(64,'FreeDom','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(65,'Gali','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(66,'Gonçalo Teixeira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(67,'Henrique Silva','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(68,'Henrique Sousa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(69,'Hugo Silva','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(70,'Invictus','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(71,'Isaque Rocha','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(72,'James Hamilton','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(73,'João Alberto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(74,'João Alves','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(75,'João Cunha','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(76,'João Filipe','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(77,'João Gomes','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(78,'João Lopes','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(79,'João Maia','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(80,'João Marques','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(81,'João Paulo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(82,'João Santos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(83,'João Santos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(84,'Joca','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(85,'Jondesu','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(86,'Jorge Vilarinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(87,'José Diogo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(88,'José Ricardo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(89,'José Xarez','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(90,'Josh Curley','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(91,'Julio Simão','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(92,'Kazh','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(93,'Keyframe','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(94,'Lino','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(95,'Luis Alão','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(96,'Luis Magina','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(97,'Luis Manuel','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(98,'Luis Miguel','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(99,'Manuel','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(100,'Marco Couto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(101,'Marco Ribeiro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(102,'Mário','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(103,'Mário Rui','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(104,'Martim Bento','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(105,'Matador','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(106,'Micha','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(107,'Miguel Carvalho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(108,'Miguel Chaves','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(109,'Miguel Monteiro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(110,'Miguel Neto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(111,'Miguel Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(112,'Miguel Soro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(113,'Nuno Cardoso (Vitag)','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(114,'Nuno Marinho','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(115,'Nuno Philipp','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(116,'Nuno Pinto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(117,'Nuno Shinigami','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(118,'Oliver','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(119,'Pacheco','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(120,'Paulo Andrade','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(121,'Paulo Naressi','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(122,'Pedro Alves','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(123,'Pedro Fonseca','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(124,'Pedro Marques','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(125,'Queldreya','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(126,'Rafael Castro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(127,'Rafael Ferreira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(128,'Ravage','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(129,'Red Eagle','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(130,'Ricardo Cardoso','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(131,'Ricardo Nunes','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(132,'Ricardo Teixeira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(133,'Rodrigo','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(134,'Rodrigo Santos','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(135,'Rúben','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(136,'Rui Almeida','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(137,'Rui Horta','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(138,'Rui Murteira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(139,'Samuel Vicente','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(140,'Sérgio','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(141,'Sérgio Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(142,'Sérgio Sousa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(143,'Simão','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(144,'Tiago Costa','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(145,'Tiago Martins','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(146,'Toga','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(147,'Tulio Sales','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(148,'Valkirius','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(149,'Ventura','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(150,'Vitor Pascoal','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(151,'Vitor Pinto','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(152,'Wolf','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(153,'Zé Pedro','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(154,'Zekita','INACTIVE',NULL,NULL,'PWF Alumni','Men'),(155,'Amaral','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(156,'Ana Costa','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(157,'Ana Silva','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(158,'Andreia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(159,'Bárbara','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(160,'Beatriz','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(161,'Bia Russo','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(162,'Bitta','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(163,'Camila','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(164,'Carlota','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(165,'Catarina Ferraz','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(166,'Catarina Flores','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(167,'Catarina Rainho','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(168,'Claudia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(169,'Cláudia Pascoal','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(170,'Cristiana Queiróz','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(171,'Daniela','ACTIVE','SmackDown','WWE Women\'s Championship','','Women'),(172,'Diana Neto','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(173,'Eliana','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(174,'Filipa Barros','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(175,'Flávia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(176,'Herzeleid','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(177,'Inês Leal','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(178,'Isabel','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(179,'Jéssica Fontes','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(180,'Jéssica Rodrigues','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(181,'Joana Brandão','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(182,'Joana Hamrol','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(183,'Joana Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(184,'Joana Vieira','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(185,'Juliana Gonçalves','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(186,'Leonor','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(187,'Lina','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(188,'Luma','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(189,'Mafalda','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(190,'Maria Iglésias','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(191,'Maria Macedo','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(192,'Mariana','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(193,'Mariana Ramos','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(194,'Marlene Veiga','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(195,'Marta','Active','RAW','Women\'s Tag Team Championship','','Women'),(196,'Marta Carvalho','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(197,'Nádia Oliveira','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(198,'Nair','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(199,'Nyuu','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(200,'Patrícia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(201,'Patrícia Sendas','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(202,'Paula Castro','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(203,'Peralta','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(204,'Raquel Sá Carneiro','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(205,'Rebeca Facine','ACTIVE','RAW',NULL,'','Women'),(206,'Rita','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(207,'Rita Soares','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(208,'Sandy Afonso','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(209,'Silvana','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(210,'Silvana Branco','ACTIVE','SmackDown',NULL,'','Women'),(211,'Sky','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(212,'Sofia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(213,'Sofia Cunha','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(214,'Sophie','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(215,'Soraia Filipa','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(216,'Soraia Patrícia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(217,'Tânia','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(218,'Tixa','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(219,'Vanessa','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(220,'Verinha','INACTIVE',NULL,NULL,'PWF Alumni','Women'),(221,'Alex','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(222,'Alexandre','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(223,'André','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(224,'António','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(225,'Bernardo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(226,'Bruno','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(227,'Carlos Santos','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(228,'César','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(229,'David','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(230,'Diogo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(231,'Duarte','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(232,'Emanuel','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(233,'Fábio','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(234,'Fábio Arantes','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(235,'Fernando Rafael','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(236,'Filipe Leesee','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(237,'Gonçalo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(238,'Hugo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(239,'Hugo Rodrigues','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(240,'Ivani Ca','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(241,'João Carlos','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(242,'João Dias','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(243,'João Pedro','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(244,'Joel','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(245,'Jorge Soares','DECEASED',NULL,NULL,'PWF Hall of Fame','Men'),(246,'José Bernardo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(247,'José João','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(248,'Kevin','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(249,'Luis Lowden','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(250,'Luis Silva','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(251,'Manuel Pedro','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(252,'Marcelo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(253,'Mário Nunes','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(254,'Paulo Durbeck','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(255,'Pedro','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(256,'Pedro Cunha','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(257,'Pedro Miguel','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(258,'Pedro Reis','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(259,'Pedro Teixeira','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(260,'Rafael','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(261,'Reinaldo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(262,'Ricardo Melo','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(263,'Ricardo Soares','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(264,'Rui Daniel','DECEASED',NULL,NULL,'PWF Hall of Fame','Men'),(265,'Rui Leal','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(266,'Rui Peixoto','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(267,'Sérgio Pires','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(268,'Tiago Jesus','DECEASED',NULL,NULL,'PWF Hall of Fame','Men'),(269,'Tiago Rodrigues','ACTIVE','SmackDown',NULL,'PWF Hall of Fame','Men'),(270,'Vitor','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(271,'Xavier','INACTIVE',NULL,NULL,'PWF Hall of Fame','Men'),(272,'Alexandra Correia','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(273,'Ana Catarina','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(274,'Ana Rita','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(275,'Angi Silva','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(276,'Bianca','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(277,'Carolina Andrade','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(278,'Catarina Alexandra','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(279,'Catarina Oliveira','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(280,'Catarina Silva','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(281,'Daniela Lopes','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(282,'Guida','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(283,'Inês Gonçalves','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(284,'Inês Lima','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(285,'Julia','ACTIVE','SmackDown',NULL,'PWF Hall of Fame','Women'),(286,'Liliana','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(287,'Lucia','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(288,'Maria','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(289,'Mónica Ferreira','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(290,'Raquel','ACTIVE','RAW','Women\'s Tag Team Championship','PWF Hall of Fame','Women'),(291,'Sara Gonçalves','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(292,'Sara Vedor','INACTIVE',NULL,NULL,'PWF Hall of Fame','Women'),(293,'Vera','ACTIVE','RAW',NULL,'PWF Hall of Fame','Women'),(294,'Adir Amiel','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(295,'Álvaro Magalhães','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(296,'Alex Ace','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(297,'Alvin','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(298,'Amauri','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(299,'André Jesus (AndreNero4)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(300,'André Nascimento (uizard)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(301,'André Nunes (Maxnunes)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(302,'André Soares','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(303,'Azorea','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(304,'Brendo Costa','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(305,'Brendo Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(306,'Bruno Borges','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(307,'Bruno Duarte','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(308,'Bruno Malheiro','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(309,'Carlos Figueira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(310,'Carlos Francisco','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(311,'Carlos Gonçalves','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(312,'Carlos Medeiros','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(313,'Carlos Pereira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(314,'Carlos Sylvester','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(315,'Cláudio Lopes','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(316,'Daniel Serrado (Patanás)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(317,'David Moscoso','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(318,'Diego Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(319,'Diogo Araújo','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(320,'Diogo Guerreiro','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(321,'Diogo Martins','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(322,'Diogo Moreira (TNDR)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(323,'Diogo Rodrigues','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(324,'Duff','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(325,'El Matador','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(326,'Enzosam','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(327,'Erick','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(328,'Fergus','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(329,'Filipe Elviro','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(330,'Francisco','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(331,'Gavin Murray','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(332,'Gonçalo Hipólito','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(333,'Gonçalo Moreira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(334,'Gonçalo Santos','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(335,'Gonçalo Sousa (Cremonezzi)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(336,'Guilherme','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(337,'Gustavo','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(338,'Hélio','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(339,'Hugo Azevedo','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(340,'Hugo Pereira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(341,'Igor','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(342,'Ivan','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(343,'Jacinto Carrilho','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(344,'João Barbosa','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(345,'João Cansado','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(346,'João Rey','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(347,'João Veloso','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(348,'Joel Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(349,'José Lameirinhas','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(350,'José Teles','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(351,'Júlio Serqueira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(352,'Kraken','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(353,'Leandro Mendonça','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(354,'Leonardo Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(355,'Lewis Reid','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(356,'Luciano Florêncio','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(357,'Luyy','ACTIVE',NULL,NULL,'','Men'),(358,'Nate Maddox','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(359,'Manuel Cabages','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(360,'Marco António','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(361,'Marco Cunha','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(362,'Marco Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(363,'Miguel Elviro','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(364,'Miguel Fonseca (Crink3d)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(365,'Miguel Maia','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(366,'Miguel Vicente','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(367,'Neph','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(368,'Nuno Teixeira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(369,'Nuno Vicente (Th3samie)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(370,'Nuno Vieira (V2)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(371,'Orlando','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(372,'Queta','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(373,'Paulo Tavares','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(374,'Pedro Brochado','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(375,'Pedro Maia','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(376,'Pedro Martins','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(377,'Pedro Tribuzi','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(378,'Rahul Saxena','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(379,'Reinventing','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(380,'Rex','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(381,'Ricardo Ermida (Killerrik99)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(382,'Ricardo Silva (Locust)','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(383,'Ricky Barceló','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(384,'Robson','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(385,'Rubby Silva','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(386,'Ruben Carvalho','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(387,'Rui Duarte','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(388,'Rui Gomes','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(389,'Rui Graça','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(390,'Rui Lopes','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(391,'Rui Nunes','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(392,'Shidoki','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(393,'Silveira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(394,'Smiley','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(395,'Suresh','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(396,'Suto','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(397,'Tejan','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(398,'Tiago Ferreira','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(399,'Tiago Leite','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(400,'Tiago Moura','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(401,'Tiago Vieira','ACTIVE','RAW',NULL,'NXT Alumni','Men'),(402,'Tim','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(403,'Vigilante','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(404,'Zenboy','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(405,'Zup','INACTIVE',NULL,NULL,'NXT Alumni','Men'),(406,'Ana Luisa Pinhal','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(407,'Ana Machado','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(408,'Ana Sousa','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(409,'Andreia Coelho','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(410,'Ângela Sofia','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(411,'Bárbara Tinoco','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(412,'Bebiana Cardoso','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(413,'Benny','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(414,'Bessie','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(415,'Carina','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(416,'Carolina Matos','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(417,'Catarina Brito','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(418,'Catarina Dias','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(419,'Cláudia Lopes','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(420,'Daisy','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(421,'Emna Khemira','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(422,'Francisca Cardoso','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(423,'Francisca Falcão','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(424,'Inês Portela','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(425,'Joana','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(426,'Kalisheedra','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(427,'Lena','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(428,'Lucia Guerra','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(429,'Margarida Maia','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(430,'Maria Belo','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(431,'Maria Claro','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(432,'Mariana Conceição','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(433,'Patrícia Ribeiro','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(434,'Patrícia Vieira','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(435,'Pipa Matos','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(436,'Raquel Cardoso','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(437,'Raquel Silva','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(438,'Rita Azevedo','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(439,'Rita Moreira','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(440,'Rita Silva','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(441,'Rita Sofia','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(442,'Salma','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(443,'Sara \"ymna\" R.','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(444,'Sofia Sousa','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(445,'Sónia Ferreira','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(446,'Teresa','INACTIVE',NULL,NULL,'NXT Alumni','Women'),(447,'Daisuke Kanehira','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(448,'Tamura','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(449,'Nick Powers','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(450,'Leon Jackson','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(451,'Cal Silva','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(452,'Mad Dog Maxx','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(453,'Kurt Simmons','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(454,'Val Eden','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(455,'Matt Fox','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(456,'Alex Cuevas','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(457,'Tajiri','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(458,'Mike Bailey','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(459,'Eric Walker','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(460,'Jay Knox','INACTIVE',NULL,NULL,'NXT UK Alumni','Men'),(461,'Cam Wellington','DECEASED',NULL,NULL,'NXT UK Alumni','Men'),(462,'Aleah James','INACTIVE',NULL,NULL,'NXT UK Alumni','Women'),(463,'Anastasia','INACTIVE',NULL,NULL,'NXT UK Alumni','Women'),(464,'Flo Riley','INACTIVE',NULL,NULL,'NXT UK Alumni','Women'),(465,'Killer Kelly','INACTIVE',NULL,NULL,'NXT UK Alumni','Women'),(466,'Armina Lily','INACTIVE',NULL,NULL,'NXT UK Alumni','Women'),(467,'Nelson Pereira','ACTIVE','RAW','WWE World Tag Team Championship','','Men'),(468,'Luis Mestre','ACTIVE','RAW','WWE World Tag Team Championship, Money in the Bank Winner','','Men'),(469,'João Milão','ACTIVE','RAW',NULL,'','Men'),(470,'Ravioli','ACTIVE','RAW',NULL,'','Men'),(471,'Ozzy','ACTIVE','RAW',NULL,'','Men'),(472,'Drothdarr','ACTIVE','RAW',NULL,'','Men'),(473,'Takarin','ACTIVE','RAW',NULL,'','Men'),(474,'Flix','ACTIVE','RAW',NULL,'','Men'),(475,'Leo Rossi','ACTIVE','RAW','WWE World Heavyweight Championship','','Men'),(476,'Sagres','ACTIVE','RAW',NULL,'','Men'),(477,'Daniel Facine','ACTIVE','RAW',NULL,'','Men'),(478,'João Pereira','ACTIVE','RAW','United States Championship','','Men'),(479,'Filipe Henriques','ACTIVE','RAW',NULL,'','Men'),(480,'Alexandre Rodrigues','ACTIVE','RAW',NULL,'','Men'),(481,'Cláudia Bradstone','ACTIVE','RAW','Women\'s World Championship','','Women'),(482,'Jay Pay','ACTIVE','RAW',NULL,'','Women'),(483,'Ivar Nyx','ACTIVE','RAW',NULL,'','Women'),(484,'Jan','ACTIVE','SmackDown',NULL,'','Men'),(485,'Pedro Soares','ACTIVE','SmackDown',NULL,'','Men'),(486,'André Gomes','ACTIVE','SmackDown','WWE Tag Team Championship','','Men'),(487,'Lobo Ibérico','ACTIVE','SmackDown','WWE Tag Team Championship','','Men'),(488,'Zuko','ACTIVE','SmackDown','Intercontinental Championship','','Men'),(489,'Grandorman','ACTIVE','SmackDown',NULL,'','Men'),(490,'Twista','ACTIVE','SmackDown','WWE Championship, Universal Championship','','Men'),(491,'Andy Hendrix','ACTIVE','SmackDown',NULL,'','Men'),(492,'Nuvas','ACTIVE','SmackDown',NULL,'','Men'),(493,'Blitz','ACTIVE','SmackDown',NULL,'','Men'),(494,'Isaac Vitorino','ACTIVE','SmackDown',NULL,'','Men'),(495,'Aurélio','ACTIVE','SmackDown',NULL,'','Men'),(496,'Luis Mira','ACTIVE','SmackDown',NULL,'','Men'),(497,'Drew Minnear','ACTIVE','SmackDown',NULL,'','Men'),(498,'Mike Silva','ACTIVE','SmackDown',NULL,'','Men'),(499,'Damião','ACTIVE','NXT','WWE Speed Championship','','Men'),(500,'\"Goldenboy\" Santos','ACTIVE','NXT','NXT Championship','','Men'),(501,'Rafael Pedras','ACTIVE','NXT',NULL,'','Men'),(502,'Paulo \"Knockout\" Cruz','ACTIVE','NXT',NULL,'','Men'),(503,'Ricky Boy','ACTIVE','NXT',NULL,'','Men'),(504,'Fausto','ACTIVE','NXT','NXT North American Championship','','Men'),(505,'Digos','ACTIVE','NXT',NULL,'','Men'),(506,'Didi','ACTIVE','NXT',NULL,'','Men'),(507,'Pégaso','ACTIVE','NXT',NULL,'','Men'),(508,'Francisco Mata','ACTIVE','NXT',NULL,'','Men'),(509,'Roddy Flow','ACTIVE','NXT',NULL,'','Men'),(510,'Darthus','ACTIVE','NXT',NULL,'','Men'),(511,'Michael Stu','ACTIVE','NXT','NXT Tag Team Championship','','Men'),(512,'Stefan Stu','ACTIVE','NXT','NXT Tag Team Championship','','Men'),(513,'Freeze','ACTIVE','NXT',NULL,'','Men'),(514,'Zadarkus','ACTIVE','NXT',NULL,'','Men'),(515,'Gon Vieira','ACTIVE','NXT',NULL,'','Men'),(516,'José Almeida','ACTIVE','NXT',NULL,'','Men'),(517,'Nuno Ferreira','ACTIVE','NXT',NULL,'','Men'),(518,'Frame','ACTIVE','NXT',NULL,'','Men'),(519,'Chiote','ACTIVE','NXT',NULL,'','Men'),(520,'Sonic','ACTIVE','NXT',NULL,'','Men'),(521,'João Lino','ACTIVE','NXT',NULL,'','Men'),(522,'Fábio Gueifão','ACTIVE','NXT',NULL,'','Men'),(523,'Brave','ACTIVE','NXT',NULL,'','Men'),(524,'Marine Riga','ACTIVE','NXT',NULL,'','Women'),(525,'Carla','ACTIVE','NXT',NULL,'','Women'),(526,'Marie Lumière','ACTIVE','NXT',NULL,'','Women'),(527,'Nena','ACTIVE','NXT',NULL,'','Women'),(528,'Eevoh','INACTIVE',NULL,NULL,'','Men'),(529,'Jéssica Sousa','ACTIVE','SmackDown',NULL,'','Women'),(530,'Lara Alexandra','ACTIVE','SmackDown',NULL,'','Women'),(531,'Tânia','ACTIVE','SmackDown',NULL,'','Women'),(532,'Nês','ACTIVE','NXT','NXT Women\'s Championship','','Women'),(533,'Yuki','ACTIVE','NXT',NULL,'','Men'),(534,'Aqua','ACTIVE','NXT',NULL,'','Men');
/*!40000 ALTER TABLE `superstars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_history`
--

DROP TABLE IF EXISTS `title_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_id` int NOT NULL,
  `champion_id` int NOT NULL,
  `defeated_id` int NOT NULL,
  `match_id` int NOT NULL,
  `reign_duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title_id` (`title_id`),
  KEY `champion_id` (`champion_id`),
  KEY `defeated_id` (`defeated_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `title_history_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_history_ibfk_2` FOREIGN KEY (`champion_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_history_ibfk_3` FOREIGN KEY (`defeated_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_history_ibfk_4` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_history`
--

LOCK TABLES `title_history` WRITE;
/*!40000 ALTER TABLE `title_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `title_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_holders`
--

DROP TABLE IF EXISTS `title_holders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title_holders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_id` int NOT NULL,
  `wrestler_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title_id` (`title_id`),
  KEY `wrestler_id` (`wrestler_id`),
  CONSTRAINT `title_holders_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_holders_ibfk_2` FOREIGN KEY (`wrestler_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_holders`
--

LOCK TABLES `title_holders` WRITE;
/*!40000 ALTER TABLE `title_holders` DISABLE KEYS */;
INSERT INTO `title_holders` VALUES (1,1,496),(2,31,496),(3,36,468),(4,4,478),(5,3,488),(6,5,467),(7,5,468),(8,35,494),(9,35,495),(10,33,482),(11,32,285),(12,34,195),(13,34,290),(14,37,499),(15,17,500),(16,18,511),(17,18,512),(18,19,532),(19,39,503),(20,38,195),(21,40,218),(22,41,483),(23,42,525);
/*!40000 ALTER TABLE `title_holders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand` enum('RAW','SmackDown','NXT','ALL') DEFAULT NULL,
  `current_name` varchar(255) NOT NULL,
  `title_type` enum('Singles','Tag Team') NOT NULL DEFAULT 'Singles',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'WWE Championship','SmackDown','WWE Championship','Singles','wwe_championship_design.png'),(2,'World Heavyweight Championship',NULL,'World Heavyweight Championship','Singles','world_heavyweight_championship_design.png'),(3,'Intercontinental Championship','SmackDown','Intercontinental Championship','Singles','intercontinental_championship_design.png'),(4,'United States Championship','RAW','United States Championship','Singles','united_states_championship_design.png'),(5,'WWE Tag Team Championship','RAW','WWE World Tag Team Championship','Tag Team','wwe_world_tag_team_championship_design.png'),(6,'World Tag Team Championship',NULL,'World Tag Team Championship','Tag Team','world_tag_team_championship_design.png'),(7,'Women\'s Championship',NULL,'Women\'s Championship','Singles','womens_championship_design.png'),(8,'Divas Championship',NULL,'Divas Championship','Singles','divas_championship_design.png'),(9,'Hardcore Championship',NULL,'Hardcore Championship','Singles','hardcore_championship_design.png'),(10,'Cruiserweight Championship',NULL,'Cruiserweight Championship','Singles','cruiserweight_championship_design.png'),(11,'Light Heavyweight Championship',NULL,'Light Heavyweight Championship','Singles','light_heavyweight_championship_design.png'),(12,'ECW Championship',NULL,'ECW Championship','Singles','ecw_championship_design.png'),(13,'ECW Television Championship',NULL,'ECW Television Championship','Singles','ecw_television_championship_design.png'),(14,'ECW World Tag Team Championship',NULL,'ECW World Tag Team Championship','Tag Team','ecw_world_tag_team_championship_design.png'),(15,'Million Dollar Championship',NULL,'Million Dollar Championship','Singles','million_dollar_championship_design.png'),(16,'WCW Championship',NULL,'WCW Championship','Singles','wcw_championship_design.png'),(17,'NXT Championship','NXT','NXT Championship','Singles','nxt_championship_design.png'),(18,'NXT Tag Team Championship','NXT','NXT Tag Team Championship','Tag Team','nxt_tag_team_championship_design.png'),(19,'NXT Women\'s Championship','NXT','NXT Women\'s Championship','Singles','nxt_womens_championship_design.png'),(20,'NXT Cruiserweight Championship',NULL,'NXT Cruiserweight Championship','Singles','nxt_cruiserweight_championship_design.png'),(21,'NXT Women\'s Tag Team Championship',NULL,'NXT Women\'s Tag Team Championship','Tag Team','nxt_womens_tag_team_championship_design.png'),(22,'United Kingdom Championship',NULL,'NXT UK Championship','Singles','nxt_uk_championship_design.png'),(23,'NXT UK Tag Team Championship',NULL,'NXT UK Tag Team Championship','Tag Team','nxt_uk_tag_team_championship_design.png'),(24,'NXT UK Women\'s Championship',NULL,'NXT UK Women\'s Championship','Singles','nxt_uk_womens_championship_design.png'),(25,'24/7 Championship',NULL,'24/7 Championship','Singles','24_7_championship_design.png'),(26,'European Championship',NULL,'European Championship','Singles','european_championship_design.png'),(27,'WWF Championship',NULL,'WWF Championship','Singles','wwf_championship_design.png'),(28,'WWF Intercontinental Championship',NULL,'WWF Intercontinental Championship','Singles','wwf_intercontinental_championship_design.png'),(29,'WWF Tag Team Championship',NULL,'WWF Tag Team Championship','Tag Team','wwf_tag_team_championship_design.png'),(30,'WWF Women\'s Championship',NULL,'WWF Women\'s Championship','Singles','wwf_womens_championship_design.png'),(31,'Universal Championship','SmackDown','Universal Championship','Singles','universal_championship_design.png'),(32,'RAW Women\'s Championship','SmackDown','WWE Women\'s Championship','Singles','wwe_womens_championship_design.png'),(33,'SmackDown Women\'s Championship','RAW','Women\'s World Championship','Singles','womens_world_championship_design.png'),(34,'Women\'s Tag Team Championship','ALL','Women\'s Tag Team Championship','Tag Team','womens_tag_team_championship_design.png'),(35,'SmackDown Tag Team Championship','SmackDown','WWE Tag Team Championship','Tag Team','wwe_tag_team_championship_design.png'),(36,'WWE World Heavyweight Championship','RAW','WWE World Heavyweight Championship','Singles','wwe_world_heavyweight_championship_design.png'),(37,'WWE Speed Championship','ALL','WWE Speed Championship','Singles','wwe_speed_championship_design.png'),(38,'WWE Women\'s Speed Championship','ALL','WWE Women\'s Speed Championship','Singles','wwe_womens_speed_championship_design.png'),(39,'NXT North American Championship','NXT','NXT North American Championship','Singles','nxt_north_american_championship_design.png'),(40,'NXT Women\'s North American Championship','NXT','NXT Women\'s North American Championship','Singles','nxt_womens_north_american_championship_design.png'),(41,'Women\'s United States Championship','RAW','Women\'s United States Championship','Singles','womens_united_states_championship_design.png'),(42,'Women\'s Intercontinental Championship','SmackDown','Women\'s Intercontinental Championship','Singles','womens_intercontinental_championship_design.png');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-28  0:29:38
