
-- DROP DATABASE `soft_uni`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


CREATE DATABASE IF NOT EXISTS `soft_uni` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `soft_uni`;


CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT,
  `address_text` varchar(100) NOT NULL,
  `town_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `PK_Addresses` (`address_id`),
  KEY `fk_addresses_towns` (`town_id`),
  CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`address_id`, `address_text`, `town_id`) VALUES
	(1, '108 Lakeside Court', 5),
	(2, '1343 Prospect St', 5),
	(3, '1648 Eastgate Lane', 5),
	(4, '2284 Azalea Avenue', 5),
	(5, '2947 Vine Lane', 5),
	(6, '3067 Maya', 5),
	(7, '3197 Thornhill Place', 5),
	(8, '3284 S. Blank Avenue', 5),
	(9, '332 Laguna Niguel', 5),
	(10, '3454 Bel Air Drive', 5),
	(11, '3670 All Ways Drive', 5),
	(12, '3708 Montana', 5),
	(13, '3711 Rollingwood Dr', 5),
	(14, '3919 Pinto Road', 5),
	(15, '4311 Clay Rd', 5),
	(16, '4777 Rockne Drive', 5),
	(17, '5678 Clear Court', 5),
	(18, '5863 Sierra', 5),
	(19, '6058 Hill Street', 5),
	(20, '6118 Grasswood Circle', 5),
	(21, '620 Woodside Ct.', 5),
	(22, '6307 Greenbelt Way', 5),
	(23, '6448 Castle Court', 5),
	(24, '6774 Bonanza', 5),
	(25, '6968 Wren Ave.', 5),
	(26, '7221 Peachwillow Street', 5),
	(27, '7270 Pepper Way', 5),
	(28, '7396 Stratton Circle', 5),
	(29, '7808 Brown St.', 5),
	(30, '7902 Grammercy Lane', 5),
	(31, '8668 Via Neruda', 5),
	(32, '8684 Military East', 5),
	(33, '8751 Norse Drive', 5),
	(34, '9320 Teakwood Dr.', 5),
	(35, '9435 Breck Court', 5),
	(36, '9745 Bonita Ct.', 5),
	(37, 'Pascalstr 951', 31),
	(38, '94, rue Descartes', 30),
	(39, '1226 Shoe St.', 8),
	(40, '1399 Firestone Drive', 8),
	(41, '1902 Santa Cruz', 8),
	(42, '1970 Napa Ct.', 8),
	(43, '250 Race Court', 8),
	(44, '5672 Hale Dr.', 8),
	(45, '5747 Shirley Drive', 8),
	(46, '6387 Scenic Avenue', 8),
	(47, '6872 Thornwood Dr.', 8),
	(48, '7484 Roundtree Drive', 8),
	(49, '8157 W. Book', 8),
	(50, '9539 Glenside Dr', 8),
	(51, '9833 Mt. Dias Blv.', 8),
	(52, '10203 Acorn Avenue', 2),
	(53, '3997 Via De Luna', 23),
	(54, 'Downshire Way', 23),
	(55, '1411 Ranch Drive', 15),
	(56, '3074 Arbor Drive', 15),
	(57, '390 Ridgewood Ct.', 15),
	(58, '9666 Northridge Ct.', 15),
	(59, '9752 Jeanne Circle', 15),
	(60, '8154 Via Mexico', 27),
	(61, '80 Sunview Terrace', 26),
	(62, '1825 Corte Del Prado', 17),
	(63, '2598 La Vista Circle', 17),
	(64, '3421 Bouncing Road', 17),
	(65, '3977 Central Avenue', 17),
	(66, '5086 Nottingham Place', 17),
	(67, '5379 Treasure Island Way', 17),
	(68, '8209 Green View Court', 17),
	(69, '8463 Vista Avenue', 17),
	(70, '9693 Mellowood Street', 17),
	(71, '991 Vista Verde', 17),
	(72, '1061 Buskrik Avenue', 3),
	(73, '172 Turning Dr.', 3),
	(74, '2038 Encino Drive', 3),
	(75, '2046 Las Palmas', 3),
	(76, '2059 Clay Rd', 3),
	(77, '207 Berry Court', 3),
	(78, '2080 Sycamore Drive', 3),
	(79, '2466 Clearland Circle', 3),
	(80, '2687 Ridge Road', 3),
	(81, '2812 Mazatlan', 3),
	(82, '3026 Anchor Drive', 3),
	(83, '3281 Hillview Dr.', 3),
	(84, '3632 Bank Way', 3),
	(85, '371 Apple Dr.', 3),
	(86, '504 O St.', 3),
	(87, '5423 Champion Rd.', 3),
	(88, '6057 Hill Street', 3),
	(89, '6870 D Bel Air Drive', 3),
	(90, '7338 Green St.', 3),
	(91, '7511 Cooper Dr.', 3),
	(92, '8152 Claudia Dr.', 3),
	(93, '8411 Mt. Orange Place', 3),
	(94, '9277 Country View Lane', 3),
	(95, '9784 Mt Etna Drive', 3),
	(96, '9825 Coralie Drive', 3),
	(97, '1185 Dallas Drive', 7),
	(98, '1362 Somerset Place', 7),
	(99, '181 Gaining Drive', 7),
	(100, '1962 Cotton Ct.', 7),
	(101, '2176 Apollo Way', 7),
	(102, '2294 West 39th St.', 7),
	(103, '3238 Laguna Circle', 7),
	(104, '3385 Crestview Drive', 7),
	(105, '3665 Oak Creek Ct.', 7),
	(106, '3928 San Francisco', 7),
	(107, '475 Santa Maria', 7),
	(108, '5242 Marvelle Ln.', 7),
	(109, '5452 Corte Gilberto', 7),
	(110, '6629 Polson Circle', 7),
	(111, '7640 First Ave.', 7),
	(112, '7883 Missing Canyon Court', 7),
	(113, '8624 Pepper Way', 7),
	(114, '9241 St George Dr.', 7),
	(115, '213 Stonewood Drive', 18),
	(116, '2425 Notre Dame Ave', 18),
	(117, '3884 Beauty Street', 18),
	(118, '8036 Summit View Dr.', 18),
	(119, '9605 Pheasant Circle', 18),
	(120, '1245 Clay Road', 10),
	(121, '1748 Bird Drive', 10),
	(122, '310 Winter Lane', 10),
	(123, '3127 El Camino Drive', 10),
	(124, '3514 Sunshine', 10),
	(125, '1144 Paradise Ct.', 6),
	(126, '1921 Ranch Road', 6),
	(127, '3333 Madhatter Circle', 6),
	(128, '342 San Simeon', 6),
	(129, '3848 East 39th Street', 6),
	(130, '5256 Chickpea Ct.', 6),
	(131, '5979 El Pueblo', 6),
	(132, '6580 Poor Ridge Court', 6),
	(133, '7435 Ricardo', 6),
	(134, '7691 Benedict Ct.', 6),
	(135, '7772 Golden Meadow', 6),
	(136, '8585 Los Gatos Ct.', 6),
	(137, '9314 Icicle Way', 6),
	(138, '9530 Vine Lane', 6),
	(139, '989 Crown Ct', 6),
	(140, '25 95th Ave NE', 20),
	(141, '4095 Cooper Dr.', 20),
	(142, '4155 Working Drive', 20),
	(143, '463 H Stagecoach Rd.', 20),
	(144, '5050 Mt. Wilson Way', 20),
	(145, '5203 Virginia Lane', 20),
	(146, '5458 Gladstone Drive', 20),
	(147, '5553 Cash Avenue', 20),
	(148, '5669 Ironwood Way', 20),
	(149, '6697 Ridge Park Drive', 20),
	(150, '7048 Laurel', 20),
	(151, '8192 Seagull Court', 20),
	(152, '350 Pastel Drive', 22),
	(153, '34 Waterloo Road', 21),
	(154, '8291 Crossbow Way', 28),
	(155, '5678 Lakeview Blvd.', 24),
	(156, '1356 Grove Way', 12),
	(157, '158 Walnut Ave', 12),
	(158, '1792 Belmont Rd.', 12),
	(159, '2275 Valley Blvd.', 12),
	(160, '3747 W. Landing Avenue', 12),
	(161, '3841 Silver Oaks Place', 12),
	(162, '4566 La Jolla', 12),
	(163, '4734 Sycamore Court', 12),
	(164, '5030 Blue Ridge Dr.', 12),
	(165, '5734 Ashford Court', 12),
	(166, '7726 Driftwood Drive', 12),
	(167, '8310 Ridge Circle', 12),
	(168, '896 Southdale', 12),
	(169, '9652 Los Angeles', 12),
	(170, '2487 Riverside Drive', 19),
	(171, '1397 Paradise Ct.', 14),
	(172, '1400 Gate Drive', 14),
	(173, '3030 Blackburn Ct.', 14),
	(174, '4350 Minute Dr.', 14),
	(175, '8967 Hamilton Ave.', 14),
	(176, '9297 Kenston Dr.', 14),
	(177, '9687 Shakespeare Drive', 14),
	(178, '9100 Sheppard Avenue North', 29),
	(179, '636 Vine Hill Way', 25),
	(180, '101 Candy Rd.', 1),
	(181, '1275 West Street', 1),
	(182, '2137 Birchwood Dr', 1),
	(183, '2383 Pepper Drive', 1),
	(184, '2427 Notre Dame Ave.', 1),
	(185, '2482 Buckingham Dr.', 1),
	(186, '3066 Wallace Dr.', 1),
	(187, '3397 Rancho View Drive', 1),
	(188, '3768 Door Way', 1),
	(189, '4909 Poco Lane', 1),
	(190, '6369 Ellis Street', 1),
	(191, '6891 Ham Drive', 1),
	(192, '7297 RisingView', 1),
	(193, '8000 Crane Court', 1),
	(194, '8040 Hill Ct', 1),
	(195, '8467 Clifford Court', 1),
	(196, '9006 Woodside Way', 1),
	(197, '9322 Driving Drive', 1),
	(198, '9863 Ridge Place', 1),
	(199, '9882 Clay Rde', 1),
	(200, '9906 Oak Grove Road', 1),
	(201, '1378 String Dr', 13),
	(202, '1803 Olive Hill', 13),
	(203, '2176 Brown Street', 13),
	(204, '2266 Greenwood Circle', 13),
	(205, '2598 Breck Court', 13),
	(206, '2736 Scramble Rd', 13),
	(207, '4312 Cambridge Drive', 13),
	(208, '5009 Orange Street', 13),
	(209, '5670 Bel Air Dr.', 13),
	(210, '5980 Icicle Circle', 13),
	(211, '6510 Hacienda Drive', 13),
	(212, '6937 E. 42nd Street', 13),
	(213, '7165 Brock Lane', 13),
	(214, '7559 Worth Ct.', 13),
	(215, '7985 Center Street', 13),
	(216, '9495 Limewood Place', 13),
	(217, '9533 Working Drive', 13),
	(218, '177 11th Ave', 16),
	(219, '1962 Ferndale Lane', 16),
	(220, '2473 Orchard Way', 16),
	(221, '4096 San Remo', 16),
	(222, '4310 Kenston Dr.', 16),
	(223, '4444 Pepper Way', 16),
	(224, '4525 Benedict Ct.', 16),
	(225, '5263 Etcheverry Dr', 16),
	(226, '535 Greendell Pl', 16),
	(227, '6871 Thornwood Dr.', 16),
	(228, '6951 Harmony Way', 16),
	(229, '7086 O St.', 16),
	(230, '7145 Matchstick Drive', 16),
	(231, '7820 Bird Drive', 16),
	(232, '7939 Bayview Court', 16),
	(233, '8316 La Salle St.', 16),
	(234, '9104 Mt. Sequoia Ct.', 16),
	(235, '1234 Seaside Way', 9),
	(236, '5725 Glaze Drive', 9),
	(237, '1064 Slow Creek Road', 4),
	(238, '1102 Ravenwood', 4),
	(239, '1220 Bradford Way', 4),
	(240, '1349 Steven Way', 4),
	(241, '136 Balboa Court', 4),
	(242, '137 Mazatlan', 4),
	(243, '1398 Yorba Linda', 4),
	(244, '1619 Stillman Court', 4),
	(245, '2144 San Rafael', 4),
	(246, '2354 Frame Ln.', 4),
	(247, '2639 Anchor Court', 4),
	(248, '3029 Pastime Dr', 4),
	(249, '3243 Buckingham Dr.', 4),
	(250, '426 San Rafael', 4),
	(251, '4598 Manila Avenue', 4),
	(252, '4948 West 4th St', 4),
	(253, '502 Alexander Pl.', 4),
	(254, '5025 Holiday Hills', 4),
	(255, '5125 Cotton Ct.', 4),
	(256, '5375 Clearland Circle', 4),
	(257, '5376 Catanzaro Way', 4),
	(258, '5407 Cougar Way', 4),
	(259, '5666 Hazelnut Lane', 4),
	(260, '5802 Ampersand Drive', 4),
	(261, '6498 Mining Rd.', 4),
	(262, '6578 Woodhaven Ln.', 4),
	(263, '6657 Sand Pointe Lane', 4),
	(264, '6843 San Simeon Dr.', 4),
	(265, '7126 Ending Ct.', 4),
	(266, '7127 Los Gatos Court', 4),
	(267, '7166 Brock Lane', 4),
	(268, '7403 N. Broadway', 4),
	(269, '7439 Laguna Niguel', 4),
	(270, '7594 Alexander Pl.', 4),
	(271, '7616 Honey Court', 4),
	(272, '77 Birchwood', 4),
	(273, '7765 Sunsine Drive', 4),
	(274, '7842 Ygnacio Valley Road', 4),
	(275, '8290 Margaret Ct.', 4),
	(276, '8656 Lakespring Place', 4),
	(277, '874 Olivera Road', 4),
	(278, '931 Corte De Luna', 4),
	(279, '9537 Ridgewood Drive', 4),
	(280, '9964 North Ridge Drive', 4),
	(281, '1285 Greenbrier Street', 11),
	(282, '2115 Passing', 11),
	(283, '2601 Cambridge Drive', 11),
	(284, '3114 Notre Dame Ave.', 11),
	(285, '3280 Pheasant Circle', 11),
	(286, '4231 Spar Court', 11),
	(287, '4852 Chaparral Court', 11),
	(288, '5724 Victory Lane', 11),
	(289, '591 Merriewood Drive', 11),
	(290, '7230 Vine Maple Street', 11),
	(291, '163 Nishava Str, ent A, apt. 1', 32);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;


CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `manager_id` int(10) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `PK_Departments` (`department_id`),
  KEY `fk_departments_employees` (`manager_id`),
  CONSTRAINT `fk_departments_employees` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`department_id`, `name`, `manager_id`) VALUES
	(1, 'Engineering', 12),
	(2, 'Tool Design', 4),
	(3, 'Sales', 273),
	(4, 'Marketing', 46),
	(5, 'Purchasing', 6),
	(6, 'Research and Development', 42),
	(7, 'Production', 148),
	(8, 'Production Control', 21),
	(9, 'Human Resources', 30),
	(10, 'Finance', 3),
	(11, 'Information Services', 42),
	(12, 'Document Control', 90),
	(13, 'Quality Assurance', 274),
	(14, 'Facilities and Maintenance', 218),
	(15, 'Shipping and Receiving', 85),
	(16, 'Executive', 109);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;



CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) NOT NULL,
  `department_id` int(10) NOT NULL,
  `manager_id` int(10) DEFAULT NULL,
  `hire_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `salary` decimal(19,4) NOT NULL,
  `address_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `PK_Employees` (`employee_id`),
  KEY `CL_FirstName` (`first_name`),
  KEY `fk_employees_departments` (`department_id`),
  KEY `fk_employees_employees` (`manager_id`),
  KEY `fk_employees_addresses` (`address_id`),
  CONSTRAINT `fk_employees_addresses` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `fk_employees_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_employees_employees` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `middle_name`, `job_title`, `department_id`, `manager_id`, `hire_date`, `salary`, `address_id`) VALUES
	(1, 'Guy', 'Gilbert', 'R', 'Production Technician', 7, 16, '1998-07-31 00:00:00.000000', 12500.0000, 166),
	(2, 'Kevin', 'Brown', 'F', 'Marketing Assistant', 4, 6, '1999-02-26 00:00:00.000000', 13500.0000, 102),
	(3, 'Roberto', 'Tamburello', NULL, 'Engineering Manager', 1, 12, '1999-12-12 00:00:00.000000', 43300.0000, 193),
	(4, 'Rob', 'Walters', NULL, 'Senior Tool Designer', 2, 3, '2000-01-05 00:00:00.000000', 29800.0000, 155),
	(5, 'Thierry', 'D\'Hers', 'B', 'Tool Designer', 2, 263, '2000-01-11 00:00:00.000000', 25000.0000, 40),
	(6, 'David', 'Bradley', 'M', 'Marketing Manager', 5, 109, '2000-01-20 00:00:00.000000', 37500.0000, 199),
	(7, 'JoLynn', 'Dobney', 'M', 'Production Supervisor', 7, 21, '2000-01-26 00:00:00.000000', 25000.0000, 275),
	(8, 'Ruth', 'Ellerbrock', 'Ann', 'Production Technician', 7, 185, '2000-02-06 00:00:00.000000', 13500.0000, 108),
	(9, 'Gail', 'Erickson', 'A', 'Design Engineer', 1, 3, '2000-02-06 00:00:00.000000', 32700.0000, 22),
	(10, 'Barry', 'Johnson', 'K', 'Production Technician', 7, 185, '2000-02-07 00:00:00.000000', 13500.0000, 285),
	(11, 'Jossef', 'Goldberg', 'H', 'Design Engineer', 1, 3, '2000-02-24 00:00:00.000000', 32700.0000, 214),
	(12, 'Terri', 'Duffy', 'Lee', 'Vice President of Engineering', 1, 109, '2000-03-03 00:00:00.000000', 63500.0000, 209),
	(13, 'Sidney', 'Higa', 'M', 'Production Technician', 7, 185, '2000-03-05 00:00:00.000000', 13500.0000, 73),
	(14, 'Taylor', 'Maxwell', 'R', 'Production Supervisor', 7, 21, '2000-03-11 00:00:00.000000', 25000.0000, 82),
	(15, 'Jeffrey', 'Ford', 'L', 'Production Technician', 7, 185, '2000-03-23 00:00:00.000000', 13500.0000, 156),
	(16, 'Jo', 'Brown', 'A', 'Production Supervisor', 7, 21, '2000-03-30 00:00:00.000000', 25000.0000, 70),
	(17, 'Doris', 'Hartwig', 'M', 'Production Technician', 7, 185, '2000-04-11 00:00:00.000000', 13500.0000, 144),
	(18, 'John', 'Campbell', 'T', 'Production Supervisor', 7, 21, '2000-04-18 00:00:00.000000', 25000.0000, 245),
	(19, 'Diane', 'Glimp', 'R', 'Production Technician', 7, 185, '2000-04-29 00:00:00.000000', 13500.0000, 184),
	(20, 'Steven', 'Selikoff', 'T', 'Production Technician', 7, 173, '2001-01-02 00:00:00.000000', 9500.0000, 104),
	(21, 'Peter', 'Krebs', 'J', 'Production Control Manager', 8, 148, '2001-01-02 00:00:00.000000', 24500.0000, 11),
	(22, 'Stuart', 'Munson', 'V', 'Production Technician', 7, 197, '2001-01-03 00:00:00.000000', 10000.0000, 36),
	(23, 'Greg', 'Alderson', 'F', 'Production Technician', 7, 197, '2001-01-03 00:00:00.000000', 10000.0000, 18),
	(24, 'David', 'Johnson', '', 'Production Technician', 7, 184, '2001-01-03 00:00:00.000000', 9500.0000, 142),
	(25, 'Zheng', 'Mu', 'W', 'Production Supervisor', 7, 21, '2001-01-04 00:00:00.000000', 25000.0000, 278),
	(26, 'Ivo', 'Salmre', 'William', 'Production Technician', 7, 108, '2001-01-05 00:00:00.000000', 14000.0000, 165),
	(27, 'Paul', 'Komosinski', 'B', 'Production Technician', 7, 87, '2001-01-05 00:00:00.000000', 15000.0000, 32),
	(28, 'Ashvini', 'Sharma', 'R', 'Network Administrator', 11, 150, '2001-01-05 00:00:00.000000', 32500.0000, 133),
	(29, 'Kendall', 'Keil', 'C', 'Production Technician', 7, 14, '2001-01-06 00:00:00.000000', 11000.0000, 257),
	(30, 'Paula', 'Barreto de Mattos', 'M', 'Human Resources Manager', 9, 140, '2001-01-07 00:00:00.000000', 27100.0000, 2),
	(31, 'Alejandro', 'McGuel', 'E', 'Production Technician', 7, 210, '2001-01-07 00:00:00.000000', 15000.0000, 274),
	(32, 'Garrett', 'Young', 'R', 'Production Technician', 7, 184, '2001-01-08 00:00:00.000000', 9500.0000, 283),
	(33, 'Jian Shuo', 'Wang', NULL, 'Production Technician', 7, 135, '2001-01-08 00:00:00.000000', 9500.0000, 160),
	(34, 'Susan', 'Eaton', 'W', 'Stocker', 15, 85, '2001-01-08 00:00:00.000000', 9000.0000, 204),
	(35, 'Vamsi', 'Kuppa', '', 'Shipping and Receiving Clerk', 15, 85, '2001-01-08 00:00:00.000000', 9500.0000, 51),
	(36, 'Alice', 'Ciccu', 'O', 'Production Technician', 7, 38, '2001-01-08 00:00:00.000000', 11000.0000, 284),
	(37, 'Simon', 'Rapier', 'D', 'Production Technician', 7, 7, '2001-01-09 00:00:00.000000', 12500.0000, 64),
	(38, 'Jinghao', 'Liu', 'K', 'Production Supervisor', 7, 21, '2001-01-09 00:00:00.000000', 25000.0000, 55),
	(39, 'Michael', 'Hines', 'T', 'Production Technician', 7, 182, '2001-01-10 00:00:00.000000', 14000.0000, 168),
	(40, 'Yvonne', 'McKay', 'S', 'Production Technician', 7, 159, '2001-01-10 00:00:00.000000', 10000.0000, 107),
	(41, 'Peng', 'Wu', 'J', 'Quality Assurance Supervisor', 13, 200, '2001-01-10 00:00:00.000000', 21600.0000, 39),
	(42, 'Jean', 'Trenary', 'E', 'Information Services Manager', 11, 109, '2001-01-12 00:00:00.000000', 50500.0000, 194),
	(43, 'Russell', 'Hunter', NULL, 'Production Technician', 7, 74, '2001-01-13 00:00:00.000000', 11000.0000, 258),
	(44, 'A. Scott', 'Wright', NULL, 'Master Scheduler', 8, 148, '2001-01-13 00:00:00.000000', 23600.0000, 172),
	(45, 'Fred', 'Northup', 'T', 'Production Technician', 7, 210, '2001-01-13 00:00:00.000000', 15000.0000, 282),
	(46, 'Sariya', 'Harnpadoungsataya', 'E', 'Marketing Specialist', 4, 6, '2001-01-13 00:00:00.000000', 14400.0000, 106),
	(47, 'Willis', 'Johnson', 'T', 'Recruiter', 9, 30, '2001-01-14 00:00:00.000000', 18300.0000, 99),
	(48, 'Jun', 'Cao', 'T', 'Production Technician', 7, 38, '2001-01-15 00:00:00.000000', 11000.0000, 197),
	(49, 'Christian', 'Kleinerman', 'E', 'Maintenance Supervisor', 14, 218, '2001-01-15 00:00:00.000000', 20400.0000, 118),
	(50, 'Susan', 'Metters', 'A', 'Production Technician', 7, 184, '2001-01-15 00:00:00.000000', 9500.0000, 224),
	(51, 'Reuben', 'D\'sa', 'H', 'Production Supervisor', 7, 21, '2001-01-16 00:00:00.000000', 25000.0000, 249),
	(52, 'Kirk', 'Koenigsbauer', 'J', 'Production Technician', 7, 123, '2001-01-16 00:00:00.000000', 10000.0000, 250),
	(53, 'David', 'Ortiz', 'J', 'Production Technician', 7, 18, '2001-01-16 00:00:00.000000', 12500.0000, 267),
	(54, 'Tengiz', 'Kharatishvili', '', 'Control Specialist', 12, 90, '2001-01-17 00:00:00.000000', 16800.0000, 129),
	(55, 'Hanying', 'Feng', 'P', 'Production Technician', 7, 143, '2001-01-17 00:00:00.000000', 14000.0000, 182),
	(56, 'Kevin', 'Liu', 'H', 'Production Technician', 7, 210, '2001-01-18 00:00:00.000000', 15000.0000, 259),
	(57, 'Annik', 'Stahl', 'O', 'Production Technician', 7, 16, '2001-01-18 00:00:00.000000', 12500.0000, 262),
	(58, 'Suroor', 'Fatima', 'R', 'Production Technician', 7, 38, '2001-01-18 00:00:00.000000', 11000.0000, 86),
	(59, 'Deborah', 'Poe', 'E', 'Accounts Receivable Specialist', 10, 139, '2001-01-19 00:00:00.000000', 19000.0000, 103),
	(60, 'Jim', 'Scardelis', 'H', 'Production Technician', 7, 74, '2001-01-20 00:00:00.000000', 11000.0000, 88),
	(61, 'Carole', 'Poland', 'M', 'Production Technician', 7, 173, '2001-01-20 00:00:00.000000', 9500.0000, 72),
	(62, 'George', 'Li', 'Z', 'Production Technician', 7, 184, '2001-01-22 00:00:00.000000', 9500.0000, 58),
	(63, 'Gary', 'Yukish', 'W', 'Production Technician', 7, 87, '2001-01-23 00:00:00.000000', 15000.0000, 80),
	(64, 'Cristian', 'Petculescu', 'K', 'Production Supervisor', 7, 21, '2001-01-23 00:00:00.000000', 25000.0000, 276),
	(65, 'Raymond', 'Sam', 'K', 'Production Technician', 7, 143, '2001-01-24 00:00:00.000000', 14000.0000, 75),
	(66, 'Janaina', 'Bueno', 'Barreiro Gambaro', 'Application Specialist', 11, 42, '2001-01-24 00:00:00.000000', 27400.0000, 131),
	(67, 'Bob', 'Hohman', '', 'Production Technician', 7, 14, '2001-01-25 00:00:00.000000', 11000.0000, 44),
	(68, 'Shammi', 'Mohamed', 'G', 'Production Technician', 7, 210, '2001-01-25 00:00:00.000000', 15000.0000, 4),
	(69, 'Linda', 'Moschell', 'K', 'Production Technician', 7, 38, '2001-01-26 00:00:00.000000', 11000.0000, 5),
	(70, 'Mindy', 'Martin', 'C', 'Benefits Specialist', 9, 30, '2001-01-26 00:00:00.000000', 16600.0000, 171),
	(71, 'Wendy', 'Kahn', 'Beth', 'Finance Manager', 10, 140, '2001-01-26 00:00:00.000000', 43300.0000, 232),
	(72, 'Kim', 'Ralls', 'T', 'Stocker', 15, 85, '2001-01-27 00:00:00.000000', 9000.0000, 42),
	(73, 'Sandra', 'Reategui Alayo', NULL, 'Production Technician', 7, 135, '2001-01-27 00:00:00.000000', 9500.0000, 255),
	(74, 'Kok-Ho', 'Loh', 'T', 'Production Supervisor', 7, 21, '2001-01-28 00:00:00.000000', 25000.0000, 10),
	(75, 'Douglas', 'Hite', 'B', 'Production Technician', 7, 159, '2001-01-28 00:00:00.000000', 10000.0000, 57),
	(76, 'James', 'Kramer', 'D', 'Production Technician', 7, 7, '2001-01-28 00:00:00.000000', 12500.0000, 162),
	(77, 'Sean', 'Alexander', 'P', 'Quality Assurance Technician', 13, 41, '2001-01-29 00:00:00.000000', 10600.0000, 210),
	(78, 'Nitin', 'Mirchandani', 'S', 'Production Technician', 7, 182, '2001-01-29 00:00:00.000000', 14000.0000, 231),
	(79, 'Diane', 'Margheim', 'L', 'Research and Development Engineer', 6, 158, '2001-01-30 00:00:00.000000', 40900.0000, 111),
	(80, 'Rebecca', 'Laszlo', 'A', 'Production Technician', 7, 16, '2001-01-30 00:00:00.000000', 12500.0000, 6),
	(81, 'Rajesh', 'Patel', 'M', 'Production Technician', 7, 210, '2001-02-01 00:00:00.000000', 15000.0000, 81),
	(82, 'Vidur', 'Luthra', 'X', 'Recruiter', 9, 30, '2001-02-02 00:00:00.000000', 18300.0000, 176),
	(83, 'John', 'Evans', 'P', 'Production Technician', 7, 38, '2001-02-02 00:00:00.000000', 11000.0000, 253),
	(84, 'Nancy', 'Anderson', 'A', 'Production Technician', 7, 7, '2001-02-03 00:00:00.000000', 12500.0000, 227),
	(85, 'Pilar', 'Ackerman', 'G', 'Shipping and Receiving Supervisor', 15, 21, '2001-02-03 00:00:00.000000', 19200.0000, 269),
	(86, 'David', 'Yalovsky', 'A', 'Production Technician', 7, 184, '2001-02-03 00:00:00.000000', 9500.0000, 241),
	(87, 'David', 'Hamilton', 'P', 'Production Supervisor', 7, 21, '2001-02-04 00:00:00.000000', 25000.0000, 150),
	(88, 'Laura', 'Steele', 'C', 'Production Technician', 7, 123, '2001-02-04 00:00:00.000000', 10000.0000, 62),
	(89, 'Margie', 'Shoop', 'W', 'Production Technician', 7, 16, '2001-02-05 00:00:00.000000', 12500.0000, 92),
	(90, 'Zainal', 'Arifin', 'T', 'Document Control Manager', 12, 200, '2001-02-05 00:00:00.000000', 17800.0000, 128),
	(91, 'Lorraine', 'Nay', 'O', 'Production Technician', 7, 210, '2001-02-05 00:00:00.000000', 15000.0000, 94),
	(92, 'Fadi', 'Fakhouri', 'K', 'Production Technician', 7, 143, '2001-02-05 00:00:00.000000', 14000.0000, 281),
	(93, 'Ryan', 'Cornelsen', 'L', 'Production Technician', 7, 51, '2001-02-06 00:00:00.000000', 15000.0000, 228),
	(94, 'Candy', 'Spoon', 'L', 'Accounts Receivable Specialist', 10, 139, '2001-02-07 00:00:00.000000', 19000.0000, 122),
	(95, 'Nuan', 'Yu', NULL, 'Production Technician', 7, 74, '2001-02-07 00:00:00.000000', 11000.0000, 12),
	(96, 'William', 'Vong', 'S', 'Scheduling Assistant', 8, 44, '2001-02-08 00:00:00.000000', 16000.0000, 35),
	(97, 'Bjorn', 'Rettig', 'M', 'Production Technician', 7, 173, '2001-02-08 00:00:00.000000', 9500.0000, 268),
	(98, 'Scott', 'Gode', 'R', 'Production Technician', 7, 197, '2001-02-09 00:00:00.000000', 10000.0000, 256),
	(99, 'Michael', 'Rothkugel', 'L', 'Production Technician', 7, 87, '2001-02-11 00:00:00.000000', 15000.0000, 93),
	(100, 'Lane', 'Sacksteder', 'M', 'Production Technician', 7, 143, '2001-02-12 00:00:00.000000', 14000.0000, 239),
	(101, 'Pete', 'Male', 'C', 'Production Technician', 7, 14, '2001-02-12 00:00:00.000000', 11000.0000, 273),
	(102, 'Dan', 'Bacon', 'K', 'Application Specialist', 11, 42, '2001-02-12 00:00:00.000000', 27400.0000, 126),
	(103, 'David', 'Barber', 'M', 'Assistant to the Chief Financial Officer', 10, 140, '2001-02-13 00:00:00.000000', 13500.0000, 173),
	(104, 'Lolan', 'Song', 'B', 'Production Technician', 7, 74, '2001-02-13 00:00:00.000000', 11000.0000, 77),
	(105, 'Paula', 'Nartker', 'R', 'Production Technician', 7, 210, '2001-02-13 00:00:00.000000', 15000.0000, 247),
	(106, 'Mary', 'Gibson', 'E', 'Marketing Specialist', 4, 6, '2001-02-13 00:00:00.000000', 14400.0000, 110),
	(107, 'Mindaugas', 'Krapauskas', 'J', 'Production Technician', 7, 38, '2001-02-14 00:00:00.000000', 11000.0000, 74),
	(108, 'Eric', 'Gubbels', NULL, 'Production Supervisor', 7, 21, '2001-02-15 00:00:00.000000', 25000.0000, 85),
	(109, 'Ken', 'Sanchez', 'J', 'Chief Executive Officer', 16, NULL, '2001-02-15 00:00:00.000000', 125500.0000, 177),
	(110, 'Jason', 'Watters', 'M', 'Production Technician', 7, 135, '2001-02-15 00:00:00.000000', 9500.0000, 21),
	(111, 'Mark', 'Harrington', 'L', 'Quality Assurance Technician', 13, 41, '2001-02-16 00:00:00.000000', 10600.0000, 139),
	(112, 'Janeth', 'Esteves', 'M', 'Production Technician', 7, 159, '2001-02-16 00:00:00.000000', 10000.0000, 163),
	(113, 'Marc', 'Ingle', 'J', 'Production Technician', 7, 184, '2001-02-17 00:00:00.000000', 9500.0000, 230),
	(114, 'Gigi', 'Matthew', '', 'Research and Development Engineer', 6, 158, '2001-02-17 00:00:00.000000', 40900.0000, 23),
	(115, 'Paul', 'Singh', 'R', 'Production Technician', 7, 108, '2001-02-18 00:00:00.000000', 14000.0000, 16),
	(116, 'Frank', 'Lee', 'T', 'Production Technician', 7, 210, '2001-02-18 00:00:00.000000', 15000.0000, 263),
	(117, 'Francois', 'Ajenstat', 'P', 'Database Administrator', 11, 42, '2001-02-18 00:00:00.000000', 38500.0000, 127),
	(118, 'Diane', 'Tibbott', 'H', 'Production Technician', 7, 14, '2001-02-19 00:00:00.000000', 11000.0000, 140),
	(119, 'Jill', 'Williams', 'A', 'Marketing Specialist', 4, 6, '2001-02-19 00:00:00.000000', 14400.0000, 114),
	(120, 'Angela', 'Barbariol', 'W', 'Production Technician', 7, 38, '2001-02-21 00:00:00.000000', 11000.0000, 91),
	(121, 'Matthias', 'Berndt', 'T', 'Shipping and Receiving Clerk', 15, 85, '2001-02-21 00:00:00.000000', 9500.0000, 201),
	(122, 'Bryan', 'Baker', NULL, 'Production Technician', 7, 7, '2001-02-22 00:00:00.000000', 12500.0000, 166),
	(123, 'Jeff', 'Hay', 'V', 'Production Supervisor', 7, 21, '2001-02-22 00:00:00.000000', 25000.0000, 113),
	(124, 'Eugene', 'Zabokritski', 'R', 'Production Technician', 7, 184, '2001-02-22 00:00:00.000000', 9500.0000, 226),
	(125, 'Barbara', 'Decker', 'S', 'Production Technician', 7, 182, '2001-02-23 00:00:00.000000', 14000.0000, 219),
	(126, 'Chris', 'Preston', 'T', 'Production Technician', 7, 123, '2001-02-23 00:00:00.000000', 10000.0000, 279),
	(127, 'Sean', 'Chai', '', 'Document Control Assistant', 12, 90, '2001-02-23 00:00:00.000000', 10300.0000, 138),
	(128, 'Dan', 'Wilson', 'B', 'Database Administrator', 11, 42, '2001-02-23 00:00:00.000000', 38500.0000, 30),
	(129, 'Mark', 'McArthur', 'K', 'Production Technician', 7, 16, '2001-02-24 00:00:00.000000', 12500.0000, 186),
	(130, 'Bryan', 'Walton', 'A', 'Accounts Receivable Specialist', 10, 139, '2001-02-25 00:00:00.000000', 19000.0000, 175),
	(131, 'Houman', 'Pournasseh', '', 'Production Technician', 7, 74, '2001-02-26 00:00:00.000000', 11000.0000, 185),
	(132, 'Sairaj', 'Uddin', 'L', 'Scheduling Assistant', 8, 44, '2001-02-27 00:00:00.000000', 16000.0000, 190),
	(133, 'Michiko', 'Osada', 'F', 'Production Technician', 7, 173, '2001-02-27 00:00:00.000000', 9500.0000, 229),
	(134, 'Benjamin', 'Martin', 'R', 'Production Technician', 7, 184, '2001-02-28 00:00:00.000000', 9500.0000, 286),
	(135, 'Cynthia', 'Randall', 'S', 'Production Supervisor', 7, 21, '2001-02-28 00:00:00.000000', 25000.0000, 147),
	(136, 'Kathie', 'Flood', 'E', 'Production Technician', 7, 197, '2001-02-28 00:00:00.000000', 10000.0000, 100),
	(137, 'Britta', 'Simon', 'L', 'Production Technician', 7, 16, '2001-03-02 00:00:00.000000', 12500.0000, 95),
	(138, 'Brian', 'Lloyd', 'T', 'Production Technician', 7, 210, '2001-03-02 00:00:00.000000', 15000.0000, 288),
	(139, 'David', 'Liu', 'J', 'Accounts Manager', 10, 140, '2001-03-03 00:00:00.000000', 34700.0000, 119),
	(140, 'Laura', 'Norman', 'F', 'Chief Financial Officer', 16, 109, '2001-03-04 00:00:00.000000', 60100.0000, 215),
	(141, 'Michael', 'Patten', 'W', 'Production Technician', 7, 38, '2001-03-04 00:00:00.000000', 11000.0000, 96),
	(142, 'Andy', 'Ruth', 'M', 'Production Technician', 7, 135, '2001-03-04 00:00:00.000000', 9500.0000, 1),
	(143, 'Yuhong', 'Li', 'L', 'Production Supervisor', 7, 21, '2001-03-05 00:00:00.000000', 25000.0000, 242),
	(144, 'Robert', 'Rounthwaite', 'J', 'Production Technician', 7, 159, '2001-03-06 00:00:00.000000', 10000.0000, 280),
	(145, 'Andreas', 'Berglund', 'T', 'Quality Assurance Technician', 13, 41, '2001-03-06 00:00:00.000000', 10600.0000, 208),
	(146, 'Reed', 'Koch', 'T', 'Production Technician', 7, 184, '2001-03-06 00:00:00.000000', 9500.0000, 191),
	(147, 'Linda', 'Randall', 'A', 'Production Technician', 7, 143, '2001-03-07 00:00:00.000000', 14000.0000, 260),
	(148, 'James', 'Hamilton', 'R', 'Vice President of Production', 7, 109, '2001-03-07 00:00:00.000000', 84100.0000, 158),
	(149, 'Ramesh', 'Meyyappan', 'V', 'Application Specialist', 11, 42, '2001-03-07 00:00:00.000000', 27400.0000, 130),
	(150, 'Stephanie', 'Conroy', 'A', 'Network Manager', 11, 42, '2001-03-08 00:00:00.000000', 39700.0000, 136),
	(151, 'Samantha', 'Smith', 'H', 'Production Technician', 7, 108, '2001-03-08 00:00:00.000000', 14000.0000, 14),
	(152, 'Tawana', 'Nusbaum', 'G', 'Production Technician', 7, 210, '2001-03-09 00:00:00.000000', 15000.0000, 237),
	(153, 'Denise', 'Smith', 'H', 'Production Technician', 7, 14, '2001-03-09 00:00:00.000000', 11000.0000, 143),
	(154, 'Hao', 'Chen', 'O', 'Human Resources Administrative Assistant', 9, 30, '2001-03-10 00:00:00.000000', 13900.0000, 135),
	(155, 'Alex', 'Nayberg', 'M', 'Production Technician', 7, 123, '2001-03-12 00:00:00.000000', 10000.0000, 174),
	(156, 'Eugene', 'Kogan', 'O', 'Production Technician', 7, 7, '2001-03-12 00:00:00.000000', 12500.0000, 71),
	(157, 'Brandon', 'Heidepriem', 'G', 'Production Technician', 7, 16, '2001-03-12 00:00:00.000000', 12500.0000, 189),
	(158, 'Dylan', 'Miller', 'A', 'Research and Development Manager', 6, 3, '2001-03-12 00:00:00.000000', 50500.0000, 141),
	(159, 'Shane', 'Kim', 'S', 'Production Supervisor', 7, 21, '2001-03-12 00:00:00.000000', 25000.0000, 20),
	(160, 'John', 'Chen', 'Y', 'Production Technician', 7, 182, '2001-03-13 00:00:00.000000', 14000.0000, 65),
	(161, 'Karen', 'Berge', 'R', 'Document Control Assistant', 12, 90, '2001-03-13 00:00:00.000000', 10300.0000, 123),
	(162, 'Jose', 'Lugo', 'R', 'Production Technician', 7, 16, '2001-03-14 00:00:00.000000', 12500.0000, 271),
	(163, 'Mandar', 'Samant', 'H', 'Production Technician', 7, 74, '2001-03-14 00:00:00.000000', 11000.0000, 63),
	(164, 'Mikael', 'Sandberg', 'Q', 'Buyer', 5, 274, '2001-03-14 00:00:00.000000', 18300.0000, 50),
	(165, 'Sameer', 'Tejani', 'A', 'Production Technician', 7, 74, '2001-03-15 00:00:00.000000', 11000.0000, 66),
	(166, 'Dragan', 'Tomic', 'K', 'Accounts Payable Specialist', 10, 139, '2001-03-15 00:00:00.000000', 19000.0000, 115),
	(167, 'Carol', 'Philips', 'M', 'Production Technician', 7, 173, '2001-03-16 00:00:00.000000', 9500.0000, 45),
	(168, 'Rob', 'Caron', 'T', 'Production Technician', 7, 87, '2001-03-17 00:00:00.000000', 15000.0000, 161),
	(169, 'Don', 'Hall', 'L', 'Production Technician', 7, 38, '2001-03-17 00:00:00.000000', 11000.0000, 59),
	(170, 'Alan', 'Brewer', 'J', 'Scheduling Assistant', 8, 44, '2001-03-17 00:00:00.000000', 16000.0000, 151),
	(171, 'David', 'Lawrence', 'Oliver', 'Production Technician', 7, 184, '2001-03-18 00:00:00.000000', 9500.0000, 167),
	(172, 'Baris', 'Cetinok', 'F', 'Production Technician', 7, 87, '2001-03-19 00:00:00.000000', 15000.0000, 244),
	(173, 'Michael', 'Ray', 'Sean', 'Production Supervisor', 7, 21, '2001-03-19 00:00:00.000000', 25000.0000, 277),
	(174, 'Steve', 'Masters', 'F', 'Production Technician', 7, 18, '2001-03-19 00:00:00.000000', 12500.0000, 252),
	(175, 'Suchitra', 'Mohan', 'O', 'Production Technician', 7, 16, '2001-03-20 00:00:00.000000', 12500.0000, 31),
	(176, 'Karen', 'Berg', 'A', 'Application Specialist', 11, 42, '2001-03-20 00:00:00.000000', 27400.0000, 132),
	(177, 'Terrence', 'Earls', 'W', 'Production Technician', 7, 143, '2001-03-20 00:00:00.000000', 14000.0000, 34),
	(178, 'Barbara', 'Moreland', 'C', 'Accountant', 10, 139, '2001-03-22 00:00:00.000000', 26400.0000, 254),
	(179, 'Chad', 'Niswonger', 'W', 'Production Technician', 7, 38, '2001-03-22 00:00:00.000000', 11000.0000, 46),
	(180, 'Rostislav', 'Shabalin', 'E', 'Production Technician', 7, 135, '2001-03-23 00:00:00.000000', 9500.0000, 9),
	(181, 'Belinda', 'Newman', 'M', 'Production Technician', 7, 197, '2001-03-24 00:00:00.000000', 10000.0000, 43),
	(182, 'Katie', 'McAskill-White', 'L', 'Production Supervisor', 7, 21, '2001-03-24 00:00:00.000000', 25000.0000, 240),
	(183, 'Russell', 'King', 'M', 'Production Technician', 7, 184, '2001-03-25 00:00:00.000000', 9500.0000, 3),
	(184, 'Jack', 'Richins', 'S', 'Production Supervisor', 7, 21, '2001-03-25 00:00:00.000000', 25000.0000, 169),
	(185, 'Andrew', 'Hill', 'R', 'Production Supervisor', 7, 21, '2001-03-26 00:00:00.000000', 25000.0000, 97),
	(186, 'Nicole', 'Holliday', 'B', 'Production Technician', 7, 87, '2001-03-26 00:00:00.000000', 15000.0000, 238),
	(187, 'Frank', 'Miller', 'T', 'Production Technician', 7, 14, '2001-03-27 00:00:00.000000', 11000.0000, 289),
	(188, 'Peter', 'Connelly', 'I', 'Network Administrator', 11, 150, '2001-03-27 00:00:00.000000', 32500.0000, 137),
	(189, 'Anibal', 'Sousa', 'T', 'Production Technician', 7, 108, '2001-03-27 00:00:00.000000', 14000.0000, 183),
	(190, 'Ken', 'Myer', 'L', 'Production Technician', 7, 210, '2001-03-28 00:00:00.000000', 15000.0000, 105),
	(191, 'Grant', 'Culbertson', '', 'Human Resources Administrative Assistant', 9, 30, '2001-03-29 00:00:00.000000', 13900.0000, 117),
	(192, 'Michael', 'Entin', 'T', 'Production Technician', 7, 38, '2001-03-29 00:00:00.000000', 11000.0000, 195),
	(193, 'Lionel', 'Penuchot', 'C', 'Production Technician', 7, 159, '2001-03-30 00:00:00.000000', 10000.0000, 261),
	(194, 'Thomas', 'Michaels', 'R', 'Production Technician', 7, 7, '2001-03-30 00:00:00.000000', 12500.0000, 78),
	(195, 'Jimmy', 'Bischoff', 'T', 'Stocker', 15, 85, '2001-03-30 00:00:00.000000', 9000.0000, 206),
	(196, 'Michael', 'Vanderhyde', 'T', 'Production Technician', 7, 135, '2001-03-30 00:00:00.000000', 9500.0000, 90),
	(197, 'Lori', 'Kane', 'A', 'Production Supervisor', 7, 21, '2001-03-30 00:00:00.000000', 25000.0000, 198),
	(198, 'Arvind', 'Rao', 'B', 'Buyer', 5, 274, '2001-04-01 00:00:00.000000', 18300.0000, 212),
	(199, 'Stefen', 'Hesse', 'A', 'Production Technician', 7, 182, '2001-04-01 00:00:00.000000', 14000.0000, 68),
	(200, 'Hazem', 'Abolrous', 'E', 'Quality Assurance Manager', 13, 148, '2001-04-01 00:00:00.000000', 28800.0000, 148),
	(201, 'Janet', 'Sheperdigian', 'L', 'Accounts Payable Specialist', 10, 139, '2001-04-02 00:00:00.000000', 19000.0000, 218),
	(202, 'Elizabeth', 'Keyser', 'I', 'Production Technician', 7, 74, '2001-04-03 00:00:00.000000', 11000.0000, 152),
	(203, 'Terry', 'Eminhizer', 'J', 'Marketing Specialist', 4, 6, '2001-04-03 00:00:00.000000', 14400.0000, 19),
	(204, 'John', 'Frum', '', 'Production Technician', 7, 184, '2001-04-04 00:00:00.000000', 9500.0000, 112),
	(205, 'Merav', 'Netz', 'A', 'Production Technician', 7, 173, '2001-04-04 00:00:00.000000', 9500.0000, 270),
	(206, 'Brian', 'LaMee', 'P', 'Scheduling Assistant', 8, 44, '2001-04-04 00:00:00.000000', 16000.0000, 109),
	(207, 'Kitti', 'Lertpiriyasuwat', 'H', 'Production Technician', 7, 38, '2001-04-05 00:00:00.000000', 11000.0000, 272),
	(208, 'Jay', 'Adams', 'G', 'Production Technician', 7, 18, '2001-04-06 00:00:00.000000', 12500.0000, 157),
	(209, 'Jan', 'Miksovsky', 'S', 'Production Technician', 7, 184, '2001-04-06 00:00:00.000000', 9500.0000, 101),
	(210, 'Brenda', 'Diaz', 'M', 'Production Supervisor', 7, 21, '2001-04-06 00:00:00.000000', 25000.0000, 251),
	(211, 'Andrew', 'Cencini', 'M', 'Production Technician', 7, 123, '2001-04-07 00:00:00.000000', 10000.0000, 233),
	(212, 'Chris', 'Norred', 'K', 'Control Specialist', 12, 90, '2001-04-07 00:00:00.000000', 16800.0000, 125),
	(213, 'Chris', 'Okelberry', 'O', 'Production Technician', 7, 16, '2001-04-08 00:00:00.000000', 12500.0000, 188),
	(214, 'Shelley', 'Dyck', '', 'Production Technician', 7, 143, '2001-04-08 00:00:00.000000', 14000.0000, 164),
	(215, 'Gabe', 'Mares', 'B', 'Production Technician', 7, 210, '2001-04-09 00:00:00.000000', 15000.0000, 87),
	(216, 'Mike', 'Seamans', 'K', 'Accountant', 10, 139, '2001-04-09 00:00:00.000000', 26400.0000, 120),
	(217, 'Michael', 'Raheem', NULL, 'Research and Development Manager', 6, 158, '2001-06-04 00:00:00.000000', 42500.0000, 236),
	(218, 'Gary', 'Altman', 'E.', 'Facilities Manager', 14, 148, '2002-01-03 00:00:00.000000', 24000.0000, 203),
	(219, 'Charles', 'Fitzgerald', 'B', 'Production Technician', 7, 18, '2002-01-04 00:00:00.000000', 12500.0000, 223),
	(220, 'Ebru', 'Ersan', '', 'Production Technician', 7, 25, '2002-01-07 00:00:00.000000', 13500.0000, 225),
	(221, 'Sylvester', 'Valdez', 'A', 'Production Technician', 7, 108, '2002-01-12 00:00:00.000000', 14000.0000, 25),
	(222, 'Brian', 'Goldstein', 'Richard', 'Production Technician', 7, 51, '2002-01-12 00:00:00.000000', 15000.0000, 48),
	(223, 'Linda', 'Meisner', 'P', 'Buyer', 5, 274, '2002-01-18 00:00:00.000000', 18300.0000, 28),
	(224, 'Betsy', 'Stadick', 'A', 'Production Technician', 7, 64, '2002-01-19 00:00:00.000000', 13500.0000, 47),
	(225, 'Magnus', 'Hedlund', 'E', 'Facilities Administrative Assistant', 14, 218, '2002-01-22 00:00:00.000000', 9800.0000, 211),
	(226, 'Karan', 'Khanna', 'R', 'Production Technician', 7, 18, '2002-01-23 00:00:00.000000', 12500.0000, 248),
	(227, 'Mary', 'Baker', 'R', 'Production Technician', 7, 25, '2002-01-26 00:00:00.000000', 13500.0000, 246),
	(228, 'Kevin', 'Homer', 'M', 'Production Technician', 7, 25, '2002-01-26 00:00:00.000000', 13500.0000, 29),
	(229, 'Mihail', 'Frintu', 'U', 'Production Technician', 7, 51, '2002-01-30 00:00:00.000000', 15000.0000, 89),
	(230, 'Bonnie', 'Kearney', '', 'Production Technician', 7, 185, '2002-02-02 00:00:00.000000', 13500.0000, 287),
	(231, 'Fukiko', 'Ogisu', 'J', 'Buyer', 5, 274, '2002-02-05 00:00:00.000000', 18300.0000, 17),
	(232, 'Hung-Fu', 'Ting', 'T', 'Production Technician', 7, 108, '2002-02-07 00:00:00.000000', 14000.0000, 220),
	(233, 'Gordon', 'Hee', 'L', 'Buyer', 5, 274, '2002-02-12 00:00:00.000000', 18300.0000, 15),
	(234, 'Kimberly', 'Zimmerman', 'B', 'Production Technician', 7, 64, '2002-02-13 00:00:00.000000', 13500.0000, 266),
	(235, 'Kim', 'Abercrombie', 'B', 'Production Technician', 7, 16, '2002-02-17 00:00:00.000000', 12500.0000, 56),
	(236, 'Sandeep', 'Kaliyath', 'P', 'Production Technician', 7, 51, '2002-02-18 00:00:00.000000', 15000.0000, 234),
	(237, 'Prasanna', 'Samarawickrama', 'E', 'Production Technician', 7, 108, '2002-02-23 00:00:00.000000', 14000.0000, 187),
	(238, 'Frank', 'Pellow', 'S', 'Buyer', 5, 274, '2002-02-24 00:00:00.000000', 18300.0000, 213),
	(239, 'Min', 'Su', 'G', 'Production Technician', 7, 108, '2002-02-25 00:00:00.000000', 14000.0000, 24),
	(240, 'Eric', 'Brown', 'L', 'Production Technician', 7, 51, '2002-02-25 00:00:00.000000', 15000.0000, 67),
	(241, 'Eric', 'Kurjan', 'S', 'Buyer', 5, 274, '2002-02-28 00:00:00.000000', 18300.0000, 207),
	(242, 'Pat', 'Coleman', 'H', 'Janitor', 14, 49, '2002-02-28 00:00:00.000000', 9300.0000, 116),
	(243, 'Maciej', 'Dusza', 'W', 'Production Technician', 7, 18, '2002-03-01 00:00:00.000000', 12500.0000, 83),
	(244, 'Erin', 'Hagens', 'M', 'Buyer', 5, 274, '2002-03-03 00:00:00.000000', 18300.0000, 8),
	(245, 'Patrick', 'Wedge', 'C', 'Production Technician', 7, 64, '2002-03-04 00:00:00.000000', 13500.0000, 7),
	(246, 'Frank', 'Martinez', 'R', 'Production Technician', 7, 51, '2002-03-08 00:00:00.000000', 15000.0000, 290),
	(247, 'Ed', 'Dudenhoefer', 'R', 'Production Technician', 7, 16, '2002-03-08 00:00:00.000000', 12500.0000, 243),
	(248, 'Christopher', 'Hill', 'E', 'Production Technician', 7, 25, '2002-03-11 00:00:00.000000', 13500.0000, 41),
	(249, 'Patrick', 'Cook', 'M', 'Production Technician', 7, 51, '2002-03-15 00:00:00.000000', 15000.0000, 264),
	(250, 'Krishna', 'Sunkammurali', NULL, 'Production Technician', 7, 108, '2002-03-16 00:00:00.000000', 14000.0000, 79),
	(251, 'Lori', 'Penor', 'K', 'Janitor', 14, 49, '2002-03-19 00:00:00.000000', 9300.0000, 124),
	(252, 'Danielle', 'Tiedt', 'C', 'Production Technician', 7, 64, '2002-03-23 00:00:00.000000', 13500.0000, 146),
	(253, 'Sootha', 'Charncherngkha', 'T', 'Quality Assurance Technician', 13, 41, '2002-03-26 00:00:00.000000', 10600.0000, 149),
	(254, 'Michael', 'Zwilling', 'J', 'Production Technician', 7, 18, '2002-03-26 00:00:00.000000', 12500.0000, 76),
	(255, 'Randy', 'Reeves', 'T', 'Production Technician', 7, 18, '2002-03-26 00:00:00.000000', 12500.0000, 84),
	(256, 'John', 'Kane', 'T', 'Production Technician', 7, 25, '2002-03-30 00:00:00.000000', 13500.0000, 69),
	(257, 'Jack', 'Creasey', 'T', 'Production Technician', 7, 51, '2002-04-03 00:00:00.000000', 15000.0000, 265),
	(258, 'Olinda', 'Turner', 'C', 'Production Technician', 7, 108, '2002-04-04 00:00:00.000000', 14000.0000, 33),
	(259, 'Stuart', 'Macrae', 'J', 'Janitor', 14, 49, '2002-04-05 00:00:00.000000', 9300.0000, 205),
	(260, 'Jo', 'Berry', 'L', 'Janitor', 14, 49, '2002-04-07 00:00:00.000000', 9300.0000, 121),
	(261, 'Ben', 'Miller', 'T', 'Buyer', 5, 274, '2002-04-09 00:00:00.000000', 18300.0000, 192),
	(262, 'Tom', 'Vande Velde', 'M', 'Production Technician', 7, 64, '2002-04-10 00:00:00.000000', 13500.0000, 98),
	(263, 'Ovidiu', 'Cracium', 'V', 'Senior Tool Designer', 2, 3, '2003-01-05 00:00:00.000000', 28800.0000, 145),
	(264, 'Annette', 'Hill', 'L', 'Purchasing Assistant', 5, 274, '2003-01-06 00:00:00.000000', 12800.0000, 181),
	(265, 'Janice', 'Galvin', 'M', 'Tool Designer', 2, 263, '2003-01-23 00:00:00.000000', 25000.0000, 200),
	(266, 'Reinout', 'Hillmann', '', 'Purchasing Assistant', 5, 274, '2003-01-25 00:00:00.000000', 12800.0000, 27),
	(267, 'Michael', 'Sullivan', 'I', 'Senior Design Engineer', 1, 3, '2003-01-30 00:00:00.000000', 36100.0000, 217),
	(268, 'Stephen', 'Jiang', 'Y', 'North American Sales Manager', 3, 273, '2003-02-04 00:00:00.000000', 48100.0000, 196),
	(269, 'Wanida', 'Benshoof', 'M', 'Marketing Assistant', 4, 6, '2003-02-07 00:00:00.000000', 13500.0000, 221),
	(270, 'Sharon', 'Salavaria', 'B', 'Design Engineer', 1, 3, '2003-02-18 00:00:00.000000', 32700.0000, 216),
	(271, 'John', 'Wood', 'L', 'Marketing Specialist', 4, 6, '2003-03-10 00:00:00.000000', 14400.0000, 180),
	(272, 'Mary', 'Dempsey', 'A', 'Marketing Assistant', 4, 6, '2003-03-17 00:00:00.000000', 13500.0000, 26),
	(273, 'Brian', 'Welcker', 'S', 'Vice President of Sales', 3, 109, '2003-03-18 00:00:00.000000', 72100.0000, 134),
	(274, 'Sheela', 'Word', 'H', 'Purchasing Manager', 13, 71, '2003-03-28 00:00:00.000000', 30000.0000, 222),
	(275, 'Michael', 'Blythe', 'G', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 60),
	(276, 'Linda', 'Mitchell', 'C', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 170),
	(277, 'Jillian', 'Carson', NULL, 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 61),
	(278, 'Garrett', 'Vargas', 'R', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 52),
	(279, 'Tsvi', 'Reiter', 'Michael', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 154),
	(280, 'Pamela', 'Ansman-Wolfe', 'O', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 179),
	(281, 'Shu', 'Ito', 'K', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 235),
	(282, 'Jose', 'Saraiva', 'Edvaldo', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 178),
	(283, 'David', 'Campbell', 'R', 'Sales Representative', 3, 268, '2003-07-01 00:00:00.000000', 23100.0000, 13),
	(284, 'Amy', 'Alberts', 'E', 'European Sales Manager', 3, 273, '2004-05-18 00:00:00.000000', 48100.0000, 202),
	(285, 'Jae', 'Pak', 'B', 'Sales Representative', 3, 284, '2004-07-01 00:00:00.000000', 23100.0000, 54),
	(286, 'Ranjit', 'Varkey Chudukatil', 'R', 'Sales Representative', 3, 284, '2004-07-01 00:00:00.000000', 23100.0000, 38),
	(287, 'Tete', 'Mensa-Annan', 'A', 'Sales Representative', 3, 268, '2004-11-01 00:00:00.000000', 23100.0000, 53),
	(288, 'Syed', 'Abbas', 'E', 'Pacific Sales Manager', 3, 273, '2005-04-15 00:00:00.000000', 48100.0000, 49),
	(289, 'Rachel', 'Valdez', 'B', 'Sales Representative', 3, 284, '2005-07-01 00:00:00.000000', 23100.0000, 37),
	(290, 'Lynn', 'Tsoflias', '', 'Sales Representative', 3, 288, '2005-07-01 00:00:00.000000', 23100.0000, 153),
	(291, 'Svetlin', 'Nakov', 'Ivanov', 'Independent Software Development  Consultant', 6, NULL, '2005-03-01 00:00:00.000000', 48000.0000, 291),
	(292, 'Martin', 'Kulov', NULL, 'Independent .NET Consultant', 6, NULL, '2005-03-01 00:00:00.000000', 48000.0000, 291),
	(293, 'George', 'Denchev', NULL, 'Independent Java Consultant', 6, NULL, '2005-03-01 00:00:00.000000', 48000.0000, 291);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;



CREATE TABLE IF NOT EXISTS `employees_projects` (
  `employee_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  UNIQUE KEY `PK_EmployeesProjects` (`employee_id`,`project_id`),
  KEY `fk_employees_projects_projects` (`project_id`),
  CONSTRAINT `fk_employees_projects_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_employees_projects_projects` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `employees_projects` DISABLE KEYS */;
INSERT INTO `employees_projects` (`employee_id`, `project_id`) VALUES
	(3, 1),
	(15, 1),
	(18, 1),
	(36, 1),
	(66, 1),
	(68, 1),
	(81, 1),
	(112, 1),
	(162, 1),
	(182, 1),
	(235, 1),
	(246, 1),
	(8, 2),
	(37, 2),
	(38, 2),
	(69, 2),
	(88, 2),
	(102, 2),
	(113, 2),
	(163, 2),
	(197, 2),
	(10, 3),
	(39, 3),
	(51, 3),
	(89, 3),
	(115, 3),
	(149, 3),
	(167, 3),
	(200, 3),
	(210, 3),
	(218, 3),
	(237, 3),
	(248, 3),
	(1, 4),
	(40, 4),
	(41, 4),
	(64, 4),
	(83, 4),
	(116, 4),
	(168, 4),
	(176, 4),
	(191, 4),
	(211, 4),
	(226, 4),
	(249, 4),
	(26, 5),
	(45, 5),
	(65, 5),
	(84, 5),
	(103, 5),
	(123, 5),
	(145, 5),
	(154, 5),
	(169, 5),
	(29, 7),
	(42, 7),
	(50, 7),
	(53, 7),
	(54, 7),
	(77, 7),
	(92, 7),
	(135, 7),
	(152, 7),
	(221, 7),
	(229, 7),
	(255, 7),
	(22, 8),
	(49, 8),
	(55, 8),
	(60, 8),
	(93, 8),
	(108, 8),
	(153, 8),
	(212, 8),
	(222, 8),
	(230, 8),
	(253, 8),
	(256, 8),
	(9, 9),
	(23, 9),
	(44, 9),
	(56, 9),
	(61, 9),
	(79, 9),
	(86, 9),
	(87, 9),
	(155, 9),
	(213, 9),
	(11, 10),
	(21, 10),
	(24, 10),
	(57, 10),
	(62, 10),
	(74, 10),
	(110, 10),
	(114, 10),
	(156, 10),
	(214, 10),
	(224, 10),
	(258, 10),
	(25, 11),
	(31, 11),
	(58, 11),
	(63, 11),
	(75, 11),
	(107, 11),
	(157, 11),
	(159, 11),
	(215, 11),
	(7, 12),
	(19, 12),
	(32, 12),
	(48, 12),
	(76, 12),
	(95, 12),
	(158, 12),
	(161, 12),
	(173, 12),
	(202, 12),
	(239, 12),
	(252, 12),
	(14, 19),
	(20, 19),
	(33, 19),
	(73, 19),
	(78, 19),
	(104, 19),
	(127, 19),
	(170, 19),
	(184, 19),
	(207, 19),
	(13, 20),
	(16, 20),
	(17, 20),
	(67, 20),
	(80, 20),
	(90, 20),
	(105, 20),
	(185, 20),
	(206, 20),
	(208, 20),
	(234, 20),
	(245, 20),
	(3, 21),
	(15, 21),
	(18, 21),
	(36, 21),
	(68, 21),
	(81, 21),
	(97, 21),
	(132, 21),
	(182, 21),
	(209, 21),
	(235, 21),
	(246, 21),
	(8, 22),
	(37, 22),
	(38, 22),
	(69, 22),
	(88, 22),
	(96, 22),
	(98, 22),
	(196, 22),
	(197, 22),
	(225, 22),
	(236, 22),
	(247, 22),
	(10, 23),
	(39, 23),
	(51, 23),
	(89, 23),
	(99, 23),
	(199, 23),
	(200, 23),
	(210, 23),
	(218, 23),
	(237, 23),
	(248, 23),
	(1, 24),
	(40, 24),
	(41, 24),
	(64, 24),
	(83, 24),
	(100, 24),
	(191, 24),
	(204, 24),
	(211, 24),
	(226, 24),
	(249, 24),
	(263, 24),
	(4, 25),
	(26, 25),
	(45, 25),
	(84, 25),
	(101, 25),
	(123, 25),
	(145, 25),
	(154, 25),
	(205, 25),
	(27, 26),
	(30, 26),
	(43, 26),
	(91, 26),
	(111, 26),
	(136, 26),
	(143, 26),
	(183, 26),
	(220, 26),
	(228, 26),
	(254, 26),
	(5, 27),
	(29, 27),
	(42, 27),
	(50, 27),
	(77, 27),
	(92, 27),
	(135, 27),
	(137, 27),
	(189, 27),
	(221, 27),
	(229, 27),
	(255, 27),
	(12, 28),
	(22, 28),
	(49, 28),
	(55, 28),
	(93, 28),
	(108, 28),
	(138, 28),
	(190, 28),
	(23, 29),
	(44, 29),
	(56, 29),
	(79, 29),
	(86, 29),
	(87, 29),
	(131, 29),
	(148, 29),
	(192, 29),
	(213, 29),
	(232, 29),
	(257, 29),
	(21, 30),
	(24, 30),
	(57, 30),
	(74, 30),
	(110, 30),
	(114, 30),
	(133, 30),
	(193, 30),
	(214, 30),
	(25, 31),
	(31, 31),
	(58, 31),
	(75, 31),
	(107, 31),
	(134, 31),
	(159, 31),
	(194, 31),
	(215, 31),
	(217, 31),
	(243, 31),
	(7, 32),
	(19, 32),
	(32, 32),
	(76, 32),
	(95, 32),
	(144, 32),
	(158, 32),
	(173, 32),
	(186, 32),
	(202, 32),
	(239, 32),
	(14, 33),
	(20, 33),
	(33, 33),
	(78, 33),
	(104, 33),
	(146, 33),
	(170, 33),
	(184, 33),
	(187, 33),
	(207, 33),
	(13, 34),
	(16, 34),
	(17, 34),
	(80, 34),
	(105, 34),
	(147, 34),
	(179, 34),
	(185, 34),
	(206, 34),
	(208, 34),
	(234, 34),
	(15, 35),
	(18, 35),
	(36, 35),
	(81, 35),
	(97, 35),
	(132, 35),
	(141, 35),
	(180, 35),
	(182, 35),
	(209, 35),
	(235, 35),
	(8, 36),
	(37, 36),
	(38, 36),
	(88, 36),
	(96, 36),
	(98, 36),
	(142, 36),
	(181, 36),
	(196, 36),
	(197, 36),
	(236, 36),
	(10, 37),
	(51, 37),
	(89, 37),
	(99, 37),
	(124, 37),
	(174, 37),
	(199, 37),
	(200, 37),
	(210, 37),
	(237, 37),
	(267, 37),
	(1, 38),
	(41, 38),
	(64, 38),
	(83, 38),
	(100, 38),
	(125, 38),
	(175, 38),
	(204, 38),
	(211, 38),
	(226, 38),
	(4, 39),
	(26, 39),
	(84, 39),
	(101, 39),
	(123, 39),
	(126, 39),
	(145, 39),
	(177, 39),
	(205, 39),
	(27, 40),
	(91, 40),
	(111, 40),
	(122, 40),
	(136, 40),
	(143, 40),
	(165, 40),
	(183, 40),
	(220, 40),
	(228, 40),
	(5, 41),
	(29, 41),
	(77, 41),
	(92, 41),
	(129, 41),
	(135, 41),
	(137, 41),
	(171, 41),
	(189, 41),
	(221, 41),
	(229, 41),
	(12, 42),
	(22, 42),
	(93, 42),
	(108, 42),
	(120, 42),
	(138, 42),
	(172, 42),
	(190, 42),
	(222, 42),
	(230, 42),
	(253, 42),
	(23, 43),
	(79, 43),
	(86, 43),
	(87, 43),
	(118, 43),
	(131, 43),
	(148, 43),
	(160, 43),
	(192, 43),
	(213, 43),
	(232, 43),
	(24, 44),
	(66, 44),
	(74, 44),
	(110, 44),
	(112, 44),
	(114, 44),
	(133, 44),
	(162, 44),
	(193, 44),
	(214, 44),
	(224, 44),
	(31, 45),
	(75, 45),
	(102, 45),
	(107, 45),
	(113, 45),
	(134, 45),
	(159, 45),
	(163, 45),
	(194, 45),
	(215, 45),
	(217, 45),
	(32, 46),
	(76, 46),
	(95, 46),
	(115, 46),
	(144, 46),
	(149, 46),
	(158, 46),
	(167, 46),
	(173, 46),
	(186, 46),
	(202, 46),
	(33, 47),
	(78, 47),
	(104, 47),
	(116, 47),
	(146, 47),
	(168, 47),
	(170, 47),
	(176, 47),
	(184, 47),
	(187, 47),
	(207, 47),
	(13, 48),
	(65, 48),
	(80, 48),
	(103, 48),
	(105, 48),
	(147, 48),
	(169, 48),
	(179, 48),
	(185, 48),
	(206, 48),
	(208, 48),
	(36, 49),
	(52, 49),
	(70, 49),
	(81, 49),
	(97, 49),
	(132, 49),
	(141, 49),
	(151, 49),
	(180, 49),
	(182, 49),
	(209, 49),
	(37, 50),
	(53, 50),
	(54, 50),
	(88, 50),
	(96, 50),
	(98, 50),
	(142, 50),
	(152, 50),
	(181, 50),
	(196, 50),
	(197, 50),
	(60, 51),
	(89, 51),
	(99, 51),
	(124, 51),
	(153, 51),
	(174, 51),
	(199, 51),
	(200, 51),
	(210, 51),
	(212, 51),
	(9, 52),
	(41, 52),
	(61, 52),
	(83, 52),
	(100, 52),
	(125, 52),
	(155, 52),
	(175, 52),
	(204, 52),
	(211, 52),
	(4, 53),
	(11, 53),
	(62, 53),
	(84, 53),
	(101, 53),
	(126, 53),
	(145, 53),
	(156, 53),
	(177, 53),
	(205, 53),
	(219, 53),
	(63, 54),
	(91, 54),
	(111, 54),
	(122, 54),
	(136, 54),
	(157, 54),
	(165, 54),
	(183, 54),
	(220, 54),
	(5, 55),
	(48, 55),
	(77, 55),
	(92, 55),
	(129, 55),
	(137, 55),
	(161, 55),
	(171, 55),
	(189, 55),
	(221, 55),
	(252, 55),
	(12, 56),
	(73, 56),
	(93, 56),
	(120, 56),
	(127, 56),
	(138, 56),
	(172, 56),
	(190, 56),
	(222, 56),
	(253, 56),
	(262, 56),
	(67, 57),
	(79, 57),
	(86, 57),
	(90, 57),
	(118, 57),
	(131, 57),
	(148, 57),
	(160, 57),
	(192, 57),
	(213, 57),
	(245, 57),
	(3, 58),
	(66, 58),
	(68, 58),
	(110, 58),
	(112, 58),
	(114, 58),
	(133, 58),
	(162, 58),
	(193, 58),
	(214, 58),
	(246, 58),
	(69, 59),
	(102, 59),
	(107, 59),
	(113, 59),
	(134, 59),
	(163, 59),
	(194, 59),
	(215, 59),
	(217, 59),
	(225, 59),
	(247, 59),
	(39, 60),
	(95, 60),
	(115, 60),
	(144, 60),
	(149, 60),
	(158, 60),
	(167, 60),
	(186, 60),
	(202, 60),
	(218, 60),
	(248, 60),
	(40, 61),
	(104, 61),
	(116, 61),
	(146, 61),
	(168, 61),
	(170, 61),
	(176, 61),
	(187, 61),
	(191, 61),
	(207, 61),
	(249, 61),
	(45, 77),
	(65, 77),
	(103, 77),
	(105, 77),
	(147, 77),
	(154, 77),
	(169, 77),
	(179, 77),
	(206, 77),
	(208, 77),
	(250, 77),
	(30, 78),
	(43, 78),
	(52, 78),
	(70, 78),
	(97, 78),
	(132, 78),
	(141, 78),
	(151, 78),
	(180, 78),
	(209, 78),
	(254, 78),
	(42, 79),
	(50, 79),
	(53, 79),
	(54, 79),
	(96, 79),
	(98, 79),
	(142, 79),
	(152, 79),
	(181, 79),
	(196, 79),
	(255, 79),
	(49, 80),
	(55, 80),
	(60, 80),
	(99, 80),
	(124, 80),
	(153, 80),
	(174, 80),
	(199, 80),
	(212, 80),
	(256, 80),
	(267, 80),
	(9, 104),
	(44, 104),
	(56, 104),
	(61, 104),
	(100, 104),
	(125, 104),
	(155, 104),
	(175, 104),
	(204, 104),
	(257, 104),
	(4, 105),
	(11, 105),
	(21, 105),
	(57, 105),
	(62, 105),
	(101, 105),
	(126, 105),
	(156, 105),
	(177, 105),
	(205, 105),
	(258, 105),
	(25, 106),
	(58, 106),
	(63, 106),
	(122, 106),
	(136, 106),
	(157, 106),
	(165, 106),
	(183, 106),
	(243, 106),
	(5, 107),
	(7, 107),
	(19, 107),
	(48, 107),
	(129, 107),
	(137, 107),
	(161, 107),
	(171, 107),
	(189, 107),
	(239, 107),
	(252, 107),
	(12, 108),
	(14, 108),
	(20, 108),
	(73, 108),
	(120, 108),
	(127, 108),
	(138, 108),
	(172, 108),
	(190, 108),
	(240, 108),
	(262, 108),
	(16, 109),
	(17, 109),
	(67, 109),
	(90, 109),
	(118, 109),
	(131, 109),
	(148, 109),
	(160, 109),
	(192, 109),
	(234, 109),
	(245, 109),
	(3, 110),
	(15, 110),
	(18, 110),
	(66, 110),
	(68, 110),
	(112, 110),
	(133, 110),
	(162, 110),
	(193, 110),
	(235, 110),
	(246, 110),
	(8, 111),
	(38, 111),
	(69, 111),
	(102, 111),
	(113, 111),
	(134, 111),
	(163, 111),
	(194, 111),
	(225, 111),
	(236, 111),
	(247, 111),
	(10, 112),
	(39, 112),
	(51, 112),
	(115, 112),
	(144, 112),
	(149, 112),
	(167, 112),
	(186, 112),
	(218, 112),
	(237, 112),
	(248, 112),
	(1, 113),
	(40, 113),
	(64, 113),
	(116, 113),
	(146, 113),
	(168, 113),
	(176, 113),
	(187, 113),
	(191, 113),
	(226, 113),
	(249, 113),
	(26, 114),
	(45, 114),
	(65, 114),
	(103, 114),
	(123, 114),
	(147, 114),
	(154, 114),
	(169, 114),
	(179, 114),
	(227, 114),
	(250, 114),
	(27, 115),
	(30, 115),
	(43, 115),
	(52, 115),
	(70, 115),
	(141, 115),
	(143, 115),
	(151, 115),
	(180, 115),
	(228, 115),
	(254, 115),
	(29, 116),
	(42, 116),
	(50, 116),
	(53, 116),
	(54, 116),
	(135, 116),
	(142, 116),
	(152, 116),
	(181, 116),
	(229, 116),
	(255, 116),
	(22, 117),
	(49, 117),
	(55, 117),
	(60, 117),
	(108, 117),
	(124, 117),
	(153, 117),
	(174, 117),
	(212, 117),
	(230, 117),
	(256, 117),
	(9, 118),
	(23, 118),
	(44, 118),
	(56, 118),
	(61, 118),
	(87, 118),
	(125, 118),
	(155, 118),
	(175, 118),
	(232, 118),
	(257, 118),
	(11, 119),
	(21, 119),
	(24, 119),
	(57, 119),
	(62, 119),
	(74, 119),
	(126, 119),
	(156, 119),
	(177, 119),
	(224, 119),
	(258, 119),
	(25, 120),
	(31, 120),
	(58, 120),
	(63, 120),
	(75, 120),
	(122, 120),
	(157, 120),
	(159, 120),
	(165, 120),
	(243, 120),
	(7, 121),
	(19, 121),
	(32, 121),
	(48, 121),
	(76, 121),
	(129, 121),
	(161, 121),
	(171, 121),
	(173, 121),
	(239, 121),
	(252, 121),
	(14, 122),
	(20, 122),
	(33, 122),
	(73, 122),
	(78, 122),
	(120, 122),
	(127, 122),
	(172, 122),
	(184, 122),
	(240, 122),
	(262, 122),
	(13, 127),
	(16, 127),
	(17, 127),
	(67, 127),
	(80, 127),
	(90, 127),
	(118, 127),
	(160, 127),
	(185, 127),
	(234, 127),
	(245, 127);
/*!40000 ALTER TABLE `employees_projects` ENABLE KEYS */;



CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `start_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `end_date` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `PK_Projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`project_id`, `name`, `description`, `start_date`, `end_date`) VALUES
	(1, 'Classic Vest', 'Research, design and development of Classic Vest. Light-weight, wind-resistant, packs to fit into a pocket.', '2003-06-01 00:00:00.000000', NULL),
	(2, 'Cycling Cap', 'Research, design and development of Cycling Cap. Traditional style with a flip-up brim; one-size fits all.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(3, 'Full-Finger Gloves', 'Research, design and development of Full-Finger Gloves. Synthetic palm, flexible knuckles, breathable mesh upper. Worn by the AWC team riders.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(4, 'Half-Finger Gloves', 'Research, design and development of Half-Finger Gloves. Full padding, improved finger flex, durable palm, adjustable closure.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(5, 'HL Mountain Frame', 'Research, design and development of HL Mountain Frame. Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(6, 'HL Road Frame', 'Research, design and development of HL Road Frame. Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.', '1998-05-02 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(7, 'HL Touring Frame', 'Research, design and development of HL Touring Frame. The HL aluminum frame is custom-shaped for both good looks and strength; it will withstand the most rigorous challenges of daily riding. Men\'s version.', '2005-05-16 16:34:00.000000', NULL),
	(8, 'LL Mountain Frame', 'Research, design and development of LL Mountain Frame. Our best value utilizing the same, ground-breaking frame technology as the ML aluminum frame.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(9, 'LL Road Frame', 'Research, design and development of LL Road Frame. The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(10, 'LL Touring Frame', 'Research, design and development of LL Touring Frame. Lightweight butted aluminum frame provides a more upright riding position for a trip around town.  Our ground-breaking design provides optimum comfort.', '2005-05-16 16:34:00.000000', NULL),
	(11, 'Long-Sleeve Logo Jersey', 'Research, design and development of Long-Sleeve Logo Jersey. Unisex long-sleeve AWC logo microfiber cycling jersey', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(12, 'Men\'s Bib-Shorts', 'Research, design and development of Men\'s Bib-Shorts. Designed for the AWC team with stay-put straps, moisture-control, chamois padding, and leg grippers.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(19, 'Mountain-100', 'Research, design and development of Mountain-100. Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(20, 'Mountain-200', 'Research, design and development of Mountain-200. Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.', '2002-06-01 00:00:00.000000', '2004-03-11 10:32:00.000000'),
	(21, 'Mountain-300', 'Research, design and development of Mountain-300. For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(22, 'Mountain-400-W', 'Research, design and development of Mountain-400-W. This bike delivers a high-level of performance on a budget. It is responsive and maneuverable, and offers peace-of-mind when you decide to go off-road.', '2006-02-22 00:00:00.000000', NULL),
	(23, 'Mountain-500', 'Research, design and development of Mountain-500. Suitable for any type of riding, on or off-road. Fits any budget. Smooth-shifting with a comfortable ride.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(24, 'Racing Socks', 'Research, design and development of Racing Socks. Thin, lightweight and durable with cuffs that stay up.', '2005-11-22 00:00:00.000000', NULL),
	(25, 'Road-150', 'Research, design and development of Road-150. This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(26, 'Road-250', 'Research, design and development of Road-250. Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(27, 'Road-350-W', 'Research, design and development of Road-350-W. Cross-train, race, or just socialize on a sleek, aerodynamic bike designed for a woman.  Advanced seat technology provides comfort all day.', '2003-06-01 00:00:00.000000', NULL),
	(28, 'Road-450', 'Research, design and development of Road-450. A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(29, 'Road-550-W', 'Research, design and development of Road-550-W. Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(30, 'Road-650', 'Research, design and development of Road-650. Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we\'re famous for.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(31, 'Road-750', 'Research, design and development of Road-750. Entry level adult bike; offers a comfortable ride cross-country or down the block. Quick-release hubs and rims.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(32, 'Short-Sleeve Classic Jersey', 'Research, design and development of Short-Sleeve Classic Jersey. Short sleeve classic breathable jersey with superior moisture control, front zipper, and 3 back pockets.', '2003-06-01 00:00:00.000000', NULL),
	(33, 'Sport-100', 'Research, design and development of Sport-100. Universal fit, well-vented, lightweight , snap-on visor.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(34, 'Touring-1000', 'Research, design and development of Touring-1000. Travel in style and comfort. Designed for maximum comfort and safety. Wide gear range takes on all hills. High-tech aluminum alloy construction provides durability without added weight.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(35, 'Touring-2000', 'Research, design and development of Touring-2000. The plush custom saddle keeps you riding all day,  and there\'s plenty of space to add panniers and bike bags to the newly-redesigned carrier.  This bike has stability when fully-loaded.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(36, 'Touring-3000', 'Research, design and development of Touring-3000. All-occasion value bike with our basic comfort and safety features. Offers wider, more stable tires for a ride around town or weekend trip.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(37, 'Women\'s Mountain Shorts', 'Research, design and development of Women\'s Mountain Shorts. Heavy duty, abrasion-resistant shorts feature seamless, lycra inner shorts with anti-bacterial chamois for comfort.', '2003-06-01 00:00:00.000000', NULL),
	(38, 'Women\'s Tights', 'Research, design and development of Women\'s Tights. Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(39, 'Mountain-400', 'Research, design and development of Mountain-400. Suitable for any type of off-road trip. Fits any budget.', '2001-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(40, 'Road-550', 'Research, design and development of Road-550. Same technology as all of our Road series bikes.  Perfect all-around bike for road or racing.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(41, 'Road-350', 'Research, design and development of Road-350. Cross-train, race, or just socialize on a sleek, aerodynamic bike.  Advanced seat technology provides comfort all day.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(42, 'LL Mountain Front Wheel', 'Research, design and development of LL Mountain Front Wheel. Replacement mountain wheel for entry-level rider.', '2002-11-20 09:57:00.000000', '2003-06-01 00:00:00.000000'),
	(43, 'Touring Rear Wheel', 'Research, design and development of Touring Rear Wheel. Excellent aerodynamic rims guarantee a smooth ride.', '2005-05-16 16:34:00.000000', NULL),
	(44, 'Touring Front Wheel', 'Research, design and development of Touring Front Wheel. Aerodynamic rims for smooth riding.', '2005-05-16 16:34:00.000000', NULL),
	(45, 'ML Mountain Front Wheel', 'Research, design and development of ML Mountain Front Wheel. Replacement mountain wheel for the casual to serious rider.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(46, 'HL Mountain Front Wheel', 'Research, design and development of HL Mountain Front Wheel. High-performance mountain replacement wheel.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(47, 'LL Touring Handlebars', 'Research, design and development of LL Touring Handlebars. Unique shape reduces fatigue for entry level riders.', '2005-05-16 16:34:00.000000', NULL),
	(48, 'HL Touring Handlebars', 'Research, design and development of HL Touring Handlebars. A light yet stiff aluminum bar for long distance riding.', '2005-05-16 16:34:00.000000', NULL),
	(49, 'LL Road Front Wheel', 'Research, design and development of LL Road Front Wheel. Replacement road front wheel for entry-level cyclist.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(50, 'ML Road Front Wheel', 'Research, design and development of ML Road Front Wheel. Sturdy alloy features a quick-release hub.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(51, 'HL Road Front Wheel', 'Research, design and development of HL Road Front Wheel. Strong wheel with double-walled rim.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(52, 'LL Mountain Handlebars', 'Research, design and development of LL Mountain Handlebars. All-purpose bar for on or off-road.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(53, 'Touring Pedal', 'Research, design and development of Touring Pedal. A stable pedal for all-day riding.', '2005-05-16 16:34:00.000000', NULL),
	(54, 'ML Mountain Handlebars', 'Research, design and development of ML Mountain Handlebars. Tough aluminum alloy bars for downhill.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(55, 'HL Mountain Handlebars', 'Research, design and development of HL Mountain Handlebars. Flat bar strong enough for the pro circuit.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(56, 'LL Road Handlebars', 'Research, design and development of LL Road Handlebars. Unique shape provides easier reach to the levers.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(57, 'ML Road Handlebars', 'Research, design and development of ML Road Handlebars. Anatomically shaped aluminum tube bar will suit all riders.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(58, 'HL Road Handlebars', 'Research, design and development of HL Road Handlebars. Designed for racers; high-end anatomically shaped bar from aluminum alloy.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(59, 'LL Headset', 'Research, design and development of LL Headset. Threadless headset provides quality at an economical price.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(60, 'ML Headset', 'Research, design and development of ML Headset. Sealed cartridge keeps dirt out.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(61, 'HL Headset', 'Research, design and development of HL Headset. High-quality 1" threadless headset with a grease port for quick lubrication.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(77, 'ML Road Rear Wheel', 'Research, design and development of ML Road Rear Wheel. Aluminum alloy rim with stainless steel spokes; built for speed.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(78, 'HL Road Rear Wheel', 'Research, design and development of HL Road Rear Wheel. Strong rear wheel with double-walled rim.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(79, 'LL Mountain Seat/Saddle 2', 'Research, design and development of LL Mountain Seat/Saddle 2. Synthetic leather. Features gel for increased comfort.', '2003-06-01 00:00:00.000000', NULL),
	(80, 'ML Mountain Seat/Saddle 2', 'Research, design and development of ML Mountain Seat/Saddle 2. Designed to absorb shock.', '2003-06-01 00:00:00.000000', '2004-03-11 10:32:00.000000'),
	(104, 'LL Fork', 'Research, design and development of LL Fork. Stout design absorbs shock and offers more precise steering.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(105, 'ML Fork', 'Research, design and development of ML Fork. Composite road fork with an aluminum steerer tube.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(106, 'HL Fork', 'Research, design and development of HL Fork. High-performance carbon road fork with curved legs.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(107, 'Hydration Pack', 'Research, design and development of Hydration Pack. Versatile 70 oz hydration pack offers extra storage, easy-fill access, and a waist belt.', '2003-06-01 00:00:00.000000', NULL),
	(108, 'Taillight', 'Research, design and development of Taillight. Affordable light for safe night riding - uses 3 AAA batteries', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(109, 'Headlights - Dual-Beam', 'Research, design and development of Headlights - Dual-Beam. Rechargeable dual-beam headlight.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(110, 'Headlights - Weatherproof', 'Research, design and development of Headlights - Weatherproof. Rugged weatherproof headlight.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(111, 'Water Bottle', 'Research, design and development of Water Bottle. AWC logo water bottle - holds 30 oz; leak-proof.', '2003-06-01 00:00:00.000000', NULL),
	(112, 'Mountain Bottle Cage', 'Research, design and development of Mountain Bottle Cage. Tough aluminum cage holds bottle securly on tough terrain.', '2003-06-01 00:00:00.000000', NULL),
	(113, 'Road Bottle Cage', 'Research, design and development of Road Bottle Cage. Aluminum cage is lighter than our mountain version; perfect for long distance trips.', '2004-02-21 00:00:00.000000', NULL),
	(114, 'Patch kit', 'Research, design and development of Patch kit. Includes 8 different size patches, glue and sandpaper.', '2003-06-01 00:00:00.000000', NULL),
	(115, 'Cable Lock', 'Research, design and development of Cable Lock. Wraps to fit front and rear tires, carrier and 2 keys included.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(116, 'Minipump', 'Research, design and development of Minipump. Designed for convenience. Fits in your pocket. Aluminum barrel. 160psi rated.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(117, 'Mountain Pump', 'Research, design and development of Mountain Pump. Simple and light-weight. Emergency patches stored in handle.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(118, 'Hitch Rack - 4-Bike', 'Research, design and development of Hitch Rack - 4-Bike. Carries 4 bikes securely; steel construction, fits 2" receiver hitch.', '2003-06-01 00:00:00.000000', NULL),
	(119, 'Bike Wash', 'Research, design and development of Bike Wash. Washes off the toughest road grime; dissolves grease, environmentally safe. 1-liter bottle.', '2005-08-01 00:00:00.000000', NULL),
	(120, 'Touring-Panniers', 'Research, design and development of Touring-Panniers. Durable, water-proof nylon construction with easy access. Large enough for weekend trips.', '2002-06-01 00:00:00.000000', '2003-06-01 00:00:00.000000'),
	(121, 'Fender Set - Mountain', 'Research, design and development of Fender Set - Mountain. Clip-on fenders fit most mountain bikes.', '2003-06-01 00:00:00.000000', NULL),
	(122, 'All-Purpose Bike Stand', 'Research, design and development of All-Purpose Bike Stand. Perfect all-purpose bike stand for working on your bike at home. Quick-adjusting clamps and steel construction.', '2005-09-01 00:00:00.000000', NULL),
	(127, 'Rear Derailleur', 'Research, design and development of Rear Derailleur. Wide-link design.', '2003-06-01 00:00:00.000000', NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;



CREATE TABLE IF NOT EXISTS `towns` (
  `town_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`town_id`),
  UNIQUE KEY `PK_Towns` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
INSERT INTO `towns` (`town_id`, `name`) VALUES
	(1, 'Redmond'),
	(2, 'Calgary'),
	(3, 'Edmonds'),
	(4, 'Seattle'),
	(5, 'Bellevue'),
	(6, 'Issaquah'),
	(7, 'Everett'),
	(8, 'Bothell'),
	(9, 'San Francisco'),
	(10, 'Index'),
	(11, 'Snohomish'),
	(12, 'Monroe'),
	(13, 'Renton'),
	(14, 'Newport Hills'),
	(15, 'Carnation'),
	(16, 'Sammamish'),
	(17, 'Duvall'),
	(18, 'Gold Bar'),
	(19, 'Nevada'),
	(20, 'Kenmore'),
	(21, 'Melbourne'),
	(22, 'Kent'),
	(23, 'Cambridge'),
	(24, 'Minneapolis'),
	(25, 'Portland'),
	(26, 'Duluth'),
	(27, 'Detroit'),
	(28, 'Memphis'),
	(29, 'Ottawa'),
	(30, 'Bordeaux'),
	(31, 'Berlin'),
	(32, 'Sofia');
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;




-- Task 1

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000 ()
BEGIN

SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` > 35000
ORDER BY `first_name`, `last_name`, `employee_id`;

END $$

DELIMITER ;

-- Task 2

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above (above_or_equal_number DECIMAL(10,4))
BEGIN

SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` >= above_or_equal_number
ORDER BY `first_name`, `last_name`, `employee_id`;

END $$

DELIMITER ;

-- ----------------------------------------
-- CALL usp_get_employees_salary_above(45000);
-- ----------------------------------------

-- Task 3

DELIMITER $$

CREATE PROCEDURE usp_get_towns_starting_with (start_with VARCHAR(50))
BEGIN

SELECT `name` AS 'town_name' FROM `towns`
WHERE `name` LIKE CONCAT(start_with, '%')
ORDER BY `town_name`;

END $$

DELIMITER ;

-- Task 4

DELIMITER $$

CREATE PROCEDURE usp_get_employees_from_town (town_name VARCHAR(50))
BEGIN

SELECT `e`.`first_name`, `e`.`last_name` FROM `employees` AS `e`
JOIN `addresses` AS `a`
ON `e`.`address_id` = `a`.`address_id`
JOIN `towns` AS `t`
ON `a`.`town_id` = `t`.`town_id`
WHERE `t`.`name` = town_name
ORDER BY `e`.`first_name`, `e`.`last_name`, `e`.`employee_id`;

END $$

DELIMITER ;

-- Task 5

DELIMITER $$

CREATE FUNCTION ufn_get_salary_level (salary DECIMAL(10,4))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

DECLARE level VARCHAR(20);
IF salary < 30000 THEN SET level := 'Low';
ELSEIF salary <= 50000 THEN SET level := 'Average';
ELSE SET level := 'High';
END IF;
RETURN level;

END $$

DELIMITER ;

-- Variant 2

CREATE FUNCTION ufn_get_salary_level(salary DOUBLE(10,4))
RETURNS VARCHAR(20)
RETURN (
    CASE 
	WHEN salary < 30000 THEN 'Low'
	WHEN salary <= 50000 THEN 'Average'
	ELSE 'High'
    END
);


-- Task 6

DELIMITER $$

CREATE PROCEDURE usp_get_employees_by_salary_level (parameter_level VARCHAR(20))
BEGIN

SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` < 30000 AND parameter_level = 'Low'
OR `salary` >= 30000  AND `salary` <= 50000 AND  parameter_level = 'Average' 
OR `salary` >= 50000 AND parameter_level = 'High'
ORDER BY `first_name` DESC, `last_name` DESC;

END $$

DELIMITER ;

-- Task 7

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
DETERMINISTIC
RETURN word REGEXP (concat('^[', set_of_letters, ']+$'));

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');
SELECT ufn_is_word_comprised('oistmiahf', 'halves');
SELECT ufn_is_word_comprised('bobr', 'Rob');
SELECT ufn_is_word_comprised('pppp', 'Guy');





/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

USE soft_uni;

-- Dumping structure for table bank.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `account_holder_id` int(11) NOT NULL,
  `balance` decimal(19,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `fk_accounts_account_holders` (`account_holder_id`),
  CONSTRAINT `fk_accounts_account_holders` FOREIGN KEY (`account_holder_id`) REFERENCES `account_holders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bank.accounts: ~18 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `account_holder_id`, `balance`) VALUES
	(1, 1, 123.1200),
	(2, 3, 4354.2300),
	(3, 12, 6546543.2300),
	(4, 9, 15345.6400),
	(5, 11, 36521.2000),
	(6, 8, 5436.3400),
	(7, 10, 565649.2000),
	(8, 11, 999453.5000),
	(9, 1, 5349758.2300),
	(10, 2, 543.3000),
	(11, 3, 10.2000),
	(12, 7, 245656.2300),
	(13, 5, 5435.3200),
	(14, 4, 1.2300),
	(15, 6, 0.1900),
	(16, 2, 5345.3400),
	(17, 11, 76653.2000),
	(18, 1, 235469.8900);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


-- Dumping structure for table bank.account_holders
DROP TABLE IF EXISTS `account_holders`;
CREATE TABLE IF NOT EXISTS `account_holders` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `ssn` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bank.account_holders: ~12 rows (approximately)
/*!40000 ALTER TABLE `account_holders` DISABLE KEYS */;
INSERT INTO `account_holders` (`id`, `first_name`, `last_name`, `ssn`) VALUES
	(1, 'Susan', 'Cane', '1234567890'),
	(2, 'Kim', 'Novac', '1234567890'),
	(3, 'Jimmy', 'Henderson', '1234567890'),
	(4, 'Steve', 'Stevenson', '1234567890'),
	(5, 'Bjorn', 'Sweden', '1234567890'),
	(6, 'Kiril', 'Petrov', '1234567890'),
	(7, 'Petar', 'Kirilov', '1234567890'),
	(8, 'Michka', 'Tsekova', '1234567890'),
	(9, 'Zlatina', 'Pateva', '1234567890'),
	(10, 'Monika', 'Miteva', '1234567890'),
	(11, 'Zlatko', 'Zlatyov', '1234567890'),
	(12, 'Petko', 'Petkov Junior', '1234567890');
/*!40000 ALTER TABLE `account_holders` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;







-- Task 8

DELIMITER $$
CREATE PROCEDURE usp_get_holders_full_name ()
BEGIN

SELECT CONCAT(`ah`.`first_name`, ' ',`ah`.`last_name` ) AS 'full_name' FROM `account_holders` AS `ah`
ORDER BY `full_name`, `ah`.`id`;

END $$
DELIMITER ;

-- Task 9

DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than (money DECIMAL(19, 4))
BEGIN

SELECT `ah`.`first_name`, `ah`.`last_name`  FROM `account_holders` AS `ah`
RIGHT JOIN `accounts` AS `a`
ON `ah`.`id` = `a`.`account_holder_id`
GROUP BY `ah`.`id`
HAVING SUM(`a`.`balance`) > money
ORDER BY `ah`.`id`;

END $$
DELIMITER ;

-- CALL usp_get_holders_with_balance_higher_than (7000);


-- Task 10

DELIMITER $$

CREATE FUNCTION ufn_calculate_future_value (initial_sum DECIMAL(19, 4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN

DECLARE result DECIMAL(19, 4);
SET result := initial_sum * POW((1 + yearly_interest_rate), number_of_years);
RETURN result;

END $$
DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5, 5);

-- Task 11

DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account (account_id INT, interest_rate DECIMAL(19, 4))
BEGIN

SELECT `a`.`id` AS 'account_id',
`h`.`first_name`,
`h`.`last_name`, 
`a`.`balance` AS 'current_balance',
ufn_calculate_future_value(`a`.`balance`, interest_rate, 5) AS 'balance_in_5_years'
FROM `account_holders` AS `h`
JOIN `accounts` AS `a`
ON `h`.`id` = `a`.`account_holder_id`
WHERE `a`.`id` = account_id; -- id of person from the table to be the id wich we enter like parameter of the procedure

END $$
DELIMITER ;

-- CALL usp_calculate_future_value_for_account(1, 0.1);

-- Submit in Judge !!!
-- ----------------------------------------------------------------------------------------------------------------------
/*
CREATE FUNCTION ufn_calculate_future_value (initial_sum DECIMAL(19, 4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN

DECLARE result DECIMAL(19, 4);
SET result := initial_sum * POW((1 + yearly_interest_rate), number_of_years);
RETURN result;

END;

CREATE PROCEDURE usp_calculate_future_value_for_account (account_id INT, interest_rate DECIMAL(19, 4))
BEGIN

SELECT `a`.`id` AS 'account_id',
`h`.`first_name`,
`h`.`last_name`, 
`a`.`balance` AS 'current_balance',
ufn_calculate_future_value(`a`.`balance`, interest_rate, 5) AS 'balance_in_5_years'
FROM `account_holders` AS `h`
JOIN `accounts` AS `a`
ON `h`.`id` = `a`.`account_holder_id`
WHERE `a`.`id` = account_id; -- id of person from the table to be the id wich we enter like parameter of the procedure

END;
*/
-- --------------------------------------------------------------------------------------------------------------------



-- Task 12

DELIMITER $$

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN

IF money_amount > 0 THEN

START TRANSACTION;
UPDATE `accounts` AS a 
SET a.balance = a.balance + money_amount
WHERE a.id = account_id;

IF (SELECT a.balance FROM `accounts` AS a WHERE a.id = account_id) < 0
THEN ROLLBACK;
ELSE
COMMIT;
END IF;
END IF;
END $$

DELIMITER ;

CALL usp_deposit_money(1, 10);

SELECT a.id AS 'account_id', a.account_holder_id, a.balance
FROM `accounts` AS a
WHERE a.id = 1;

-- Task 13

DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN
    IF money_amount > 0 THEN
        START TRANSACTION;
        
        UPDATE `accounts` AS a 
        SET a.balance = a.balance - money_amount
        WHERE a.id = account_id;
        
        IF (SELECT a.balance FROM `accounts` AS a 
		WHERE a.id = account_id) < 0
		THEN ROLLBACK;
        ELSE
		COMMIT;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL usp_withdraw_money(1, 10);

SELECT a.id AS 'account_id', a.account_holder_id, a.balance
FROM `accounts` AS a
WHERE a.id = 1;

-- Task 14

DELIMITER $$

CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, money_amount DECIMAL(19, 4))
BEGIN
    IF money_amount > 0 
        AND from_account_id <> to_account_id 
        AND (SELECT a.id 
            FROM `accounts` AS a 
            WHERE a.id = to_account_id) IS NOT NULL
        AND (SELECT a.id 
            FROM `accounts` AS a 
            WHERE a.id = from_account_id) IS NOT NULL
        AND (SELECT a.balance 
            FROM `accounts` AS a 
            WHERE a.id = from_account_id) >= money_amount
    THEN
        START TRANSACTION;
        
        UPDATE `accounts` AS a 
        SET 
            a.balance = a.balance + money_amount
        WHERE
            a.id = to_account_id;
            
        UPDATE `accounts` AS a 
        SET 
            a.balance = a.balance - money_amount
        WHERE
            a.id = from_account_id;
        
        IF (SELECT a.balance 
            FROM `accounts` AS a 
            WHERE a.id = from_account_id) < 0
            THEN ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END IF;
END $$
DELIMITER ;

CALL usp_transfer_money(1, 2, 10);
CALL usp_transfer_money(2, 1, 10);

SELECT a.id AS 'account_id', a.account_holder_id, a.balance
FROM `accounts` AS a
WHERE a.id IN (1 , 2);


-- Task 15

CREATE TABLE `logs` (
`log_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`account_id` INT(11) NOT NULL,
`old_sum` DECIMAL(19, 4) NOT NULL,
`new_sum` DECIMAL(19, 4) NOT NULL
);

DELIMITER $$

CREATE TRIGGER `tr_balance_updated`
AFTER UPDATE ON `accounts`
FOR EACH ROW
BEGIN
    IF OLD.balance != NEW.balance THEN
        INSERT INTO `logs`(`account_id`, `old_sum`, `new_sum`)
        VALUES (OLD.id, OLD.balance, NEW.balance);
    END IF;
END $$

DELIMITER ;

CALL usp_transfer_money(1, 2, 10);
CALL usp_transfer_money(2, 1, 10);

SELECT * FROM `logs`;

-- Task 16










