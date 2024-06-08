-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.0.165    Database: student_finance
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `expense_category`
--

DROP TABLE IF EXISTS `expense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_category` (
  `id` bigint NOT NULL,
  `expense_type` varchar(100) NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_category`
--

LOCK TABLES `expense_category` WRITE;
/*!40000 ALTER TABLE `expense_category` DISABLE KEYS */;
INSERT INTO `expense_category` VALUES (1,'food','2024-06-07 20:00:09'),(2,'travel','2024-06-07 20:00:09'),(3,'movies','2024-06-07 20:00:09'),(4,'shopping','2024-06-07 20:00:09'),(5,'streaming_platforms','2024-06-07 20:00:09');
/*!40000 ALTER TABLE `expense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `months` (
  `id` bigint NOT NULL,
  `month_name` varchar(200) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months`
--

LOCK TABLES `months` WRITE;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` VALUES (1,'january',NULL),(2,'february ',NULL),(3,'march',NULL),(4,'april',NULL),(5,'may',NULL),(6,'june',NULL),(7,'july',NULL),(8,'august',NULL),(9,'september',NULL),(10,'october',NULL),(11,'november',NULL),(12,'december',NULL);
/*!40000 ALTER TABLE `months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'pallavi',1111111111,'pallavi@gmail.com','pallavi@123','blr','2024-06-07 01:20:35'),(2,'radhika',2222222222,'radhika@gmail.com','radhika@123','blr','2024-06-07 01:20:35'),(3,'sanjana',3333333333,'sanjana@gmail.com','sanjana@123','blr','2024-06-07 01:20:35'),(4,'shreya',4444444444,'shreya@gmail.com','shreya@123','blr','2024-06-07 01:20:35');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_expense`
--

DROP TABLE IF EXISTS `student_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_expense` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `expense_type_id` bigint NOT NULL,
  `month_id` bigint NOT NULL,
  `expense_amount` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_expense`
--

LOCK TABLES `student_expense` WRITE;
/*!40000 ALTER TABLE `student_expense` DISABLE KEYS */;
INSERT INTO `student_expense` VALUES (1,1,1,1,400,'2024-06-07 12:00:32'),(2,1,2,1,600,'2024-06-07 12:00:32'),(3,1,3,1,100,'2024-06-07 12:00:32'),(4,1,4,1,200,'2024-06-07 12:00:32'),(5,1,5,1,100,'2024-06-07 12:00:32');
/*!40000 ALTER TABLE `student_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_income`
--

DROP TABLE IF EXISTS `student_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_income` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `income` bigint NOT NULL,
  `month_id` int NOT NULL,
  `duration_days` bigint DEFAULT NULL,
  `saving_goals` bigint DEFAULT NULL,
  `expense_amount` bigint DEFAULT NULL,
  `available_expense_amount` bigint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_income`
--

LOCK TABLES `student_income` WRITE;
/*!40000 ALTER TABLE `student_income` DISABLE KEYS */;
INSERT INTO `student_income` VALUES (1,1,2000,1,30,500,1500,1500,NULL),(2,2,3000,1,30,600,2400,2400,NULL),(3,3,4000,1,30,700,3300,3300,NULL),(4,4,5000,1,30,800,4200,4200,NULL);
/*!40000 ALTER TABLE `student_income` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 20:38:01
