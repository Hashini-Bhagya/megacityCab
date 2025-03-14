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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` char(60) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_email` (`email`),
  KEY `idx_nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'santha','213365489','20014568898','santha@gmail.com','$2a$10$D1dLSMOZHsyPyQwSaFFcsOQGQbz9ubWAb8Yo.zJwQi0DHhN5jVidy','RIDER','2025-03-11 07:36:17'),(2,'Kamathe Gedara Hashini Bhagya Kavindi','561519115626','0712494773','kavindihashini15@gmail.com','$2a$10$vsxyB/bYLkmOQWks2M2nmevJzfR7GJWFAaiUeGap0jdzmgeFh7zKO','ADMIN','2025-03-11 08:00:10'),(3,'shenali hirushika','1234567890','0724595336','shenali@gmail.com','$2a$10$CsYYxr1/luARWg4A3W74luHlcSFp4JI1PdUYPQopZ8Ksop2CEpMwK','USER','2025-03-11 15:11:07'),(4,'vihaga ','1234568523','0112495337','vihaga@gmail.com','$2a$10$Ut0mUEg4Xll3DyoKlKUPEuAJCU5CD2I67ZTtTTew0d5x8nEbnvlTe','RIDER','2025-03-11 15:15:57'),(5,'anusha dilhani','19956325478','0719865344','anusha@gmail.com','$2a$10$HATxG9Z4zKkBwHGkgp2UYuIDTLZWfN/fz9jooibJjv8fXmtV8ls5K','USER','2025-03-11 15:31:55'),(6,'yomal thushara ','200245698732','0110564741','yomal@gmail.com','$2a$10$ZpHtXKA/8SHLs66Cf54tgejXJgEBQsJ1e9TXVAdI61JJ55a1S3Jka','RIDER','2025-03-11 15:35:37'),(7,'wishmi sandipa','20045636985','0112365884','wishmi@gmail.com','$2a$10$PusR0FXdSMtpDCUvY1C86ebQJ0Wh9Cxc6Bgci/ctILjAAVP5Xyx8q','USER','2025-03-11 16:33:40'),(8,'saduni','12345678974','0769845623','sadu@gmail.com','$2a$10$/y0Y.rhGcvzyPMC.4LR.XOsDWgtyJ.XUaPc8qCCOwh4VsBLnH97XW','USER','2025-03-11 18:03:13'),(9,'kasuni nimesha','2004205202235','0714565325','kasuni10@gmail.com','$2a$10$4mD71vWFUe9q6GwVkBBFmOcIdPI8j0nCznBIKDQftmx5R8C9hiOtG','USER','2025-03-12 20:02:14'),(10,'bhagya kavindi','200145696385','0452365885','bhagya10@gmail.com','$2a$10$p71YbnYd/4FnAGCK0M7SkeB63vriljVZs.k7FxS0OHu05/mftacCm','USER','2025-03-14 14:33:56'),(11,'saman kumara','199725896311','0245896332 ','saman@gmail.com','$2a$10$ZcTeFp0NoL7UrDL1aixTy.ylKXwR5Pp.V8KvyXGdDEsHx1ooiyvEO','RIDER','2025-03-14 14:50:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
