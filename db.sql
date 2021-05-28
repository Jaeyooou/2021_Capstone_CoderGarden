-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.23

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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',8,'add_authgroup'),(26,'Can change auth group',8,'change_authgroup'),(27,'Can delete auth group',8,'delete_authgroup'),(28,'Can view auth group',8,'view_authgroup'),(29,'Can add auth group permissions',9,'add_authgrouppermissions'),(30,'Can change auth group permissions',9,'change_authgrouppermissions'),(31,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(32,'Can view auth group permissions',9,'view_authgrouppermissions'),(33,'Can add auth permission',10,'add_authpermission'),(34,'Can change auth permission',10,'change_authpermission'),(35,'Can delete auth permission',10,'delete_authpermission'),(36,'Can view auth permission',10,'view_authpermission'),(37,'Can add auth user',11,'add_authuser'),(38,'Can change auth user',11,'change_authuser'),(39,'Can delete auth user',11,'delete_authuser'),(40,'Can view auth user',11,'view_authuser'),(41,'Can add auth user groups',12,'add_authusergroups'),(42,'Can change auth user groups',12,'change_authusergroups'),(43,'Can delete auth user groups',12,'delete_authusergroups'),(44,'Can view auth user groups',12,'view_authusergroups'),(45,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(49,'Can add django admin log',14,'add_djangoadminlog'),(50,'Can change django admin log',14,'change_djangoadminlog'),(51,'Can delete django admin log',14,'delete_djangoadminlog'),(52,'Can view django admin log',14,'view_djangoadminlog'),(53,'Can add django content type',15,'add_djangocontenttype'),(54,'Can change django content type',15,'change_djangocontenttype'),(55,'Can delete django content type',15,'delete_djangocontenttype'),(56,'Can view django content type',15,'view_djangocontenttype'),(57,'Can add django migrations',16,'add_djangomigrations'),(58,'Can change django migrations',16,'change_djangomigrations'),(59,'Can delete django migrations',16,'delete_djangomigrations'),(60,'Can view django migrations',16,'view_djangomigrations'),(61,'Can add django session',17,'add_djangosession'),(62,'Can change django session',17,'change_djangosession'),(63,'Can delete django session',17,'delete_djangosession'),(64,'Can view django session',17,'view_djangosession'),(65,'Can add member',7,'add_member'),(66,'Can change member',7,'change_member'),(67,'Can delete member',7,'delete_member'),(68,'Can view member',7,'view_member'),(69,'Can add sourcecode',18,'add_sourcecode'),(70,'Can change sourcecode',18,'change_sourcecode'),(71,'Can delete sourcecode',18,'delete_sourcecode'),(72,'Can view sourcecode',18,'view_sourcecode');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$9XWHupdGypvs$0MYkAFjCMUVHXvLvSNi7gHI2xGFgWIelIdVdhY+yQYo=','2021-05-13 14:07:40.359145',1,'root','','','jaehyen2@naver.com',1,1,'2021-04-02 06:58:01.435766');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-09 09:33:15.700112','3','Member object (3)',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','authgroup'),(9,'account','authgrouppermissions'),(10,'account','authpermission'),(11,'account','authuser'),(12,'account','authusergroups'),(13,'account','authuseruserpermissions'),(14,'account','djangoadminlog'),(15,'account','djangocontenttype'),(16,'account','djangomigrations'),(17,'account','djangosession'),(7,'account','member'),(18,'account','sourcecode'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-02 06:52:35.423782'),(2,'auth','0001_initial','2021-04-02 06:52:35.490447'),(3,'admin','0001_initial','2021-04-02 06:52:35.621039'),(4,'admin','0002_logentry_remove_auto_add','2021-04-02 06:52:35.660358'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-02 06:52:35.667528'),(6,'contenttypes','0002_remove_content_type_name','2021-04-02 06:52:35.718185'),(7,'auth','0002_alter_permission_name_max_length','2021-04-02 06:52:35.740038'),(8,'auth','0003_alter_user_email_max_length','2021-04-02 06:52:35.759206'),(9,'auth','0004_alter_user_username_opts','2021-04-02 06:52:35.766346'),(10,'auth','0005_alter_user_last_login_null','2021-04-02 06:52:35.791112'),(11,'auth','0006_require_contenttypes_0002','2021-04-02 06:52:35.792850'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-02 06:52:35.799831'),(13,'auth','0008_alter_user_username_max_length','2021-04-02 06:52:35.824531'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-02 06:52:35.854164'),(15,'auth','0010_alter_group_name_max_length','2021-04-02 06:52:35.869108'),(16,'auth','0011_update_proxy_permissions','2021-04-02 06:52:35.876889'),(17,'auth','0012_alter_user_first_name_max_length','2021-04-02 06:52:35.902143'),(18,'sessions','0001_initial','2021-04-02 06:52:35.912212'),(19,'account','0001_initial','2021-05-13 09:53:32.406248');
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
INSERT INTO `django_session` VALUES ('4bk146ly3u6hk7spn6jj02ed5tqgnoap','.eJxVjEEOwiAQRe_C2hCgKINL956BzDBTqRpISrsy3l2bdKHb_977L5VwXUpau8xpYnVWVh1-N8L8kLoBvmO9NZ1bXeaJ9KbonXZ9bSzPy-7-HRTs5VsTGvBAo_dDcNaiM3HAMVqJAJzJu2wF3BCDJWYOWeQE3kFAOFIOzqj3B9b-N6c:1lX6Iw:LAPxZbJYUl5odX6nOxtwaMfZT4QZWGE0kjTJ_IOM-NA','2021-04-29 18:01:26.904206'),('6slttgvxfwekmjxadnrr8isb0qcm12bt','e30:1lUkte:w-ke0GXJO4TlzXe4SVj_aOQixP7hYjCZz3BoO0tb5ro','2021-04-23 06:45:38.759358'),('7n337vudf51mym7inzzrg2n5bigc7oej','.eJxVjDsOwyAQRO9CHSEDhrVTpvcZ0MIuwUkEkj9VlLvHSG7cTPHmzXzFvvIi7gJzETfhcd-yb8jPdFB1ZQHjm0sr6IXlWWWsZVvmIJsiz3aVUyX-PE73cpBxzceaHRjoQogaWZNm29uUWBnSpicNkY8ck3W204AA5CiYAVSiUQ0OOYjfH6lNPBw:1lhC33:2NwY7H2TSOdlaT5cArwsF4Ih2Ca0D_RNamj_HPyLTnk','2021-05-27 14:10:45.864543'),('cxg4kajr5pi9qe9ho4hw9k9mqnv8qgi7','.eJxVjEEOwiAQRe_C2hCgKINL956BzDBTqRpISrsy3l2bdKHb_977L5VwXUpau8xpYnVWVh1-N8L8kLoBvmO9NZ1bXeaJ9KbonXZ9bSzPy-7-HRTs5VsTGvBAo_dDcNaiM3HAMVqJAJzJu2wF3BCDJWYOWeQE3kFAOFIOzqj3B9b-N6c:1lVmgd:BGmML4pLDL7EqasSk0jyPdyHOuI7bwD5vWR7qpFgznQ','2021-04-26 02:52:27.596646'),('lpubo8nxe1k179e9820kb2q76hosd992','e30:1lixsJ:964YjivtZZ_zWO6jS7FVsFxKH2Fi7R4e5wRhhJ_r-yM','2021-06-01 11:26:59.168893'),('ovpq3ryidae5gkk4895yn6s4euo091qj','.eJxVjEEOwiAQRe_C2hCgKINL956BzDBTqRpISrsy3l2bdKHb_977L5VwXUpau8xpYnVWVh1-N8L8kLoBvmO9NZ1bXeaJ9KbonXZ9bSzPy-7-HRTs5VsTGvBAo_dDcNaiM3HAMVqJAJzJu2wF3BCDJWYOWeQE3kFAOFIOzqj3B9b-N6c:1lUlgE:Jv-wvJPPxsHD2tdsAm892HYW35HjfZ3wpjAmgF4Dnr4','2021-04-23 07:35:50.982266'),('pfjojmr03aqr98jztm0rja1kr9n8diav','e30:1lUkw8:beQnMqY1l0_fOB15A6daIwXyQlCJBeFKWm83EecyuxM','2021-04-23 06:48:12.598870'),('s4w0v95abda5udk9gauqvtkx2af0zi3r','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWBKCs1E6AyEZ6K4O0DlQlbYJwujoKmJJSHrW3PiSFgApFLRp8lsaz9wegqzaF:1lSDl5:f_gRnrRZ1n9v8S1LSnZPnNYKmOTUeENhRhnXSM_bnKE','2021-04-16 06:58:19.578130'),('yn3im9y2hoa48dr1yycwx93dlvzb6ilq','e30:1llyGC:oxoS0EMdAGzxNsUCNCdv6QJdplhr1LwrFxSVjpw41-s','2021-06-09 18:28:04.801915');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `User_number` int NOT NULL AUTO_INCREMENT,
  `User_name` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `User_password` varchar(20) NOT NULL,
  PRIMARY KEY (`User_number`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_id_2` (`user_id`),
  UNIQUE KEY `user_id_3` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'jaehyun','jaehyen2','wogus12'),(2,'ahn','jaeyooou','1234'),(3,'최락현','fkr123','1234'),(4,'ahn','ahn','1234'),(5,'hon','hon','1234'),(8,'asdf','asdf','1234');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sourcecode`
--

DROP TABLE IF EXISTS `sourcecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sourcecode` (
  `User_code` longtext,
  `code_date` date DEFAULT NULL,
  `code_title` varchar(30) DEFAULT NULL,
  `process_time` double DEFAULT NULL,
  `User_number` int DEFAULT NULL,
  `code_number` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code_number`),
  KEY `User_number` (`User_number`),
  CONSTRAINT `sourcecode_ibfk_1` FOREIGN KEY (`User_number`) REFERENCES `member` (`User_number`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sourcecode`
--

LOCK TABLES `sourcecode` WRITE;
/*!40000 ALTER TABLE `sourcecode` DISABLE KEYS */;
INSERT INTO `sourcecode` VALUES ('print(hi\")',NULL,NULL,NULL,NULL,1),('hi','2020-01-16','init',NULL,NULL,2),('asdf',NULL,'init2',123,1,3),('hi',NULL,'example',2,4,4),('print(\"hi\")','2021-05-14','제목',0.0007679462432861328,4,5),('a = 10\r\nb = 20\r\nc = 30\r\nprint(a+b+c)','2021-05-14','Bubble_sort',0.0007901191711425781,4,6),('def a()\r\n	print(hi)\r\n	\r\na','2021-05-20','Bubble_sort',0.01025700569152832,4,7),('def a :\r\n	print(hi)\r\n	\r\na','2021-05-20','Bubble_sort',0.0006830692291259766,4,8),('\r\ndef solution(int a , int b):\r\n	pass\r\n\r\nif __name__ == \'__main__\':\r\n	print(\"hi\")','2021-05-20','Bubble_sort',0.000701904296875,4,9),('a = input()\r\n','2021-05-21','Bubble_sort',0.012362957000732422,4,10),('a = input(\"hi\")\r\n','2021-05-21','Bubble_sort',0.0026679039001464844,4,11),('asdf',NULL,NULL,NULL,NULL,12),('asdf',NULL,NULL,NULL,NULL,13),('asdf',NULL,NULL,NULL,NULL,14),('# include <stdio.h>\n# define SWAP(x, y, temp) ( (temp)=(x), (x)=(y), (y)=(temp) )\n# define MAX_SIZE 5\n\n// 선택 정렬\nvoid selection_sort(int list[], int n){\n  int i, j, least, temp;\n\n  // 마지막 숫자는 자동으로 정렬되기 때문에 (숫자 개수-1) 만큼 반복한다.\n  for(i=0; i<n-1; i++){\n    least = i;\n\n    // 최솟값을 탐색한다.\n    for(j=i+1; j<n; j++){\n      if(list[j]<list[least])\n        least = j;\n    }\n\n    // 최솟값이 자기 자신이면 자료 이동을 하지 않는다.\n    if(i != least){\n        SWAP(list[i], list[least], temp);\n    }\n  }\n}\n\nvoid main(){\n  int i;\n  i\n\n;\n;\n',NULL,NULL,NULL,NULL,15),('# include <stdio.h>\n# define SWAP(x, y, temp) ( (temp)=(x), (x)=(y), (y)=(temp) )\n# define MAX_SIZE 5\n\n// 선택 정렬\nvoid selection_sort(int list[], int n){\n  int i, j, least, temp;\n\n  // 마지막 숫자는 자동으로 정렬되기 때문에 (숫자 개수-1) 만큼 반복한다.\n  for(i=0; i<n-1; i++){\n    least = i;\n\n    // 최솟값을 탐색한다.\n    for(j=i+1; j<n; j++){\n      if(list[j]<list[least])\n      ',NULL,NULL,NULL,NULL,16),('# include <stdio.h>\n# define SWAP(x, y, temp) ( (temp)=(x), (x)=(y), (y)=(temp) )\n# define MAX_SIZE 5\n\n// 선택 정렬\nvoid selection_sort(int list[], int n){\n  int i, j, least, temp;\n\n  // 마지막 숫자는 자동으로 정렬되기 때문에 (숫자 개수-1) 만큼 반복한다.\n  for(i=0; i<n-1; i++){\n    least = i;\n\n    // 최솟값을 탐색한다.\n    for(j=i+1; j<n; j++){\n      if(list[j]<list[least])\n        least = j;\n    }\n\n    // 최솟값이 자기 자신이면 자료 이동을 하지 않는다.\n    if(i != least){\n        SWAP(list[i], list[least], temp);\n    }\n  }\n}\n\nvoid main(){\n  int i;\n  i\n\n;\n;',NULL,NULL,NULL,NULL,17),('def ff(a[]):\r\n	print(\"hi\")\r\n	\r\n	\r\na[] = [1,2,3,4,5]\r\nff(a)','2021-05-22','Bubble_sort',0.010567903518676758,4,18),('print(\"hi\")','2021-05-26','Bubble_sort',0.0019190311431884766,4,19),('print(\"hi\")','2021-05-26','Bubble_sort',0.0006339550018310547,4,20),('print(\"hi\")\r\nprint(\"hi\")\r\n','2021-05-27','Bubble_sort',0.0006148815155029297,4,21),('# version: Python3\r\n\r\n# please edit your code here:\r\n# code start\r\n\r\ndef solution():\r\n	pass\r\n\r\nif __name__ == \'__main__\':\r\n\r\n# code end\r\n\r\n','2021-05-27','Bubble_sort',0.005453824996948242,4,22);
/*!40000 ALTER TABLE `sourcecode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27  3:34:02
