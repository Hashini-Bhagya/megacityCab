CREATE DATABASE  IF NOT EXISTS `megacitycabdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `megacitycabdb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: megacitycabdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `ride_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `scheduled_time` timestamp NULL DEFAULT NULL,
  `deadline_time` timestamp NULL DEFAULT NULL,
  `booked_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'pending',
  `assigned_rider_id` int DEFAULT NULL,
  `distance` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `selected_vehicle` varchar(20) NOT NULL,
  PRIMARY KEY (`ride_id`),
  KEY `idx_assigned_rider` (`assigned_rider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (26,5,'kaduwela','baththaramulla','2025-03-13 23:10:00','2025-03-13 22:10:00','2025-03-11 15:32:38','COMPLETED',3,7.00,415.00,'CAR'),(27,5,'kaduwela','malabe','2025-03-11 23:08:00','2025-03-11 22:08:00','2025-03-11 15:38:16','ASSIGNED',2,7.00,345.00,'THREE_WHEEL'),(28,3,'kaduwela','malabe','2025-03-26 04:44:00','2025-03-26 03:44:00','2025-03-12 07:14:39','ASSIGNED',2,7.00,345.00,'THREE_WHEEL'),(29,3,'baththramulla','malabe','2025-03-19 21:17:00','2025-03-19 20:17:00','2025-03-12 11:45:27','COMPLETED',3,7.00,1150.00,'THREE_WHEEL'),(30,9,'Colombo 10 ','rajagiriya ','2025-03-13 02:30:00','2025-03-13 01:30:00','2025-03-13 05:57:00','ASSIGNED',3,5.00,850.00,'THREE_WHEEL'),(33,3,'rajagiriya','baththaramulla','2025-03-19 20:00:00','2025-03-19 19:00:00','2025-03-13 23:34:26','COMPLETED',4,2.00,400.00,'THREE_WHEEL'),(34,10,'kurunegala','narammala','2025-03-15 23:30:00','2025-03-15 22:30:00','2025-03-14 15:09:29','REQUESTED',NULL,12.00,3100.00,'VAN');
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 22:11:14
