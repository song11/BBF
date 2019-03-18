-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: django_bbf
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_user_id_f25a9fc4_fk_user_id` (`user_id`),
  CONSTRAINT `app_order_user_id_f25a9fc4_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (1,'2019-03-18 02:29:51.973022','2019-03-18 02:29:51.973112',0,'201903180229515266',1),(2,'2019-03-18 07:04:29.334563','2019-03-18 07:04:29.334597',2,'201903180704291495',1),(3,'2019-03-18 07:04:59.530249','2019-03-18 07:04:59.530286',0,'201903180704593959',1),(4,'2019-03-18 07:05:04.561305','2019-03-18 07:05:04.561340',1,'201903180705045224',1),(5,'2019-03-18 07:05:08.428441','2019-03-18 07:05:08.428542',0,'201903180705088698',1),(6,'2019-03-18 07:25:49.304648','2019-03-18 07:25:49.304685',2,'201903180725498661',1),(7,'2019-03-18 07:54:42.324919','2019-03-18 07:54:42.324965',0,'201903180754421185',1);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_ordergoods`
--

DROP TABLE IF EXISTS `app_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ordergoods_goods_id_b3c19f94_fk_goods_5_id` (`goods_id`),
  KEY `app_ordergoods_order_id_ef926487_fk_app_order_id` (`order_id`),
  CONSTRAINT `app_ordergoods_goods_id_b3c19f94_fk_goods_5_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_5` (`id`),
  CONSTRAINT `app_ordergoods_order_id_ef926487_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_ordergoods`
--

LOCK TABLES `app_ordergoods` WRITE;
/*!40000 ALTER TABLE `app_ordergoods` DISABLE KEYS */;
INSERT INTO `app_ordergoods` VALUES (1,23,1,1),(2,3,3,1),(3,2,2,1),(4,8,1,2),(5,7,4,2),(6,5,5,2),(7,7,2,2),(8,2,1,6),(9,5,4,6);
/*!40000 ALTER TABLE `app_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add index baner sll',7,'add_indexbanersll'),(20,'Can change index baner sll',7,'change_indexbanersll'),(21,'Can delete index baner sll',7,'delete_indexbanersll'),(22,'Can add index drb',8,'add_indexdrb'),(23,'Can change index drb',8,'change_indexdrb'),(24,'Can delete index drb',8,'delete_indexdrb'),(25,'Can add index louti',9,'add_indexlouti'),(26,'Can change index louti',9,'change_indexlouti'),(27,'Can delete index louti',9,'delete_indexlouti'),(28,'Can add index mrb',10,'add_indexmrb'),(29,'Can change index mrb',10,'change_indexmrb'),(30,'Can delete index mrb',10,'delete_indexmrb'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add goods',12,'add_goods'),(35,'Can change goods',12,'change_goods'),(36,'Can delete goods',12,'delete_goods'),(37,'Can add goods_5',13,'add_goods_5'),(38,'Can change goods_5',13,'change_goods_5'),(39,'Can delete goods_5',13,'delete_goods_5'),(40,'Can add cart',14,'add_cart'),(41,'Can change cart',14,'change_cart'),(42,'Can delete cart',14,'delete_cart'),(43,'Can add order',15,'add_order'),(44,'Can change order',15,'change_order'),(45,'Can delete order',15,'delete_order'),(46,'Can add order goods',16,'add_ordergoods'),(47,'Can change order goods',16,'change_ordergoods'),(48,'Can delete order goods',16,'delete_ordergoods');
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `isdelect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_goods_id_a0c55193_fk_goods_5_id` (`goods_id`),
  KEY `cart_user_id_1361a739_fk_user_id` (`user_id`),
  CONSTRAINT `cart_goods_id_a0c55193_fk_goods_5_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_5` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(14,'app','cart'),(12,'app','goods'),(13,'app','goods_5'),(7,'app','indexbanersll'),(8,'app','indexdrb'),(9,'app','indexlouti'),(10,'app','indexmrb'),(15,'app','order'),(16,'app','ordergoods'),(11,'app','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 07:52:40.400933'),(2,'auth','0001_initial','2019-03-14 07:52:41.251848'),(3,'admin','0001_initial','2019-03-14 07:52:41.565854'),(4,'admin','0002_logentry_remove_auto_add','2019-03-14 07:52:41.593825'),(5,'contenttypes','0002_remove_content_type_name','2019-03-14 07:52:41.663421'),(6,'auth','0002_alter_permission_name_max_length','2019-03-14 07:52:41.745875'),(7,'auth','0003_alter_user_email_max_length','2019-03-14 07:52:41.794556'),(8,'auth','0004_alter_user_username_opts','2019-03-14 07:52:41.806364'),(9,'auth','0005_alter_user_last_login_null','2019-03-14 07:52:41.856075'),(10,'auth','0006_require_contenttypes_0002','2019-03-14 07:52:41.860418'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-14 07:52:41.876643'),(12,'auth','0008_alter_user_username_max_length','2019-03-14 07:52:41.981196'),(13,'sessions','0001_initial','2019-03-14 07:52:42.031242'),(14,'app','0001_initial','2019-03-15 01:47:42.767506'),(15,'app','0002_user','2019-03-15 06:36:13.925451'),(16,'app','0003_auto_20190315_0640','2019-03-15 06:40:29.858560'),(17,'app','0004_goods','2019-03-15 10:57:08.463626'),(18,'app','0004_goods_5','2019-03-15 11:09:13.982791'),(19,'app','0005_goods','2019-03-15 11:24:11.158971'),(20,'app','0005_cart','2019-03-16 04:05:20.955144'),(21,'app','0006_order_ordergoods','2019-03-17 11:14:22.511406');
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
INSERT INTO `django_session` VALUES ('4180bfoub8359nz2fdceiz9e8hhci0cl','NDZjYmNkYWE3Mzg1MGFjNTVjYjE1ZDFmOWJhYTM4NjFiYmFkZjI5MDp7InRva2VuIjoiMTUxMDU3ODU5OWZkMmY0NTE3YWM3NzNiN2VjZmJjNzIifQ==','2019-04-01 02:32:03.837384'),('60hctbk7oydn24uok6scl2encxgf913r','YmFlNzdmMzE1MmQ0MjVmOWYzMmJkZjNkZDU2MzA2ZDZmN2ZhZTZmZDp7InRva2VuIjoiMWY4Y2Q1YWJlN2MyMzNkODIyMjc0MzNmNjRmNDEwYmIifQ==','2019-04-01 08:13:03.936519'),('64njlw431j3e5qitr9g1zsz2o2pm4kr1','MDAyNWQ4Mzc3NDNmMjZiYTA4ZWE3ZWU4NjMwYzUwMWJlYTQ2NmE2MTp7InRva2VuIjoiMzBiMTBmNmFiMGQ1NmM5MTI4MmIwODBjYjE2MzBjMWUifQ==','2019-04-01 02:11:32.475022'),('6pu4rts2bi84s53hex2590x1b7wnvtif','YWFlNGUwZDQzZGEzNDRmYThlMzE4ZmFkOWMyMTVmZjdmYTM3MDI5YTp7InRva2VuIjoiZWE4OGQyMzljMDAwZmM2NjBiZjgwYjc1M2QyMmRmODMifQ==','2019-04-01 06:14:38.779926'),('74npb613gylzlsrhh2w0lbrt6oxycik5','MDZhMjcxNTliMjFkYzA4Y2I2OTY3ZWZmMGU2MGY2MDc0ODlhZmUxYzp7InRva2VuIjoiMzhlNWNiM2QwMzA0ZDc4N2ZiODdmZWU4MGRmMDY0ZWYifQ==','2019-03-31 09:00:40.760712'),('8d21h1sf6oqzed8nipzled2huxdibabz','ZmY0ZWIyNzVkMDdiNjE3MzY1NjczM2IzYjc4ZDM2NmU1ZTAzMDAyZDp7InRva2VuIjoiYjQ5YjQ3OWFmZTg2ZDY4YjZiYzM3ZjIwMTQwZTUzNjkifQ==','2019-03-31 04:48:18.548889'),('bw4stiwf6gb9ada7j4uwnbr7esjaalrj','YjQ5MjE3M2JjNjIxZmU3MjJmNWIzOWM4NGQ1OTI0NWQwNDVkN2YyYjp7InRva2VuIjoiMzljYmU3ODk1NjJhNDlkNzQzYzljZmUyNzBkZmM4ZDMifQ==','2019-04-01 06:07:26.412897'),('eh72xvofyvsol7ou0z7l5c3n66ja740n','NWE5MGMwZGQ3OTM1Y2QwZjA4YTEzODkyMTc0YzZhYWM0NDcyZDJiZDp7InRva2VuIjoiNzk3NjBjNTIxZmY2MTI0MTI2ZTU4YTRjZTgxODgzYjMifQ==','2019-04-01 06:12:56.867209'),('esr0mm9hygzstjlgab3w05sthl6o6wnz','Y2MyMGZiZjFjNTRhODY2YTAwMTdkYmM1ZWFlYWRjZjc3ZGJjNGJlYzp7InRva2VuIjoiOTcxODMyYzc4NjBmMDllZDNjNjNmNzlhNjY0MzM2MzEifQ==','2019-03-29 07:55:18.789227'),('fminhnitk14xpot64c42nkqdoqxklmr0','NzVhZjBhMmQwNGM2YzM4ZjBkNWRhZDBlOWViZGJlMjM1NmFjMzhlYTp7InRva2VuIjoiZmE2YmRiNTg1MzgyOTA5MDcyNzMzZThmMzZjNDU4ZDcifQ==','2019-04-01 05:11:39.840600'),('ioodaqu35diej67qe6l8ae3xoe56v4va','ZWIyOWQzZWExYWZiMTcxNWI1ZmQ0YjYzZGQzY2QyMDk1YmI2M2I1Yjp7InRva2VuIjoiZjNmZDI4M2YwNDE0OGVjMmVjOTg0YTE2ODAzYTc0ZTIifQ==','2019-04-01 05:06:57.706887'),('s4uem7ucj6s7befpy7oej4pnwlsm3sks','ZThkMTRhYjI0MzI3NjNlZGRmYzg2ZjZjZGJkMTM2YzYyMDg5NWZlYzp7InRva2VuIjoiZDRkZjU4Y2UzNTMyODRmOGI0NWE1ZDE5ZjMyZGIyNDcifQ==','2019-03-29 10:59:21.784177'),('tsbibczf589vq0oec17s48lft5m4wwvg','YTA4YjZhN2JmY2VkMmMxOWRiYzQyM2FmMzIyMGFmYzlmOWFmOGI5Nzp7InRva2VuIjoiYWIzMDM2NzdmZDM2MGRkYzVhNWVmODEwZmQ4MjE4NzcifQ==','2019-03-31 15:59:25.348474');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_5`
--

DROP TABLE IF EXISTS `goods_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(10) NOT NULL,
  `productimg` varchar(100) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productlongname` varchar(100) NOT NULL,
  `ads` varchar(100) NOT NULL,
  `specifics` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `marketprice` double NOT NULL,
  `categoryname_1st` varchar(50) NOT NULL,
  `categoryname_2st` varchar(50) NOT NULL,
  `categoryname_3st` varchar(50) NOT NULL,
  `storenums` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL,
  `selleraddr` varchar(100) NOT NULL,
  `sellername` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_5`
--

LOCK TABLES `goods_5` WRITE;
/*!40000 ALTER TABLE `goods_5` DISABLE KEYS */;
INSERT INTO `goods_5` VALUES (1,'1253048','base/img/20160906091633_854.jpg','草姬男极','草姬 Men\'s Infinity男極 壮阳补肾 持久延时','拍下减20 ！壮阳补肾 ！','90粒/盒',284,370,'营养保健','保健食品','其他保健食品',99,'九龙 · 香港草姬','香港九龙','王伟健'),(2,'1363086','base/img/20160808154653_931.jpg','金戈10片装特价包邮','金戈 枸橼酸西地那非片','勃起功能障碍','50mg*2片/盒',210,380,'中西成药','男科用药','阳痿早泄',987,'长春市 · 民益大药房','吉林省长春市','张腾匀'),(3,'1522644','base/img/20160728152149_248.jpg','陈李济 舒筋健腰丸','舒筋健腰丸OTC(白云山)','送风湿膏8贴','45g*10瓶/盒',708,799,'中西成药','风湿跌打','风湿骨痛',33,'广州市 · 健客大药房','广东省广州市','王先生'),(4,'1158922','base/img/20160808155521_217.jpg','【润众】恩替卡韦分散片7片','恩替卡韦分散片','慢性乙型肝炎 肝病','0.5mg*7片/盒',148,179,'中西成药','肝胆用药','肝炎用药',500,'上饶市 · 昌盛大药房','江西省上饶市','李靖'),(5,'1606198','base/img/20160825135620_630.gif','解郁安神片','解郁安神片','解郁安 化瘀解毒','24片/盒',76,82.5,'中西成药','神经系统','其它精神类药',13,'长春市 · 民益大药房','吉林省长春市','张腾匀');
/*!40000 ALTER TABLE `goods_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexBanerSll`
--

DROP TABLE IF EXISTS `indexBanerSll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexBanerSll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `backColor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexBanerSll`
--

LOCK TABLES `indexBanerSll` WRITE;
/*!40000 ALTER TABLE `indexBanerSll` DISABLE KEYS */;
INSERT INTO `indexBanerSll` VALUES (1,'base/img/carousel-1.jpg','中秋国庆','#111143'),(2,'base/img/carousel-2.jpg','嘉伦光彩','#d51216'),(3,'base/img/carousel-3.jpg','禾沐康','#1dcbff'),(4,'base/img/carousel-4.jpg','草姬','#f8a56f'),(5,'base/img/carousel-5.jpg','乐陶陶','#2d2c56');
/*!40000 ALTER TABLE `indexBanerSll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexDrb`
--

DROP TABLE IF EXISTS `indexDrb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexDrb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tits` varchar(200) NOT NULL,
  `price1` varchar(20) NOT NULL,
  `price2` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexDrb`
--

LOCK TABLES `indexDrb` WRITE;
/*!40000 ALTER TABLE `indexDrb` DISABLE KEYS */;
INSERT INTO `indexDrb` VALUES (1,'东阿阿胶 千年珍袋泡西洋参','2盒送礼带 领卷减140','￥538','/679','base/img/20160902114506_175.jpg'),(2,'枣夹核桃人','补血养颜 健脾养胃','￥45.9','/98','base/img/20160905141509_457.jpg'),(3,'草姬苏灭酸','拍下减20 ！1小时降尿酸','￥289','/358','base/img/20160906091826_374.jpg'),(4,'汇仁肾宝片 126 片','券后价245元包邮','￥322','/322','base/img/20160616182123_762.jpg'),(5,'云南三七粉','活血化瘀，消肿止痛','￥90','/180','base/img/20160818170115_552.jpg');
/*!40000 ALTER TABLE `indexDrb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexLouti`
--

DROP TABLE IF EXISTS `indexLouti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexLouti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tits` varchar(200) NOT NULL,
  `price1` varchar(20) NOT NULL,
  `price2` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexLouti`
--

LOCK TABLES `indexLouti` WRITE;
/*!40000 ALTER TABLE `indexLouti` DISABLE KEYS */;
INSERT INTO `indexLouti` VALUES (1,'同仁堂 六味地黄丸 4盒','滋阴补肾 千年古方 包邮','￥51.6','/￥60','base/img/20160428153800_504.jpg'),(2,'同仁堂 六味地黄丸 4盒','滋阴补肾 千年古方 包邮','￥51.6','/￥60','base/img/20160817180457_22.png'),(3,'同仁堂 六味地黄丸 4盒','滋阴补肾 千年古方 包邮','￥51.6','/￥60','base/img/20160428154024_676.jpg'),(4,'同仁堂 六味地黄丸 4盒','滋阴补肾 千年古方 包邮','￥51.6','/￥60','base/img/20160518150942_223.jpg'),(5,'同仁堂 六味地黄丸 4盒','活血化瘀，消肿止痛','￥90','/180','base/img/20160808155521_217.jpg'),(6,'云南三七粉','活血化瘀，消肿止痛','￥90','/180','base/img/20160726180302_811.jpg');
/*!40000 ALTER TABLE `indexLouti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexMrb`
--

DROP TABLE IF EXISTS `indexMrb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexMrb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexMrb`
--

LOCK TABLES `indexMrb` WRITE;
/*!40000 ALTER TABLE `indexMrb` DISABLE KEYS */;
INSERT INTO `indexMrb` VALUES (1,'base/img/20160223103312_73.jpg'),(2,'base/img/20160223103312_73.jpg'),(3,'base/img/20160223103432_82.jpg'),(4,'base/img/20160223103506_462.jpg'),(5,'base/img/20160203155906_809.jpg'),(6,'base/img/20160223103600_652.jpg'),(7,'base/img/20160223103630_801.jpg'),(8,'base/img/20160223103659_438.jpg'),(9,'base/img/20160223103730_224.jpg'),(10,'base/img/20160223103810_439.jpg'),(11,'base/img/20160223103845_279.jpg'),(12,'base/img/20160223103923_915.jpg'),(13,'base/img/20160223103953_137.jpg');
/*!40000 ALTER TABLE `indexMrb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL,
  `pwd` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'13014980037','e10adc3949ba59abbe56e057f20f883e'),(2,'15872505978','e10adc3949ba59abbe56e057f20f883e'),(3,'13011111111','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 17:08:39
