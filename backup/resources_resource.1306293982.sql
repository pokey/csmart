-- MySQL dump 10.11
--
-- Host: localhost    Database: csmart
-- ------------------------------------------------------
-- Server version	5.0.77

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add poll',8,'add_poll'),(23,'Can change poll',8,'change_poll'),(24,'Can delete poll',8,'delete_poll'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add resource',11,'add_resource'),(32,'Can change resource',11,'change_resource'),(33,'Can delete resource',11,'delete_resource'),(34,'Can add resource type',12,'add_resourcetype'),(35,'Can change resource type',12,'change_resourcetype'),(36,'Can delete resource type',12,'delete_resourcetype'),(37,'Can add comment',13,'add_comment'),(38,'Can change comment',13,'change_comment'),(39,'Can delete comment',13,'delete_comment'),(40,'Can moderate comments',13,'can_moderate'),(41,'Can add comment flag',14,'add_commentflag'),(42,'Can change comment flag',14,'change_commentflag'),(43,'Can delete comment flag',14,'delete_commentflag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'csmart','','','bipins@stanford.edu','sha1$2da0d$b834a9ce41ae5e03eb979c5c04cbb154c7fcde53',1,1,1,'2011-05-19 10:37:10','2011-04-25 19:25:12'),(2,'guest1','','','','sha1$be558$43b47c95a16f3d0a365104125af664a994963760',0,1,0,'2011-05-05 09:45:09','2011-05-04 23:56:04'),(9,'apcsprinciples@gmail.com','','','','sha1$9b064$99cb2ef128a4dea349d68fb9729fedd477156a96',1,1,1,'2011-05-19 11:08:05','2011-05-19 11:06:42');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-04-25 22:13:51',1,8,'1','What\'s up?',2,'Changed pub_date.'),(2,'2011-04-26 00:30:45',1,8,'1','What\'s up?',2,'Added choice \"Happiness\".'),(3,'2011-05-16 20:02:42',1,3,'3','guest2',3,''),(4,'2011-05-17 02:46:46',1,11,'1','Gridworld Case Study',1,''),(5,'2011-05-17 02:47:48',1,11,'1','Gridworld Case Study',2,'Changed is_document.'),(6,'2011-05-17 02:48:18',1,11,'1','Gridworld Case Study',2,'Changed description.'),(7,'2011-05-17 16:42:21',1,12,'1','ResourceType object',1,''),(8,'2011-05-17 16:43:14',1,12,'2','ResourceType object',1,''),(9,'2011-05-17 16:44:19',1,12,'3','case study',1,''),(10,'2011-05-17 16:44:25',1,12,'4','compiler',1,''),(11,'2011-05-17 16:44:31',1,12,'5','explanation',1,''),(12,'2011-05-17 16:44:38',1,12,'6','game',1,''),(13,'2011-05-17 16:44:44',1,12,'7','lesson',1,''),(14,'2011-05-17 16:44:49',1,12,'8','list',1,''),(15,'2011-05-17 16:44:52',1,12,'9','offline',1,''),(16,'2011-05-17 16:44:59',1,12,'10','problems',1,''),(17,'2011-05-17 16:45:04',1,12,'11','project',1,''),(18,'2011-05-17 16:45:10',1,12,'12','quiz',1,''),(19,'2011-05-17 16:45:13',1,12,'13','reference',1,''),(20,'2011-05-17 16:45:21',1,12,'14','role play',1,''),(21,'2011-05-17 16:45:24',1,12,'15','syllabus',1,''),(22,'2011-05-17 16:45:30',1,12,'16','textbook',1,''),(23,'2011-05-17 16:45:32',1,12,'17','tool',1,''),(24,'2011-05-17 16:45:36',1,12,'18','video',1,''),(25,'2011-05-17 16:45:41',1,12,'19','worksheet',1,''),(26,'2011-05-17 16:45:44',1,12,'20','other',1,''),(27,'2011-05-17 16:59:12',1,11,'1','Gridworld Case Study',1,''),(28,'2011-05-17 17:00:27',1,11,'2','Quick Reference',1,''),(29,'2011-05-17 17:01:55',1,11,'3','LightBot',1,''),(30,'2011-05-18 03:04:47',1,3,'4','guest2',3,''),(31,'2011-05-18 03:04:47',1,3,'5','guest4',3,''),(32,'2011-05-19 10:21:19',1,3,'6','guest5',3,''),(33,'2011-05-19 10:21:19',1,3,'7','guest6',3,''),(34,'2011-05-19 10:21:19',1,3,'8','guest7',3,''),(35,'2011-05-19 10:24:50',1,11,'4','Coding Bat AP-1',1,''),(36,'2011-05-19 11:07:24',1,3,'9','apcsprinciples@gmail.com',2,'Changed is_staff and is_superuser.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_fbfc09f1` (`user_id`),
  KEY `django_comment_flags_9b3dc754` (`comment_id`),
  KEY `django_comment_flags_111c90f9` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL auto_increment,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) default NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_comments_e4470c6e` (`content_type_id`),
  KEY `django_comments_6223029` (`site_id`),
  KEY `django_comments_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
INSERT INTO `django_comments` VALUES (1,11,'2',1,1,'bipin','bipins@stanford.edu','','this is a test comment','2011-05-24 16:21:37','10.33.3.78',1,0),(2,11,'2',1,1,'bipin','bipins@stanford.edu','','this is a <b>strong</b> comment','2011-05-24 16:23:34','10.33.3.78',1,0);
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'poll','polls','poll'),(9,'choice','polls','choice'),(10,'log entry','admin','logentry'),(11,'resource','resources','resource'),(12,'resource type','resource_types','resourcetype'),(13,'comment','comments','comment'),(14,'comment flag','comments','commentflag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a0770c990dd94a8cbee21ef5132b3de7','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:47'),('445dbe867fa4943d1b34d78a1e6c094d','MDQzMmRlY2IxNDI3OGYyZjQ5ZDZkMzM0YjI1YjYxYjZlYWVhZmQxODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-05-09 22:09:12'),('efe06020aa930378a1fbb380c49a6bc0','NDQyNWJlODhkNGQ4ZGMwOGJhZTFiZGQ5Y2E3MWJjYTEzOWNlYjEyZDqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVDV9hdXRoX3VzZXJfaWRxBIoBAlUSX2F1dGhfdXNlcl9iYWNrZW5kcQVV\nKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQZ1Lg==\n','2011-05-19 09:50:39'),('5c9b54ce62068e4eb0e8c6199f12d411','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:36'),('7b46dc7bfe30f8f6cde5242f7a1c338d','NTE5NGM4MzViMTRiNzY5NzM2NmZlOWFhMjEzYmQ0NzUwMDZlZTYwYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==\n','2011-05-19 10:36:11'),('464f29d4b7cfaffadbbf17838c539cd8','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:48'),('67164f7a6325b22f30f1aa5164394db7','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:48'),('723827a915dfca1bb58bae34a89a62d2','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:48'),('444b5ae93b56fd9f2e3ea5a32d7eec96','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:49'),('3a2e7fbd450b2386eed3d1944cd1a21f','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:50'),('8492907f95ec00507a02c795b6bdc949','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:50'),('d472369a4e13df59dbdb27d81b9775d6','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:51'),('3d1a1ab6e4475e9b194888155bfd0a0d','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:52'),('df5c6300e07d0cbae91b39d72d5dae6c','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:53'),('a8346415bccba7000c170adf4605fa61','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:54'),('803a086cbf77448dd55722453d8142f3','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:54'),('c40d4d23651820e9c2dd3ec594535fdd','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:56'),('dd2985b8bed60f128a01e671f09af1d4','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:56'),('d700924325f93d843d19cf3f5b543937','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:57'),('173dfbe6e0b538aec7ba889c4e1d3563','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:58'),('3fa6ec8c340c96c0f707daaf79d87e1b','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:58'),('6c14a0c4c186f0b7a77b6dfb0e8f965e','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:58'),('235ff9e74ceabb6f236aa1dc7836eb43','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:37:59'),('c4c76a1e041c4cc59a22ebdc82742948','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:01'),('a8c5f790a964449ad552278e26101410','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:03'),('ddd054dd73e8441b9d744951d4e47ce8','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:03'),('29a676c10961e0c222bfc927485144dd','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:03'),('f16dccd795420fa0068492c6bbd71449','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:03'),('9c88a16d5eec277a80d843c45ac9637b','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:04'),('df36888859ed707cff4ea4313b40b1f1','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:05'),('7148349f5236c3504bb7f797ffc555b3','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:05'),('dc505b6c293c70e7f6f2278502b0050d','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:06'),('fdf29dde3204e43d9a9a3a26f2c23313','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:07'),('f5657dd7df70a98424888d795a9e5ec8','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:08'),('b61dca4dccc4bfcc38dc6d6b0f3cbd68','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:12'),('f45e986e4defff84b3156df5d819820a','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:14'),('a508441e8c9a10690833de9af8e728b6','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:18'),('944119e873c18ede3ba05c794ecf1eab','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:20'),('60d889c295b7d42a66d99988d8cd2b6d','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:21'),('4c114f0596c77fefc138f1f05dc98ca2','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:22'),('9fd4204ac12855829e023d2a1a5cddaa','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:23'),('07accc4a791606b38c986cba6d1d6201','MDQ5YWU5YmFmYjQ5YTNkODQ2ZWMyNzRlNGNlZWIxMzIwNmQ1MzI2YzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2011-05-24 12:38:27'),('22dcb8c114156835a32819d737804c0d','MDQzMmRlY2IxNDI3OGYyZjQ5ZDZkMzM0YjI1YjYxYjZlYWVhZmQxODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-06-02 10:37:10'),('85c9529aeca75e8c0eb04d57fef01a92','MDQzMmRlY2IxNDI3OGYyZjQ5ZDZkMzM0YjI1YjYxYjZlYWVhZmQxODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-06-02 10:36:48'),('865214cd95cabfa18857945bc173e7a3','MDQzMmRlY2IxNDI3OGYyZjQ5ZDZkMzM0YjI1YjYxYjZlYWVhZmQxODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-06-02 10:28:07'),('713c6018ec5608f1853f8d5f76f4adec','ZWUzMTBmNWE0NmEyZWJjMDljNGJhNTgyYjhmYzU4NjU0ODY1ZDYzMjqAAn1xAS4=\n','2011-06-02 11:12:20'),('9219c68b66f87bb4d8ec218e06d0ee1e','ZWUzMTBmNWE0NmEyZWJjMDljNGJhNTgyYjhmYzU4NjU0ODY1ZDYzMjqAAn1xAS4=\n','2011-06-01 04:33:20');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL auto_increment,
  `poll_id` int(11) NOT NULL,
  `choice` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `polls_choice_763e883` (`poll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
INSERT INTO `polls_choice` VALUES (1,1,'Not much',4),(2,1,'The sky',2),(3,1,'Happiness',3);
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_poll`
--

DROP TABLE IF EXISTS `polls_poll`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `polls_poll` (
  `id` int(11) NOT NULL auto_increment,
  `question` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `polls_poll`
--

LOCK TABLES `polls_poll` WRITE;
/*!40000 ALTER TABLE `polls_poll` DISABLE KEYS */;
INSERT INTO `polls_poll` VALUES (1,'What\'s up?','2011-04-25 20:13:51');
/*!40000 ALTER TABLE `polls_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_types_resourcetype`
--

DROP TABLE IF EXISTS `resource_types_resourcetype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resource_types_resourcetype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resource_types_resourcetype`
--

LOCK TABLES `resource_types_resourcetype` WRITE;
/*!40000 ALTER TABLE `resource_types_resourcetype` DISABLE KEYS */;
INSERT INTO `resource_types_resourcetype` VALUES (1,'activity'),(2,'assignment'),(3,'case study'),(4,'compiler'),(5,'explanation'),(6,'game'),(7,'lesson'),(8,'list'),(9,'offline'),(10,'problems'),(11,'project'),(12,'quiz'),(13,'reference'),(14,'role play'),(15,'syllabus'),(16,'textbook'),(17,'tool'),(18,'video'),(19,'worksheet'),(20,'other');
/*!40000 ALTER TABLE `resource_types_resourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_resource`
--

DROP TABLE IF EXISTS `resources_resource`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resources_resource` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(200) NOT NULL,
  `name` varchar(500) NOT NULL,
  `is_document` tinyint(1) NOT NULL,
  `topics` varchar(500) default NULL,
  `description` longtext,
  `level` varchar(100) default NULL,
  `author` varchar(100) default NULL,
  `rating` decimal(2,1) NOT NULL,
  `date` datetime default NULL,
  `uploaded_by_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `resources_resource_e43a31e7` (`uploaded_by_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resources_resource`
--

LOCK TABLES `resources_resource` WRITE;
/*!40000 ALTER TABLE `resources_resource` DISABLE KEYS */;
INSERT INTO `resources_resource` VALUES (1,'http://apcentral.collegeboard.com/apc/public/courses/teachers_corner/151155.html','Gridworld Case Study',1,'case study','Gridworld case study used in the AP CS exam','apcs','','0.0','2011-05-17 16:58:35',1),(2,'http://apcentral.collegeboard.com/apc/public/repository/ap_comp_sci_a_quick_reference.pdf','Quick Reference',1,'','Reference document allowed for us on the AP exam.','apcs','','0.0','2011-05-17 16:59:49',1),(3,'http://armorgames.com/play/6061/light-bot-20','LightBot',1,'functions, conditionals, recursion','Lightbot is a game where you use tiles to create algorithms to direct your robot through a maze.',NULL,'Danny Yaroslavski','0.0','2011-05-17 17:00:51',1),(4,'http://codingbat.com/java/AP-1','Coding Bat AP-1',1,'arrays, loops, logic','Small programming problems based on past AP exams.','apcs','','0.0','2011-05-19 10:22:42',1);
/*!40000 ALTER TABLE `resources_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_resource_resource_type`
--

DROP TABLE IF EXISTS `resources_resource_resource_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resources_resource_resource_type` (
  `id` int(11) NOT NULL auto_increment,
  `resource_id` int(11) NOT NULL,
  `resourcetype_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `resource_id` (`resource_id`,`resourcetype_id`),
  KEY `resources_resource_resource_type_31b73438` (`resource_id`),
  KEY `resources_resource_resource_type_a62e211c` (`resourcetype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resources_resource_resource_type`
--

LOCK TABLES `resources_resource_resource_type` WRITE;
/*!40000 ALTER TABLE `resources_resource_resource_type` DISABLE KEYS */;
INSERT INTO `resources_resource_resource_type` VALUES (1,1,3),(2,2,13),(3,3,1),(4,3,6),(5,4,1);
/*!40000 ALTER TABLE `resources_resource_resource_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-25  3:26:25
