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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15  1:53:29
