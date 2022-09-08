-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: realestatedb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB
DROP SCHEMA IF EXISTS `realestatedb`;
CREATE SCHEMA `realestatedb`;
USE `realestatedb`;


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
-- Temporary table structure for view `ακίνητα_με_συμβόλαιο`
--

DROP TABLE IF EXISTS `ακίνητα_με_συμβόλαιο`;
/*!50001 DROP VIEW IF EXISTS `ακίνητα_με_συμβόλαιο`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ακίνητα_με_συμβόλαιο` (
  `ΑκίνητοID` tinyint NOT NULL,
  `είδος_διάθεσης` tinyint NOT NULL,
  `ποσό` tinyint NOT NULL,
  `ημερομηνία_υπογραφής` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ακίνητο`
--

DROP TABLE IF EXISTS `ακίνητο`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ακίνητο` (
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  `είδος_διάθεσης` enum('πώληση','ενοικίαση') NOT NULL,
  `έτος_κατασκευής` int(4) unsigned DEFAULT NULL,
  `#μπάνιων` int(1) unsigned DEFAULT NULL,
  `#δωματίων` int(1) unsigned DEFAULT NULL,
  `τ.μ` int(3) unsigned NOT NULL,
  `είδος_θέρμανσης` varchar(25) DEFAULT NULL,
  `ποσό` int(7) unsigned NOT NULL,
  `διεύθυνση` varchar(50) DEFAULT NULL,
  `πόλη` varchar(50) NOT NULL,
  `περιοχή` varchar(50) DEFAULT NULL,
  `ΜεσίτηςID` int(6) unsigned NOT NULL,
  `ΙδιοκτήτηςID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`ΑκίνητοID`),
  KEY `fk_Ακίνητο_Περιοχή1_idx` (`διεύθυνση`),
  KEY `fk_Ακίνητο_Μεσίτης1_idx1` (`ΜεσίτηςID`),
  KEY `fk_Ακίνητο_Ιδιοκτήτης1_idx` (`ΙδιοκτήτηςID`),
  CONSTRAINT `fk_Ακίνητο_Ιδιοκτήτης1` FOREIGN KEY (`ΙδιοκτήτηςID`) REFERENCES `ιδιοκτήτης` (`ΙδιοκτήτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ακίνητο_Μεσίτης1` FOREIGN KEY (`ΜεσίτηςID`) REFERENCES `μεσίτης` (`ΜεσίτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ακίνητο`
--

LOCK TABLES `ακίνητο` WRITE;
/*!40000 ALTER TABLE `ακίνητο` DISABLE KEYS */;
INSERT INTO `ακίνητο` VALUES (21,'ενοικίαση',2000,1,1,30,'πετρέλαιο',280,'Παλαιοκώμης 13','Σέρρες','Κέντρο',1890,89013),(529,'πώληση',1993,1,3,73,'φυσικό αέριο',81000,'Αθανασίου 27','Λάρισα','Αλκαζάρ',5873,98),(578,'πώληση',1961,2,3,140,'πετρέλαιο',155000,'Σαλαμίνος 124','Κατερίνη ','Δυτική',801452,98),(2198,'ενοικίαση',1965,1,2,70,'φυσικό αέριο',450,'Βακτριανής 64','Αθήνα ','Ζωγράφου',5873,98213),(7421,'πώληση',1979,3,5,650,'φυσικό αέριο',1500000,'Σπετσών 10 ','Καλαμάτα','Μαρίνα Καλαμάτας',134,459801),(13274,'πώληση',1976,2,3,180,'πετρέλαιο',140000,'Στρατού 32','Βέροια','Βορειοανατολική',801452,98),(43012,'ενοικίαση',1975,2,2,120,'φυσικό αέριο',620,'Έλλης 89','Θεσσαλονίκη','Κρυονέρι',12654,10879),(99634,'ενοικίαση',1988,2,2,70,'θερμοσυσσωρευτής',400,'Ιβίσκου 13','Θεσσαλονίκη','Κάτω τούμπα',43989,10879),(162532,'πώληση',1960,1,2,65,'ηλεκτρικός λέβητας',75000,'Περικλέους 4','Αθήνα','Νέο Ψυχικό',781542,579),(298743,'ενοικίαση',1998,1,4,120,'πετρέλαιο',450,'Παπάφη 39','Θεσσαλονίκη','Κάτω τούμπα',12654,3205),(750021,'πώληση',1982,2,2,130,'ηλεκτρικός λέβητας',75000,'Ανδριανουπόλεως 24','Αλεξανδρούπολη','Κέντρο',781542,89013),(980123,'ενοικίαση',1994,2,2,135,'ηλεκτρικός λέβητας',540,'Μεταξάκη 53','Ρέθυμνο','Παλιά πόλη',5873,98213);
/*!40000 ALTER TABLE `ακίνητο` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ακίνητο_ενδιαφέρει_πελάτη`
--

DROP TABLE IF EXISTS `ακίνητο_ενδιαφέρει_πελάτη`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ακίνητο_ενδιαφέρει_πελάτη` (
  `ΠελάτηςID` int(6) unsigned NOT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`ΠελάτηςID`,`ΑκίνητοID`),
  KEY `fk_Πελάτης_has_Ακίνητο_Ακίνητο1_idx` (`ΑκίνητοID`),
  KEY `fk_Πελάτης_has_Ακίνητο_Πελάτης1_idx` (`ΠελάτηςID`),
  CONSTRAINT `fk_Πελάτης_has_Ακίνητο_Πελάτης1` FOREIGN KEY (`ΠελάτηςID`) REFERENCES `πελάτης` (`ΠελάτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Πελάτης_has_Ακίνητο_Ακίνητο1` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ακίνητο_ενδιαφέρει_πελάτη`
--

LOCK TABLES `ακίνητο_ενδιαφέρει_πελάτη` WRITE;
/*!40000 ALTER TABLE `ακίνητο_ενδιαφέρει_πελάτη` DISABLE KEYS */;
INSERT INTO `ακίνητο_ενδιαφέρει_πελάτη` VALUES (74,298743),(231,7421),(245,21),(1967,43012),(58679,750021),(209876,21),(302846,529);
/*!40000 ALTER TABLE `ακίνητο_ενδιαφέρει_πελάτη` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `διαμέρισμα`
--

DROP TABLE IF EXISTS `διαμέρισμα`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `διαμέρισμα` (
  `όροφος` int(1) unsigned DEFAULT NULL,
  `τύπος_θέρμανσης` enum('κεντρική','αυτόνομη') DEFAULT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`ΑκίνητοID`),
  CONSTRAINT `fk_Διαμέρισμα_Ακίνητο1` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `διαμέρισμα`
--

LOCK TABLES `διαμέρισμα` WRITE;
/*!40000 ALTER TABLE `διαμέρισμα` DISABLE KEYS */;
INSERT INTO `διαμέρισμα` VALUES (3,'κεντρική',21),(5,'αυτόνομη',2198),(4,'αυτόνομη',99634),(1,'αυτόνομη',162532),(5,'αυτόνομη',298743),(2,'κεντρική',750021);
/*!40000 ALTER TABLE `διαμέρισμα` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ενοικιάσεις`
--

DROP TABLE IF EXISTS `ενοικιάσεις`;
/*!50001 DROP VIEW IF EXISTS `ενοικιάσεις`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ενοικιάσεις` (
  `κωδικός_συμβολαίου` tinyint NOT NULL,
  `ημερομηνία_υπογραφής` tinyint NOT NULL,
  `ημερομηνία_εξόφλησης` tinyint NOT NULL,
  `διάρκεια` tinyint NOT NULL,
  `Ιδιοκτήτης` tinyint NOT NULL,
  `αριθμός_ακινήτου` tinyint NOT NULL,
  `ποσό` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `επιπλέον_χαρακτηριστικά`
--

DROP TABLE IF EXISTS `επιπλέον_χαρακτηριστικά`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `επιπλέον_χαρακτηριστικά` (
  `επιπλέον_χαρακτηριστικά` varchar(25) NOT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`ΑκίνητοID`,`επιπλέον_χαρακτηριστικά`),
  CONSTRAINT `fk_Επιπλέον_Χαρακτηριστικά_Ακίνητ1` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `επιπλέον_χαρακτηριστικά`
--

LOCK TABLES `επιπλέον_χαρακτηριστικά` WRITE;
/*!40000 ALTER TABLE `επιπλέον_χαρακτηριστικά` DISABLE KEYS */;
INSERT INTO `επιπλέον_χαρακτηριστικά` VALUES ('πόρτα ασφαλείας',21),('θέα',578),('parking',13274),('τζάκι',13274),('ανακαινισμένο',43012),('ενεργειακή κλάση Α',43012),('θέα',162532);
/*!40000 ALTER TABLE `επιπλέον_χαρακτηριστικά` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ιδιοκτήτης`
--

DROP TABLE IF EXISTS `ιδιοκτήτης`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ιδιοκτήτης` (
  `ΙδιοκτήτηςID` int(6) unsigned NOT NULL,
  `ονοματεπώνυμο` varchar(45) DEFAULT NULL,
  `τηλέφωνο` bigint(10) unsigned DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ΙδιοκτήτηςID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ιδιοκτήτης`
--

LOCK TABLES `ιδιοκτήτης` WRITE;
/*!40000 ALTER TABLE `ιδιοκτήτης` DISABLE KEYS */;
INSERT INTO `ιδιοκτήτης` VALUES (98,'Ανδρέας Παπάς',6987452136,'anpap@hotmail.gr'),(579,'Κατερίνα Λάμπρου',6932217895,'klamp89@gmail.com'),(3205,'Γιάννης Αλκαίου',6965912348,'galk123@hotmail.com'),(10879,'Κώστας Παπαδόπουλος',6953784659,'kospap@gmail.com'),(89013,'Θεοδώρα Ρασέλη',6923456321,'thrasg@gmail.com'),(98213,'Μαρία Φωτιάδη',6987123054,'mariafot84@gmail.com'),(459801,'Περικλής Νικολάου',6987452930,'periknik@hotmail.gr');
/*!40000 ALTER TABLE `ιδιοκτήτης` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `μεσίτες_θεσσαλονίκης`
--

DROP TABLE IF EXISTS `μεσίτες_θεσσαλονίκης`;
/*!50001 DROP VIEW IF EXISTS `μεσίτες_θεσσαλονίκης`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `μεσίτες_θεσσαλονίκης` (
  `ΜεσίτηςID` tinyint NOT NULL,
  `ονοματεπώνυμο` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `μεσίτης`
--

DROP TABLE IF EXISTS `μεσίτης`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `μεσίτης` (
  `ΜεσίτηςID` int(6) unsigned NOT NULL,
  `ονοματεπώνυμο` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `τηλέφωνο` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ΜεσίτηςID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `μεσίτης`
--

LOCK TABLES `μεσίτης` WRITE;
/*!40000 ALTER TABLE `μεσίτης` DISABLE KEYS */;
INSERT INTO `μεσίτης` VALUES (134,'Γιώργος Σούλης','gsoulis@hotmail.gr',6985231405),(1890,'Ανδρέας Ευαγγελόπουλος','nationalstar@gmail.com',6932145879),(5873,'Ελένη Μήτρου','elmit@hotmail.com',6974152380),(12654,'Χάρης Αλεξίου','charal@gmail.com',6935287416),(43989,'Γιώργος Σταυρόπουλος','mrmpoutia@hotmail.gr',6958231047),(781542,'Άκης Δημητρίου','akidim@gmail.gr',6945201235),(801452,'Στέλλα Αντωνίου','stelad@gmail.com',6954578632);
/*!40000 ALTER TABLE `μεσίτης` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `μονοκατοικία`
--

DROP TABLE IF EXISTS `μονοκατοικία`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `μονοκατοικία` (
  `#ορόφων` int(1) unsigned DEFAULT NULL,
  `κήπος` tinyint(1)  DEFAULT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`ΑκίνητοID`),
  CONSTRAINT `fk_Μονοκατοικία_Ακίνητο1` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `μονοκατοικία`
--

LOCK TABLES `μονοκατοικία` WRITE;
/*!40000 ALTER TABLE `μονοκατοικία` DISABLE KEYS */;
INSERT INTO `μονοκατοικία` VALUES (1,1,529),(2,0,578),(4,1,7421),(2,0,13274),(1,1,43012),(2,1,980123);
/*!40000 ALTER TABLE `μονοκατοικία` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `μονοκατοικίες_θεσσαλονίκης`
--

DROP TABLE IF EXISTS `μονοκατοικίες_θεσσαλονίκης`;
/*!50001 DROP VIEW IF EXISTS `μονοκατοικίες_θεσσαλονίκης`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `μονοκατοικίες_θεσσαλονίκης` (
  `ΑκίνητοID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `πελάτης`
--

DROP TABLE IF EXISTS `πελάτης`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `πελάτης` (
  `ΠελάτηςID` int(6) unsigned NOT NULL,
  `ονοματεπώνυμο` varchar(45) DEFAULT NULL,
  `τηλέφωνο` bigint(10) unsigned DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`ΠελάτηςID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `πελάτης`
--

LOCK TABLES `πελάτης` WRITE;
/*!40000 ALTER TABLE `πελάτης` DISABLE KEYS */;
INSERT INTO `πελάτης` VALUES (74,'Χρήστος Δήμου',6985471236,'chrisdim@gmail.com'),(231,'Άννα Αμανατίδου',6912589635,'annaman@hotmail.com'),(245,'Μαρία Νικολάου',6985231472,'marianik@hotmail.com'),(1967,'Δήμητρα Αντωνίου',6937896521,'dimanto@gmail.com'),(58679,'Κωνσταντίνος Εμμανουήλ',6935241803,'konemmanouel@gmail.gr'),(209876,'Παναγιώτα Βλάχου',6938521667,'pvlachou@hotmail.com'),(302846,'Παναγιώτης Βασιλάκος',6949890924,'pvasilakos@gmail.com');
/*!40000 ALTER TABLE `πελάτης` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `πελάτης_επισκέπτεται_ακίνητο`
--

DROP TABLE IF EXISTS `πελάτης_επισκέπτεται_ακίνητο`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `πελάτης_επισκέπτεται_ακίνητο` (
  `ΠελάτηςID` int(6) unsigned NOT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  `ώρα` decimal(4,2) DEFAULT NULL,
  `ημερομηνία` date DEFAULT NULL,
  `διάρκεια_σε_λεπτά` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`ΠελάτηςID`,`ΑκίνητοID`),
  KEY `fk_Πελάτης_has_Ακίνητο_Ακίνητο2_idx` (`ΑκίνητοID`),
  KEY `fk_Πελάτης_has_Ακίνητο_Πελάτης2_idx` (`ΠελάτηςID`),
  CONSTRAINT `fk_Πελάτης_has_Ακίνητο_Πελάτης2` FOREIGN KEY (`ΠελάτηςID`) REFERENCES `πελάτης` (`ΠελάτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Πελάτης_has_Ακίνητο_Ακίνητο2` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `πελάτης_επισκέπτεται_ακίνητο`
--

LOCK TABLES `πελάτης_επισκέπτεται_ακίνητο` WRITE;
/*!40000 ALTER TABLE `πελάτης_επισκέπτεται_ακίνητο` DISABLE KEYS */;
INSERT INTO `πελάτης_επισκέπτεται_ακίνητο` VALUES (74,162532,11.45,'2020-12-06',30),(231,21,12.00,'2019-03-04',15),(245,298743,13.45,'2018-07-15',10),(1967,980123,9.00,'2020-09-01',20),(58679,99634,11.30,'2020-11-30',25),(209876,578,13.00,'2020-11-25',30),(302846,99634,11.15,'2020-12-03',20);
/*!40000 ALTER TABLE `πελάτης_επισκέπτεται_ακίνητο` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realestatedb`.`Πελάτης_Επισκέπτεται_Ακίνητο_BEFORE_INSERT` 
BEFORE INSERT ON `Πελάτης_Επισκέπτεται_Ακίνητο` FOR EACH ROW
BEGIN
	IF (NEW.διάρκεια_σε_λεπτά > 30) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid_data!';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realestatedb`.`Πελάτης_Επισκέπτεται_Ακίνητο_BEFORE_UPDATE` 
BEFORE UPDATE ON `Πελάτης_Επισκέπτεται_Ακίνητο` FOR EACH ROW
BEGIN
	IF (NEW.διάρκεια_σε_λεπτά > 30) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid_data!';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `συμβόλαιο`
--

DROP TABLE IF EXISTS `συμβόλαιο`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `συμβόλαιο` (
  `Κωδικός_συμβολαίου` int(6) unsigned NOT NULL,
  `ημερομηνία_υπογραφής` date DEFAULT NULL,
  `ημερομηνία_εξόφλησης` date DEFAULT NULL,
  `διάρκεια` enum('απεριόριστη','1 χρόνος','2 χρόνια','3 χρόνια') DEFAULT NULL,
  `ΠελάτηςID` int(6) unsigned NOT NULL,
  `ΑκίνητοID` int(6) unsigned NOT NULL,
  `ΙδιοκτήτηςID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`Κωδικός_συμβολαίου`),
  KEY `fk_Συμβόλαιο_Ακίνητο1_idx` (`ΑκίνητοID`),
  KEY `fk_Συμβόλαιο_Ιδιοκτήτης1_idx` (`ΙδιοκτήτηςID`),
  KEY `fk_Συμβόλαιο_Πελάτης1_idx` (`ΠελάτηςID`),
  CONSTRAINT `fk_Συμβόλαιο_Πελάτης1` FOREIGN KEY (`ΠελάτηςID`) REFERENCES `πελάτης` (`ΠελάτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Συμβόλαιο_Ακίνητο1` FOREIGN KEY (`ΑκίνητοID`) REFERENCES `ακίνητο` (`ΑκίνητοID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Συμβόλαιο_Ιδιοκτήτης1` FOREIGN KEY (`ΙδιοκτήτηςID`) REFERENCES `ιδιοκτήτης` (`ΙδιοκτήτηςID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `συμβόλαιο`
--

LOCK TABLES `συμβόλαιο` WRITE;
/*!40000 ALTER TABLE `συμβόλαιο` DISABLE KEYS */;
INSERT INTO `συμβόλαιο` VALUES (67,'2017-04-19','2017-05-03','1 χρόνος',231,21,89013),(569,'2020-10-29','2022-06-30','απεριόριστη',209876,529,98),(987,'2019-07-05','2019-08-05','3 χρόνια',74,298743,3205),(7852,'2020-11-21','2020-12-06','1 χρόνος',58679,99634,10879),(9635,'2018-10-23','2018-11-03','2 χρόνια',245,21,89013),(14320,'2020-10-13','2020-10-30','απεριόριστη',1967,162532,579);
/*!40000 ALTER TABLE `συμβόλαιο` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ακίνητα_με_συμβόλαιο`
--

/*!50001 DROP TABLE IF EXISTS `ακίνητα_με_συμβόλαιο`*/;
/*!50001 DROP VIEW IF EXISTS `ακίνητα_με_συμβόλαιο`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ακίνητα_με_συμβόλαιο` AS select `συμβόλαιο`.`ΑκίνητοID` AS `ΑκίνητοID`,`ακίνητο`.`είδος_διάθεσης` AS `είδος_διάθεσης`,`ακίνητο`.`ποσό` AS `ποσό`,`συμβόλαιο`.`ημερομηνία_υπογραφής` AS `ημερομηνία_υπογραφής` from (`συμβόλαιο` join `ακίνητο` on((`συμβόλαιο`.`ΑκίνητοID` = `ακίνητο`.`ΑκίνητοID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ενοικιάσεις`
--

/*!50001 DROP TABLE IF EXISTS `ενοικιάσεις`*/;
/*!50001 DROP VIEW IF EXISTS `ενοικιάσεις`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ενοικιάσεις` AS select `συμβόλαιο`.`Κωδικός_συμβολαίου` AS `κωδικός_συμβολαίου`,`συμβόλαιο`.`ημερομηνία_υπογραφής` AS `ημερομηνία_υπογραφής`,`συμβόλαιο`.`ημερομηνία_εξόφλησης` AS `ημερομηνία_εξόφλησης`,`συμβόλαιο`.`διάρκεια` AS `διάρκεια`,`ιδιοκτήτης`.`ονοματεπώνυμο` AS `Ιδιοκτήτης`,`συμβόλαιο`.`ΑκίνητοID` AS `αριθμός_ακινήτου`,`ακίνητο`.`ποσό` AS `ποσό` from ((`συμβόλαιο` join `ιδιοκτήτης` on((`συμβόλαιο`.`ΙδιοκτήτηςID` = `ιδιοκτήτης`.`ΙδιοκτήτηςID`))) join `ακίνητο` on((`συμβόλαιο`.`ΑκίνητοID` = `ακίνητο`.`ΑκίνητοID`))) where (`συμβόλαιο`.`διάρκεια` <> 'απεριόριστη') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `μεσίτες_θεσσαλονίκης`
--

/*!50001 DROP TABLE IF EXISTS `μεσίτες_θεσσαλονίκης`*/;
/*!50001 DROP VIEW IF EXISTS `μεσίτες_θεσσαλονίκης`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `μεσίτες_θεσσαλονίκης` AS select `μεσίτης`.`ΜεσίτηςID` AS `ΜεσίτηςID`,`μεσίτης`.`ονοματεπώνυμο` AS `ονοματεπώνυμο` from (`μεσίτης` join `ακίνητο` on((`ακίνητο`.`ΜεσίτηςID` = `μεσίτης`.`ΜεσίτηςID`))) where (`ακίνητο`.`πόλη` = 'Θεσσαλονίκη') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `μονοκατοικίες_θεσσαλονίκης`
--

/*!50001 DROP TABLE IF EXISTS `μονοκατοικίες_θεσσαλονίκης`*/;
/*!50001 DROP VIEW IF EXISTS `μονοκατοικίες_θεσσαλονίκης`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `μονοκατοικίες_θεσσαλονίκης` AS select `μονοκατοικία`.`ΑκίνητοID` AS `ΑκίνητοID` from (`μονοκατοικία` join `ακίνητο` on((`μονοκατοικία`.`ΑκίνητοID` = `ακίνητο`.`ΑκίνητοID`))) where (`ακίνητο`.`πόλη` = 'Θεσσαλονίκη') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19 20:15:00
