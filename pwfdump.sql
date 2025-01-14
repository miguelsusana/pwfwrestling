-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: pwfwrestling
-- ------------------------------------------------------
-- Server version	8.0.37

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
INSERT INTO `events` VALUES (1,'RAW','January',1,1,1),(2,'SmackDown','January',1,1,1),(3,'ECW','January',1,1,1),(4,'Royal Rumble','January',1,1,1),(5,'RAW','February',1,1,1),(6,'SmackDown','February',1,1,1),(7,'Superstars','February',1,1,1),(8,'No Way Out','February',1,1,1),(9,'RAW','March',1,1,1),(10,'SmackDown','March',1,1,1),(11,'Superstars','March',1,1,1),(12,'WrestleMania','March',1,1,1),(13,'RAW','April',1,1,1),(14,'SmackDown','April',1,1,1),(15,'Superstars','April',1,1,1),(16,'Backlash','March',1,1,1),(17,'RAW','May',1,1,1),(18,'SmackDown','May',1,1,1),(19,'Superstars','May',1,1,1),(20,'Extreme Rules','March',1,1,1),(21,'RAW','June',1,1,1),(22,'SmackDown','June',1,1,1),(23,'Superstars','June',1,1,1),(24,'The Bash','June',1,1,1),(25,'RAW','July',1,1,1),(26,'SmackDown','July',1,1,1),(27,'Superstars','July',1,1,1),(28,'Night of Champions','July',1,1,1),(29,'RAW','August',1,1,1),(30,'SmackDown','August',1,1,1),(31,'Superstars','August',1,1,1),(32,'Summerslam','August',1,1,1),(33,'RAW','September',1,1,1),(34,'SmackDown','September',1,1,1),(35,'Superstars','September',1,1,1),(36,'Hell In A Cell','September',1,1,1),(37,'RAW','October',1,1,1),(38,'SmackDown','October',1,1,1),(39,'Superstars','October',1,1,1),(40,'Bragging Rights','October',1,1,1),(41,'RAW','November',1,1,1),(42,'SmackDown','November',1,1,1),(43,'Superstars','November',1,1,1),(44,'Survivor Series','November',1,1,1),(45,'RAW','December',1,1,1),(46,'SmackDown','December',1,1,1),(47,'Superstars','December',1,1,1),(48,'TLC','December',1,1,1),(49,'RAW','January',1,2,1),(50,'SmackDown','January',1,2,1),(51,'ECW','January',1,2,1),(52,'Royal Rumble','January',1,2,1),(53,'RAW','February',1,2,1),(54,'SmackDown','February',1,2,1),(55,'Superstars','February',1,2,1),(56,'No Way Out','February',1,2,1),(57,'RAW','March',1,2,1),(58,'SmackDown','March',1,2,1),(59,'Superstars','March',1,2,1),(60,'WrestleMania','March',1,2,1),(61,'RAW','April',1,2,1),(62,'SmackDown','April',1,2,1),(63,'Superstars','April',1,2,1),(64,'Backlash','April',1,2,1),(65,'RAW','May',1,2,1),(66,'SmackDown','May',1,2,1),(67,'Superstars','May',1,2,1),(68,'Extreme Rules','May',1,2,1),(69,'RAW','June',1,2,1),(70,'SmackDown','June',1,2,1),(71,'Superstars','June',1,2,1),(72,'The Bash','June',1,2,1),(73,'RAW','July',1,2,1),(74,'SmackDown','July',1,2,1),(75,'Superstars','July',1,2,1),(76,'Night of Champions','July',1,2,1),(77,'RAW','August',1,2,1),(78,'SmackDown','August',1,2,1),(79,'Superstars','August',1,2,1),(80,'Summerslam','August',1,2,1),(81,'RAW','September',1,2,1),(82,'SmackDown','September',1,2,1),(83,'Superstars','September',1,2,1),(84,'Hell In A Cell','September',1,2,1),(85,'RAW','October',1,2,1),(86,'SmackDown','October',1,2,1),(87,'Superstars','October',1,2,1),(88,'Bragging Rights','October',1,2,1),(89,'RAW','November',1,2,1),(90,'SmackDown','November',1,2,1),(91,'Superstars','November',1,2,1),(92,'Survivor Series','November',1,2,1),(93,'RAW','December',1,2,1),(94,'SmackDown','December',1,2,1),(95,'Superstars','December',1,2,1),(96,'TLC','December',1,2,1),(97,'NXT','January',3,6,1),(98,'SmackDown','January',3,6,1),(99,'RAW','January',3,6,1),(100,'Royal Rumble','January',3,6,1),(101,'NXT Parque Mayer','January',3,6,1),(102,'RAW','January',3,6,2),(103,'SmackDown','January',3,6,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster`
--

LOCK TABLES `roster` WRITE;
/*!40000 ALTER TABLE `roster` DISABLE KEYS */;
INSERT INTO `roster` VALUES (1,'\"Jokeyboy\" Nelson Andrade','Inactive','Men',NULL,'PWF Alumni'),(2,'ABREU','Inactive','Men',NULL,'PWF Alumni'),(3,'Adam','Inactive','Men',NULL,'PWF Alumni'),(4,'Agostinho','Inactive','Men',NULL,'PWF Alumni'),(5,'Alexandre Coutinho','Inactive','Men',NULL,'PWF Alumni'),(6,'Alfredo','Inactive','Men',NULL,'PWF Alumni'),(7,'André Aleixo','Inactive','Men',NULL,'PWF Alumni'),(8,'André Coutinho','Inactive','Men',NULL,'PWF Alumni'),(9,'André Couto','Inactive','Men',NULL,'PWF Alumni'),(10,'André Gomes (6º)','Inactive','Men',NULL,'PWF Alumni'),(11,'André Pimenta','Inactive','Men',NULL,'PWF Alumni'),(12,'André Prata','Inactive','Men',NULL,'PWF Alumni'),(13,'António Afonso','Inactive','Men',NULL,'PWF Alumni'),(14,'Barbosa','Inactive','Men',NULL,'PWF Alumni'),(15,'Bernardo Carvalho','Inactive','Men',NULL,'PWF Alumni'),(16,'Bernas','Inactive','Men',NULL,'PWF Alumni'),(17,'Bertolucci','Inactive','Men',NULL,'PWF Alumni'),(18,'Bruno Alves','Inactive','Men',NULL,'PWF Alumni'),(19,'Bruno Fátima','Inactive','Men',NULL,'PWF Alumni'),(20,'Bruno Guerreiro','Inactive','Men',NULL,'PWF Alumni'),(21,'Bruno Pedro','Inactive','Men',NULL,'PWF Alumni'),(22,'Bruno Pinho','Inactive','Men',NULL,'PWF Alumni'),(23,'Bryngela','Inactive','Men',NULL,'PWF Alumni'),(24,'Carlos','Inactive','Men',NULL,'PWF Alumni'),(25,'Carlos Miguel','Inactive','Men',NULL,'PWF Alumni'),(27,'César Bourdain','Inactive','Men',NULL,'PWF Alumni'),(28,'Cláudio','Inactive','Men',NULL,'PWF Alumni'),(29,'Comandante','Inactive','Men',NULL,'PWF Alumni'),(30,'Condoriano','Inactive','Men',NULL,'PWF Alumni'),(31,'Coxo','Inactive','Men',NULL,'PWF Alumni'),(32,'Cristiano Martins','Inactive','Men',NULL,'PWF Alumni'),(33,'Dani Lopes','Inactive','Men',NULL,'PWF Alumni'),(34,'Daniel Filipe','Inactive','Men',NULL,'PWF Alumni'),(35,'Daniel Julio','Inactive','Men',NULL,'PWF Alumni'),(36,'Daniel Mota','Inactive','Men',NULL,'PWF Alumni'),(37,'Daniel Oliveira','Inactive','Men',NULL,'PWF Alumni'),(38,'Daniel Pereira','Inactive','Men',NULL,'PWF Alumni'),(39,'Daniel Rodrigues','Inactive','Men',NULL,'PWF Alumni'),(40,'Daniel Tomás','Inactive','Men',NULL,'PWF Alumni'),(41,'Danny Silva','Inactive','Men',NULL,'PWF Alumni'),(42,'Davez','Inactive','Men',NULL,'PWF Alumni'),(43,'David Conde','Inactive','Men',NULL,'PWF Alumni'),(44,'David Moreira','Inactive','Men',NULL,'PWF Alumni'),(45,'David Pinhal','Inactive','Men',NULL,'PWF Alumni'),(46,'Dinarte de Abreu','Inactive','Men',NULL,'PWF Alumni'),(47,'Diogo Barbosa','Inactive','Men',NULL,'PWF Alumni'),(48,'Diogo Machado','Inactive','Men',NULL,'PWF Alumni'),(49,'Diogo Matos','Inactive','Men',NULL,'PWF Alumni'),(50,'Diogo Moreira','Inactive','Men',NULL,'PWF Alumni'),(51,'Diogo Oliveira','Inactive','Men',NULL,'PWF Alumni'),(52,'Diogo Ramos','Inactive','Men',NULL,'PWF Alumni'),(53,'Diogo Silva','Inactive','Men',NULL,'PWF Alumni'),(54,'Diogo Silva (6º)','Inactive','Men',NULL,'PWF Alumni'),(55,'Diogo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(56,'Eduardo','Inactive','Men',NULL,'PWF Alumni'),(57,'Eduardo Sousa','Inactive','Men',NULL,'PWF Alumni'),(58,'Fabiano','Inactive','Men',NULL,'PWF Alumni'),(59,'Fábio Lopes','Inactive','Men',NULL,'PWF Alumni'),(60,'Filipe Nora','Inactive','Men',NULL,'PWF Alumni'),(61,'Filipe Valente','Inactive','Men',NULL,'PWF Alumni'),(62,'Flake','Inactive','Men',NULL,'PWF Alumni'),(63,'Francisco Barral','Inactive','Men',NULL,'PWF Alumni'),(64,'FreeDom','Inactive','Men',NULL,'PWF Alumni'),(65,'Gali','Inactive','Men',NULL,'PWF Alumni'),(66,'Gonçalo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(67,'Henrique Silva','Inactive','Men',NULL,'PWF Alumni'),(68,'Henrique Sousa','Inactive','Men',NULL,'PWF Alumni'),(69,'Hugo Silva','Inactive','Men',NULL,'PWF Alumni'),(70,'Invictus','Inactive','Men',NULL,'PWF Alumni'),(71,'Isaque Rocha','Inactive','Men',NULL,'PWF Alumni'),(72,'James Hamilton','Inactive','Men',NULL,'PWF Alumni'),(73,'João Alberto','Inactive','Men',NULL,'PWF Alumni'),(74,'João Alves','Inactive','Men',NULL,'PWF Alumni'),(75,'João Cunha','Inactive','Men',NULL,'PWF Alumni'),(76,'João Filipe','Inactive','Men',NULL,'PWF Alumni'),(77,'João Gomes','Inactive','Men',NULL,'PWF Alumni'),(78,'João Lopes','Inactive','Men',NULL,'PWF Alumni'),(79,'João Maia','Inactive','Men',NULL,'PWF Alumni'),(80,'João Marques','Inactive','Men',NULL,'PWF Alumni'),(81,'João Paulo','Inactive','Men',NULL,'PWF Alumni'),(82,'João Santos','Inactive','Men',NULL,'PWF Alumni'),(83,'João Santos','Inactive','Men',NULL,'PWF Alumni'),(84,'Joca','Inactive','Men',NULL,'PWF Alumni'),(85,'Jondesu','Inactive','Men',NULL,'PWF Alumni'),(86,'Jorge Vilarinho','Inactive','Men',NULL,'PWF Alumni'),(87,'José Diogo','Inactive','Men',NULL,'PWF Alumni'),(88,'José Ricardo','Inactive','Men',NULL,'PWF Alumni'),(89,'José Xarez','Inactive','Men',NULL,'PWF Alumni'),(90,'Josh Curley','Inactive','Men',NULL,'PWF Alumni'),(91,'Julio Simão','Inactive','Men',NULL,'PWF Alumni'),(92,'Kazh','Inactive','Men',NULL,'PWF Alumni'),(93,'Keyframe','Inactive','Men',NULL,'PWF Alumni'),(94,'Lino','Inactive','Men',NULL,'PWF Alumni'),(95,'Luis Alão','Inactive','Men',NULL,'PWF Alumni'),(96,'Luis Magina','Inactive','Men',NULL,'PWF Alumni'),(97,'Luis Manuel','Inactive','Men',NULL,'PWF Alumni'),(98,'Luis Miguel','Inactive','Men',NULL,'PWF Alumni'),(99,'Manuel','Inactive','Men',NULL,'PWF Alumni'),(100,'Marco Couto','Inactive','Men',NULL,'PWF Alumni'),(101,'Marco Ribeiro','Inactive','Men',NULL,'PWF Alumni'),(102,'Mário','Inactive','Men',NULL,'PWF Alumni'),(103,'Mário Rui','Inactive','Men',NULL,'PWF Alumni'),(104,'Martim Bento','Inactive','Men',NULL,'PWF Alumni'),(105,'Matador','Inactive','Men',NULL,'PWF Alumni'),(106,'Micha','Inactive','Men',NULL,'PWF Alumni'),(107,'Miguel Carvalho','Inactive','Men',NULL,'PWF Alumni'),(108,'Miguel Chaves','Inactive','Men',NULL,'PWF Alumni'),(109,'Miguel Monteiro','Inactive','Men',NULL,'PWF Alumni'),(110,'Miguel Neto','Inactive','Men',NULL,'PWF Alumni'),(111,'Miguel Oliveira','Inactive','Men',NULL,'PWF Alumni'),(112,'Miguel Soro','Inactive','Men',NULL,'PWF Alumni'),(113,'Nuno Cardoso (Vitag)','Inactive','Men',NULL,'PWF Alumni'),(114,'Nuno Marinho','Inactive','Men',NULL,'PWF Alumni'),(115,'Nuno Philipp','Inactive','Men',NULL,'PWF Alumni'),(116,'Nuno Pinto','Inactive','Men',NULL,'PWF Alumni'),(117,'Nuno Shinigami','Inactive','Men',NULL,'PWF Alumni'),(118,'Oliver','Inactive','Men',NULL,'PWF Alumni'),(119,'Pacheco','Inactive','Men',NULL,'PWF Alumni'),(120,'Paulo Andrade','Inactive','Men',NULL,'PWF Alumni'),(121,'Paulo Naressi','Inactive','Men',NULL,'PWF Alumni'),(122,'Pedro Alves','Inactive','Men',NULL,'PWF Alumni'),(123,'Pedro Fonseca','Inactive','Men',NULL,'PWF Alumni'),(124,'Pedro Marques','Inactive','Men',NULL,'PWF Alumni'),(125,'Queldreya','Inactive','Men',NULL,'PWF Alumni'),(126,'Rafael Castro','Inactive','Men',NULL,'PWF Alumni'),(127,'Rafael Ferreira','Inactive','Men',NULL,'PWF Alumni'),(128,'Ravage','Inactive','Men',NULL,'PWF Alumni'),(129,'Red Eagle','Inactive','Men',NULL,'PWF Alumni'),(130,'Ricardo Cardoso','Inactive','Men',NULL,'PWF Alumni'),(131,'Ricardo Nunes','Inactive','Men',NULL,'PWF Alumni'),(132,'Ricardo Teixeira','Inactive','Men',NULL,'PWF Alumni'),(133,'Rodrigo','Inactive','Men',NULL,'PWF Alumni'),(134,'Rodrigo Santos','Inactive','Men',NULL,'PWF Alumni'),(135,'Rúben Pinheiro','Inactive','Men',NULL,'PWF Alumni'),(136,'Rui Almeida','Inactive','Men',NULL,'PWF Alumni'),(137,'Rui Horta','Inactive','Men',NULL,'PWF Alumni'),(138,'Rui Murteira','Inactive','Men',NULL,'PWF Alumni'),(139,'Samuel Vicente','Inactive','Men',NULL,'PWF Alumni'),(140,'Sérgio Ferreira','Inactive','Men',NULL,'PWF Alumni'),(141,'Sérgio Oliveira','Inactive','Men',NULL,'PWF Alumni'),(142,'Sérgio Sousa','Inactive','Men',NULL,'PWF Alumni'),(143,'Simão','Inactive','Men',NULL,'PWF Alumni'),(144,'Tiago Costa','Inactive','Men',NULL,'PWF Alumni'),(145,'Tiago Martins','Inactive','Men',NULL,'PWF Alumni'),(146,'Toga','Inactive','Men',NULL,'PWF Alumni'),(147,'Tulio Sales','Inactive','Men',NULL,'PWF Alumni'),(148,'Valkirius','Inactive','Men',NULL,'PWF Alumni'),(149,'Ventura','Inactive','Men',NULL,'PWF Alumni'),(150,'Vitor Pascoal','Inactive','Men',NULL,'PWF Alumni'),(151,'Vitor Pinto','Inactive','Men',NULL,'PWF Alumni'),(152,'Wolf','Inactive','Men',NULL,'PWF Alumni'),(153,'Zé Pedro','Inactive','Men',NULL,'PWF Alumni'),(154,'Zekita','Inactive','Men',NULL,'PWF Alumni'),(155,'Amaral','Inactive','Women',NULL,'PWF Alumni'),(156,'Ana Costa','Inactive','Women',NULL,'PWF Alumni'),(157,'Ana Silva','Inactive','Women',NULL,'PWF Alumni'),(158,'Andreia','Inactive','Women',NULL,'PWF Alumni'),(159,'Bárbara','Inactive','Women',NULL,'PWF Alumni'),(160,'Beatriz','Inactive','Women',NULL,'PWF Alumni'),(161,'Bia Russo','Inactive','Women',NULL,'PWF Alumni'),(162,'Bitta','Active','Women','RAW','PWF Alumni'),(163,'Camila','Inactive','Women',NULL,'PWF Alumni'),(164,'Carlota','Inactive','Women',NULL,'PWF Alumni'),(165,'Catarina Ferraz','Inactive','Women',NULL,'PWF Alumni'),(166,'Catarina Flores','Inactive','Women',NULL,'PWF Alumni'),(167,'Catarina Rainho','Inactive','Women',NULL,'PWF Alumni'),(168,'Claudia','Inactive','Women',NULL,'PWF Alumni'),(169,'Cláudia Pascoal','Inactive','Women',NULL,'PWF Alumni'),(170,'Cristiana Queiróz','Inactive','Women',NULL,'PWF Alumni'),(171,'Daniela','Active','Women','SmackDown',NULL),(172,'Diana Neto','Inactive','Women',NULL,'PWF Alumni'),(173,'Eliana','Inactive','Women',NULL,'PWF Alumni'),(174,'Filipa Barros','Inactive','Women',NULL,'PWF Alumni'),(175,'Flávia','Inactive','Women',NULL,'PWF Alumni'),(176,'Herzeleid','Inactive','Women',NULL,'PWF Alumni'),(177,'Inês Leal','Inactive','Women',NULL,'PWF Alumni'),(178,'Isabel','Active','Women','SmackDown','PWF Alumni'),(179,'Jéssica Fontes','Inactive','Women',NULL,'PWF Alumni'),(180,'Jéssica Rodrigues','Inactive','Women',NULL,'PWF Alumni'),(181,'Joana Brandão','Inactive','Women',NULL,'PWF Alumni'),(182,'Joana Hamrol','Inactive','Women',NULL,'PWF Alumni'),(183,'Joana Oliveira','Inactive','Women',NULL,'PWF Alumni'),(184,'Joana Vieira','Inactive','Women',NULL,'PWF Alumni'),(185,'Juliana Gonçalves','Inactive','Women',NULL,'PWF Alumni'),(186,'Leonor','Inactive','Women',NULL,'PWF Alumni'),(187,'Lina','Inactive','Women',NULL,'PWF Alumni'),(188,'Luma','Inactive','Women',NULL,'PWF Alumni'),(189,'Mafalda','Inactive','Women',NULL,'PWF Alumni'),(190,'Maria Iglésias','Inactive','Women',NULL,'PWF Alumni'),(191,'Maria Macedo','Inactive','Women',NULL,'PWF Alumni'),(192,'Mariana','Inactive','Women',NULL,'PWF Alumni'),(193,'Mariana Ramos','Inactive','Women',NULL,'PWF Alumni'),(194,'Marlene Veiga','Inactive','Women',NULL,'PWF Alumni'),(195,'Marta','Active','Women','RAW',NULL),(196,'Marta Carvalho','Inactive','Women',NULL,'PWF Alumni'),(197,'Nádia Oliveira','Inactive','Women',NULL,'PWF Alumni'),(198,'Nair','Inactive','Women',NULL,'PWF Alumni'),(199,'Nyuu','Inactive','Women',NULL,'PWF Alumni'),(200,'Patrícia','Inactive','Women',NULL,'PWF Alumni'),(201,'Patrícia Sendas','Inactive','Women',NULL,'PWF Alumni'),(202,'Paula Castro','Inactive','Women',NULL,'PWF Alumni'),(203,'Peralta','Inactive','Women',NULL,'PWF Alumni'),(204,'Raquel Sá Carneiro','Inactive','Women',NULL,'PWF Alumni'),(205,'Rebeca Facine','Active','Women','RAW',NULL),(206,'Rita','Inactive','Women',NULL,'PWF Alumni'),(207,'Rita Soares','Inactive','Women',NULL,'PWF Alumni'),(208,'Sandy Afonso','Inactive','Women',NULL,'PWF Alumni'),(209,'Silvana','Inactive','Women',NULL,'PWF Alumni'),(210,'Silvana Branco','Active','Women','SmackDown',NULL),(211,'Sky','Inactive','Women',NULL,'PWF Alumni'),(212,'Sofia','Inactive','Women',NULL,'PWF Alumni'),(213,'Sofia Cunha','Inactive','Women',NULL,'PWF Alumni'),(214,'Sophie','Active','Women','SmackDown','PWF Alumni'),(215,'Soraia Filipa','Inactive','Women',NULL,'PWF Alumni'),(216,'Soraia Patrícia','Inactive','Women',NULL,'PWF Alumni'),(217,'Tânia','Inactive','Women',NULL,'PWF Alumni'),(218,'Tixa','Inactive','Women',NULL,'PWF Alumni'),(219,'Vanessa','Active','Women','RAW','PWF Alumni'),(220,'Verinha','Inactive','Women',NULL,'PWF Alumni'),(221,'Alex','Inactive','Men',NULL,'PWF Hall of Fame'),(222,'Alexandre','Inactive','Men',NULL,'PWF Hall of Fame'),(223,'André','Inactive','Men',NULL,'PWF Hall of Fame'),(224,'António','Inactive','Men',NULL,'PWF Hall of Fame'),(225,'Bernardo','Inactive','Men',NULL,'PWF Hall of Fame'),(226,'Bruno','Inactive','Men',NULL,'PWF Hall of Fame'),(227,'Carlos Santos','Active','Men','SmackDown','PWF Hall of Fame'),(228,'César','Inactive','Men',NULL,'PWF Hall of Fame'),(229,'David','Inactive','Men',NULL,'PWF Hall of Fame'),(230,'Diogo','Inactive','Men',NULL,'PWF Hall of Fame'),(231,'Duarte','Inactive','Men',NULL,'PWF Hall of Fame'),(232,'Emanuel','Inactive','Men',NULL,'PWF Hall of Fame'),(233,'Fábio','Inactive','Men',NULL,'PWF Hall of Fame'),(234,'Fábio Arantes','Inactive','Men',NULL,'PWF Hall of Fame'),(235,'Fernando Rafael','Inactive','Men',NULL,'PWF Hall of Fame'),(236,'Filipe Leesee','Inactive','Men',NULL,'PWF Hall of Fame'),(237,'Gonçalo','Inactive','Men',NULL,'PWF Hall of Fame'),(238,'Hugo','Inactive','Men',NULL,'PWF Hall of Fame'),(239,'Hugo Rodrigues','Inactive','Men',NULL,'PWF Hall of Fame'),(240,'Ivani Ca','Inactive','Men',NULL,'PWF Hall of Fame'),(241,'João Carlos','Inactive','Men',NULL,'PWF Hall of Fame'),(242,'João Dias','Inactive','Men',NULL,'PWF Hall of Fame'),(243,'João Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(244,'Joel','Inactive','Men',NULL,'PWF Hall of Fame'),(245,'Jorge Soares','Deceased','Men',NULL,'PWF Hall of Fame'),(246,'José Bernardo','Inactive','Men',NULL,'PWF Hall of Fame'),(247,'José João','Inactive','Men',NULL,'PWF Hall of Fame'),(248,'Kevin','Inactive','Men',NULL,'PWF Hall of Fame'),(249,'Luis Lowden','Inactive','Men',NULL,'PWF Hall of Fame'),(250,'Luis Silva','Inactive','Men',NULL,'PWF Hall of Fame'),(251,'Manuel Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(252,'Marcelo','Inactive','Men',NULL,'PWF Hall of Fame'),(253,'Mário Nunes','Inactive','Men',NULL,'PWF Hall of Fame'),(254,'Paulo Durbeck','Inactive','Men',NULL,'PWF Hall of Fame'),(255,'Pedro','Inactive','Men',NULL,'PWF Hall of Fame'),(256,'Pedro Cunha','Inactive','Men',NULL,'PWF Hall of Fame'),(257,'Pedro Miguel','Inactive','Men',NULL,'PWF Hall of Fame'),(258,'Pedro Reis','Inactive','Men',NULL,'PWF Hall of Fame'),(259,'Pedro Teixeira','Inactive','Men',NULL,'PWF Hall of Fame'),(260,'Rafael','Inactive','Men',NULL,'PWF Hall of Fame'),(261,'Reinaldo','Inactive','Men',NULL,'PWF Hall of Fame'),(262,'Ricardo Melo','Inactive','Men',NULL,'PWF Hall of Fame'),(263,'Ricardo Soares','Inactive','Men',NULL,'PWF Hall of Fame'),(264,'Rui Daniel','Deceased','Men',NULL,'PWF Hall of Fame'),(265,'Rui Leal','Inactive','Men',NULL,'PWF Hall of Fame'),(266,'Rui Peixoto','Inactive','Men',NULL,'PWF Hall of Fame'),(267,'Sérgio Pires','Inactive','Men',NULL,'PWF Hall of Fame'),(268,'Tiago Jesus','Deceased','Men',NULL,'PWF Hall of Fame'),(269,'Tiago Rodrigues','Active','Men','SmackDown','PWF Hall of Fame'),(270,'Vitor','Inactive','Men',NULL,'PWF Hall of Fame'),(271,'Xavier','Inactive','Men',NULL,'PWF Hall of Fame'),(272,'Alexandra Correia','Inactive','Women',NULL,'PWF Hall of Fame'),(273,'Ana Catarina','Inactive','Women',NULL,'PWF Hall of Fame'),(274,'Ana Rita','Inactive','Women',NULL,'PWF Hall of Fame'),(275,'Angi Silva','Active','Women','SmackDown','PWF Hall of Fame'),(276,'Bianca','Inactive','Women',NULL,'PWF Hall of Fame'),(277,'Carolina Andrade','Inactive','Women',NULL,'PWF Hall of Fame'),(278,'Catarina Alexandra','Inactive','Women',NULL,'PWF Hall of Fame'),(279,'Catarina Oliveira','Inactive','Women',NULL,'PWF Hall of Fame'),(280,'Catarina Silva','Inactive','Women',NULL,'PWF Hall of Fame'),(281,'Daniela Lopes','Inactive','Women',NULL,'PWF Hall of Fame'),(282,'Guida','Inactive','Women',NULL,'PWF Hall of Fame'),(283,'Inês Gonçalves','Inactive','Women',NULL,'PWF Hall of Fame'),(284,'Inês Lima','Inactive','Women',NULL,'PWF Hall of Fame'),(285,'Julia','Active','Women','SmackDown','PWF Hall of Fame'),(286,'Liliana','Inactive','Women',NULL,'PWF Hall of Fame'),(287,'Lucia','Inactive','Women',NULL,'PWF Hall of Fame'),(288,'Maria','Active','Women','RAW','PWF Hall of Fame'),(289,'Mónica Ferreira','Inactive','Women',NULL,'PWF Hall of Fame'),(290,'Raquel','Active','Women','RAW','PWF Hall of Fame'),(291,'Sara Gonçalves','Inactive','Women',NULL,'PWF Hall of Fame'),(292,'Sara Vedor','Active','Women','SmackDown','PWF Hall of Fame'),(293,'Vera','Active','Women','RAW','PWF Hall of Fame'),(294,'Adir Amiel','Inactive','Men',NULL,'NXT Alumni'),(295,'Álvaro Magalhães','Inactive','Men',NULL,'NXT Alumni'),(296,'Alex Ace','Inactive','Men',NULL,'NXT Alumni'),(297,'Alvin','Inactive','Men',NULL,'NXT Alumni'),(298,'Amauri','Inactive','Men',NULL,'NXT Alumni'),(299,'André Jesus (AndreNero4)','Inactive','Men',NULL,'NXT Alumni'),(300,'André Nascimento (uizard)','Inactive','Men',NULL,'NXT Alumni'),(301,'André Nunes (Maxnunes)','Inactive','Men',NULL,'NXT Alumni'),(302,'André Soares','Inactive','Men',NULL,'NXT Alumni'),(303,'Azorea','Inactive','Men',NULL,'NXT Alumni'),(304,'Brendo Costa','Inactive','Men',NULL,'NXT Alumni'),(305,'Brendo Silva','Inactive','Men',NULL,'NXT Alumni'),(306,'Bruno Borges','Inactive','Men',NULL,'NXT Alumni'),(307,'Bruno Duarte','Inactive','Men',NULL,'NXT Alumni'),(308,'Bruno Malheiro','Inactive','Men',NULL,'NXT Alumni'),(309,'Carlos Figueira','Inactive','Men',NULL,'NXT Alumni'),(310,'Carlos Francisco','Inactive','Men',NULL,'NXT Alumni'),(311,'Carlos Gonçalves','Inactive','Men',NULL,'NXT Alumni'),(312,'Carlos Medeiros','Active','Men','SmackDown',NULL),(313,'Carlos Pereira','Inactive','Men',NULL,'NXT Alumni'),(314,'Carlos Sylvester','Inactive','Men',NULL,'NXT Alumni'),(315,'Cláudio Lopes','Inactive','Men',NULL,'NXT Alumni'),(316,'Daniel Serrado (Patanás)','Inactive','Men',NULL,'NXT Alumni'),(317,'David Moscoso','Inactive','Men',NULL,'NXT Alumni'),(318,'Diego Silva','Inactive','Men',NULL,'NXT Alumni'),(319,'Diogo Araújo','Inactive','Men',NULL,'NXT Alumni'),(320,'Diogo Guerreiro','Inactive','Men',NULL,'NXT Alumni'),(321,'Diogo Martins','Inactive','Men',NULL,'NXT Alumni'),(322,'Diogo Moreira (TNDR)','Inactive','Men',NULL,'NXT Alumni'),(323,'Diogo Rodrigues','Inactive','Men',NULL,'NXT Alumni'),(324,'Duff','Inactive','Men',NULL,'NXT Alumni'),(325,'El Matador','Inactive','Men',NULL,'NXT Alumni'),(326,'Enzosam','Inactive','Men',NULL,'NXT Alumni'),(327,'Erick','Inactive','Men',NULL,'NXT Alumni'),(328,'Fergus','Inactive','Men',NULL,'NXT Alumni'),(329,'Filipe Elviro','Inactive','Men',NULL,'NXT Alumni'),(330,'Francisco','Inactive','Men',NULL,'NXT Alumni'),(331,'Gavin Murray','Inactive','Men',NULL,'NXT Alumni'),(332,'Gonçalo Hipólito','Inactive','Men',NULL,'NXT Alumni'),(333,'Gonçalo Moreira','Inactive','Men',NULL,'NXT Alumni'),(334,'Gonçalo Santos','Inactive','Men',NULL,'NXT Alumni'),(335,'Gonçalo Sousa (Cremonezzi)','Inactive','Men',NULL,'NXT Alumni'),(336,'Guilherme','Inactive','Men',NULL,'NXT Alumni'),(337,'Gustavo','Inactive','Men',NULL,'NXT Alumni'),(338,'Hélio','Inactive','Men',NULL,'NXT Alumni'),(339,'Hugo Azevedo','Inactive','Men',NULL,'NXT Alumni'),(340,'Hugo Pereira','Inactive','Men',NULL,'NXT Alumni'),(341,'Igor','Inactive','Men',NULL,'NXT Alumni'),(342,'Ivan','Inactive','Men',NULL,'NXT Alumni'),(343,'Jacinto Carrilho','Inactive','Men',NULL,'NXT Alumni'),(344,'João Barbosa','Inactive','Men',NULL,'NXT Alumni'),(345,'João Cansado','Inactive','Men',NULL,'NXT Alumni'),(346,'João Rey','Inactive','Men',NULL,'NXT Alumni'),(347,'João Veloso','Inactive','Men',NULL,'NXT Alumni'),(348,'Joel Silva','Inactive','Men',NULL,'NXT Alumni'),(349,'José Lameirinhas','Inactive','Men',NULL,'NXT Alumni'),(350,'José Teles','Inactive','Men',NULL,'NXT Alumni'),(351,'Júlio Serqueira','Inactive','Men',NULL,'NXT Alumni'),(352,'Kraken','Inactive','Men',NULL,'NXT Alumni'),(353,'Leandro Mendonça','Inactive','Men',NULL,'NXT Alumni'),(354,'Leonardo Silva','Inactive','Men',NULL,'NXT Alumni'),(355,'Lewis Reid','Inactive','Men',NULL,'NXT Alumni'),(356,'Luciano Florêncio','Inactive','Men',NULL,'NXT Alumni'),(357,'Luyy','Active','Men',NULL,NULL),(358,'Nate Maddox','Inactive','Men',NULL,'NXT Alumni'),(359,'Manuel Cabages','Inactive','Men',NULL,'NXT Alumni'),(360,'Marco António','Inactive','Men',NULL,'NXT Alumni'),(361,'Marco Cunha','Inactive','Men',NULL,'NXT Alumni'),(362,'Marco Silva','Inactive','Men',NULL,'NXT Alumni'),(363,'Miguel Elviro','Inactive','Men',NULL,'NXT Alumni'),(364,'Miguel Fonseca (Crink3d)','Inactive','Men',NULL,'NXT Alumni'),(365,'Miguel Maia','Inactive','Men',NULL,'NXT Alumni'),(366,'Miguel Vicente','Inactive','Men',NULL,'NXT Alumni'),(367,'Neph','Inactive','Men',NULL,'NXT Alumni'),(368,'Nuno Teixeira','Inactive','Men',NULL,'NXT Alumni'),(369,'Nuno Vicente (Th3samie)','Inactive','Men',NULL,'NXT Alumni'),(370,'Nuno Vieira (V2)','Inactive','Men',NULL,'NXT Alumni'),(371,'Orlando','Inactive','Men',NULL,'NXT Alumni'),(372,'Queta','Inactive','Men',NULL,'NXT Alumni'),(373,'Paulo Tavares','Inactive','Men',NULL,'NXT Alumni'),(374,'Pedro Brochado','Inactive','Men',NULL,'NXT Alumni'),(375,'Pedro Maia','Inactive','Men',NULL,'NXT Alumni'),(376,'Pedro Martins','Inactive','Men',NULL,'NXT Alumni'),(377,'Pedro Tribuzi','Inactive','Men',NULL,'NXT Alumni'),(378,'Rahul Saxena','Inactive','Men',NULL,'NXT Alumni'),(379,'Reinventing','Inactive','Men',NULL,'NXT Alumni'),(380,'Rex','Inactive','Men',NULL,'NXT Alumni'),(381,'Ricardo Ermida (Killerrik99)','Inactive','Men',NULL,'NXT Alumni'),(382,'Ricardo Silva (Locust)','Inactive','Men',NULL,'NXT Alumni'),(383,'Ricky Barceló','Inactive','Men',NULL,'NXT Alumni'),(384,'Robson','Inactive','Men',NULL,'NXT Alumni'),(385,'Rubby Silva','Inactive','Men',NULL,'NXT Alumni'),(386,'Ruben Carvalho','Inactive','Men',NULL,'NXT Alumni'),(387,'Rui Duarte','Inactive','Men',NULL,'NXT Alumni'),(388,'Rui Gomes','Inactive','Men',NULL,'NXT Alumni'),(389,'Rui Graça','Inactive','Men',NULL,'NXT Alumni'),(390,'Rui Lopes','Inactive','Men',NULL,'NXT Alumni'),(391,'Rui Nunes','Inactive','Men',NULL,'NXT Alumni'),(392,'Shidoki','Inactive','Men',NULL,'NXT Alumni'),(393,'Silveira','Inactive','Men',NULL,'NXT Alumni'),(394,'Smiley','Inactive','Men',NULL,'NXT Alumni'),(395,'Suresh','Inactive','Men',NULL,'NXT Alumni'),(396,'Suto','Inactive','Men',NULL,'NXT Alumni'),(397,'Tejan','Inactive','Men',NULL,'NXT Alumni'),(398,'Tiago Ferreira','Inactive','Men',NULL,'NXT Alumni'),(399,'Tiago Leite','Inactive','Men',NULL,'NXT Alumni'),(400,'Tiago Moura','Inactive','Men',NULL,'NXT Alumni'),(401,'Tiago Vieira','Active','Men','RAW','NXT Alumni'),(402,'Tim','Inactive','Men',NULL,'NXT Alumni'),(403,'Vigilante','Inactive','Men',NULL,'NXT Alumni'),(404,'Zenboy','Inactive','Men',NULL,'NXT Alumni'),(405,'Zup','Inactive','Men',NULL,'NXT Alumni'),(406,'Ana Luisa Pinhal','Inactive','Women',NULL,'NXT Alumni'),(407,'Ana Machado','Inactive','Women',NULL,'NXT Alumni'),(408,'Ana Sousa','Inactive','Women',NULL,'NXT Alumni'),(409,'Andreia Coelho','Inactive','Women',NULL,'NXT Alumni'),(410,'Ângela Sofia','Inactive','Women',NULL,'NXT Alumni'),(411,'Bárbara Tinoco','Inactive','Women',NULL,'NXT Alumni'),(412,'Bebiana Cardoso','Inactive','Women',NULL,'NXT Alumni'),(413,'Benny','Inactive','Women',NULL,'NXT Alumni'),(414,'Bessie','Inactive','Women',NULL,'NXT Alumni'),(415,'Carina','Inactive','Women',NULL,'NXT Alumni'),(416,'Carolina Matos','Inactive','Women',NULL,'NXT Alumni'),(417,'Catarina Brito','Inactive','Women',NULL,'NXT Alumni'),(418,'Catarina Dias','Inactive','Women',NULL,'NXT Alumni'),(419,'Cláudia Lopes','Inactive','Women',NULL,'NXT Alumni'),(420,'Daisy','Inactive','Women',NULL,'NXT Alumni'),(421,'Emna Khemira','Inactive','Women',NULL,'NXT Alumni'),(422,'Francisca Cardoso','Inactive','Women',NULL,'NXT Alumni'),(423,'Francisca Falcão','Inactive','Women',NULL,'NXT Alumni'),(424,'Inês Portela','Inactive','Women',NULL,'NXT Alumni'),(425,'Joana','Inactive','Women',NULL,'NXT Alumni'),(426,'Kalisheedra','Inactive','Women',NULL,'NXT Alumni'),(427,'Lena','Inactive','Women',NULL,'NXT Alumni'),(428,'Lucia Guerra','Inactive','Women',NULL,'NXT Alumni'),(429,'Margarida Maia','Inactive','Women',NULL,'NXT Alumni'),(430,'Maria Belo','Inactive','Women',NULL,'NXT Alumni'),(431,'Maria Claro','Inactive','Women',NULL,'NXT Alumni'),(432,'Mariana Conceição','Inactive','Women',NULL,'NXT Alumni'),(433,'Patrícia Ribeiro','Inactive','Women',NULL,'NXT Alumni'),(434,'Patrícia Vieira','Inactive','Women',NULL,'NXT Alumni'),(435,'Pipa Matos','Inactive','Women',NULL,'NXT Alumni'),(436,'Raquel Cardoso','Inactive','Women',NULL,'NXT Alumni'),(437,'Raquel Silva','Inactive','Women',NULL,'NXT Alumni'),(438,'Rita Azevedo','Inactive','Women',NULL,'NXT Alumni'),(439,'Rita Moreira','Inactive','Women',NULL,'NXT Alumni'),(440,'Rita Silva','Inactive','Women',NULL,'NXT Alumni'),(441,'Rita Sofia','Inactive','Women',NULL,'NXT Alumni'),(442,'Salma','Inactive','Women',NULL,'NXT Alumni'),(443,'Sara \"ymna\" R.','Inactive','Women',NULL,'NXT Alumni'),(444,'Sofia Sousa','Inactive','Women',NULL,'NXT Alumni'),(445,'Sónia Ferreira','Inactive','Women',NULL,'NXT Alumni'),(446,'Teresa','Inactive','Women',NULL,'NXT Alumni'),(447,'Daisuke Kanehira','Inactive','Men',NULL,'NXT UK Alumni'),(448,'Tamura','Inactive','Men',NULL,'NXT UK Alumni'),(449,'Nick Powers','Inactive','Men',NULL,'NXT UK Alumni'),(450,'Leon Jackson','Inactive','Men',NULL,'NXT UK Alumni'),(451,'Cal Silva','Inactive','Men',NULL,'NXT UK Alumni'),(452,'Mad Dog Maxx','Inactive','Men',NULL,'NXT UK Alumni'),(453,'Kurt Simmons','Inactive','Men',NULL,'NXT UK Alumni'),(454,'Val Eden','Inactive','Men',NULL,'NXT UK Alumni'),(455,'Matt Fox','Inactive','Men',NULL,'NXT UK Alumni'),(456,'Alex Cuevas','Inactive','Men',NULL,'NXT UK Alumni'),(457,'Tajiri','Inactive','Men',NULL,'NXT UK Alumni'),(458,'Mike Bailey','Inactive','Men',NULL,'NXT UK Alumni'),(459,'Eric Walker','Inactive','Men',NULL,'NXT UK Alumni'),(460,'Jay Knox','Inactive','Men',NULL,'NXT UK Alumni'),(461,'Cam Wellington','Deceased','Men',NULL,'NXT UK Alumni'),(462,'Aleah James','Inactive','Women',NULL,'NXT UK Alumni'),(463,'Anastasia','Inactive','Women',NULL,'NXT UK Alumni'),(464,'Flo Riley','Inactive','Women',NULL,'NXT UK Alumni'),(465,'Killer Kelly','Inactive','Women',NULL,'NXT UK Alumni'),(466,'Armina Lily','Inactive','Women',NULL,'NXT UK Alumni'),(467,'Nelson Pereira','Active','Men','RAW',NULL),(468,'Luis Mestre','Active','Men','RAW',NULL),(469,'João Milão','Active','Men','RAW',NULL),(470,'Ravioli','Active','Men','RAW',NULL),(471,'Ozzy','Active','Men','RAW',NULL),(472,'Drothdarr','Active','Men','RAW',NULL),(473,'Takarin','Active','Men','RAW',NULL),(474,'Flix','Active','Men','RAW',NULL),(475,'Leo Rossi','Active','Men','RAW',NULL),(476,'Sagres','Active','Men','RAW',NULL),(477,'Daniel Facine','Active','Men','RAW',NULL),(478,'João Pereira','Active','Men','RAW',NULL),(479,'Filipe Henriques','Active','Men','RAW',NULL),(480,'Alexandre Rodrigues','Active','Men','RAW',NULL),(481,'Cláudia Bradstone','Active','Women','RAW',NULL),(482,'Jay Pay','Active','Women','RAW',NULL),(483,'Ivar Nyx','Active','Women','RAW',NULL),(484,'Jan','Active','Men','SmackDown',NULL),(485,'Pedro Soares','Active','Men','SmackDown',NULL),(486,'André Gomes','Active','Men','SmackDown',NULL),(487,'Lobo Ibérico','Active','Men','SmackDown',NULL),(488,'Zuko','Active','Men','SmackDown',NULL),(489,'Grandorman','Active','Men','SmackDown',NULL),(490,'Twista','Active','Men','SmackDown',NULL),(491,'Andy Hendrix','Active','Men','SmackDown',NULL),(492,'Nuvas','Active','Men','SmackDown',NULL),(493,'Blitz','Active','Men','SmackDown',NULL),(494,'Isaac Vitorino','Active','Men','SmackDown',NULL),(495,'Aurélio','Active','Men','SmackDown',NULL),(496,'Luis Mira','Active','Men','SmackDown',NULL),(497,'Drew Minnear','Active','Men','SmackDown',NULL),(498,'Mike Silva','Active','Men','SmackDown',NULL),(499,'Damião','Active','Men','NXT',NULL),(500,'\"Goldenboy\" Santos','Active','Men','NXT',NULL),(501,'Rafael Pedras','Active','Men','SmackDown',NULL),(502,'Paulo \"Knockout\" Cruz','Active','Men','RAW',NULL),(503,'Ricky Boy','Active','Men','NXT',NULL),(504,'Fausto','Active','Men','SmackDown',NULL),(505,'Digos','Active','Men','NXT',NULL),(506,'Didi','Active','Men','NXT',NULL),(507,'Pégaso','Active','Men','NXT',NULL),(508,'Francisco Mata','Active','Men','NXT',NULL),(509,'Roddy Flow','Active','Men','NXT',NULL),(510,'Darthus','Active','Men','NXT',NULL),(511,'Michael Stu','Active','Men','NXT',NULL),(512,'Stefan Stu','Active','Men','NXT',NULL),(513,'Freeze','Inactive','Men',NULL,NULL),(514,'Zadarkus','Inactive','Men',NULL,'NXT Alumni'),(515,'Gon Vieira','Active','Men','NXT',NULL),(516,'José Almeida','Active','Men','NXT',NULL),(517,'Nuno Ferreira','Active','Men','RAW',NULL),(518,'Frame','Active','Men','NXT',NULL),(519,'Chiote','Active','Men','NXT',NULL),(520,'Sonic','Inactive','Men',NULL,'NXT Alumni'),(521,'João Lino','Inactive','Men',NULL,'NXT Alumni'),(522,'Fábio Gueifão','Inactive','Men',NULL,'NXT Alumni'),(523,'Brave','Active','Men','NXT',NULL),(524,'Marine Riga','Active','Women','RAW',NULL),(525,'Carla','Active','Women','SmackDown',NULL),(526,'Marie Lumière','Active','Women','NXT',NULL),(527,'Nena','Active','Women','NXT',NULL),(528,'Eevoh','Inactive','Men',NULL,NULL),(529,'Jéssica Sousa','Active','Women','SmackDown',NULL),(530,'Lara Alexandra','Active','Women','SmackDown',NULL),(531,'Tânia','Active','Women','SmackDown',NULL),(532,'Nês','Active','Women','RAW',NULL),(533,'Yuki','Active','Men','NXT',NULL),(534,'Aqua','Active','Men','NXT',NULL),(535,'Akshay Tiwari','Active','Men','NXT',NULL),(536,'Oleksii','Active','Men','NXT',NULL),(537,'Miguel Mendes','Active','Men','NXT',NULL),(538,'Ricardo Morgado','Active','Men','NXT',NULL),(539,'Cédrine Barandon','Active','Women','NXT',NULL),(540,'Stephan van Kalmthout','Active','Men','NXT',NULL),(541,'Tarte','Active','Men','NXT',NULL),(542,'Hee_HO','Active','Men','NXT',NULL),(543,'Nox','Active','Men','NXT',NULL),(544,'Yamcher','Active','Men','NXT',NULL),(545,'Bules','Active','Men','NXT',NULL),(546,'Keron','Active','Men','NXT',NULL),(547,'Sir Shadows','Active','Men','NXT',NULL),(548,'THE VIGILANTE','Active','Men','NXT',NULL),(549,'Esqueiro','Active','Men','NXT',NULL),(550,'Snoopy','Active','Men','NXT',NULL),(551,'Baltazar','Active','Men','NXT',NULL),(552,'Foxx','Active','Men','NXT',NULL),(553,'Hugo Soares','Inactive','Men',NULL,'PWF Alumni'),(554,'António João','Inactive','Men',NULL,'PWF Alumni'),(555,'Lucas','Inactive','Men',NULL,'PWF Alumni'),(556,'Ricardo Machado','Inactive','Men',NULL,'PWF Alumni'),(557,'Ricardo Filipe','Inactive','Men',NULL,'PWF Alumni');
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
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
  `reign_order` int NOT NULL,
  `champion_id` int DEFAULT NULL,
  `match_id` int DEFAULT NULL,
  `reign_duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title_id` (`title_id`),
  KEY `champion_id` (`champion_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `title_history_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_history_ibfk_2` FOREIGN KEY (`champion_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  CONSTRAINT `title_history_ibfk_4` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_history`
--

LOCK TABLES `title_history` WRITE;
/*!40000 ALTER TABLE `title_history` DISABLE KEYS */;
INSERT INTO `title_history` VALUES (1,1,1,238,12,NULL),(2,1,2,498,NULL,NULL),(3,1,3,229,NULL,263),(4,1,4,222,NULL,16),(5,1,5,229,NULL,346),(6,1,6,NULL,NULL,NULL),(7,1,7,236,NULL,129),(8,1,8,229,NULL,236),(9,1,9,236,NULL,63),(10,1,10,229,NULL,124),(11,1,11,226,NULL,28),(12,1,12,236,NULL,38),(13,1,13,228,NULL,85),(14,1,14,234,NULL,92),(15,1,15,229,NULL,121),(16,1,16,228,NULL,7),(17,1,17,236,NULL,1),(18,1,18,234,NULL,15),(19,1,19,229,NULL,NULL),(20,1,20,234,NULL,NULL),(21,1,21,229,NULL,NULL),(22,1,22,234,NULL,NULL),(23,1,23,229,NULL,NULL),(24,1,24,NULL,NULL,NULL),(25,1,25,226,NULL,NULL),(26,1,26,249,NULL,203),(27,1,27,229,NULL,376),(28,1,28,250,NULL,21),(29,1,29,257,NULL,61),(30,1,30,250,NULL,62),(31,1,31,257,NULL,60),(32,1,32,225,NULL,153),(33,1,33,249,NULL,91),(34,1,34,39,NULL,122),(35,1,35,243,NULL,91),(36,1,36,260,NULL,123),(37,1,37,249,NULL,45),(38,1,38,553,NULL,46),(39,1,39,249,NULL,29),(40,1,40,257,NULL,31),(41,1,41,229,NULL,91),(42,1,42,249,NULL,31),(43,1,43,257,NULL,122),(44,1,44,250,NULL,62),(45,1,45,229,NULL,60),(46,1,46,250,NULL,122),(47,1,47,249,NULL,0),(48,1,48,NULL,NULL,NULL),(49,1,49,269,NULL,174),(50,1,50,229,NULL,60),(51,1,51,477,NULL,183),(52,1,52,61,NULL,92),(53,1,53,269,NULL,31),(54,1,54,477,NULL,2),(55,1,55,269,NULL,57),(56,1,56,38,NULL,30),(57,1,57,61,NULL,31),(58,1,58,269,NULL,30),(59,1,59,267,NULL,31),(60,1,60,38,NULL,62),(61,1,61,271,NULL,92),(62,1,62,498,NULL,121),(63,1,63,269,NULL,NULL),(64,1,64,227,NULL,NULL),(65,1,65,269,NULL,NULL),(66,1,66,258,NULL,NULL),(67,1,67,269,NULL,NULL),(68,1,68,258,NULL,NULL),(69,1,69,269,NULL,NULL),(70,1,70,143,NULL,NULL),(71,1,71,259,NULL,NULL),(72,1,72,143,NULL,NULL),(73,1,73,258,NULL,NULL),(74,1,74,143,NULL,NULL),(75,1,75,477,NULL,NULL),(76,1,76,221,NULL,NULL),(77,1,77,269,NULL,NULL),(78,1,78,477,NULL,NULL),(79,1,79,269,NULL,NULL),(80,1,80,53,NULL,NULL),(81,1,81,239,NULL,NULL),(82,1,82,477,NULL,NULL),(83,1,83,229,NULL,NULL),(84,1,84,240,NULL,NULL),(85,1,85,268,NULL,NULL),(86,1,86,240,NULL,153),(87,1,87,269,NULL,60),(88,1,88,17,NULL,122),(89,1,89,14,NULL,61),(90,1,90,269,NULL,61),(91,1,91,258,NULL,31),(92,1,92,269,NULL,31),(93,1,93,258,NULL,60),(94,1,94,143,NULL,30),(95,1,95,269,NULL,0),(96,1,96,NULL,NULL,NULL),(97,1,97,143,NULL,92),(98,1,98,258,NULL,30),(99,1,99,NULL,NULL,NULL),(100,1,100,248,NULL,49),(101,1,101,229,NULL,61),(102,1,102,269,NULL,31),(103,1,103,229,NULL,30),(104,1,104,477,NULL,31),(105,1,105,229,NULL,31),(106,1,106,477,NULL,30),(107,1,107,229,NULL,30),(108,1,108,245,NULL,31),(109,1,109,NULL,NULL,NULL),(110,1,110,244,NULL,151),(111,1,111,268,NULL,61),(112,1,112,244,NULL,159),(113,1,113,107,NULL,160),(114,1,114,53,NULL,63),(115,1,115,29,NULL,93),(116,1,116,258,NULL,63),(117,1,117,143,NULL,92),(118,1,118,248,NULL,62),(119,1,119,NULL,NULL,NULL),(120,1,120,248,NULL,183),(121,1,121,41,NULL,153),(122,1,122,255,NULL,30),(123,1,123,41,NULL,123),(124,1,124,248,NULL,29),(125,1,125,41,NULL,31),(126,1,126,248,NULL,0),(127,1,127,472,NULL,30),(128,1,128,248,NULL,184),(129,1,129,245,NULL,30),(130,1,130,NULL,NULL,NULL),(131,1,131,248,NULL,517),(132,1,132,137,NULL,153),(133,1,133,72,NULL,366),(134,1,134,258,NULL,7),(135,1,135,30,NULL,356),(136,1,136,477,NULL,123),(137,1,137,255,NULL,59),(138,1,138,490,NULL,457),(139,1,139,472,NULL,143),(140,1,140,477,NULL,469),(141,1,141,491,NULL,153),(142,1,142,490,NULL,610),(143,1,143,496,NULL,NULL),(144,2,1,260,15,NULL),(145,2,2,233,NULL,NULL),(146,2,3,NULL,NULL,NULL),(147,2,4,498,NULL,NULL),(148,2,5,222,NULL,NULL),(149,2,6,233,NULL,NULL),(150,2,7,222,NULL,NULL),(151,2,8,36,NULL,NULL),(152,2,9,498,NULL,NULL),(153,2,10,554,NULL,NULL),(154,2,11,226,NULL,NULL),(155,2,12,NULL,NULL,NULL),(156,2,13,238,NULL,177),(157,2,14,233,NULL,0),(158,2,15,NULL,NULL,NULL),(159,2,16,238,NULL,213),(160,2,17,261,NULL,57),(161,2,18,238,NULL,95),(162,2,19,261,NULL,175),(163,2,20,238,NULL,43),(164,2,21,261,NULL,64),(165,2,22,238,NULL,20),(166,2,23,226,NULL,312),(167,2,24,229,NULL,59),(168,2,25,NULL,NULL,NULL),(169,2,26,261,NULL,31),(170,2,27,226,NULL,92),(171,2,28,247,NULL,0),(172,2,29,226,NULL,30),(173,2,30,NULL,NULL,NULL),(174,2,31,223,NULL,122),(175,2,32,229,NULL,30),(176,2,33,223,NULL,61),(177,2,34,238,NULL,31),(178,2,35,226,NULL,153),(179,2,36,NULL,NULL,NULL),(180,2,37,87,NULL,60),(181,2,38,269,NULL,31),(182,2,39,NULL,NULL,NULL),(183,2,40,223,NULL,0),(184,2,41,NULL,NULL,NULL),(185,2,42,263,NULL,NULL),(186,2,43,NULL,NULL,NULL),(187,2,44,250,NULL,381),(188,2,45,257,NULL,213),(189,2,46,250,NULL,1),(190,3,1,24,6,NULL),(191,3,2,293,NULL,NULL),(192,3,3,168,NULL,NULL),(193,3,4,233,NULL,NULL),(194,3,5,273,NULL,NULL),(195,3,6,87,NULL,NULL),(196,3,7,260,NULL,NULL),(197,3,8,24,NULL,NULL),(198,3,9,281,NULL,NULL),(199,3,10,10,NULL,NULL),(200,3,11,171,NULL,NULL),(201,3,12,226,NULL,NULL),(202,3,13,261,NULL,NULL),(203,3,14,223,NULL,123),(204,3,15,228,NULL,182),(205,3,16,226,NULL,94),(206,3,17,228,NULL,35),(207,3,18,226,NULL,153),(208,3,19,235,NULL,118),(209,3,20,226,NULL,NULL),(210,3,21,223,NULL,NULL),(211,3,22,292,NULL,NULL),(212,3,23,223,NULL,NULL),(213,3,24,292,NULL,NULL),(214,3,25,229,NULL,NULL),(215,3,26,247,NULL,NULL),(216,3,27,223,NULL,NULL),(217,3,28,292,NULL,NULL),(218,3,29,223,NULL,NULL),(219,3,30,257,NULL,NULL),(220,3,31,223,NULL,NULL),(221,3,32,257,NULL,NULL),(222,3,33,238,NULL,NULL),(223,3,34,232,NULL,NULL),(224,3,35,247,NULL,NULL),(225,3,36,226,NULL,NULL),(226,3,37,235,NULL,NULL),(227,3,38,257,NULL,NULL),(228,3,39,235,NULL,NULL),(229,3,40,226,NULL,NULL),(230,3,41,235,NULL,NULL),(231,3,42,265,NULL,NULL),(232,3,43,247,NULL,NULL),(233,3,44,229,NULL,NULL),(234,3,45,247,NULL,NULL),(235,3,46,555,NULL,NULL),(236,3,47,NULL,NULL,NULL),(237,3,48,102,NULL,0),(238,3,49,NULL,NULL,NULL),(239,3,50,555,NULL,0),(240,3,51,NULL,NULL,NULL),(241,3,52,237,NULL,NULL),(242,3,53,NULL,NULL,NULL),(243,3,54,257,NULL,75),(244,3,55,263,NULL,153),(245,3,56,257,NULL,122),(246,3,57,243,NULL,31),(247,3,58,556,NULL,29),(248,3,59,274,NULL,92),(249,3,60,243,NULL,122),(250,3,61,263,NULL,93),(251,3,62,243,NULL,31),(252,3,63,225,NULL,30),(253,3,64,229,NULL,31),(254,3,65,243,NULL,95),(255,3,66,229,NULL,60),(256,3,67,243,NULL,30),(257,3,68,237,NULL,61),(258,3,69,498,NULL,28),(259,3,70,237,NULL,34),(260,3,71,477,NULL,59),(261,3,72,498,NULL,153),(262,3,73,247,NULL,29),(263,3,74,263,NULL,30),(264,3,75,498,NULL,458),(265,3,76,61,NULL,93),(266,3,77,88,NULL,92),(267,3,78,61,NULL,62),(268,3,79,28,NULL,31),(269,3,80,61,NULL,31),(270,3,81,86,NULL,67),(271,3,82,28,NULL,58),(272,3,83,38,NULL,15),(273,3,84,28,NULL,16),(274,3,85,38,NULL,31),(275,3,86,28,NULL,2),(276,3,87,38,NULL,28),(277,3,88,227,NULL,95),(278,3,89,498,NULL,46),(279,3,90,227,NULL,30),(280,3,91,88,NULL,58),(281,3,92,240,NULL,44),(282,3,93,88,NULL,48),(283,3,94,268,NULL,160),(284,3,95,221,NULL,7),(285,3,96,227,NULL,15),(286,3,97,268,NULL,96),(287,3,98,245,NULL,2),(288,3,99,144,NULL,28),(289,3,100,268,NULL,123),(290,3,101,498,NULL,122),(291,3,102,248,NULL,121),(292,3,103,78,NULL,1),(293,3,104,248,NULL,30),(294,3,105,78,NULL,15),(295,3,106,477,NULL,15),(296,3,107,248,NULL,62),(297,3,108,244,NULL,61),(298,3,109,477,NULL,61),(299,3,110,244,NULL,31),(300,3,111,477,NULL,60),(301,3,112,17,NULL,122),(302,3,113,14,NULL,31),(303,3,114,244,NULL,122),(304,3,115,14,NULL,121),(305,3,116,57,NULL,123),(306,3,117,248,NULL,30),(307,3,118,557,NULL,NULL),(308,3,119,248,NULL,NULL),(309,3,120,557,NULL,NULL),(310,3,121,46,NULL,NULL),(311,3,122,245,NULL,NULL),(312,3,123,57,NULL,NULL),(313,3,124,17,NULL,NULL),(314,3,125,477,NULL,NULL),(315,3,126,17,NULL,NULL),(316,3,127,248,NULL,NULL),(317,3,128,14,NULL,NULL),(318,3,129,248,NULL,NULL),(319,3,130,14,NULL,NULL),(320,3,131,248,NULL,NULL),(321,3,132,258,NULL,NULL),(322,3,133,244,NULL,NULL),(323,3,134,248,NULL,NULL),(324,3,135,498,NULL,NULL),(325,3,136,248,NULL,NULL),(326,3,137,245,NULL,NULL),(327,3,138,498,NULL,NULL),(328,3,139,53,NULL,NULL),(329,3,140,14,NULL,NULL),(330,3,141,245,NULL,NULL),(331,3,142,14,NULL,NULL),(332,3,143,244,NULL,8),(333,3,144,NULL,NULL,NULL),(334,3,145,14,NULL,21),(335,3,146,47,NULL,131),(336,3,147,61,NULL,31),(337,3,148,477,NULL,64),(338,3,149,14,NULL,66),(339,3,150,248,NULL,94),(340,3,151,86,NULL,65),(341,3,152,477,NULL,0),(342,3,153,NULL,NULL,NULL),(343,3,154,50,NULL,113),(344,3,155,11,NULL,61),(345,3,156,14,NULL,93),(346,3,157,50,NULL,120),(347,3,158,94,NULL,184),(348,3,159,37,NULL,43),(349,3,160,94,NULL,136),(350,3,161,245,NULL,124),(351,3,162,258,NULL,21),(352,3,163,NULL,NULL,NULL),(353,3,164,107,NULL,138),(354,3,165,477,NULL,90),(355,3,166,78,NULL,61),(356,3,167,51,NULL,62),(357,3,168,78,NULL,15),(358,3,169,51,NULL,14),(359,3,170,78,NULL,188),(360,3,171,492,NULL,275),(361,3,172,62,NULL,31),(362,3,173,492,NULL,121),(363,3,174,14,NULL,122),(364,3,175,19,NULL,183),(365,3,176,62,NULL,153),(366,3,177,244,NULL,403),(367,3,178,113,NULL,113),(368,3,179,147,NULL,59),(369,3,180,3,NULL,30),(370,3,181,147,NULL,123),(371,3,182,152,NULL,30),(372,3,183,53,NULL,61),(373,3,184,15,NULL,274),(374,3,185,477,NULL,183),(375,3,186,481,NULL,153),(376,3,187,475,NULL,91),(377,3,188,NULL,NULL,NULL),(378,3,189,513,NULL,28),(379,3,190,475,NULL,184),(380,3,191,489,NULL,383),(381,3,192,496,NULL,99),(382,3,193,488,NULL,NULL);
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

-- Dump completed on 2025-01-14 19:51:08
