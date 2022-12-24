
DROP SCHEMA IF EXISTS stc;
CREATE SCHEMA stc;
USE stc;

-- Task 1

CREATE TABLE addresses(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL
);

CREATE TABLE clients(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`full_name` VARCHAR(50) NOT NULL,
`phone_number` VARCHAR(20) NOT NULL
);

CREATE TABLE drivers(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30) NOT NULL,
`age` INT NOT NULL,
`rating` FLOAT DEFAULT 5.5
);

CREATE TABLE cars(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`make` VARCHAR(20) NOT NULL,
`model` VARCHAR(20),
`year` INT NOT NULL DEFAULT 0,
`mileage` INT DEFAULT 0,
`condition` CHAR(1) NOT NULL,
`category_id` INT NOT NULL,
CONSTRAINT fk_cars_categories
FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`)
);

CREATE TABLE courses(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`from_address_id` INT NOT NULL,
`start` DATETIME NOT NULL,
`bill` DECIMAL(10, 2) DEFAULT 10,
`car_id` INT NOT NULL,
`client_id` INT NOT NULL,
CONSTRAINT fk_courses_addresses
FOREIGN KEY (`from_address_id`)
REFERENCES `addresses`(`id`),
CONSTRAINT fk_courses_cars
FOREIGN KEY (`car_id`)
REFERENCES `cars`(`id`),
CONSTRAINT fk_courses_clients
FOREIGN KEY (`client_id`)
REFERENCES `clients`(`id`)
);

CREATE TABLE cars_drivers(
`car_id` INT NOT NULL,
`driver_id` INT NOT NULL,
CONSTRAINT pk_cars_drivers
PRIMARY KEY (`car_id`, `driver_id`),
CONSTRAINT fk_cars_drivers_cars
FOREIGN KEY (`car_id`)
REFERENCES `cars`(`id`),
CONSTRAINT fk_cars_drivers_drivers
FOREIGN KEY (`driver_id`)
REFERENCES `drivers`(`id`)
);

-- Task 2

INSERT INTO `clients`(`full_name`, `phone_number`)
(SELECT CONCAT(`d`.`first_name`, ' ', `d`.`last_name`),
CONCAT('(088)', ' ', '9999', `d`.`id` * 2) FROM `drivers` AS `d`
WHERE `d`.`id` BETWEEN 10 AND 20);

-- Task 3

UPDATE `cars` AS `c`
SET `condition` = 'C'
WHERE `c`.`mileage` >= 800000
OR `c`.`mileage` IS NULL
AND `c`.`year` <= 2010
AND `c`.`make` != 'Mercedes-Benz';

-- Task 4

-- SELECT * FROM `clients` AS `c`
DELETE `c` FROM `clients` AS `c`
LEFT JOIN `courses` AS `co`
ON `c`.`id` = `co`.`client_id`
WHERE `co`.`client_id` IS NULL AND  CHAR_LENGTH(`c`.`full_name`) > 3 ;

-- Task 5

SELECT `make`, `model`, `condition` FROM `cars`
ORDER BY `id`;

-- Task 6

SELECT
`d`.`first_name`,
`d`.`last_name`,
`c`.`make`,
`c`.`model`,
`c`.`mileage`
FROM `drivers` AS `d`
JOIN `cars_drivers` AS `cd`
ON `d`.`id` = `cd`.`driver_id`
JOIN `cars` AS `c`
ON `c`.`id` = `cd`.`car_id`
WHERE `c`.`mileage` IS NOT NULL
ORDER BY `c`.`mileage` DESC, `d`.`first_name`;

-- Task 7

SELECT
`c`.`id` AS 'car_id',
`c`.`make`,
`c`.`mileage`,
COUNT(`co`.`id`) AS 'count_of_courses',
ROUND(AVG(`co`.`bill`), 2) AS 'avg_bill'
FROM `cars` AS `c`
LEFT JOIN `courses` AS `co`
ON `c`.`id` = `co`.`car_id`
GROUP BY `c`.`id`
HAVING `count_of_courses` != 2
ORDER BY `count_of_courses` DESC, `c`.`id`;

-- Task 8

SELECT
`cl`.`full_name`,
COUNT(`c`.`id`) AS 'count_of_cars',
SUM(`co`.`bill`)
FROM `clients` AS `cl`
JOIN `courses` AS `co`
ON `cl`.`id` = `co`.`client_id`
JOIN `cars` AS `c`
ON `c`.`id` = `co`.`car_id`
WHERE `cl`.`full_name` LIKE '_a%'
GROUP BY `cl`.`id`
HAVING `count_of_cars` > 1
ORDER BY `cl`.`full_name`;

-- Task 9

SELECT
`a`.`name`,
(CASE
WHEN HOUR(`co`.`start`) BETWEEN 6 AND 20 THEN 'Day'
ELSE 'Night'
END) AS 'day_time',
`co`.`bill`,
`cl`.`full_name`,
`c`.`make`,
`c`.`model`,
`ca`.`name`
FROM `courses` AS `co`
JOIN `addresses` AS `a`
ON `a`.`id` = `co`.`from_address_id`
JOIN `clients` AS `cl`
ON `cl`.`id` = `co`.`client_id`
JOIN `cars` AS `c`
ON `c`.`id` = `co`.`car_id`
JOIN `categories` AS `ca`
ON `ca`.`id` = `c`.`category_id`
ORDER BY `co`.`id`;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(*) FROM `clients` AS `cl`
JOIN `courses` AS `co`
ON `cl`.`id` = `co`.`client_id`
WHERE `cl`.`phone_number` = phone_num);

END $$
DELIMITER ;

SELECT udf_courses_by_client ('(803) 6386812') as `count`;
SELECT udf_courses_by_client ('(704) 2502909') as `count`;

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN

SELECT
`a`.`name`,
`cl`.`full_name`,
(CASE
WHEN `co`.`bill` <= 20 THEN 'Low'
WHEN `co`.`bill` <= 30 THEN 'Medium'
ELSE 'High'
END) AS 'level_of_bill',
`c`.`make`,
`c`.`condition`,
`ca`.`name` AS `cat_name`
FROM `courses` AS `co`
JOIN `addresses` AS `a`
ON `a`.`id` = `co`.`from_address_id`
JOIN `clients` AS `cl`
ON `cl`.`id` = `co`.`client_id`
JOIN `cars` AS `c`
ON `c`.`id` = `co`.`car_id`
JOIN `categories` AS `ca`
ON `ca`.`id` = `c`.`category_id`
WHERE `a`.`name` = address_name
ORDER BY `c`.`make`, `cl`.`full_name`;

END $$
DELIMITER ;

CALL udp_courses_by_address('700 Monterey Avenue');
CALL udp_courses_by_address('66 Thompson Drive');






