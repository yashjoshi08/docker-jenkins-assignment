-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: devopsdb
-- ------------------------------------------------------
-- Server version	8.0.46

--
-- Table structure for table `employees`
-- backup check

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Yash','DevOps Engineer','IT',80000.00),(2,'Rahul','Cloud Engineer','IT',90000.00),(3,'Harshad','Site Reliability Engineer','Infrastructure',95000.00),(4,'Sam','Linux Administrator','Operations',70000.00),(5,'Manish','Platform Engineer','IT',100000.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2026-08-05 11:55:52
-- check automatic jidfotrigger
