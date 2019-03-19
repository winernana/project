-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: miya
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add wheel',7,'add_wheel'),(20,'Can change wheel',7,'change_wheel'),(21,'Can delete wheel',7,'delete_wheel'),(22,'Can add shop',8,'add_shop'),(23,'Can change shop',8,'change_shop'),(24,'Can delete shop',8,'delete_shop'),(25,'Can add mainshow',9,'add_mainshow'),(26,'Can change mainshow',9,'change_mainshow'),(27,'Can delete mainshow',9,'delete_mainshow'),(28,'Can add goods',10,'add_goods'),(29,'Can change goods',10,'change_goods'),(30,'Can delete goods',10,'delete_goods'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add cart',12,'add_cart'),(35,'Can change cart',12,'change_cart'),(36,'Can delete cart',12,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(12,'app','cart'),(10,'app','goods'),(9,'app','mainshow'),(8,'app','shop'),(11,'app','user'),(7,'app','wheel'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 14:13:35.985794'),(2,'auth','0001_initial','2019-03-14 14:13:38.686184'),(3,'admin','0001_initial','2019-03-14 14:13:39.093250'),(4,'admin','0002_logentry_remove_auto_add','2019-03-14 14:13:39.254503'),(5,'app','0001_initial','2019-03-14 14:13:39.436764'),(6,'contenttypes','0002_remove_content_type_name','2019-03-14 14:13:39.676577'),(7,'auth','0002_alter_permission_name_max_length','2019-03-14 14:13:39.802642'),(8,'auth','0003_alter_user_email_max_length','2019-03-14 14:13:39.968983'),(9,'auth','0004_alter_user_username_opts','2019-03-14 14:13:39.996832'),(10,'auth','0005_alter_user_last_login_null','2019-03-14 14:13:40.106090'),(11,'auth','0006_require_contenttypes_0002','2019-03-14 14:13:40.111707'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-14 14:13:40.133504'),(13,'auth','0008_alter_user_username_max_length','2019-03-14 14:13:40.222778'),(14,'sessions','0001_initial','2019-03-14 14:13:40.276545'),(15,'app','0002_shop','2019-03-15 03:50:36.645291'),(16,'app','0003_mainshow','2019-03-15 08:16:41.325899'),(17,'app','0004_auto_20190315_1616','2019-03-15 08:17:01.733984'),(18,'app','0005_goods','2019-03-15 08:36:43.952136'),(19,'app','0006_user','2019-03-16 03:45:19.790579'),(20,'app','0007_cart','2019-03-18 13:56:04.625147');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3bhf1bpqehink8orw2o3dyztg0ukyuih','ODZmZDNhNmViZDBhNGYyNDAxMDNkODM4NzQ0Y2IyN2Q0MDkxMjM5ZDp7InRva2VuIjoiNTJlMzg2MTM1MWFiNjYxNTJlOWNkZTE4MjQxMmEwYjcifQ==','2019-04-02 03:05:39.408400'),('5y9m5u7jl6et8egjagq8ywokbko05e1b','M2RlNGE0Nzg3OTA4YWE3YjFmOWFmNzBjZDJlY2YyMWIwZmNjY2NlYTp7InRva2VuIjoiMmM1YzYxYTE0ZDYxMDI1ZmNlZWM2M2E5MmQ3YWMwMjEifQ==','2019-04-01 07:26:26.419459'),('7awim6itrhzc6bfz94n5x5quw8af5dco','OWFlZmNlMjk0OTA4ZTJlNjdjOTUzOWVlN2FmNTY0MjY5ZGNmMTZjMjp7InRva2VuIjoiODdmMjA5ZDg3NjBiOWZhMzBkYmQ2OTg0NWMyMzg3ZWIifQ==','2019-04-01 06:51:28.188320'),('knjje3ap29ogm2nf3pnodpihpy9owxxg','OTAwOGNjODU4NTFhNzQyMDljZmFhNzYzMDNmNWQ1NzBkMDJlYjI5ZTp7InRva2VuIjoiMWRhNmM5ZTc5ZGM5NjQ2ZWQyN2Y5OWE4MjA0MTIxZjgifQ==','2019-04-02 01:57:18.035732'),('lyrcg1n9z3daesbbmens24vl991i57cv','ZDRhOTU5ZmJlZWViMGM3ODE4ZTE1MjJhNzcwNGZjYmJkN2RkMTBlNDp7InRva2VuIjoiZmE5MGM3MWVlNzUwNmQ3MmQ0ZTVjMzE4NWZlZDJiZjQifQ==','2019-04-01 07:56:33.757157'),('m1bfviu9zuog8jcamsvsbmjwnnm5w8ml','ZGQyNWU3YTMwODY4ZTUzM2RmMTFmMWY5MjYxZDZhOGI3MGEyMGE0Mjp7InRva2VuIjoiNGIxY2Q5NGIxOTMxYWNmZGM3YzA2NGUzZDU3NjM1MjcifQ==','2019-04-01 06:05:15.518038'),('mt01ee28kva067nul7cwkkc35073s3ax','OWQwNTdkZWM4OWI0OTdiMTU3OGNiNmNjNWZiODU2OWM2N2FlYzQ5Mzp7InRva2VuIjoiOGIxZDhhYTgxOTZlZjU5NGExYzljZDYyN2Y1YjE1YjYifQ==','2019-04-02 03:14:42.770523'),('n9w3eqjm6m1fmt0qjjtf04v7sntmk2z4','OWI5NTJjNGZiNzA4YzlmYTA0MGI4MmVmODNhMTA5Y2U1MDYwMTRmODp7InRva2VuIjoiZmVmN2UzNTNjMmJlOGVjM2QyMWY2YjkxZjY0ODY1MGYifQ==','2019-04-01 07:53:14.494814'),('nlrn9zyxnt0hp9udhs70546bi0ijr3x9','ZGI1YjVhMzAwZjJkYjY2YTA2OWI5MjNmZDA3MGI0MDM4MGM5M2UzYjp7InRva2VuIjoiZDNmOWNiYTM4ODFlZjE0MDI3YzliYTg3ODE5ZjRmYjUifQ==','2019-04-01 14:26:48.627302'),('nmq5m13zzjns2a78c75ov0tvqny5rh8z','MTU0NDAwNTVhMjQxYjZkMTJjMjc1MGQ3NGQ0YTY4MzEwOWVlNTU1MTp7InRva2VuIjoiODRmNzE1YzY4NjlmYzUxMmYyN2EwYjZjMTI1YmVkMGUifQ==','2019-04-01 08:16:53.686499'),('q975cf1kfqcu7e7chk8apy9kcxc4wvaf','MTlkYzdhMDhlODUwNWZjNTQ3YTk0NTc4Y2M2NmY2MzA2ZDU5MmFhNDp7InRva2VuIjoiYjM0N2Q4YjJjMzJjOTAyYmU0MjYzMzkzMmQwMDY4MzUifQ==','2019-04-02 02:10:34.785168'),('r2nbxqqzme5dyc5bzd6z8hriwe6u86k2','ODEwY2U1YjU3NTg1NDhjOTQ2NWIxNjMyZDM2MzRhM2QwNjJkOTljYjp7InRva2VuIjoiZjdiMjQ0ZGE5ODU3NDcyZTAxYjdjYTBmNTVhMmFjNDQifQ==','2019-04-01 10:56:25.854514'),('xrbd8qzlvs0fjk6dzmoj4j883ba86rjp','OGFmYjk5OGJhMGY3MDI3YjJkYzQ3MjM3ODY5OWEzMWRhMjM5OTM4ODp7InRva2VuIjoiY2EzZTRkOGY0YjU3MmQxOTFlYzYxY2VkYzBjNmQwMWQifQ==','2019-04-01 01:49:03.623899'),('xt1ui86gj34tbeefo4ufu779ig1ivbw3','ODQzODM2ZGVkMDBlMDBkOGFjYWIwNGM2ZTU1MGFlN2I3Mjk0MmRiNjp7InRva2VuIjoiMzA5MjYzNzJkOGY2OWNkMmJhMWU0YTUzOTEyMzlmNmMifQ==','2019-04-01 07:51:13.207964');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_cart`
--

DROP TABLE IF EXISTS `miya_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `miya_cart_goods_id_4356e7dc_fk_miya_goods_id` (`goods_id`),
  KEY `miya_cart_user_id_05cd4ceb_fk_miya_user_id` (`user_id`),
  CONSTRAINT `miya_cart_goods_id_4356e7dc_fk_miya_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `miya_goods` (`id`),
  CONSTRAINT `miya_cart_user_id_05cd4ceb_fk_miya_user_id` FOREIGN KEY (`user_id`) REFERENCES `miya_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_cart`
--

LOCK TABLES `miya_cart` WRITE;
/*!40000 ALTER TABLE `miya_cart` DISABLE KEYS */;
INSERT INTO `miya_cart` VALUES (1,6,1,0,1,8),(2,2,1,0,5,8),(3,3,1,0,2,8),(4,9,1,0,2,9),(5,3,1,0,4,9),(6,3,1,0,5,9);
/*!40000 ALTER TABLE `miya_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_goods`
--

DROP TABLE IF EXISTS `miya_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productimg` varchar(200) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productlongname` varchar(200) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `marketprice` double NOT NULL,
  `productnum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_goods`
--

LOCK TABLES `miya_goods` WRITE;
/*!40000 ALTER TABLE `miya_goods` DISABLE KEYS */;
INSERT INTO `miya_goods` VALUES (1,'http://127.0.0.1:8000/static/img/23_tuijian.jpg','衣服','好看的衣服',20.00,25,100),(2,'http://127.0.0.1:8000/static/img/15_tuij.jpg','衣服','4646465衣服',20.00,25,100),(3,'http://127.0.0.1:8000/static/img/20_tuijian.jpg','餐具套装','1562餐具套装',20.00,25,100),(4,'http://127.0.0.1:8000/static/img/21_tuijian.jpg','套装','156247套装',20.00,25,155),(5,'http://127.0.0.1:8000/static/img/22_tuijian.jpg','套装1','8888888套装',20.00,25,100),(6,'http://127.0.0.1:8000/static/img/24_tuijian.jpg','套装2','666666套装',20.00,25,100),(7,'http://127.0.0.1:8000/static/img/25_tuijian.jpg','套装3','5858套装',200.00,245,100),(8,'http://127.0.0.1:8000/static/img/23_tuijian.jpg','套装4','686868套装',200.00,245,1400);
/*!40000 ALTER TABLE `miya_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_mainshow`
--

DROP TABLE IF EXISTS `miya_mainshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_mainshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trackid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `categoryid` varchar(20) NOT NULL,
  `brandname` varchar(100) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `childcid1` varchar(100) NOT NULL,
  `productid1` varchar(20) NOT NULL,
  `longname1` varchar(100) NOT NULL,
  `price1` varchar(20) NOT NULL,
  `marketprice1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `childcid2` varchar(100) NOT NULL,
  `productid2` varchar(20) NOT NULL,
  `longname2` varchar(100) NOT NULL,
  `price2` varchar(20) NOT NULL,
  `marketprice2` varchar(100) NOT NULL,
  `img3` varchar(100) NOT NULL,
  `childcid3` varchar(100) NOT NULL,
  `productid3` varchar(20) NOT NULL,
  `longname3` varchar(100) NOT NULL,
  `price3` varchar(20) NOT NULL,
  `marketprice3` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_mainshow`
--

LOCK TABLES `miya_mainshow` WRITE;
/*!40000 ALTER TABLE `miya_mainshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `miya_mainshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_shop`
--

DROP TABLE IF EXISTS `miya_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_shop`
--

LOCK TABLES `miya_shop` WRITE;
/*!40000 ALTER TABLE `miya_shop` DISABLE KEYS */;
INSERT INTO `miya_shop` VALUES (1,'http://127.0.0.1:8000/static/img/15_tuij.jpg','衣服','1464'),(2,'/static/img/20_tuijian.jpg','餐具套装','1562'),(3,'/static/img/21_tuijian.jpg','套装','1888'),(4,'/static/img/22_tuijian.jpg','套装1','1688'),(5,'/static/img/24_tuijian.jpg','套装2','1588'),(6,'/static/img/25_tuijian.jpg','套装3','1858');
/*!40000 ALTER TABLE `miya_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_user`
--

DROP TABLE IF EXISTS `miya_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_user`
--

LOCK TABLES `miya_user` WRITE;
/*!40000 ALTER TABLE `miya_user` DISABLE KEYS */;
INSERT INTO `miya_user` VALUES (8,'222222','4297f44b13955235245b2497399d7a93'),(9,'8888888','4297f44b13955235245b2497399d7a93');
/*!40000 ALTER TABLE `miya_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miya_wheel`
--

DROP TABLE IF EXISTS `miya_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miya_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miya_wheel`
--

LOCK TABLES `miya_wheel` WRITE;
/*!40000 ALTER TABLE `miya_wheel` DISABLE KEYS */;
INSERT INTO `miya_wheel` VALUES (1,'/static/images/1.jpg','彩妆','1'),(2,'/static/images/2.jpg','Aveeno洗护','2'),(3,'/static/images/3.jpg','雪地靴','3'),(4,'/static/images/4.jpg','集结号','4'),(5,'/static/images/5.jpg','湿巾','5'),(6,'/static/images/8.jpg','奶粉','6');
/*!40000 ALTER TABLE `miya_wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 12:02:17
