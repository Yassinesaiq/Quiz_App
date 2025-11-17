-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: test_app
-- ------------------------------------------------------
-- Server version	8.0.39

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Admins'),(1,'Azubis');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (45,1,44),(1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,41),(34,2,42),(35,2,43),(36,2,44),(37,2,45),(38,2,46),(39,2,47),(40,2,48),(41,2,49),(42,2,50),(43,2,51),(44,2,52);
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add questions',7,'add_questions'),(26,'Can change questions',7,'change_questions'),(27,'Can delete questions',7,'delete_questions'),(28,'Can view questions',7,'view_questions'),(29,'Can add topics',8,'add_topics'),(30,'Can change topics',8,'change_topics'),(31,'Can delete topics',8,'delete_topics'),(32,'Can view topics',8,'view_topics'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add Token',10,'add_tokenproxy'),(38,'Can change Token',10,'change_tokenproxy'),(39,'Can delete Token',10,'delete_tokenproxy'),(40,'Can view Token',10,'view_tokenproxy'),(41,'Can add results',11,'add_results'),(42,'Can change results',11,'change_results'),(43,'Can delete results',11,'delete_results'),(44,'Can view results',11,'view_results'),(45,'Can add wrong answer',12,'add_wronganswer'),(46,'Can change wrong answer',12,'change_wronganswer'),(47,'Can delete wrong answer',12,'delete_wronganswer'),(48,'Can view wrong answer',12,'view_wronganswer'),(49,'Can add quiz result',13,'add_quizresult'),(50,'Can change quiz result',13,'change_quizresult'),(51,'Can delete quiz result',13,'delete_quizresult'),(52,'Can view quiz result',13,'view_quizresult'),(53,'Can add text answer',14,'add_textanswer'),(54,'Can change text answer',14,'change_textanswer'),(55,'Can delete text answer',14,'delete_textanswer'),(56,'Can view text answer',14,'view_textanswer'),(57,'Can add text question',15,'add_textquestion'),(58,'Can change text question',15,'change_textquestion'),(59,'Can delete text question',15,'delete_textquestion'),(60,'Can view text question',15,'view_textquestion'),(61,'Can add test session',16,'add_testsession'),(62,'Can change test session',16,'change_testsession'),(63,'Can delete test session',16,'delete_testsession'),(64,'Can view test session',16,'view_testsession'),(65,'Can add user profile',18,'add_userprofile'),(66,'Can change user profile',18,'change_userprofile'),(67,'Can delete user profile',18,'delete_userprofile'),(68,'Can view user profile',18,'view_userprofile'),(69,'Can add URL Permission',19,'add_groupurlpermissions'),(70,'Can change URL Permission',19,'change_groupurlpermissions'),(71,'Can delete URL Permission',19,'delete_groupurlpermissions'),(72,'Can view URL Permission',19,'view_groupurlpermissions');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$GOJNhzKzGMXAJpS2pIuxon$5kyuuiKCRRWR7EkRbaxsQqpi3SGkbTXyrmNViPYdQpg=','2025-11-14 13:41:14.947144',1,'saiqy','Yassine','Saiq','yassine.saiq@usmba.ac.ma',1,1,'2025-07-21 11:28:55.000000'),(2,'pbkdf2_sha256$1000000$4KF8YCcg4bFkwiLRFnV0KE$3RJCrQYmjGskb6JvuZG0Wd5mcjlZdj5V/pXkC27ZQ0g=','2025-08-04 07:40:13.477871',0,'Azubi1','','','',0,1,'2025-07-23 08:11:32.000000'),(3,'pbkdf2_sha256$1000000$0oL51qEGko2rYVuMGOMGSq$wKlhDN1xwobEMOXJl5qo0MJJUSv1FPi4YngPh/iiJwk=',NULL,0,'Azubi2','','','',0,1,'2025-07-28 07:52:40.133324'),(4,'pbkdf2_sha256$1000000$2N7ZyelpUiijRw4sLO5PNa$khRaMoN9Ex+LxeLyuLCZz6Wj6AcOgC9vIhv3hkLqVA4=','2025-09-23 09:34:41.051666',0,'stelzerf','Florian','Stelzer','',1,1,'2025-07-29 07:57:34.000000'),(5,'pbkdf2_sha256$1000000$pGasbjgabRdm8oaN59BDD0$omdqYfiFziWAxPq0oNK5iuMgaPvm2XLJ2UMZIulam9E=','2025-10-30 14:55:28.942628',0,'uzundals','Salih','Uzundal','',1,1,'2025-07-29 07:59:01.000000'),(6,'pbkdf2_sha256$1000000$RTQsftG5aDN2lJjO1mrd78$GtwoobH8Qnjrqt7EHNJUHKT4OWzaFcFjP/7xjFD8VMM=','2025-11-11 14:17:19.363620',0,'ali','Ali','Mohamed','',0,1,'2025-10-28 09:55:11.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,1,2),(1,2,1),(3,4,2),(4,5,2),(5,6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('3a992c85a252f86241c559a009e2096b01c07989','2025-07-30 15:00:37.533270',5),('69fce53d34b80aa95f11b2aa2299e0e24d4e4c5e','2025-07-28 07:52:56.143892',3),('7a30369131f9b647a7e4ff6db44434527b3273b1','2025-10-28 09:55:51.881991',6),('8b2d9e8c2af9a31db9637fd8a157483d082ece57','2025-07-24 09:12:59.560023',1),('dda3558658db9b49c5760374199a36452e37b4c5','2025-07-28 07:49:20.611013',2),('f5ca2b23285e0ad3ab4f0a69be2df2e7feb5ab33','2025-07-30 06:22:06.632080',4);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-21 11:29:21.255173','10','Questions object (10)',3,'',7,1),(2,'2025-07-21 11:29:21.255207','9','Questions object (9)',3,'',7,1),(3,'2025-07-21 11:29:25.745923','8','Topics object (8)',3,'',8,1),(4,'2025-07-21 11:29:25.745977','7','Topics object (7)',3,'',8,1),(5,'2025-07-21 11:30:00.984411','9','Topics object (9)',1,'[{\"added\": {}}]',8,1),(6,'2025-07-21 11:30:04.111366','11','Questions object (11)',1,'[{\"added\": {}}]',7,1),(7,'2025-07-21 11:35:22.587572','9','Topics object (9)',3,'',8,1),(8,'2025-07-21 11:38:16.124805','1','Topics object (1)',1,'[{\"added\": {}}]',8,1),(9,'2025-07-21 11:38:17.823094','1','Questions object (1)',1,'[{\"added\": {}}]',7,1),(10,'2025-07-21 11:38:26.145866','1','Topics object (1)',3,'',8,1),(11,'2025-07-21 11:38:40.288863','1','Questions object (1)',3,'',7,1),(12,'2025-07-21 11:38:47.472149','1','Topics object (1)',3,'',8,1),(13,'2025-07-21 11:39:14.467346','2','Topics object (2)',1,'[{\"added\": {}}]',8,1),(14,'2025-07-21 11:39:23.184392','2','Questions object (2)',1,'[{\"added\": {}}]',7,1),(15,'2025-07-21 14:23:26.758129','1','Topics object (1)',1,'[{\"added\": {}}]',8,1),(16,'2025-07-21 14:23:28.631079','1','Questions object (1)',1,'[{\"added\": {}}]',7,1),(17,'2025-07-21 14:24:00.534110','2','Topics object (2)',1,'[{\"added\": {}}]',8,1),(18,'2025-07-21 14:24:02.050733','2','Questions object (2)',1,'[{\"added\": {}}]',7,1),(20,'2025-07-22 06:08:57.555152','1','Questions object (1)',3,'',7,1),(23,'2025-07-22 06:09:23.953102','1','Topics object (1)',3,'',8,1),(24,'2025-07-22 13:56:29.239275','14','Questions object (14)',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',7,1),(25,'2025-07-22 14:00:38.852714','13','Questions object (13)',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',7,1),(26,'2025-07-22 14:00:45.039815','12','Questions object (12)',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',7,1),(27,'2025-07-22 14:00:52.290753','11','Questions object (11)',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',7,1),(28,'2025-07-23 08:08:31.255806','1','Azubis',1,'[{\"added\": {}}]',3,1),(29,'2025-07-23 08:09:46.584608','2','Admins',1,'[{\"added\": {}}]',3,1),(30,'2025-07-23 08:11:33.160751','2','Azubi1',1,'[{\"added\": {}}]',4,1),(31,'2025-07-23 08:11:44.362658','2','Azubi1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(32,'2025-07-23 08:23:07.669559','1','saiqy',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(33,'2025-07-23 08:36:19.282580','1','saiqy',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(34,'2025-07-28 06:58:05.986738','1','saiqy - Score: 1',3,'',13,1),(35,'2025-07-28 07:03:13.046713','2','saiqy - Score: 3',3,'',13,1),(36,'2025-07-28 07:41:01.649841','2','Azubi1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(37,'2025-07-28 07:52:40.557230','3','azubi2',1,'[{\"added\": {}}]',4,1),(38,'2025-07-29 07:47:00.394080','8','saiqy - Score: 1',3,'',13,1),(39,'2025-07-29 07:47:00.394123','7','saiqy - Score: 2',3,'',13,1),(40,'2025-07-29 07:47:00.394138','6','azubi2 - Score: 1',3,'',13,1),(41,'2025-07-29 07:47:00.394149','5','Azubi1 - Score: 2',3,'',13,1),(42,'2025-07-29 07:47:00.394159','4','saiqy - Score: 3',3,'',13,1),(43,'2025-07-29 07:55:03.301916','9','saiqy - Score: 3',3,'',13,1),(44,'2025-07-29 07:55:03.301949','3','saiqy - Score: 3',3,'',13,1),(45,'2025-07-29 07:57:34.660515','4','florians',1,'[{\"added\": {}}]',4,1),(46,'2025-07-29 07:58:25.543692','4','florians',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',4,1),(47,'2025-07-29 07:59:01.639845','5','Salihu',1,'[{\"added\": {}}]',4,1),(48,'2025-07-29 07:59:29.986338','5','Salihu',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',4,1),(49,'2025-07-29 08:04:17.713125','5','Salihu',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(50,'2025-07-30 06:27:35.306985','37','Was macht das virtual-Schlüsselwort? - Topic : C#',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',7,1),(51,'2025-07-30 08:35:32.478788','2','Admins',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(52,'2025-07-30 08:38:52.134280','4','florians',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(53,'2025-07-30 08:39:02.889300','5','Salihu',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(54,'2025-08-01 06:08:26.799629','1','saiqy',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(55,'2025-08-02 08:03:12.646155','26','saiqy - Score: 4',3,'',13,1),(56,'2025-09-03 06:50:02.883344','1','Textfrage: hallo , der himmel',1,'[{\"added\": {}}]',15,1),(57,'2025-09-08 07:55:03.146571','1','Textfrage: hallo , ist der himmel hell ?',2,'[{\"changed\": {\"fields\": [\"Question text\"]}}]',15,1),(58,'2025-09-09 13:27:45.896421','44','saiqy - Score: 1',2,'[{\"changed\": {\"fields\": [\"Session\"]}}]',13,1),(59,'2025-09-09 13:27:59.138796','44','saiqy - Score: 1',2,'[]',13,1),(60,'2025-09-09 13:28:11.660399','17','saiqy – hallo , ist der himmel hell ?',2,'[{\"changed\": {\"fields\": [\"Session\", \"Answer text\"]}}]',14,1),(61,'2025-09-09 13:39:44.349301','1','saiqy – hallo , ist der himmel hell ?',2,'[{\"changed\": {\"fields\": [\"Session\", \"Answer text\"]}}]',14,1),(62,'2025-09-09 13:42:24.084806','6','TestSession von saiqy für Sql am 09.09.2025 13:40',3,'',16,1),(63,'2025-09-09 13:42:24.084832','5','TestSession von saiqy für Sql am 09.09.2025 13:38',3,'',16,1),(64,'2025-09-09 13:42:24.084845','4','TestSession von saiqy für Sql am 09.09.2025 13:37',3,'',16,1),(65,'2025-09-09 13:42:24.084857','3','TestSession von saiqy für Sql am 09.09.2025 13:26',3,'',16,1),(66,'2025-09-09 13:42:24.084868','2','TestSession von saiqy für Sql am 09.09.2025 12:12',3,'',16,1),(67,'2025-09-09 13:43:38.419184','21','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(68,'2025-09-09 13:43:38.419207','20','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(69,'2025-09-09 13:43:38.419217','19','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(70,'2025-09-09 13:43:38.419226','18','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(71,'2025-09-09 13:43:38.419235','16','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(72,'2025-09-09 13:43:38.419244','15','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(73,'2025-09-09 13:43:38.419252','14','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(74,'2025-09-09 13:43:38.419261','13','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(75,'2025-09-09 13:43:38.419269','12','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(76,'2025-09-09 13:43:38.419277','11','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(77,'2025-09-09 13:43:38.419285','10','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(78,'2025-09-09 13:43:38.419292','9','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(79,'2025-09-09 13:43:38.419300','8','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(80,'2025-09-09 13:43:38.419308','7','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(81,'2025-09-09 13:43:38.419315','6','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(82,'2025-09-09 13:43:38.419323','5','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(83,'2025-09-09 13:43:38.419330','4','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(84,'2025-09-09 13:43:38.419337','3','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(85,'2025-09-09 13:43:38.419344','2','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(86,'2025-09-09 14:07:31.614365','45','saiqy - Score: 1',2,'[{\"changed\": {\"fields\": [\"Session\"]}}]',13,1),(87,'2025-09-09 14:07:56.592518','25','saiqy – hallo , ist der himmel hell ?',2,'[{\"changed\": {\"fields\": [\"Session\"]}}]',14,1),(88,'2025-09-10 06:38:18.470891','33','saiqy – hallo , ist der himmel hell ?',2,'[{\"changed\": {\"fields\": [\"Session\"]}}]',14,1),(89,'2025-09-10 11:57:54.316252','34','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(90,'2025-09-10 11:57:54.316326','33','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(91,'2025-09-10 11:57:54.316363','32','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(92,'2025-09-10 11:57:54.316395','31','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(93,'2025-09-10 11:57:54.316426','30','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(94,'2025-09-10 11:57:54.316457','29','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(95,'2025-09-10 11:57:54.316487','28','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(96,'2025-09-10 11:57:54.316516','27','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(97,'2025-09-10 11:57:54.316545','26','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(98,'2025-09-10 11:57:54.316572','25','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(99,'2025-09-10 11:57:54.316599','24','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(100,'2025-09-10 11:57:54.316625','23','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(101,'2025-09-10 11:57:54.316650','22','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(102,'2025-09-11 05:32:02.490888','61','saiqy - Score: 2',3,'',13,1),(103,'2025-09-11 05:36:15.011142','47','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(104,'2025-09-11 05:36:15.011166','44','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(105,'2025-09-11 05:36:15.011177','43','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(106,'2025-09-11 05:36:15.011185','42','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(107,'2025-09-11 05:36:15.011193','41','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(108,'2025-09-11 05:36:15.011201','40','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(109,'2025-09-11 05:36:15.011208','39','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(110,'2025-09-11 05:36:15.011215','38','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(111,'2025-09-11 05:36:15.011222','37','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(112,'2025-09-11 05:36:15.011229','36','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(113,'2025-09-11 05:36:15.011236','35','saiqy – hallo , ist der himmel hell ?',3,'',14,1),(114,'2025-09-11 05:36:23.269693','52','saiqy - Score: 0',3,'',13,1),(115,'2025-09-11 05:36:23.269743','50','saiqy - Score: 1',3,'',13,1),(116,'2025-09-11 05:36:23.269766','49','saiqy - Score: 1',3,'',13,1),(117,'2025-09-11 05:36:23.269785','48','saiqy - Score: 1',3,'',13,1),(118,'2025-09-11 05:36:23.269803','47','saiqy - Score: 1',3,'',13,1),(119,'2025-09-11 05:36:23.269820','46','saiqy - Score: 5',3,'',13,1),(120,'2025-09-11 05:36:23.269837','45','saiqy - Score: 19',3,'',13,1),(121,'2025-09-11 05:36:30.537418','36','TestSession von saiqy für Networks am 10.09.2025 13:42',3,'',16,1),(122,'2025-09-11 05:36:30.537455','33','TestSession von saiqy für Sql am 10.09.2025 12:53',3,'',16,1),(123,'2025-09-11 05:36:30.537468','32','TestSession von saiqy für Sql am 10.09.2025 12:51',3,'',16,1),(124,'2025-09-11 05:36:30.537481','31','TestSession von saiqy für Sql am 10.09.2025 12:41',3,'',16,1),(125,'2025-09-11 05:36:30.537493','30','TestSession von saiqy für Sql am 10.09.2025 12:36',3,'',16,1),(126,'2025-09-11 05:36:30.537505','29','TestSession von saiqy für Sql am 10.09.2025 12:35',3,'',16,1),(127,'2025-09-11 05:36:30.537518','28','TestSession von saiqy für Sql am 10.09.2025 12:25',3,'',16,1),(128,'2025-09-11 05:36:30.537530','27','TestSession von saiqy für Sql am 10.09.2025 12:14',3,'',16,1),(129,'2025-09-11 05:36:30.537542','26','TestSession von saiqy für Sql am 10.09.2025 12:10',3,'',16,1),(130,'2025-09-11 05:36:30.537554','25','TestSession von saiqy für Sql am 10.09.2025 12:06',3,'',16,1),(131,'2025-09-11 05:36:30.537564','24','TestSession von saiqy für Sql am 10.09.2025 12:03',3,'',16,1),(132,'2025-09-11 05:36:30.537575','23','TestSession von saiqy für Sql am 10.09.2025 11:58',3,'',16,1),(133,'2025-09-11 05:36:30.537585','22','TestSession von saiqy für Sql am 10.09.2025 11:58',3,'',16,1),(134,'2025-09-11 05:36:30.537595','21','TestSession von saiqy für Sql am 10.09.2025 11:49',3,'',16,1),(135,'2025-09-11 05:36:30.537606','20','TestSession von saiqy für Sql am 10.09.2025 06:36',3,'',16,1),(136,'2025-09-11 05:36:30.537616','19','TestSession von saiqy für Sql am 10.09.2025 06:26',3,'',16,1),(137,'2025-09-11 05:36:30.537626','18','TestSession von saiqy für Sql am 10.09.2025 06:21',3,'',16,1),(138,'2025-09-11 05:36:30.537636','17','TestSession von saiqy für Sql am 10.09.2025 06:14',3,'',16,1),(139,'2025-09-11 05:36:30.537647','16','TestSession von saiqy für Sql am 10.09.2025 06:13',3,'',16,1),(140,'2025-09-11 05:36:30.537658','15','TestSession von saiqy für Sql am 10.09.2025 06:11',3,'',16,1),(141,'2025-09-11 05:36:30.537668','14','TestSession von saiqy für Sql am 10.09.2025 06:08',3,'',16,1),(142,'2025-09-11 05:36:30.537678','13','TestSession von saiqy für Sql am 10.09.2025 06:04',3,'',16,1),(143,'2025-09-11 05:36:30.537688','12','TestSession von saiqy für Sql am 10.09.2025 05:49',3,'',16,1),(144,'2025-09-11 05:36:30.537697','11','TestSession von saiqy für Sql am 10.09.2025 05:43',3,'',16,1),(145,'2025-09-11 05:36:30.537707','10','TestSession von saiqy für Sql am 09.09.2025 14:04',3,'',16,1),(146,'2025-09-11 05:36:30.537716','9','TestSession von saiqy für Sql am 09.09.2025 14:03',3,'',16,1),(147,'2025-09-11 05:36:30.537727','8','TestSession von saiqy für Sql am 09.09.2025 14:02',3,'',16,1),(148,'2025-09-11 05:36:30.537737','7','TestSession von saiqy für Sql am 09.09.2025 13:43',3,'',16,1),(149,'2025-09-12 06:12:44.718579','1','MCQ',1,'[{\"added\": {}}]',17,1),(150,'2025-09-12 06:13:03.312056','2','Textfrage',1,'[{\"added\": {}}]',17,1),(151,'2025-09-12 06:13:16.784018','3','MCQ + Text',1,'[{\"added\": {}}]',17,1),(152,'2025-09-12 06:19:42.017497','11','C# ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(153,'2025-09-12 06:20:07.098720','10','Design Patterns ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(154,'2025-09-12 06:20:11.774816','9','Python ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(155,'2025-09-12 06:20:15.602265','7','Dokcer ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(156,'2025-09-12 06:20:20.808105','6','ASP .NET ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(157,'2025-09-12 06:20:27.329178','6','ASP .NET ',2,'[]',8,1),(158,'2025-09-12 06:20:31.038776','5','Git ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(159,'2025-09-12 06:20:34.721404','4','Networks ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(160,'2025-09-12 06:20:38.575565','3','Sql ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(161,'2025-09-12 06:33:11.107136','3','Sql ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(162,'2025-09-12 06:34:13.218578','3','Sql ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(163,'2025-09-12 13:32:33.936236','9','Python ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(164,'2025-09-16 11:16:52.704422','9','Python ',2,'[{\"changed\": {\"fields\": [\"Topic type\"]}}]',8,1),(165,'2025-09-18 05:35:48.735802','8','Textfrage: new question ?',2,'[{\"changed\": {\"fields\": [\"Question text\"]}}]',15,1),(166,'2025-09-18 08:01:46.838145','1','Textfrage: hallo , ist der himmel hell ?',3,'',15,1),(167,'2025-09-23 06:52:13.811637','9','Textfrage: asdg dgsa sda sda sdv sad sgad',1,'[{\"added\": {}}]',15,1),(168,'2025-09-23 06:52:24.365871','10','Textfrage: sbda sadj vdvh as vdash jkasdads ?',1,'[{\"added\": {}}]',15,1),(169,'2025-09-23 07:36:43.098358','90','saiqy – sbda sadj vdvh as vdash jkasda',3,'',14,1),(170,'2025-09-23 07:36:43.098525','89','saiqy – asdg dgsa sda sda sdv sad sgad',3,'',14,1),(171,'2025-09-23 07:36:43.098541','88','saiqy – BVD  DSBNB MN BDS SDVNBN MB fa',3,'',14,1),(172,'2025-09-23 07:36:43.098550','87','saiqy – BVD  DSBNB MN BDS SDVNBN MB fa',3,'',14,1),(173,'2025-09-23 07:36:43.098558','86','saiqy – BVD  DSBNB MN BDS SDVNBN MB fa',3,'',14,1),(174,'2025-09-23 07:36:43.098566','85','saiqy – BVD  DSBNB MN BDS SDVNBN MB fa',3,'',14,1),(175,'2025-09-23 07:36:43.098574','84','saiqy – BVD  DSBNB MN BDS SDVNBN MB fa',3,'',14,1),(176,'2025-09-23 07:37:00.901786','10','Textfrage: whtas ur name ?',2,'[{\"changed\": {\"fields\": [\"Question text\"]}}]',15,1),(177,'2025-09-23 07:37:51.992695','10','Textfrage: Whats the name of the king of Morocco ?',2,'[{\"changed\": {\"fields\": [\"Question text\"]}}]',15,1),(178,'2025-09-23 09:25:09.856565','4','florians',2,'[]',4,1),(179,'2025-09-23 09:34:28.995681','4','florians',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(180,'2025-09-30 11:28:31.936174','5','Textfrage: hello ??',2,'[{\"changed\": {\"fields\": [\"Des img\"]}}]',15,1),(181,'2025-10-06 07:46:40.135467','40','Textfrage: vcccccccccccc',3,'',15,1),(182,'2025-10-06 07:46:40.135519','39','Textfrage: xcccccccccccccccccccc',3,'',15,1),(183,'2025-10-06 07:46:40.135541','38','Textfrage: xcccccccccccccccccccc',3,'',15,1),(184,'2025-10-06 07:46:40.135567','37','Textfrage: xcccccccccccccccccccc',3,'',15,1),(185,'2025-10-06 07:46:40.135584','36','Textfrage: xcccccccccccccccccccc',3,'',15,1),(186,'2025-10-06 07:46:40.135600','35','Textfrage: scxxxxxxxxxxxx cccccccccccccc',3,'',15,1),(187,'2025-10-06 07:46:40.135616','34','Textfrage: ddfffffffffffffffffff cc',3,'',15,1),(188,'2025-10-09 13:04:14.863607','145','saiqy – Find Fehler im Code Syntaxfehl',3,'',14,1),(189,'2025-10-09 13:04:14.863652','143','saiqy – Find Fehler im Code Syntaxfehl',3,'',14,1),(190,'2025-10-09 13:04:14.863673','141','saiqy – Find Fehler im Code Syntaxfehl',3,'',14,1),(191,'2025-10-27 12:21:57.934702','5','Salihu',2,'[]',4,1),(192,'2025-10-27 12:22:53.784285','5','Salihu',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(193,'2025-10-28 06:17:28.071734','5','Salihu',2,'[]',4,1),(194,'2025-10-28 09:55:11.563014','6','ali',1,'[{\"added\": {}}]',4,1),(195,'2025-10-28 09:55:18.124841','6','ali',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(196,'2025-10-28 09:55:41.126035','6','ali',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(197,'2025-11-04 10:20:29.108171','6','ali',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(198,'2025-11-04 10:20:35.795158','6','ali',2,'[]',4,1),(199,'2025-11-06 06:59:20.786416','1','Azubis',2,'[]',3,1),(200,'2025-11-06 07:00:00.017144','1','Azubis',2,'[]',3,1),(201,'2025-11-06 07:00:05.630415','1','Azubis',2,'[]',3,1),(202,'2025-11-06 07:04:17.414825','1','Azubis',2,'[]',3,1),(203,'2025-11-06 07:05:30.431543','1','Azubis',2,'[]',3,1),(204,'2025-11-06 07:05:51.528036','1','Azubis',2,'[]',3,1),(205,'2025-11-06 07:07:49.914448','1','Azubis',2,'[]',3,1),(206,'2025-11-06 07:08:24.683279','1','Azubis',2,'[]',3,1),(207,'2025-11-06 09:56:07.970057','1','Azubis',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(19,'django_url_group_permissions','groupurlpermissions'),(6,'sessions','session'),(7,'test_app','questions'),(13,'test_app','quizresult'),(11,'test_app','results'),(16,'test_app','testsession'),(14,'test_app','textanswer'),(15,'test_app','textquestion'),(8,'test_app','topics'),(17,'test_app','topictype'),(18,'test_app','userprofile'),(12,'test_app','wronganswer');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-17 13:34:05.439962'),(2,'auth','0001_initial','2025-07-17 13:34:06.139805'),(3,'admin','0001_initial','2025-07-17 13:34:06.344660'),(4,'admin','0002_logentry_remove_auto_add','2025-07-17 13:34:06.352227'),(5,'admin','0003_logentry_add_action_flag_choices','2025-07-17 13:34:06.358740'),(6,'contenttypes','0002_remove_content_type_name','2025-07-17 13:34:06.457299'),(7,'auth','0002_alter_permission_name_max_length','2025-07-17 13:34:06.529145'),(8,'auth','0003_alter_user_email_max_length','2025-07-17 13:34:06.567687'),(9,'auth','0004_alter_user_username_opts','2025-07-17 13:34:06.576963'),(10,'auth','0005_alter_user_last_login_null','2025-07-17 13:34:06.648325'),(11,'auth','0006_require_contenttypes_0002','2025-07-17 13:34:06.652312'),(12,'auth','0007_alter_validators_add_error_messages','2025-07-17 13:34:06.662282'),(13,'auth','0008_alter_user_username_max_length','2025-07-17 13:34:06.732226'),(14,'auth','0009_alter_user_last_name_max_length','2025-07-17 13:34:06.806333'),(15,'auth','0010_alter_group_name_max_length','2025-07-17 13:34:06.826134'),(16,'auth','0011_update_proxy_permissions','2025-07-17 13:34:06.834095'),(17,'auth','0012_alter_user_first_name_max_length','2025-07-17 13:34:06.906382'),(18,'sessions','0001_initial','2025-07-17 13:34:06.954059'),(19,'test_app','0001_initial','2025-07-17 13:34:07.098825'),(20,'test_app','0002_remove_topics_topic_alter_questions_option1_and_more','2025-07-18 06:13:35.075014'),(21,'test_app','0003_questions_des_img','2025-07-22 13:40:09.802524'),(22,'test_app','0004_alter_questions_des_img','2025-07-23 07:39:48.605716'),(23,'test_app','0005_topics_created_at_topics_created_by_and_more','2025-07-23 09:21:13.655905'),(24,'test_app','0006_topics_created_at_topics_created_by','2025-07-23 09:24:55.614712'),(25,'test_app','0007_topics_created_at_topics_visible','2025-07-23 09:46:09.117336'),(26,'authtoken','0001_initial','2025-07-24 09:11:17.104813'),(27,'authtoken','0002_auto_20160226_1747','2025-07-24 09:11:17.124065'),(28,'authtoken','0003_tokenproxy','2025-07-24 09:11:17.128823'),(29,'authtoken','0004_alter_tokenproxy_options','2025-07-24 09:11:17.135022'),(30,'test_app','0008_results_topics_created_at_alter_questions_topic_id','2025-07-24 13:14:30.871600'),(31,'test_app','0009_quizresult_wronganswer_delete_results_and_more','2025-07-25 05:55:26.918072'),(32,'test_app','0010_topics_created_at_alter_quizresult_user','2025-07-25 13:42:28.525396'),(33,'test_app','0011_quizresult_topic_topics_created_at','2025-07-28 06:55:57.945974'),(34,'test_app','0002_remove_topics_topic_questions_des_img_and_more','2025-09-03 05:42:38.811271'),(35,'test_app','0003_remove_topics_topic_questions_des_img_and_more','2025-09-09 08:19:58.271761'),(36,'django_url_group_permissions','0001_initial','2025-11-06 06:56:47.380990'),(37,'django_url_group_permissions','0002_auto_20250208_1339','2025-11-06 06:56:47.497772');
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
INSERT INTO `django_session` VALUES ('03kfu6q2dspum7s51n4mbcr0be9nzj43','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1v6mrl:LhBcANz4l-qwrFkKTFo5yauC7Z7YyAe22APySFN5I6Q','2025-10-23 09:23:17.735764'),('1l0g8b7wmi79p300hqi4c7qlu79zrodq','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vE00Y:VRUxC0J-PVCP9NWGHGRugnnIF2o5tVu8B4MHq38AZCk','2025-11-12 06:50:10.506087'),('1n6e7zt2ub7gc8coyaduwsod12xi26lc','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1v3rc8:_XCzQ0_uVu9LRVjZqsNvFmwLqghuC-NIBLTH48QOzbQ','2025-10-15 07:51:04.129656'),('6o300qnthckp1fjx2tovv4f1k5kq6jz3','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vETM7:EZGo4y1wQeiMv2RdMuMTM23MfqAM2jdqiLoniFNnVSc','2025-11-13 14:10:23.235039'),('84pows8lhutkq7bt4o24flhtr9e06wde','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ugIda:6BZ4XtAj9Kd483HXVzzMLaiVZiKS1U28vISJm4qat5I','2025-08-11 07:51:10.579267'),('8esvad984ri55vl99qwza5foygug49gm','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uyrF6:mcHjk3-zTFaDXK4aHgHCpGB-Q6vENIhMVccgHejPhSM','2025-10-01 12:26:36.292479'),('8s7iz25zi4po481hf0px0jnvtldv1lik','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uvqtb:HOGp7yLADS4Ke_aVhNcdaIFxvUN1ungDY3rnl6xywqo','2025-09-23 05:27:59.606881'),('93wjfomfkhg0gfmw7e1ykupfoo3eat0w','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ueBOR:vTZ9_78nlsmDK32zZWu-7zFCzt_MbJM3fVhkKSm8e6g','2025-08-05 11:42:47.417237'),('98qdhb83fudjlokdhq88gvkybydrk1u1','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ueBct:6bzDRPfL_bF3b6Wrs50eh-3iSB7isBxYC8Xl4aoY1V4','2025-08-05 11:57:43.717369'),('a133uqwg86npby3gy2zyj2i1r14mge1r','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ui7F9:VZ1AZhZ5moSqfRDKDEm_C0cKsBRMQmzUJsA2LG9ALvs','2025-08-16 08:05:27.847986'),('b7utu1ujp8o9uqx7z719fb6odn968t27','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uiuZa:VvvMyIKAhXIFIKz5tReQEmT3nt3JCgnn57jbqXiDUN4','2025-08-18 12:45:50.890609'),('czbtiqoym1pns9hlpy7cidfnzjuiyjsp','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vDczw:sun6CgQRpaqjyshZKNewUJOt4xXUNqnz_WFZMIdmL_o','2025-11-11 06:16:00.533601'),('ebzb3rg6y2hvr24gk2gjxqetop4z1aw1','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ueZLU:9OxVuGsOtiZPbEKmmyDKdOb6hqWk4vpP3OvWdubpjcY','2025-08-06 13:17:20.733228'),('f93q16o1rwy6uofclj06zahrdjcnj33r','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vDMF2:4NB2pL2Gk77p4rM5tja4KYNSa5lChY78nDuR5G1Lvu0','2025-11-10 12:22:28.990040'),('gbdapu1j6grmanlcz77l0sc1pag5iah4','.eJxVjEEOwiAQRe_C2hAZLAMu3fcMZGBGqRpISrsy3l2bdKHb_977LxVpXUpcu8xxYnVWTh1-t0T5IXUDfKd6azq3usxT0puid9r12Fiel939OyjUy7cOYAnCyfick0dvCROwhAHQIrARcRggZDyiXAdmMT4ZShnEBGAnot4f1vE4Gg:1vHJYV:YmmmX8wSJNN701cOX1JxurLyizoJDvwy5tooYWHrwaU','2025-11-21 10:18:55.861440'),('i6rrj24bp24qaoqjmxjoyrekqpy1wfws','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uzZDD:Kc81DHM-9P5jLHLrY9GFKI4eniBhEonKD5XhgvC3i7Q','2025-10-03 11:23:35.364588'),('ixoqvcuz3kzyunkvf99kcvoxpntkntfh','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uwgT0:C2429hfrNwBry_YjKV1dkmxJrSvEHBBObZpJHTfFLSI','2025-09-25 12:31:58.002002'),('l82vzyxpl0xxt7bt3i58t07wpo6053mw','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vDKJO:uE2f1jFZsvIppdF9k5p1mLli3AfBwihXbzYeB8tSstI','2025-11-10 10:18:50.477658'),('lnuiuqtyfpldr6v1k7u1rj0qese5zr4l','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uhpfF:riZQoPsJ37GltSjt6YSYdX-Mvzd_-1Ds0uQiwEfxAmE','2025-08-15 13:19:13.945688'),('ns95xx3i51pjk2cbpsb38cdi1aufxp2k','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vDcxc:fzTbclIf74fym3UlAHs1TWKduQurx52pXEZl8l7fxx8','2025-11-11 06:13:36.246037'),('prikb327lcb3yac49urdy0qlg6k5hzwq','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vGE62:q2TNFwLYkuoKWjyDbvBxy3lNtl4ZqxlRlSRTTrWG_zI','2025-11-18 10:17:02.215685'),('syqj741qwvvk4gkzedww8uf8s7fpa3qo','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uvqtb:HOGp7yLADS4Ke_aVhNcdaIFxvUN1ungDY3rnl6xywqo','2025-09-23 05:27:59.873841'),('tv6kmu9kz4d1wzh1lqagbbi2egk9ku0d','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1vJu38:Z0HQFu_wSrVmH2Ro-cTAeEpFrtYRj3J41xCJTnlsPyk','2025-11-28 13:41:14.999115'),('ub22fmd4fjbrhxw805mxl8c8czqjq6kj','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1v6mrm:4bITe4CofvOP49vINDBax8vWEQlL6czEnLzAuSF2pM4','2025-10-23 09:23:18.281564'),('wsm3rcbom9y50f03s0fka08bxv23sq03','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1ugITl:RIPkedQLLgPTIKXvS18-q5r-uEC-1MSgNP-0bqCgfw4','2025-08-11 07:41:01.665120'),('wuiygx6r98p7pylf6zapgz80v6qgwiad','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1udohh:CaVUfkT6LsDji2xJbYmCugFVP1QTrFxhqJki1KExajQ','2025-08-04 11:29:09.799282'),('zxc0j8ou7ojr31pnds234mbplvq2p2jm','.eJxVjEEOgjAQRe_StWmYFlrHpXvOQGamU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMCZzMWBOvxuTPHTaQbrTdJutzNO6jGx3xR602n5O-rwe7t9BoVq-dW7EAfmIPp61ZYHkSQGJGQQcKzYUMbbqKbShyxA1u8gZJaBrBDvz_gDtBzgD:1uhlAl:2isWLMH4iR5gB1GGcReHJIZVzto4ay2PlpWQBEO6JsI','2025-08-15 08:31:27.332903');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` longtext,
  `option1` longtext,
  `option2` longtext,
  `option3` longtext,
  `option4` longtext,
  `answer` longtext,
  `topic_id` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `Questions_topic_id_4d26a30d_fk_Topics_Topic_id` (`topic_id`),
  CONSTRAINT `Questions_topic_id_4d26a30d_fk_Topics_Topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (11,'What does the acronym OSI stand for in the context of networking?','Open System Interface','Open System Interconnection','Operational System Integration','Online Service Interaction','Open System Interconnection',4,'uploads/topics/CN-1_O5YeErI.jpg'),(12,'Which protocol is used to transfer web pages over the internet?','FTP','HTTP','SMTP','SNMP','HTTP',4,'uploads/topics/CN-1_hGP0fJV.jpg'),(13,'What is the primary function of a router in a network?','To connect devices within the same network','To forward data packets between different networks','To provide IP addresses to devices','To encrypt network traffic','To forward data packets between different networks',4,'uploads/topics/CN-1_l8ljlo0.jpg'),(14,'Which layer of the OSI model is responsible for reliable data transfer between end systems?','Physical Layer','Data Link Layer','Transport Layer','Application Layer','Transport Layer',4,'uploads/topics/CN-1_mfzVoyC.jpg'),(15,'What is ASP .NET ?','Framework','Code Builder','Service','Software','Framework',6,''),(18,'Wofür wird \"git log --oneline\" benutzt?','Speicherplatz','Verlauf / Ablauf der Commits','Aktueller Stand der Commits','Pushbefehl auf den remote Server','Aktueller Stand der Commits',5,''),(25,'asghag das','dfsdsdf','dfdfdf','dfggd','gggg','gggg',6,''),(28,'Was ist Vererbung in C#?','Eine Methode, die sich selbst aufruft','Die Fähigkeit, Daten sicher zu speichern','Die Möglichkeit, von einer Klasse Eigenschaften zu erben','Das automatische Erstellen von Objekten','Die Möglichkeit, von einer Klasse Eigenschaften zu erben',11,'uploads/questions/Vererbung3-1024x576.jpg'),(29,'Welche Zugriffsmodifizierer erlaubt den Zugriff innerhalb derselben Klasse und von abgeleiteten Klassen?','private','protected','internal','public','protected',11,'uploads/questions/csm_Cyberlock_canstockphoto10228085_2a6862616b.jpg'),(30,'Was bedeutet Polymorphie in der objektorientierten Programmierung?','Ein Objekt hat keine Eigenschaften','Eine Methode kann mehrere Namen haben','Ein Objekt kann viele Formen annehmen','Eine Klasse kann sich nicht ändern','Ein Objekt kann viele Formen annehmen',11,'uploads/questions/0116737838.jpeg'),(31,'Wie nennt man eine Klasse, die nicht instanziiert werden kann, sondern nur als Basis dient?','Virtuelle Klasse','Abstrakte Klasse','Statische Klasse','Struktur','Abstrakte Klasse',11,'uploads/questions/0f3bfebf4d8952dd6d341f36eaac0c8c.jpg'),(32,'Welches Schlüsselwort wird verwendet, um eine Methode zu überschreiben?','override','overload','virtual','base','override',11,'uploads/questions/Explorer-Overwrite.jpg'),(33,'Was ist der Zweck eines Konstruktors in C#?','Eine Klasse zu löschen','Eine Methode zu überschreiben','Ein Objekt zu initialisieren','Eine Eigenschaft zu vererben','Ein Objekt zu initialisieren',11,'uploads/questions/c-konstruktor-1.png'),(34,'Welche Aussage ist korrekt zur Kapselung (Encapsulation)?','Daten sind öffentlich zugänglich','Objekte können sich nicht ändern','Daten und Methoden sind zusammen verpackt','Klassen können nicht erben','Daten und Methoden sind zusammen verpackt',11,'uploads/questions/xblog-Encapsulation.png'),(35,'Welche Methode wird automatisch aufgerufen, wenn ein Objekt erstellt wird?','Finalizer','Konstruktor','Main()','Dispose()','Konstruktor',11,'uploads/questions/ps_blog_objektorientierte_programmierung_grafiken.003.png'),(36,'Welche Schlüsselwörter verwendet man, um Eigenschaften (Properties) in C# zu definieren?','public und private','do und while','set und get','value und return','set und get',11,'uploads/questions/3720240703125107.png'),(37,'Was macht das virtual-Schlüsselwort?','Verhindert die Vererbung','Erzwingt die Implementierung','Ermöglicht das Überschreiben in abgeleiteten Klassen','Führt zu einer statischen Methode','Ermöglicht das Überschreiben in abgeleiteten Klassen',11,'uploads/questions/VirtualDiagram1_rgzWFnJ.png'),(38,'What is sql ?','Query language','Network protocol','Managment system','programming language','Query language',3,'uploads/questions/SQL.png'),(39,'Wie verbindet mann ein Remote Repository erst mal mit einem lokalen Repository ?','git fetch Repository_Pfad','git clone Repository_Pfad','git push Repository_Pfad','git status Repository_Pfad','git clone Repository_Pfad',5,'uploads/questions/clone-solid-icon-size_512.png'),(49,'Wie lest mann aus einen nachricht in Python','print(Hello, Python!)','print(\"Hello, Python!\")','Console.writeline(\"\"Hello, Python!\"\");','Println(\"Hello, Python!\");','print(\"Hello, Python!\")',16,'uploads/questions/image2.png'),(54,'hhhhhhhhhhhh','hhhhhhhhhhhhhhhhh','hhhhhhhhhhhhhhhhhh','hhhhhhhhhhhhhhhhhhhhh','hhhhhhhhhhhhhhhhhhhf','hhhhhhhhhhhhhhhhhhhf',5,'');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizresult`
--

DROP TABLE IF EXISTS `quizresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `topic` longtext,
  `maxsize` int DEFAULT NULL,
  `session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_app_quizresult_user_id_46d89d3b_fk_auth_user_id` (`user_id`),
  KEY `fk_quizresult_session` (`session_id`),
  CONSTRAINT `fk_quizresult_session` FOREIGN KEY (`session_id`) REFERENCES `test_app_testsession` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test_app_quizresult_user_id_46d89d3b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizresult`
--

LOCK TABLES `quizresult` WRITE;
/*!40000 ALTER TABLE `quizresult` DISABLE KEYS */;
INSERT INTO `quizresult` VALUES (71,2,'2025-09-18 09:02:09.419590',1,'Django Framework',2,50),(72,2,'2025-09-18 09:02:59.221109',1,'Django Framework',2,51),(73,1,'2025-09-19 08:17:22.696704',1,'Django Framework',2,52),(74,2,'2025-09-22 08:19:36.249048',1,'Django Framework',2,59),(75,2,'2025-09-22 09:25:31.853022',1,'Django Framework',2,64),(76,2,'2025-09-25 06:36:40.409785',1,'Django Framework',2,81),(82,1,'2025-10-01 07:59:57.112885',1,'Django Framework',2,116),(83,0,'2025-10-01 12:46:38.936120',1,'Sql',1,120),(84,0,'2025-10-01 12:48:07.375575',1,'Sql',1,121),(85,1,'2025-10-01 12:48:51.139043',1,'Sql',1,122),(86,0,'2025-10-01 12:49:41.501582',1,'Sql',1,123),(87,1,'2025-10-01 13:25:06.441661',1,'Sql',1,124),(88,0,'2025-10-07 06:30:41.370711',1,'Django Framework',1,127),(89,3,'2025-10-07 06:39:19.720742',1,'Networks',4,131),(90,1,'2025-10-08 07:39:02.037613',1,'Django Framework',1,135),(91,1,'2025-10-08 13:53:03.347957',1,'Django Framework',1,141),(92,0,'2025-10-08 14:07:50.840459',1,'Django Framework',1,145),(93,1,'2025-10-09 09:43:17.785974',1,'Django Framework',1,146),(94,1,'2025-10-09 11:16:47.692530',1,'Django Framework',1,147),(97,1,'2025-10-10 05:50:00.075829',1,'Django Framework',1,151),(98,7,'2025-10-10 05:52:47.633435',1,'C#',10,152),(99,1,'2025-10-27 08:42:24.774235',1,'Sql',1,153),(101,6,'2025-10-28 10:04:38.502886',6,'C#',10,156),(102,1,'2025-10-28 10:07:36.171200',6,'Django Framework',1,157),(103,1,'2025-11-03 14:41:50.496394',1,'Django Framework',1,161),(104,0,'2025-11-12 07:51:20.075200',1,'Django Framework',1,169);
/*!40000 ALTER TABLE `quizresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_app_remark`
--

DROP TABLE IF EXISTS `test_app_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_app_remark` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_app_remark`
--

LOCK TABLES `test_app_remark` WRITE;
/*!40000 ALTER TABLE `test_app_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_app_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_app_testsession`
--

DROP TABLE IF EXISTS `test_app_testsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_app_testsession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `started_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `finished_at` datetime(6) DEFAULT NULL,
  `total_score` double NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `topic_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_testsession_user` (`user_id`),
  KEY `fk_testsession_topic` (`topic_id`),
  CONSTRAINT `fk_testsession_topic` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_testsession_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_app_testsession`
--

LOCK TABLES `test_app_testsession` WRITE;
/*!40000 ALTER TABLE `test_app_testsession` DISABLE KEYS */;
INSERT INTO `test_app_testsession` VALUES (46,'2025-09-18 08:03:22.727864',NULL,0,1,16),(50,'2025-09-18 09:01:41.702491',NULL,0,1,16),(51,'2025-09-18 09:02:28.982125',NULL,0,1,16),(52,'2025-09-19 08:15:24.930649',NULL,0,1,16),(59,'2025-09-22 08:19:17.242496',NULL,0,1,16),(64,'2025-09-22 09:25:15.992640',NULL,0,1,16),(81,'2025-09-25 06:36:04.942254',NULL,0,1,16),(91,'2025-09-29 11:11:08.469952',NULL,0,1,14),(111,'2025-10-01 07:08:36.877294',NULL,0,1,14),(116,'2025-10-01 07:58:52.100668',NULL,0,1,16),(118,'2025-10-01 08:02:26.813934',NULL,0,1,14),(119,'2025-10-01 12:44:20.829863',NULL,0,1,16),(120,'2025-10-01 12:46:32.531443',NULL,0,1,3),(121,'2025-10-01 12:48:02.661029',NULL,0,1,3),(122,'2025-10-01 12:48:46.170856',NULL,0,1,3),(123,'2025-10-01 12:49:37.012939',NULL,0,1,3),(124,'2025-10-01 13:24:59.554224',NULL,0,1,3),(127,'2025-10-07 06:29:03.331951',NULL,0,1,16),(131,'2025-10-07 06:38:32.535110',NULL,0,1,4),(135,'2025-10-08 07:37:31.124755',NULL,0,1,16),(140,'2025-10-08 13:52:38.688563',NULL,0,1,16),(141,'2025-10-08 13:52:40.815286',NULL,0,1,16),(144,'2025-10-08 14:06:23.759966',NULL,0,1,16),(145,'2025-10-08 14:06:25.118556',NULL,0,1,16),(146,'2025-10-09 09:42:23.194998',NULL,0,1,16),(147,'2025-10-09 11:15:22.206062',NULL,0,1,16),(151,'2025-10-10 05:49:34.209831',NULL,0,1,16),(152,'2025-10-10 05:50:58.586255',NULL,0,1,11),(153,'2025-10-27 08:42:19.370083',NULL,0,1,3),(156,'2025-10-28 09:57:29.891839',NULL,0,6,11),(157,'2025-10-28 10:05:25.515476',NULL,0,6,16),(161,'2025-11-03 14:39:52.304299',NULL,0,1,16),(169,'2025-11-12 07:50:54.242045',NULL,0,1,16);
/*!40000 ALTER TABLE `test_app_testsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_app_textanswer`
--

DROP TABLE IF EXISTS `test_app_textanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_app_textanswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer_text` longtext NOT NULL,
  `is_reviewed` tinyint(1) NOT NULL,
  `score` double DEFAULT NULL,
  `feedback` longtext,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `question_id` bigint NOT NULL,
  `session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_app_textanswer_user_id_40990c7e_fk_auth_user_id` (`user_id`),
  KEY `test_app_textanswer_question_id_aae25d4d_fk_TextQuestion_id` (`question_id`),
  KEY `textanswer_session_id_fkey` (`session_id`),
  CONSTRAINT `test_app_textanswer_question_id_aae25d4d_fk_TextQuestion_id` FOREIGN KEY (`question_id`) REFERENCES `textquestion` (`id`),
  CONSTRAINT `test_app_textanswer_user_id_40990c7e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `textanswer_session_id_fkey` FOREIGN KEY (`session_id`) REFERENCES `test_app_testsession` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_app_textanswer`
--

LOCK TABLES `test_app_textanswer` WRITE;
/*!40000 ALTER TABLE `test_app_textanswer` DISABLE KEYS */;
INSERT INTO `test_app_textanswer` VALUES (56,'jggfjjjfj',0,NULL,NULL,'2025-09-18 08:03:31.946226',1,2,46),(65,'hsb hfsd',0,NULL,NULL,'2025-09-18 09:01:48.276024',1,2,50),(66,'hkfff',0,NULL,NULL,'2025-09-18 09:01:51.688079',1,4,50),(69,'nlnklnlk',0,NULL,NULL,'2025-09-18 09:02:34.493054',1,2,51),(70,'jjknkh jjvjv jl jhvbmb k',0,NULL,NULL,'2025-09-18 09:02:39.757326',1,4,51),(73,'hd df jdfb sfbd sbsdflbsdbjssssssssssssssssjdfklsdfsd dsfj dgjb gdfsbs g jdsfjr r',1,2,'','2025-09-19 08:15:52.020266',1,2,52),(74,'fff',1,2,'','2025-09-19 08:15:55.433202',1,4,52),(106,'18500 km',1,0,'75000 km ','2025-09-29 11:11:51.168059',1,9,91),(107,'sadv hvh sad sdavhj as asdvhja dasasd v',1,0,'0','2025-09-29 11:11:51.171234',1,4,91),(108,'Rabat',1,1,'gut','2025-09-29 11:11:51.203406',1,10,91),(112,'Mohammed 6',1,2,'','2025-10-01 07:09:28.616259',1,4,111),(113,'red',1,1,'','2025-10-01 07:09:28.619099',1,12,111),(114,'Rabat',1,1,'','2025-10-01 07:09:28.631992',1,10,111),(115,'750000 KM',1,1,'','2025-10-01 07:09:28.635372',1,9,111),(119,'vfjsd sdfh sdfjvj sdffffffffffffffffffffvh dsfv sdffffffffffffffffffffffffffffffffffffffmn sghdfa vfggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',1,2,'','2025-10-01 08:03:58.369703',1,4,118),(136,'Error Type',1,3,'','2025-10-08 14:07:12.539262',1,58,145),(137,')',1,1.5,'','2025-10-08 14:07:12.539617',1,56,145),(138,')',1,2,'','2025-10-09 09:43:12.147188',1,56,146),(139,'Type Error',1,3,'','2025-10-09 09:43:12.153794',1,58,146),(140,'no answer',0,NULL,NULL,'2025-10-09 11:16:28.508057',1,56,147),(146,')',0,NULL,NULL,'2025-10-10 05:49:55.259293',1,56,151),(147,'Error Type',0,NULL,NULL,'2025-10-10 05:49:55.271507',1,58,151),(148,'type Error',1,2,'nicht gut erlautet ','2025-10-28 10:07:04.071439',6,58,157),(149,')',1,1,'not bad ','2025-10-28 10:07:04.071127',6,56,157),(150,'Daten Type Error',1,3,'','2025-11-03 14:41:33.958482',1,58,161),(151,'messing \" ( \" in the end of the line',1,1,'this is the right messing bracket )','2025-11-03 14:41:33.959627',1,56,161),(152,'dddddddddddddddddddd',0,NULL,NULL,'2025-11-12 07:51:14.653197',1,58,169),(153,'ddddddddddddddddddddddd',0,NULL,NULL,'2025-11-12 07:51:14.654638',1,56,169);
/*!40000 ALTER TABLE `test_app_textanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_app_topictype`
--

DROP TABLE IF EXISTS `test_app_topictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_app_topictype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_app_topictype`
--

LOCK TABLES `test_app_topictype` WRITE;
/*!40000 ALTER TABLE `test_app_topictype` DISABLE KEYS */;
INSERT INTO `test_app_topictype` VALUES (1,'MCQ'),(3,'MCQ + Text'),(2,'Textfrage');
/*!40000 ALTER TABLE `test_app_topictype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_app_userprofile`
--

DROP TABLE IF EXISTS `test_app_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_app_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_image` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bio` text,
  `gradiantcolor2` text,
  `gradiantcolor1` text,
  `cover_angle` int NOT NULL DEFAULT '135',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_userprofile_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_app_userprofile`
--

LOCK TABLES `test_app_userprofile` WRITE;
/*!40000 ALTER TABLE `test_app_userprofile` DISABLE KEYS */;
INSERT INTO `test_app_userprofile` VALUES (1,'uploads/profile_images/passfotogeneratorcom-202509050913062060-single.jpg',1,'+4994619518582','','#c850c0','#4158d0',135),(2,'',5,NULL,'','#C850C0','#4158D0',135),(3,'',6,NULL,'','#fcfcfc','#37018d',135);
/*!40000 ALTER TABLE `test_app_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textquestion`
--

DROP TABLE IF EXISTS `textquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `textquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` longtext NOT NULL,
  `max_score` double NOT NULL,
  `topic_id` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TextQuestion_topic_id_8f9ace74_fk_Topics_Topic_id` (`topic_id`),
  CONSTRAINT `TextQuestion_topic_id_8f9ace74_fk_Topics_Topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textquestion`
--

LOCK TABLES `textquestion` WRITE;
/*!40000 ALTER TABLE `textquestion` DISABLE KEYS */;
INSERT INTO `textquestion` VALUES (2,'hallo',2,5,NULL),(4,'Whats the name of the king of Morocco ?',2,14,'uploads/text_questions/Flag_of_Morocco_IbCCnT9.svg.png'),(9,'how larg is the Moroccan Territory ?',1,14,'uploads/text_questions/Flag_of_Morocco_SqCinZg.svg.png'),(10,'What is the Capital of Morocco ?',1,14,'uploads/text_questions/Wydad_AC_crest_2022.svg.png'),(12,'what is the color of moroccan flag ?',2,14,'uploads/text_questions/Flag_of_Morocco.svg.png'),(56,'find Fehler im Code Syntaxfehler',3,16,'uploads/text_questions/2025-10-08_16_00_20-code_python_with_fehler_-_Google_Suche.png'),(58,'Find Fehler im Code Syntaxfehler',3,16,'uploads/text_questions/2025-10-08_16_01_54-code_python_with_fehler_-_Google_Suche.png');
/*!40000 ALTER TABLE `textquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  `topic` longtext,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `topic_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `Topics_created_by_id_9a8bec27_fk_auth_user_id` (`created_by_id`),
  KEY `fk_topics_topictype` (`topic_type_id`),
  CONSTRAINT `fk_topics_topictype` FOREIGN KEY (`topic_type_id`) REFERENCES `test_app_topictype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Topics_created_by_id_9a8bec27_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (3,'SQL (Structured Query Language) ist eine standardisierte Programmiersprache zur Verwaltung und Abfrage von Daten in relationalen Datenbanken. Es ermöglicht das Hinzufügen, Abrufen, Aktualisieren und Löschen von Daten sowie das Durchführen komplexer Abfragen.','uploads/topics/SQL.png','Sql','2025-07-29 10:40:37.388846',1,1,1),(4,'A network, in general, refers to a system of interconnected components. This can range from physical networks like computer networks and transportation networks to abstract networks like social networks and information networks.','uploads/topics/CN-1.jpg','Networks','2025-07-23 09:14:31.873378',2,1,1),(5,'Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals.','uploads/topics/git-blog-header.png','Git','2025-07-29 10:41:42.771501',1,1,1),(6,'Free. Cross-platform. Open source.\r\nA framework for building web apps and services with .NET and C#.','uploads/topics/aspnetcore-logo.png','ASP .NET','2025-07-29 10:43:34.919145',1,1,1),(7,'Docker helps developers build, share, run, and verify applications anywhere — without tedious environment configuration or management.','uploads/topics/Ou-sont-stockes-les-images-et-les-conteneurs-Docker-sur-2027844..png','Dokcer','2025-07-29 10:44:30.835302',1,1,1),(9,'Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.','uploads/topics/1_3IcLSFuT8PQg4cUBaRXH1A.png','Python','2025-07-29 08:01:31.648788',5,1,1),(11,'C# (see SHARP) is a general-purpose high-level programming language supporting multiple paradigms. C# encompasses static typing, strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.','uploads/topics/f13f625e-7f8e-4485-824f-3785a891bff3.jpg','C#','2025-09-16 14:10:09.640793',1,1,1),(14,'salasdfh ojkakj akj fa b bsbb fabf b','uploads/topics/Flag_of_Morocco.svg.png','Marokko','2025-09-16 14:09:34.650153',1,1,2),(16,'Django is a Python framework that makes it easier to create web sites using Python.\r\nDjango takes care of the difficult stuff so that you can concentrate on building your web applications.\r\nDjango emphasizes reusability of components, also referred to as DRY (Don\'t Repeat Yourself), and comes with ready-to-use features like login system, database connection and CRUD operations (Create Read Update Delete).','uploads/topics/Django-The-Python-Web-Framework.jpg','Django Framework','2025-11-13 09:40:22.895065',1,1,3);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wronganswer`
--

DROP TABLE IF EXISTS `wronganswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wronganswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `correct_answer` longtext NOT NULL,
  `selected_option` longtext NOT NULL,
  `quiz_result_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_app_wronganswer_quiz_result_id_66daa364_fk_test_app_` (`quiz_result_id`),
  CONSTRAINT `test_app_wronganswer_quiz_result_id_66daa364_fk_test_app_` FOREIGN KEY (`quiz_result_id`) REFERENCES `quizresult` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wronganswer`
--

LOCK TABLES `wronganswer` WRITE;
/*!40000 ALTER TABLE `wronganswer` DISABLE KEYS */;
INSERT INTO `wronganswer` VALUES (104,'gvsad vhasdv lha sdj','fdfddfdf','dfsdfsdfs',73),(110,'fgkls djk s','hjklh','nbkj b',82),(111,'What is sql ?','Query language','programming language',83),(112,'What is sql ?','Query language','programming language',84),(113,'What is sql ?','Query language','programming language',86),(114,'kkkkkkkkkkkkkkkk','kkkkkkkkkkkkkkkkkkkkk','kkkkkkkkkkkkkkkk',88),(115,'What does the acronym OSI stand for in the context of networking?','Open System Interconnection','Online Service Interaction',89),(116,'Wie lest mann aus einen nachricht in Python','print(Hello, Python!)','print(\"Hello, Python!\")',92),(118,'Welche Aussage ist korrekt zur Kapselung (Encapsulation)?','Daten und Methoden sind zusammen verpackt','Klassen können nicht erben',98),(119,'Welche Schlüsselwörter verwendet man, um Eigenschaften (Properties) in C# zu definieren?','set und get','value und return',98),(120,'Was macht das virtual-Schlüsselwort?','Ermöglicht das Überschreiben in abgeleiteten Klassen','Verhindert die Vererbung',98),(121,'Wie nennt man eine Klasse, die nicht instanziiert werden kann, sondern nur als Basis dient?','Abstrakte Klasse','Virtuelle Klasse',101),(122,'Was ist der Zweck eines Konstruktors in C#?','Ein Objekt zu initialisieren','Eine Methode zu überschreiben',101),(123,'Welche Schlüsselwörter verwendet man, um Eigenschaften (Properties) in C# zu definieren?','set und get','public und private',101),(124,'Was macht das virtual-Schlüsselwort?','Ermöglicht das Überschreiben in abgeleiteten Klassen','Verhindert die Vererbung',101),(125,'Wie lest mann aus einen nachricht in Python','print(\"Hello, Python!\")','print(Hello, Python!)',104);
/*!40000 ALTER TABLE `wronganswer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-15 11:41:25
