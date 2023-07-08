-- MySQL dump 10.13  Distrib 8.0.33, for Linux (aarch64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add product',6,'add_product'),(22,'Can change product',6,'change_product'),(23,'Can delete product',6,'delete_product'),(24,'Can view product',6,'view_product'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add cart',8,'add_cart'),(30,'Can change cart',8,'change_cart'),(31,'Can delete cart',8,'delete_cart'),(32,'Can view cart',8,'view_cart'),(33,'Can add cart item',9,'add_cartitem'),(34,'Can change cart item',9,'change_cartitem'),(35,'Can delete cart item',9,'delete_cartitem'),(36,'Can view cart item',9,'view_cartitem'),(37,'Can add password reset request',10,'add_passwordresetrequest'),(38,'Can change password reset request',10,'change_passwordresetrequest'),(39,'Can delete password reset request',10,'delete_passwordresetrequest'),(40,'Can view password reset request',10,'view_passwordresetrequest'),(41,'Can add user profile',11,'add_userprofile'),(42,'Can change user profile',11,'change_userprofile'),(43,'Can delete user profile',11,'delete_userprofile'),(44,'Can view user profile',11,'view_userprofile');
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
  `phone_number` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-07-06 19:23:14.250739','1','Cart for admin',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(2,'2023-07-06 19:23:44.498260','1','Cart for admin',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(3,'2023-07-07 12:56:38.123898','1','admin',2,'[{\"changed\": {\"fields\": [\"Phone number\", \"Address\"]}}]',7,1),(4,'2023-07-07 15:28:23.635444','1','Cart for admin',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(5,'2023-07-07 15:28:44.602463','1','Cart for admin',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(6,'2023-07-07 17:11:14.428516','1','Cart for admin',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(7,'2023-07-07 18:13:24.931372','12','Cart for admin',3,'',8,1),(8,'2023-07-07 18:13:24.942400','11','Cart for admin',3,'',8,1),(9,'2023-07-07 18:13:24.949171','10','Cart for admin',3,'',8,1),(10,'2023-07-07 18:13:24.954162','9','Cart for admin',3,'',8,1),(11,'2023-07-07 18:13:24.958500','8','Cart for admin',3,'',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(8,'store','cart'),(9,'store','cartitem'),(10,'store','passwordresetrequest'),(6,'store','product'),(7,'store','user'),(11,'store','userprofile');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-07-02 12:25:13.516390'),(2,'auth','0001_initial','2023-07-02 12:25:13.722794'),(3,'admin','0001_initial','2023-07-02 12:25:13.769152'),(4,'admin','0002_logentry_remove_auto_add','2023-07-02 12:25:13.775848'),(5,'admin','0003_logentry_add_action_flag_choices','2023-07-02 12:25:13.780160'),(6,'contenttypes','0002_remove_content_type_name','2023-07-02 12:25:13.810203'),(7,'auth','0002_alter_permission_name_max_length','2023-07-02 12:25:13.831147'),(8,'auth','0003_alter_user_email_max_length','2023-07-02 12:25:13.840858'),(9,'auth','0004_alter_user_username_opts','2023-07-02 12:25:13.844808'),(10,'auth','0005_alter_user_last_login_null','2023-07-02 12:25:13.863270'),(11,'auth','0006_require_contenttypes_0002','2023-07-02 12:25:13.865022'),(12,'auth','0007_alter_validators_add_error_messages','2023-07-02 12:25:13.868828'),(13,'auth','0008_alter_user_username_max_length','2023-07-02 12:25:13.890037'),(14,'auth','0009_alter_user_last_name_max_length','2023-07-02 12:25:13.911355'),(15,'auth','0010_alter_group_name_max_length','2023-07-02 12:25:13.919514'),(16,'auth','0011_update_proxy_permissions','2023-07-02 12:25:13.925897'),(17,'auth','0012_alter_user_first_name_max_length','2023-07-02 12:25:13.953549'),(18,'sessions','0001_initial','2023-07-02 12:25:13.972590'),(19,'store','0001_initial','2023-07-02 12:25:13.982572'),(20,'store','0002_cart_user_cartitem_cart_products_cart_user','2023-07-02 12:25:14.156668'),(21,'store','0003_alter_product_id','2023-07-02 12:25:14.244521'),(22,'store','0004_cart_status','2023-07-06 16:42:58.888273'),(23,'store','0005_alter_cart_status','2023-07-06 16:57:58.953910'),(24,'store','0006_alter_cart_status','2023-07-06 17:50:37.695339'),(25,'store','0007_alter_cart_status','2023-07-06 18:03:02.040423'),(26,'store','0008_product_price_int','2023-07-06 18:15:16.040876'),(27,'store','0009_alter_product_price_int','2023-07-06 18:26:50.193901'),(28,'store','0010_userprofile_passwordresetrequest','2023-07-07 16:13:32.891585'),(29,'store','0011_alter_cart_user','2023-07-07 17:53:27.388768');
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
INSERT INTO `django_session` VALUES ('7lvgs54idysntl04nljn35rhr0puecwi','e30:1qHnQQ:H2hBNUhbnHjRApglSbun3iHOGBRN-7EEIyeFCxDpRc0','2023-07-21 15:31:14.653460'),('xhti2z0gkm3a54asg59sv8da77h99hoe','.eJxVizkOwjAQRe_iGkV2PN4oSU1Jbc3YYxmxRIqTCnF3jJQCur-89xIRt7XGrfESr1kchRKH340w3fj5Pdo6LzzsvQ3T1ofHpTPnOfP9tHN_csVWuylNKCCZMqmkNGimZHy2JuCojQrFGkADKhNaiyNBIe9dAgWyJ-e0eH8ACLI2cg:1qHoRo:yMm_6w7FAR3x0S3DEy6-uFcr8zTiZnuenfZObpXWc3c','2023-07-21 16:36:44.382252');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cart_user_id_99e99107` (`user_id`),
  CONSTRAINT `store_cart_user_id_99e99107_fk_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
INSERT INTO `store_cart` VALUES (1,'2023-07-06 19:22:53.708842','2023-07-07 17:50:17.158833',1,'PENDING'),(2,'2023-07-07 15:49:39.740858','2023-07-07 15:49:53.857923',2,'PENDING'),(7,'2023-07-07 17:53:31.249540','2023-07-07 18:07:01.883762',1,'PENDING'),(13,'2023-07-07 18:13:31.241898','2023-07-07 18:18:43.901093',1,'PENDING'),(14,'2023-07-07 18:18:48.948533','2023-07-07 18:19:12.456816',1,'PENDING'),(15,'2023-07-07 18:19:17.411960','2023-07-07 18:19:17.412012',1,'NOTCLOSED');
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cartitem`
--

DROP TABLE IF EXISTS `store_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cartitem_cart_id_4f60ac05_fk_store_cart_id` (`cart_id`),
  KEY `store_cartitem_product_id_4238d443_fk` (`product_id`),
  CONSTRAINT `store_cartitem_cart_id_4f60ac05_fk_store_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`),
  CONSTRAINT `store_cartitem_product_id_4238d443_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `store_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cartitem`
--

LOCK TABLES `store_cartitem` WRITE;
/*!40000 ALTER TABLE `store_cartitem` DISABLE KEYS */;
INSERT INTO `store_cartitem` VALUES (2,2,1,104),(3,1,2,1),(4,1,2,12),(5,2,7,2),(6,1,13,2),(7,1,14,2),(8,1,14,8),(9,1,15,4);
/*!40000 ALTER TABLE `store_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_passwordresetrequest`
--

DROP TABLE IF EXISTS `store_passwordresetrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_passwordresetrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_passwordresetrequest_user_id_03c10302_fk_store_user_id` (`user_id`),
  CONSTRAINT `store_passwordresetrequest_user_id_03c10302_fk_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_passwordresetrequest`
--

LOCK TABLES `store_passwordresetrequest` WRITE;
/*!40000 ALTER TABLE `store_passwordresetrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_passwordresetrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_link` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `screen` varchar(255) NOT NULL,
  `RAM` varchar(255) NOT NULL,
  `ROM` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `price_int` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (1,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/galaxys23ultra_front_green_221122_2.jpg','Samsung Galaxy S23 Ultra 256GB','6.8 inches','8 GB','256 GB','26.990.000₫',26990000),(2,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_18.png','iPhone 14 Pro Max 128GB | Chính hãng VN/A','6.7 inches','6 GB','128 GB','26.690.000₫',26690000),(3,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt_7766_3__1.jpg','Xiaomi Redmi Note 12','6.67 inches','4 GB','128 GB','4.590.000₫',4590000),(4,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/4/14_1_9_2_9.jpg','iPhone 13 128GB | Chính hãng VN/A','6.1 inches','4 GB','128 GB','16.490.000₫',16490000),(5,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-reno8t-vang1-thumb-600x600.jpg','OPPO Reno8 T 5G (8GB - 128GB)','6.7 inches','8GB + Mở rộng 8GB','128 GB','9.290.000₫',9290000),(6,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg','iPhone 11 64GB | Chính hãng VN/A','6.1 inches','4 GB','64 GB','10.490.000₫',10490000),(7,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-14-storage-select-202209-6-1inch-y889.jpg','iPhone 14 128GB | Chính hãng VN/A','6.1 inches','6 GB','128 GB','18.990.000₫',18990000),(8,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_51_1_7.jpg','iPhone 13 Pro Max 128GB | Chính hãng VN/A','6.7 inches','6 GB','128 GB','24.290.000₫',24290000),(9,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119.jpg','Samsung Galaxy S22 Ultra (8GB - 128GB)','6.8 inches','8 GB','128 GB','17.990.000₫',17990000),(10,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-20-fe_4_.jpg','Samsung Galaxy S20 FE 256GB','6.5 inches','8 GB','256 GB','7.490.000₫',7490000),(11,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png','iPhone 14 Pro Max 256GB | Chính hãng VN/A','6.7 inches','6 GB','256 GB','29.750.000₫',29750000),(12,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/2/n2_flip_-_combo_product_-_black.png','OPPO Find N2 Flip','6.8 inches','8 GB','256 GB','19.990.000₫',19990000),(13,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_282.jpg','vivo Y35','6.58 inches','8GB + Mở rộng 8GB','128 GB','5.990.000₫',5990000),(14,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_252.jpg','iPhone 12 64GB | Chính hãng VN/A','6.1 inches','4 GB','64 GB','14.690.000₫',14690000),(15,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-51_4.jpg','iPhone 14 Plus 128GB | Chính hãng VN/A','6.7 inches','6 GB','128 GB','21.290.000₫',21290000),(16,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_187_1.jpg','iPhone 11 128GB | Chính hãng VN/A','6.1 inches','4 GB','128 GB','12.190.000₫',12190000),(17,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt7766.jpg','Xiaomi Redmi Note 12 Pro 5G','6.67 inches','8 GB','256 GB','8.790.000₫',8790000),(18,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12t-den_1.jpg','Xiaomi 12T 8GB 128GB','6.67 inches','8 GB','128 GB','9.690.000₫',9690000),(19,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-redmi-note-12s.jpg','Xiaomi Redmi Note 12S','6.43 inches','8 GB','256 GB','6.190.000₫',6190000),(20,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_12.png','iPhone 14 Pro 128GB | Chính hãng VN/A','6.1 inches','6 GB','128 GB','24.490.000₫',24490000),(21,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_241_2.jpg','iPhone 12 128GB | Chính hãng VN/A','6.1 inches','4 GB','128 GB','15.690.000₫',15690000),(22,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_365.jpg','ASUS ROG Phone 7 Ultimate 16GB 512GB - Chỉ có tại CellphoneS','6.78 inches','16 GB','512 GB','29.990.000₫',29990000),(23,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_1.jpg','Samsung Galaxy Z Flip4 128GB','6.7 inches','8 GB','128 GB','15.990.000₫',15990000),(24,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/b/lb-galaxy-m14-sm-m146-sm-m146bzbvmea-535834833.png','Samsung Galaxy M14 5G 4GB 128GB','6.6 inches','4 GB','128 GB','3.990.000₫',3990000),(25,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/redmi-note-12-pro-4g-1-den.jpg','Xiaomi Redmi Note 12 Pro 4G 8GB 256GB','6.67 inches','8 GB','256 GB','7.490.000₫',7490000),(26,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12-pro_arenamobiles.jpg','Xiaomi 12 Pro (5G)','6.73 inches','12 GB','256 GB','14.490.000₫',14490000),(27,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_66_6_2_1_12.jpg','iPhone 13 Pro Max 256GB | Chính hãng VN/A','6.7 inches','6 GB','256 GB','26.590.000₫',26590000),(28,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_phantomblack_211119_2.jpg','Samsung Galaxy S22 Ultra (12GB - 256GB) - Độc quyền','6.8 inches','12 GB','256 GB','19.490.000₫',19490000),(29,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_13.png','iPhone 14 Pro 256GB | Chính hãng VN/A','6.1 inches','6 GB','256 GB','27.490.000₫',27490000),(30,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-g990_s21fe_backfront_lv.png','Samsung Galaxy S21 FE 8GB 128GB','6.4 inches','8 GB','128 GB','10.290.000₫',10290000),(31,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/g/_global-version_-sm-s911_galaxys23_back_cream_221122.jpg','Samsung Galaxy S23 8GB 256GB','6.1 inches','8 GB','256 GB','17.490.000₫',17490000),(32,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a34_3_.jpg','Samsung Galaxy A34 5G 8GB 128GB','6.6 inches','8 GB','128 GB','7.490.000₫',7490000),(33,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/3/13_liteee.jpg','Xiaomi 13 Lite','6.55 inches','8 GB','256 GB','9.690.000₫',9690000),(34,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-camon-20-1_2.png','Tecno Camon 20 Pro','6.67 inches','8 GB','256 GB','5.050.000₫',5050000),(35,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_fold_4-7.jpg','Samsung Galaxy Z Fold4','7.6 inches','12 GB','256 GB','29.490.000₫',29490000),(36,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/0/9/0989_4_.jpg','Tecno Spark 10 Pro 8GB 128GB','6.78 inches','8 GB','128 GB','3.650.000₫',3650000),(37,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m-iphone-14-pro_2.png','iPhone 14 Pro Max 512GB | Chính hãng VN/A','6.7 inches','6 GB','512 GB','35.990.000₫',35990000),(38,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1670745783.80967984.png','Xiaomi 13 8GB 256GB','6.36 inches','8 GB','256 GB','18.490.000₫',18490000),(39,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-a536_galaxy_a53_5g_awesome_peach004.jpg','Samsung Galaxy A53 (5G)','6.5 inches','8 GB','128 GB','6.790.000₫',6790000),(40,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a14_1_.jpg','Samsung Galaxy A14 5G','6.6 inches','4 GB','128 GB','4.690.000₫',4690000),(41,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/f/5/f5677.jpg','Xiaomi Redmi 12C 4GB 64GB','6.71 inches','4 GB','64 GB','2.750.000₫',2750000),(42,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a54_3_.jpg','Samsung Galaxy A54 5G 8GB 128GB','6.4 inches','8 GB','128 GB','9.490.000₫',9490000),(43,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/2/22_14.jpg','Samsung Galaxy A23 5G','6.6 inches','4 GB','128 GB','4.950.000₫',4950000),(44,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-camon-20-1.png','Tecno Camon 20','6.67 inches','8 GB','256 GB','4.400.000₫',4400000),(45,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/g/_global_version_sm-s916_galaxys23plus_front_cream_221122_2.jpg','Samsung galaxy S23 Plus 8GB 512GB','6.6 inches','8 GB','512 GB','21.490.000₫',21490000),(46,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/galaxys23ultra_front_green_221122_1.jpg','Samsung Galaxy S23 Ultra 12GB 512GB','6.8 inches','12 GB','512 GB','31.990.000₫',31990000),(47,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/0/9/0989.jpg','Tecno Pova 4 Pro 8GB 256GB','6.66 inches','8 GB','256 GB','5.290.000₫',5290000),(48,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/g/rgrgrtyt6.jpg','realme C55 6GB 128GB','6.72 inches','6 GB','128 GB','4.390.000₫',4390000),(49,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-51_6.jpg','iPhone 14 Plus 256GB | Chính hãng VN/A','6.7 inches','6 GB','256 GB','23.590.000₫',23590000),(50,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/h/white-7e6a0f537b.png','realme 10 8GB 256GB','6.4 inches','8 GB','256 GB','5.790.000₫',5790000),(51,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_23__4_6.png','Vivo V27e 8GB 256GB','6.62 inches','8 GB','256 GB','8.190.000₫',8190000),(52,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/b/g/bgf.png','ASUS ROG Phone 6 12GB 256GB','6.78 inches','12 GB','256 GB','14.990.000₫',14990000),(53,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/7/d78000_6_.jpg','Xiaomi POCO X5 Pro 5G 6GB 128GB','6.67 inches','6 GB','128 GB','7.390.000₫',7390000),(54,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-6-12gb-256gb_2.png','ASUS ROG Phone 6 16GB 512GB - Chỉ có tại CellphoneS','6.78 inches','16 GB','512 GB','17.990.000₫',17990000),(55,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/g/dgtyi8899_.jpg','Nokia G22 4GB 128GB','6.52 inches','4 GB','128 GB','3.420.000₫',3420000),(56,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/f/v/fvssxa.jpg','Xiaomi POCO M5 4GB 64GB','6.58 inches','4 GB','64 GB','3.400.000₫',3400000),(57,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/e/d/edobfefy.jpg','OnePlus Nord CE 3 Lite - Chỉ có tại CellphoneS','6.72 inches','8 GB','256 GB','5.990.000₫',5990000),(58,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a14-4g.jpg','Samsung Galaxy A14 4G','6.6 inches','4 GB','128 GB','3.890.000₫',3890000),(59,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-51_2.jpg','iPhone 14 256GB | Chính hãng VN/A','6.1 inches','6 GB','256 GB','21.990.000₫',21990000),(60,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a73-1-600x600_3.jpg','Samsung Galaxy A73 128GB','6.7 inches','8 GB','128 GB','10.490.000₫',10490000),(61,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/g/_global_version_sm-s916_galaxys23plus_front_cream_221122.jpg','Samsung Galaxy S23 Plus 8GB 256GB','6.6 inches','8 GB','256 GB','19.990.000₫',19990000),(62,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_366.jpg','ASUS ROG Phone 7 16GB 512GB','6.78 inches','16 GB','512 GB','24.990.000₫',24990000),(63,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/7/d78000_2__1.jpg','POCO X5 5G 6GB 128GB - Chỉ có tại CellphoneS','6.67 inches','6 GB','128 GB','5.450.000₫',5450000),(64,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi_redmi_note_.jpg_pro_5g_blanco_01_l.jpg','Xiaomi Redmi Note 11 Pro 5G','6.67 inches','8 GB','128 GB','6.990.000₫',6990000),(65,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_product_-_reno8_4g_-_gold.png','OPPO Reno8','6.4 inches','8 GB','256 GB','7.490.000₫',7490000),(66,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_250_1.jpg','Nokia C31 4GB 128GB','6.7 inches','4 GB','128 GB','2.550.000₫',2550000),(67,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-mi-11-lite-5g-2_10.png','Xiaomi Mi 11 Lite 5G','6.55 inches','8 GB','128 GB','7.490.000₫',7490000),(68,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/9/_/9_ro_plus.png','realme 9 Pro Plus','6.4 inches','8 GB','128 GB','5.690.000₫',5690000),(69,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/galaxy_a13.jpg','Samsung Galaxy A13 (4G)','6.6 inches','4 GB','128 GB','4.190.000₫',4190000),(70,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/1/11-pro-plus-blue.jpg','Xiaomi Redmi Note 11 Pro Plus 5G - Chỉ có tại CellphoneS','6.67 inches','8 GB','256 GB','8.190.000₫',8190000),(71,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-spark-10_5_.png','Tecno Spark 10 8GB 128GB','6.56 inches','8 GB','128 GB','3.190.000₫',3190000),(72,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a04s_1__1.jpg','Samsung Galaxy A04s','6.5 inches','4 GB','64 GB','3.490.000₫',3490000),(73,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-11-lite-5g-014_1.jpg','Xiaomi 11 Lite 5G NE','6.55 inches','8 GB','128 GB','6.590.000₫',6590000),(74,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/t/itel-s23-2.jpg','Itel S23 8GB 128GB','6.6 inches','8 GB','128 GB','2.690.000₫',2690000),(75,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/0/9/0989_4__1.jpg','Tecno Spark 10 Pro 8GB 256GB','6.78 inches','8 GB','256 GB','4.090.000₫',4090000),(76,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a04_2_.jpg','Samsung Galaxy A04','6.5 inches','3 GB','32 GB','2.490.000₫',2490000),(77,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/galaxys23ultra_front_green_221122.jpg','Samsung Galaxy S23 Ultra 12GB 1TB','6.8 inches','12 GB','1 TB','35.990.000₫',35990000),(78,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a57_-_black.jpg','OPPO A57 4GB 64GB','6.56 inches','4 GB','64 GB','3.790.000₫',3790000),(79,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-a546_galaxy_a54_5g_awesome_violet_front_2.png','Samsung Galaxy A54 8GB 256GB','6.4 inches','8 GB','256 GB','9.990.000₫',9990000),(80,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/7/d78000_6__2.jpg','Xiaomi POCO X5 Pro 8GB 256GB','6.67 inches','8 GB','256 GB','7.390.000₫',7390000),(81,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus_11_-_black_-_rgb.jpg','OnePlus 11 16GB 256GB','6.7 inches','16 GB','256 GB','19.690.000₫',19690000),(82,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/f/v/fvssxa_3.jpg','Xiaomi POCO M5 6GB 128GB','6.58 inches','6 GB','128 GB','4.050.000₫',4050000),(83,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-a23-cam-thumb-600x600_1.jpg','Samsung Galaxy A23 4G','6.6 inches','4 GB','128 GB','4.750.000₫',4750000),(84,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_2.jpg','Samsung Galaxy Z Flip4 256GB','6.7 inches','8 GB','256 GB','17.990.000₫',17990000),(85,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/g/rgrgrtyt6_1.jpg','realme C55 8GB 256GB','6.72 inches','8 GB','256 GB','5.290.000₫',5290000),(86,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/f/f/ffet45444_1_.jpg','Infinix Hot 30i 4GB 128GB','6.56 inches','4GB + Mở rộng 4GB','128 GB','2.390.000₫',2390000),(87,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/v/dvfdgty.jpg','ASUS ROG Phone 6 Batman 12GB 256GB','6.78 inches','12 GB','256 GB','16.690.000₫',16690000),(88,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_product_-_reno8_5g_-_black.png','OPPO Reno8 5G 8GB 256GB','6.4 inches','8 GB','256 GB','13.990.000₫',13990000),(89,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/8/0/800x800-640x640-5.png','Xiaomi Redmi Note 11 128GB','6.43 inches','4 GB','128 GB','4.090.000₫',4090000),(90,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi_poco_f4_verde_01_l.jpg','Xiaomi Poco F4','6.67 inches','6 GB','128 GB','7.790.000₫',7790000),(91,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a55_-_xanh_-_cmyk.jpg','OPPO A55','6.5 inches','4 GB','64 GB','3.490.000₫',3490000),(92,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a77s-_en_2.jpg','OPPO A77s','6.56 inches','8 GB','128 GB','6.290.000₫',6290000),(93,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/0/4/04_2_4.png','Samsung Galaxy A52s 5G','6.5 inches','8 GB','128 GB','10.990.000₫',10990000),(94,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_product_-_rainbow_spectrum_-_reno7_z.png','OPPO Reno7 Z (5G)','6.43 inches','8 GB','128 GB','7.000.000₫',7000000),(95,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo_reno6.jpg','OPPO Reno6 Z 5G','6.43 inches','8 GB','128 GB','6.790.000₫',6790000),(96,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/6/3/638106969904674603_oppo-reno8-t-4g-den-5.jpg','OPPO Reno8 T 256GB','6.4 inches','8 GB','256 GB','8.490.000₫',8490000),(97,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a57_-_black_3.jpg','OPPO A57 4GB 128GB','6.56 inches','4 GB','128 GB','4.390.000₫',4390000),(98,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_fn77_2.jpg','Xiaomi POCO M5s 6GB 128GB','6.43 inches','6 GB','128 GB','4.690.000₫',4690000),(99,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/1/w1q1111c_.jpg','Redmi A1','6.52 inches','2 GB','32 GB','1.750.000₫',1750000),(100,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/s/1sdcsc_2.jpg','realme C33 4GB 64GB','6.5 inches','4 GB','64 GB','2.820.000₫',2820000),(101,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/7/d78000_2__1_2.jpg','POCO X5 5G 8GB 256GB','6.67 inches','8 GB','256 GB','6.350.000₫',6350000),(102,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_42__3.png','OPPO Reno 7 Pro','6.5 inches','12 GB','256 GB','11.190.000₫',11190000),(103,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/2/s22_3.jpg','Samsung Galaxy S22 Plus (8GB - 256GB)','6.6 inches','8 GB','256 GB','18.990.000₫',18990000),(104,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/red-magic-7-1_7hxhmi7_1.jpg','Nubia Red Magic 7 Pusar 16GB 256GB','6.8 inches','16 GB','256 GB','18.990.000₫',18990000),(105,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-c30s-den-glr--009.jpg','realme C30s 2GB 32GB','6.5 inches','2 GB','32 GB','1.790.000₫',1790000),(106,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_product_-_blue_-_reno7_5g.png','OPPO Reno7 (5G)','6.43 inches','8 GB','256 GB','7.590.000₫',7590000),(107,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-g11-plus-blue_2.jpg','Nokia G11 Plus 3GB 32GB','6.51 inches','3 GB','32 GB','2.090.000₫',2090000),(108,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-s21-fe.png','Samsung Galaxy S21 FE 5G (8GB - 256GB)','6.4 inches','8 GB','256 GB','15.690.000₫',15690000),(109,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/9/c91ba5bf721d5b2d4eae4f821b8e4ced.png','vivo V23e','6.44 inches','8 GB','128 GB','5.490.000₫',5490000),(110,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a16k_-_black.jpg','OPPO A16K','6.52 inches','3 GB','32 GB','2.390.000₫',2390000),(111,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_fold_4-7_3.jpg','Samsung Galaxy Z Fold4 512GB','7.6 inches','12 GB','512 GB','30.790.000₫',30790000),(112,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus10t.jpg','Oneplus 10T 5G 16GB 256GB','6.7 inches','16 GB','256 GB','15.990.000₫',15990000),(113,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a17k_-_gold_-_cmyk.jpg','OPPO A17K','6.56 inches','3 GB','64 GB','2.990.000₫',2990000),(114,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/b/1/b1ppr0nazrpqahyt.jpg','OPPO A17','6.56 inches','4 GB','64 GB','3.990.000₫',3990000),(115,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/1/t1x_01.png','vivo T1X','6.58 inches','4GB + Mở rộng 1GB','64 GB','3.890.000₫',3890000),(116,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/o/poco-x4-pro.jpg','Xiaomi POCO X4 Pro','6.67 inches','6 GB','128 GB','6.090.000₫',6090000),(117,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1650393946.86423132.png','Xiaomi Redmi 10A','6.53 inches','2 GB','32 GB','2.650.000₫',2650000),(118,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus_11_-_black_-_rgb_1.jpg','OnePlus 11 8GB 128GB','6.7 inches','8 GB','128 GB','17.490.000₫',17490000),(119,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-c21-plus-600x600.jpg','Nokia C21 Plus 2GB 64GB','6.52 inches','2 GB','64 GB','1.790.000₫',1790000),(120,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/s/1sdcsc.jpg','realme C33 3GB 32GB','6.5 inches','3 GB','32 GB','2.420.000₫',2420000),(121,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/gallery-pc-img1_2.jpg','Vivo X80 Pro','6.78 inches','12 GB','256 GB','14.990.000₫',14990000),(122,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-5_0002_gsmarena_001_3_1.jpg','ASUS ROG Phone 5S 16GB 256GB','6.78 inches','16 GB','256 GB','17.690.000₫',17690000),(123,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/f/2fd21c69b0cae924821762ec8270b62e.png','vivo Y22S 8GB 128GB','6.55 inches','8GB + Mở rộng 8GB','128 GB','5.290.000₫',5290000),(124,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/n/oneplus10tblack_1.jpg','Oneplus 10T 5G 8GB 128GB','6.7 inches','8 GB','128 GB','13.990.000₫',13990000),(125,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/ip179999_00.jpg','vivo V25 Pro 8GB 128GB','6.56 inches','8GB + Mở rộng 8GB','128 GB','9.990.000₫',9990000),(126,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-8-5g-blue-1-600x600_1.jpg','realme 8 5G','6.5 inches','8 GB','128 GB','6.290.000₫',6290000),(127,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-c21-plus-600x600_2.jpg','Nokia C21 Plus 3GB 32GB','6.5 inches','3 GB','32 GB','1.990.000₫',1990000),(128,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-c30s-den-glr--009_3_3.jpg','realme C30s 3GB 64GB','6.5 inches','3 GB','64 GB','2.390.000₫',2390000),(129,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_250.jpg','Nokia C31 3GB 32GB','6.7 inches','3 GB','32 GB','2.150.000₫',2150000),(130,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y16-den.jpg','vivo Y16','6.51 inches','4GB + Mở rộng 1GB','128 GB','4.190.000₫',4190000),(131,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02s-thumb-1-2-600x600.jpg','vivo Y02s 3G 32GB','6.51 inches','3 GB','32 GB','2.890.000₫',2890000),(132,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/1/t1x_01_2.png','vivo T1X 8GB 128GB','6.58 inches','8 GB','128 GB','4.990.000₫',4990000),(133,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo_v25_5g_8gb_128gb-removebg-preview_1.png','vivo V25 5G 8GB 128GB','6.44 inches','8GB + Mở rộng 8GB','128 GB','8.490.000₫',8490000),(134,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/4/542434226_3.jpeg','vivo Y22S 4GB 128GB','6.55 inches','4 GB','128 GB','4.390.000₫',4390000),(135,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivov25e.png','vivo V25e 8GB 128GB','6.44 inches','8 GB','128 GB','7.790.000₫',7790000),(136,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02-002.jpg','vivo Y02','6.51 inches','2 GB','32 GB','2.590.000₫',2590000),(137,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02s-thumb-1-2-600x600_3.jpg','vivo Y02s 3GB 64GB','6.51 inches','3 GB','64 GB','3.190.000₫',3190000),(138,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/_/d_nnen_4__1.jpg','Vivo Y02A 3GB 32GB','6.51 inches','3 GB','32 GB','2.690.000₫',2690000),(139,'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/b/l/black_2_6.png','Tecno Spark Go 4GB 64GB','6.6 inches','4GB + Mở rộng 3GB','64 GB','2.490.000₫',2490000);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user`
--

DROP TABLE IF EXISTS `store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `phone_number` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user`
--

LOCK TABLES `store_user` WRITE;
/*!40000 ALTER TABLE `store_user` DISABLE KEYS */;
INSERT INTO `store_user` VALUES (1,'pbkdf2_sha256$600000$QAyoxL8KJWJHGT0gsNcKgd$aN3U9DWPPA28XmKY77y2ONmGeDfmh19EVPM5szl7c+E=','2023-07-07 16:36:44.376348',1,'admin','','','lct@admin.com',1,1,'2023-07-06 18:22:16.000000','090009090','HCMC'),(2,'pbkdf2_sha256$600000$xVk4KWuggFnmD8gAsy3hXC$8k7TQjNCIfN9pgNpOhbxYh1JVsx6/dtvtVqasLgqdtM=','2023-07-07 16:24:08.028284',0,'testuser','','','',0,1,'2023-07-07 15:31:14.513491','0989897875','Q10');
/*!40000 ALTER TABLE `store_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user_groups`
--

DROP TABLE IF EXISTS `store_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_user_groups_user_id_group_id_d5c2dca2_uniq` (`user_id`,`group_id`),
  KEY `store_user_groups_group_id_def3ecb1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `store_user_groups_group_id_def3ecb1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `store_user_groups_user_id_f76ad019_fk_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user_groups`
--

LOCK TABLES `store_user_groups` WRITE;
/*!40000 ALTER TABLE `store_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user_user_permissions`
--

DROP TABLE IF EXISTS `store_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_user_user_permissions_user_id_permission_id_bfd44b7c_uniq` (`user_id`,`permission_id`),
  KEY `store_user_user_perm_permission_id_d9830978_fk_auth_perm` (`permission_id`),
  CONSTRAINT `store_user_user_perm_permission_id_d9830978_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `store_user_user_permissions_user_id_31a90150_fk_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user_user_permissions`
--

LOCK TABLES `store_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `store_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_userprofile`
--

DROP TABLE IF EXISTS `store_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `store_userprofile_user_id_6db609dc_fk_store_user_id` FOREIGN KEY (`user_id`) REFERENCES `store_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_userprofile`
--

LOCK TABLES `store_userprofile` WRITE;
/*!40000 ALTER TABLE `store_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08 16:37:07
