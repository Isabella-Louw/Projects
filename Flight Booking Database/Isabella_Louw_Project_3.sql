-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flight_booking_agency
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(13) NOT NULL,
  `customer_passport_num` varchar(9) DEFAULT NULL,
  `customer_email_address` varchar(100) NOT NULL,
  `customer_telephone_num` varchar(12) NOT NULL,
  `customer_first_name` varchar(50) NOT NULL,
  `customer_last_name` varchar(50) NOT NULL,
  `customer_postal_address` longtext,
  `customer_age` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_passport_num` (`customer_passport_num`),
  CONSTRAINT `check_id` CHECK ((char_length(`customer_id`) = 13))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0211230718083',NULL,'ana.o@gmail.com','0825814935','Ana','Olivier','13 Fluff Tail road, Stone Ridge',21),('0407115169084',NULL,'john.soloman@vodacom.co.za','0739217304','John','Soloman','19 Boulders Bay, Ocean Drive',19),('5404185234087',NULL,'alex.d@gmail.com','0721398402','Alexander','De Beer','12 Coner Hedge street, Valley View',69),('8912070154082',NULL,'amber.venter@outlook.com','0128309837','Amber','Venter','45 Migmatite road, Coal Avenue',34),('9409229402492',NULL,'Archie.b@gmail.com','0858536789','Archie','Barnes','13 Rocky Road, Park Avenue',29),('9908150374089',NULL,'tessa.smith@gmail.com','0829381739','Tessa','Smith','Swartberg street, Echo Creek',24);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `discount_type` varchar(50) NOT NULL DEFAULT 'No Discount',
  `discount_percentage` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Senior Discount',15);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flight_num` varchar(10) NOT NULL,
  `flight_name` varchar(100) NOT NULL,
  `flight_capacity` int NOT NULL,
  `flight_availability` int NOT NULL,
  `flight_class` varchar(20) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `idx_flight_num` (`flight_num`),
  KEY `idx_flight_class` (`flight_class`),
  CONSTRAINT `check_class` CHECK ((`flight_class` in (_utf8mb4'First Class',_utf8mb4'Business Class',_utf8mb4'Economy Class')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'MSD093','KLM',242,200,'Economy Class'),(2,'QDS937','Emirates',345,135,'First Class'),(3,'HDI920','FlySafair',189,170,'Economy Class'),(4,'JJK124','Turkish Airlines',400,350,'Economy Class'),(5,'UIS038','British Airways',336,290,'Business Class'),(6,'MSD093','KLM',242,200,'Business Class');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_seat_availability` AFTER INSERT ON `flight` FOR EACH ROW BEGIN
    DECLARE flightCount INT;

    -- Count the number of rows with the same flight_num
    SELECT COUNT(*)
    INTO flightCount
    FROM Flight
    WHERE flight_num = NEW.flight_num;

    -- If there is more than one row, update available_seats
    IF flightCount > 1 THEN
        UPDATE Flight
        SET flight_availability = flight_availability - 1
        WHERE flight_num = NEW.flight_num;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(10) NOT NULL,
  `ticket_id` varchar(10) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`payment_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('034L093','I075','MasterCard',18000.00),('093K039','F293','MasterCard',9300.00),('134P083','K970','MasterCard',12000.00),('251T273','J759','EFT',5600.00),('291X028','W392','Visa',17000.00),('367K039','Y527','Visa',2000.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` varchar(10) NOT NULL,
  `customer_id` varchar(13) NOT NULL,
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `reservation_departure_place` varchar(100) NOT NULL,
  `reservation_arrival_points` varchar(100) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `customer_id` (`customer_id`),
  KEY `flight_id` (`flight_id`),
  KEY `idx_departure_place` (`reservation_departure_place`),
  KEY `idx_arrival_points` (`reservation_arrival_points`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('DHABWO','0211230718083',1,'2023-12-09','00:30:00','Johannesburg','Amsterdam'),('DMCOWH','9908150374089',5,'2023-11-01','01:00:00','Australia','London'),('HSMDOH','9409229402492',6,'2023-12-09','00:30:00','Johannesburg','Amsterdam'),('NSODHU','8912070154082',3,'2023-10-31','09:45:00','Johannesburg','Cape Town'),('WBOFHS','0407115169084',4,'2023-11-20','21:15:00','Paris','Turkey'),('XNALDO','5404185234087',2,'2024-01-04','22:00:00','Cape Town','Dubai');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_reservation_insert` BEFORE INSERT ON `reservation` FOR EACH ROW BEGIN
    DECLARE available_seats INT;

    IF NEW.reservation_date < CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation date must be in the future';
    END IF;

    IF NEW.flight_id IS NOT NULL THEN
        SELECT flight_availability INTO available_seats
        FROM Flight
        WHERE flight_id = NEW.flight_id;

        IF available_seats <= 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No available seats for the selected flight';
        END IF;
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_reservation_delete` AFTER DELETE ON `reservation` FOR EACH ROW BEGIN
    UPDATE Flight
    SET flight_availability = flight_availability + 1
    WHERE flight_id = OLD.flight_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` varchar(10) NOT NULL,
  `reservation_id` varchar(10) NOT NULL,
  `ticket_seat_num` varchar(10) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('F293','DHABWO','78B'),('I075','XNALDO','2A'),('J759','WBOFHS','240F'),('K970','DMCOWH','23A'),('W392','HSMDOH','29C'),('Y527','NSODHU','100C');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_affordableflight`
--

DROP TABLE IF EXISTS `vw_affordableflight`;
/*!50001 DROP VIEW IF EXISTS `vw_affordableflight`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_affordableflight` AS SELECT 
 1 AS `flight_id`,
 1 AS `flight_name`,
 1 AS `reservation_id`,
 1 AS `ticket_id`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_flight`
--

DROP TABLE IF EXISTS `vw_flight`;
/*!50001 DROP VIEW IF EXISTS `vw_flight`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_flight` AS SELECT 
 1 AS `reservation_id`,
 1 AS `flight_name`,
 1 AS `flight_availability`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_onboardcustomers`
--

DROP TABLE IF EXISTS `vw_onboardcustomers`;
/*!50001 DROP VIEW IF EXISTS `vw_onboardcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_onboardcustomers` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_first_name`,
 1 AS `customer_last_name`,
 1 AS `first_class_count`,
 1 AS `economy_class_count`,
 1 AS `business_class_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_seniorusers`
--

DROP TABLE IF EXISTS `vw_seniorusers`;
/*!50001 DROP VIEW IF EXISTS `vw_seniorusers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_seniorusers` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_first_name`,
 1 AS `customer_last_name`,
 1 AS `customer_age`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'flight_booking_agency'
--

--
-- Dumping routines for database 'flight_booking_agency'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddNewFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddNewFlights`(
    IN flight_num_param VARCHAR(10),
    IN flight_name_param VARCHAR(100),
    IN flight_capacity_param INT,
    IN flight_availability_param INT,
    IN flight_class_param VARCHAR(20)
)
BEGIN
    INSERT INTO Flight (flight_num, flight_name, flight_capacity, flight_availability, flight_class)
    VALUES (flight_num_param, flight_name_param, flight_capacity_param, flight_availability_param, flight_class_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteTicket`(
    IN ticket_id_param VARCHAR(10)
)
BEGIN
    DECLARE reservation_date DATE;

    -- Get the reservation date associated with the ticket
    SELECT reservation_date INTO reservation_date
    FROM Reservation
    INNER JOIN Ticket ON Reservation.reservation_id = Ticket.reservation_id
    WHERE Ticket.ticket_id = ticket_id_param;

    -- Check if the reservation date has already happened
    IF reservation_date <= CURDATE() THEN
        -- If the reservation date has already happened, delete the ticket
        DELETE FROM Ticket
        WHERE ticket_id = ticket_id_param;
    ELSE
        -- If the reservation date is in the future, do not delete the ticket
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete ticket. Reservation date is in the future.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Report`(
    IN flight_class VARCHAR(20)
)
BEGIN
    -- Declare variables
    DECLARE counter INT DEFAULT 1;
    DECLARE bookIdVar VARCHAR(10);
    DECLARE customerFirstNameVar VARCHAR(50);
    DECLARE customerLastNameVar VARCHAR(50);
    DECLARE reservationDateVar DATE;
    DECLARE flightNumVar VARCHAR(10);
    DECLARE journeyTypeVar VARCHAR(20);
    DECLARE flightNameVar VARCHAR(100);
    DECLARE ticketPriceVar DECIMAL(10, 2);
    DECLARE reportText VARCHAR(4000); 

    -- Cursor declaration
    DECLARE your_cursor CURSOR FOR
        SELECT
            r.reservation_id AS bookIdVar,
            c.customer_first_name AS customerFirstNameVar,
            c.customer_last_name AS customerLastNameVar,
            r.reservation_date AS reservationDateVar,
            r.flight_id AS flightNumVar,
            CASE WHEN r.reservation_date IS NOT NULL THEN 'Round trip' ELSE 'One way' END AS journeyType,
            f.flight_name AS flightNameVar,
            p.price AS ticketPriceVar
        FROM
            Reservation r
            JOIN Customer c ON r.customer_id = c.customer_id
            JOIN Flight f ON r.flight_id = f.flight_id
            JOIN Ticket t ON r.reservation_id = t.reservation_id
            JOIN Payment p ON t.ticket_id = p.ticket_id
        WHERE
            f.flight_class = flight_class
        ORDER BY
            r.reservation_id;


    -- Start printing the report header
    SET reportText = 'FLIGHT BOOKING REPORT:\n___________________\n';

    -- Cursor open
    OPEN your_cursor;

    -- Fetch from cursor
    FETCH your_cursor INTO bookIdVar, customerFirstNameVar, customerLastNameVar, reservationDateVar, flightNumVar, journeyTypeVar, flightNameVar, ticketPriceVar;

    -- Loop through the cursor
    WHILE NOT (bookIdVar IS NULL) DO
        -- Append report details to reportText variable
        SET reportText = CONCAT(reportText,
            CONCAT('Book ID: ', bookIdVar), '\n',
            CONCAT('customer name: ', customerFirstNameVar, ' ', customerLastNameVar, ' [Date: ', reservationDateVar, ']'), '\n',
            CONCAT('flight number: ', flightNumVar, ' Journey: ', journeyTypeVar), '\n',
            'No. Customer Name Flight Price\n',
            CONCAT(counter, '. ', customerFirstNameVar, ' R', ticketPriceVar), '\n',
            '__________________________________________________\n'
        );

        -- Increment the counter
        SET counter = counter + 1;

        -- Fetch the next row
        FETCH your_cursor INTO bookIdVar, customerFirstNameVar, customerLastNameVar, reservationDateVar, flightNumVar, journeyTypeVar, flightNameVar, ticketPriceVar;
    END WHILE;

    -- Close the cursor
    CLOSE your_cursor;

    -- Print the report
    SELECT reportText AS report;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateFlyingTimes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateFlyingTimes`(
    IN reservation_id_param VARCHAR(10),
    IN new_reservation_date_param DATE,
    IN new_reservation_time_param TIME
)
BEGIN
    UPDATE Reservation
    SET reservation_date = new_reservation_date_param, reservation_time = new_reservation_time_param
    WHERE reservation_id = reservation_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_affordableflight`
--

/*!50001 DROP VIEW IF EXISTS `vw_affordableflight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_affordableflight` AS select `f`.`flight_id` AS `flight_id`,`f`.`flight_name` AS `flight_name`,`r`.`reservation_id` AS `reservation_id`,`t`.`ticket_id` AS `ticket_id`,`p`.`price` AS `price` from (((`flight` `f` join `reservation` `r` on((`f`.`flight_id` = `r`.`flight_id`))) join `ticket` `t` on((`r`.`reservation_id` = `t`.`reservation_id`))) join `payment` `p` on((`t`.`ticket_id` = `p`.`ticket_id`))) order by `p`.`price` limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_flight`
--

/*!50001 DROP VIEW IF EXISTS `vw_flight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_flight` AS select `r`.`reservation_id` AS `reservation_id`,`f`.`flight_name` AS `flight_name`,`f`.`flight_availability` AS `flight_availability`,`p`.`price` AS `price` from (((`reservation` `r` join `flight` `f` on((`r`.`flight_id` = `f`.`flight_id`))) join `ticket` `t` on((`r`.`reservation_id` = `t`.`reservation_id`))) join `payment` `p` on((`t`.`ticket_id` = `p`.`ticket_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_onboardcustomers`
--

/*!50001 DROP VIEW IF EXISTS `vw_onboardcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_onboardcustomers` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_first_name` AS `customer_first_name`,`c`.`customer_last_name` AS `customer_last_name`,count(distinct (case when (`f`.`flight_class` = 'First Class') then `f`.`flight_class` end)) AS `first_class_count`,count(distinct (case when (`f`.`flight_class` = 'Economy Class') then `f`.`flight_class` end)) AS `economy_class_count`,count(distinct (case when (`f`.`flight_class` = 'Business Class') then `f`.`flight_class` end)) AS `business_class_count` from ((`customer` `c` join `reservation` `r` on((`c`.`customer_id` = `r`.`customer_id`))) join `flight` `f` on((`r`.`flight_id` = `f`.`flight_id`))) group by `c`.`customer_id`,`c`.`customer_first_name`,`c`.`customer_last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_seniorusers`
--

/*!50001 DROP VIEW IF EXISTS `vw_seniorusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_seniorusers` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_first_name` AS `customer_first_name`,`c`.`customer_last_name` AS `customer_last_name`,`c`.`customer_age` AS `customer_age` from `customer` `c` where (`c`.`customer_age` > 65) */;
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

-- Dump completed on 2023-11-15  1:54:03
