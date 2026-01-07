-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 02:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangay_information_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `IssueCertificate` (IN `p_resident_id` INT, IN `p_type` VARCHAR(50), IN `p_purpose` TEXT, IN `p_amount` INT)   BEGIN
    INSERT INTO certificates (resident_id, type_of_certificate, purpose, amount_paid, date_issued)
    VALUES (p_resident_id, p_type, p_purpose, p_amount, CURDATE());
    
    SELECT 
        certificate_id AS 'Generated ID', 
        type_of_certificate AS 'Type', 
        amount_paid AS 'Amount', 
        date_issued AS 'Date'
    FROM certificates
    WHERE resident_id = p_resident_id
    ORDER BY certificate_id DESC 
    LIMIT 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `barangay_summary`
-- (See below for the actual view)
--
CREATE TABLE `barangay_summary` (
`total_residents` bigint(21)
,`number_of_households` bigint(21)
,`active_projects` varchar(50)
,`official_list` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `certificate_id` varchar(50) NOT NULL,
  `resident_id` int(11) DEFAULT NULL,
  `type_of_certificate` varchar(50) NOT NULL,
  `purpose` text NOT NULL,
  `amount_paid` int(11) DEFAULT NULL CHECK (`amount_paid` > 0),
  `date_issued` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`certificate_id`, `resident_id`, `type_of_certificate`, `purpose`, `amount_paid`, `date_issued`) VALUES
('BRGY-20260106-2049', 9, 'Barangay Clearance', 'Postal ID', 100, '2025-01-14'),
('BRGY-20260106-2159', 1, 'Barangay Clearance', 'Employment', 100, '2025-01-10'),
('BRGY-20260106-2938', 2, 'Residency', 'School Requirement', 50, '2025-01-14'),
('BRGY-20260106-3880', 15, 'Barangay Clearance', 'Employment', 100, '2025-04-13'),
('BRGY-20260106-4013', 4, 'Residency', 'ID Application', 50, '2025-04-15'),
('BRGY-20260106-4228', 1, 'Barangay Clearance', 'Employment Applcation', 100, '2025-01-20'),
('BRGY-20260106-5963', 8, 'Residency', 'Bank Account', 50, '2026-01-12'),
('BRGY-20260106-8154', 10, 'Business Permit', 'Sari-sari Store', 500, '2025-01-12'),
('BRGY-20260106-8772', 16, 'Business Permit', 'Food Stall', 500, '2026-01-16'),
('BRGY-20260106-8948', 1, 'Barangay Clearance', 'Employment Applcation', 100, '2025-01-20'),
('BRGY-20260106-9432', 12, 'Indigency', 'Scholarship', 50, '2025-12-15'),
('BRGY-20260106-9441', 1, 'Barangay Clearance', 'Employment Application', 100, '2026-01-06'),
('BRGY-20260106-9888', 5, 'Indigency', 'Scholarship', 50, '2025-08-11');

--
-- Triggers `certificates`
--
DELIMITER $$
CREATE TRIGGER `generate_certificate_id` BEFORE INSERT ON `certificates` FOR EACH ROW BEGIN
    SET NEW.certificate_id = CONCAT('BRGY-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', FLOOR(1000 + RAND() * 9000));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `household_id` int(11) NOT NULL,
  `household_head` varchar(50) DEFAULT NULL,
  `number_of_residents` int(11) DEFAULT NULL CHECK (`number_of_residents` > 0),
  `address` varchar(255) NOT NULL,
  `postal_code` int(11) DEFAULT 4024
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`household_id`, `household_head`, `number_of_residents`, `address`, `postal_code`) VALUES
(1, 'Juan Dela Cruz', 5, 'Block 1 Lot 2, Mabini St.', 4024),
(2, 'Pedro Penduko', 4, '123 Rizal Ave.', 4024),
(3, 'Maria Clara', 3, '45 Narra St.', 4024),
(4, 'Jose Rizal', 5, '789 Calamba Road', 4024),
(5, 'Andres Bonifacio', 3, '101 Katipunan Blvd', 4024);

-- --------------------------------------------------------

--
-- Table structure for table `officials`
--

CREATE TABLE `officials` (
  `official_id` int(11) NOT NULL,
  `official_name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `official_contact_number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officials`
--

INSERT INTO `officials` (`official_id`, `official_name`, `position`, `official_contact_number`) VALUES
(1, 'Kapitan Tiago', 'Captain', '09991112222'),
(2, 'Kagawad Berto', 'Kagawad', '09991113333'),
(3, 'Kagawad Dante', 'Kagawad', '09991114444'),
(4, 'Kagawad Elmo', 'Kagawad', '09991115555'),
(5, 'Secretary Kim', 'Secretary', '09991116666'),
(6, 'Treasurer Joy', 'Treasurer', '09991117777'),
(7, 'SK Chairman Popoy', 'SK Chairman', '09991118888');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `budget` int(11) DEFAULT NULL CHECK (`budget` > 0),
  `project_status` varchar(50) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL CHECK (`date_end` > `date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `description`, `budget`, `project_status`, `date_start`, `date_end`) VALUES
(1, 'Oplan Linis', 'Community cleaning', 5000, 'Completed', '2025-01-10', '2025-02-01'),
(2, 'Feeding Program', 'Lunch for kids', 10000, 'Planned', '2025-02-01', '2025-02-02'),
(3, 'Road Repair', 'Fixing potholes', 50000, 'Active', '2025-01-05', '2025-03-01'),
(4, 'Basketball League', 'Summer sports', 15000, 'Completed', '2024-04-01', '2024-05-30'),
(5, 'Livelihood Seminar', 'Soap making', 2000, 'Planned', '2025-03-10', '2025-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `resident_id` int(11) NOT NULL,
  `household_id` int(11) DEFAULT NULL,
  `household_head` varchar(50) DEFAULT NULL,
  `resident_name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` > 0),
  `sex` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `resident_contact_number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`resident_id`, `household_id`, `household_head`, `resident_name`, `age`, `sex`, `date_of_birth`, `civil_status`, `occupation`, `resident_contact_number`) VALUES
(1, 1, 'Juan Dela Cruz', 'Juan Dela Cruz', 45, 'Male', '1979-05-15', 'Married', 'Driver', '09171110001'),
(2, 1, 'Juan Dela Cruz', 'Juana Dela Cruz', 43, 'Female', '1981-08-20', 'Married', 'Housewife', '09171110002'),
(3, 1, 'Juan Dela Cruz', 'Juanito Dela Cruz', 18, 'Male', '2006-01-10', 'Single', 'Student', '09171110003'),
(4, 1, 'Juan Dela Cruz', 'Juanita Dela Cruz', 16, 'Female', '2008-03-05', 'Single', 'Student', '09171110004'),
(5, 1, 'Juan Dela Cruz', 'Uncle Bob', 60, 'Male', '1964-01-01', 'Single', 'Unemployed', '09171110018'),
(6, 2, 'Pedro Penduko', 'Pedro Penduko', 35, 'Male', '1989-11-30', 'Single', 'Carpenter', '09171110005'),
(7, 2, 'Pedro Penduko', 'Lola Basyang', 75, 'Female', '1949-02-14', 'Widowed', 'Retired', '09171110006'),
(8, 2, 'Pedro Penduko', 'Nene Penduko', 10, 'Female', '2014-06-12', 'Single', 'Student', '09171110007'),
(9, 2, 'Pedro Penduko', 'Cousin It', 33, 'Male', '1991-05-05', 'Single', 'Artist', '09171110019'),
(10, 3, 'Maria Clara', 'Maria Clara', 28, 'Female', '1996-12-25', 'Single', 'Call Center', '09171110008'),
(11, 3, 'Maria Clara', 'Crisostomo Ibarra', 30, 'Male', '1994-10-01', 'Single', 'Engineer', '09171110009'),
(12, 3, 'Maria Clara', 'Tia Isabel', 55, 'Female', '1969-07-07', 'Widowed', 'Dressmaker', '09171110020'),
(13, 4, 'Jose Rizal', 'Jose Rizal', 50, 'Male', '1974-06-19', 'Married', 'Doctor', '09171110010'),
(14, 4, 'Jose Rizal', 'Josephine Bracken', 48, 'Female', '1976-08-09', 'Married', 'Nurse', '09171110011'),
(15, 4, 'Jose Rizal', 'Paciano Rizal', 25, 'Male', '1999-01-20', 'Single', 'Teacher', '09171110012'),
(16, 4, 'Jose Rizal', 'Trinidad Rizal', 22, 'Female', '2002-04-15', 'Single', 'Student', '09171110013'),
(17, 4, 'Jose Rizal', 'Saturnina Rizal', 20, 'Female', '2004-09-21', 'Single', 'Student', '09171110014'),
(18, 5, 'Andres Bonifacio', 'Andres Bonifacio', 40, 'Male', '1984-11-30', 'Married', 'Factory Worker', '09171110015'),
(19, 5, 'Andres Bonifacio', 'Gregoria De Jesus', 38, 'Female', '1986-05-09', 'Married', 'Factory Worker', '09987654321'),
(20, 5, 'Andres Bonifacio', 'Procopio Bonifacio', 15, 'Male', '2009-12-30', 'Single', 'Student', '09171110017'),
(21, 2, 'Pedro Penduko', 'Jhomari Chan', 21, 'Male', '2004-07-01', 'Single', 'Programmer', '09123456789'),
(22, 3, 'Maria Clara', 'Andres  Korri', 45, 'Male', '0000-00-00', 'Widowed', 'IT Professor', '9171110001\r'),
(23, 1, 'Juan Dela Cruz', 'Anna Sophia Talento', 43, 'Female', '0000-00-00', 'Single', 'Student', '9171110002\r'),
(24, 1, 'Juan Dela Cruz', 'Ron Pondevida', 18, 'Male', '0000-00-00', 'Single', 'Student', '9171110003\r'),
(25, 4, 'Jose Rizal', 'Hannah Seranno', 16, 'Female', '0000-00-00', 'Single', 'Student', '9171110004\r'),
(26, 4, 'Jose Rizal', 'Jay Castro', 60, 'Male', '0000-00-00', 'Married', 'Retired', '9171110018\r'),
(27, 5, 'Andres Bonifacio', 'Dwight Ramos', 35, 'Male', '0000-00-00', 'Divorced', 'Professional Athlete', '9171110005\r'),
(28, 2, 'Pedro Penduko', 'Alden Pajero', 75, 'Male', '0000-00-00', 'Widowed', 'Retired', '9171110006\r'),
(29, 2, 'Pedro Penduko', 'Neneg Bhie', 10, 'Male', '0000-00-00', 'Single', 'Student', '9171110007\r'),
(30, 2, 'Pedro Penduko', 'Lebron Jamero', 33, 'Male', '0000-00-00', 'Married', 'Professional Athlete', '9171110019\r'),
(31, 5, 'Andres Bonifacio', 'Maja  Dela  Cruz', 28, 'Female', '0000-00-00', 'Married', 'Actress', '9171110008\r'),
(32, 3, 'Maria Clara', 'Jan  Majoro', 30, 'Male', '0000-00-00', 'Single', 'Entertainer', '9171110009\r');

-- --------------------------------------------------------

--
-- Structure for view `barangay_summary`
--
DROP TABLE IF EXISTS `barangay_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barangay_summary`  AS SELECT CASE WHEN `offi`.`rn` = 1 THEN (select count(0) from `residents`) ELSE NULL END AS `total_residents`, CASE WHEN `offi`.`rn` = 1 THEN (select count(0) from `households`) ELSE NULL END AS `number_of_households`, `proj`.`project_name` AS `active_projects`, `offi`.`official_name` AS `official_list` FROM ((select `officials`.`official_name` AS `official_name`,row_number() over ( order by `officials`.`official_name`) AS `rn` from `officials`) `offi` left join (select `projects`.`project_name` AS `project_name`,row_number() over ( order by `projects`.`project_name`) AS `rn` from `projects` where `projects`.`project_status` = 'Active') `proj` on(`offi`.`rn` = `proj`.`rn`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
