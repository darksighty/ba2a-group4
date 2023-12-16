-- MySQL dump 10.16  Distrib 10.2.3-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: kimia
-- ------------------------------------------------------
-- Server version	10.2.3-MariaDB-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_commenter` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_commented` datetime DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `FK_id_post` (`id_post`),
  KEY `FK_id_commenter` (`id_commenter`),
  CONSTRAINT `FK_id_commenter` FOREIGN KEY (`id_commenter`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FK_id_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,3,'Thats funny fr!','2023-07-07 10:41:18'),(2,4,4,'Thats dope!','2023-03-09 10:48:18'),(3,2,3,'No way!','2023-07-09 10:48:18');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id_follower` int(11) DEFAULT NULL,
  `id_following` int(11) DEFAULT NULL,
  KEY `FK_id_follower` (`id_follower`),
  KEY `FK_id_following` (`id_following`),
  CONSTRAINT `FK_id_follower` FOREIGN KEY (`id_follower`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FK_id_following` FOREIGN KEY (`id_following`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  KEY `FK_id_posti` (`id_post`),
  CONSTRAINT `FK_id_posti` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_user_comment`
--

DROP TABLE IF EXISTS `like_user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_user_comment` (
  `id_luc` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_comment` int(11) DEFAULT NULL,
  KEY `pk3_id_user` (`id_user`),
  KEY `pk_id_comment` (`id_comment`),
  CONSTRAINT `pk3_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `pk_id_comment` FOREIGN KEY (`id_comment`) REFERENCES `comments` (`id_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_user_comment`
--

LOCK TABLES `like_user_comment` WRITE;
/*!40000 ALTER TABLE `like_user_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_user_post`
--

DROP TABLE IF EXISTS `like_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_user_post` (
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `reaction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_post`),
  KEY `pk2_id_post` (`id_post`),
  CONSTRAINT `pk2_id_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `pk2_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_user_post`
--

LOCK TABLES `like_user_post` WRITE;
/*!40000 ALTER TABLE `like_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date_published` datetime DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  KEY `FK_id_user` (`id_user`),
  CONSTRAINT `FK_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,3,'Hello world','I love my family so much','','2023-09-12 12:35:10'),(2,2,'What a day','I hate work','','2023-10-12 11:19:01'),(3,4,'1st day at work','My day was good tho','','2023-06-06 10:40:14'),(4,1,'first day at school','My day was good','','2023-02-09 14:20:12');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` int(20) DEFAULT NULL,
  `age` int(50) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `UK_email` (`email`),
  UNIQUE KEY `UK_password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Paul','awoulbesalomon2003@gmail.com','0000000',NULL,0),(2,'Stephane','paulateba2007@gmail.com','11111',NULL,0),(3,'Paul','Sarahateba2010@gmail.com','22222',NULL,0),(4,'Paul','Davidateba2014@gmail.com','33333',NULL,0),(5,'Paul','Deborahateba2018@gmail.com','44444',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profil`
--

DROP TABLE IF EXISTS `user_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profil` (
  `id_user_profil` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(20) NOT NULL,
  `user_surname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `about` varchar(250) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user_profil`),
  KEY `fk1_id_user` (`id_user`),
  CONSTRAINT `fk1_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profil`
--

LOCK TABLES `user_profil` WRITE;
/*!40000 ALTER TABLE `user_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 15:46:18
