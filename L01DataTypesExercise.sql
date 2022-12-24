CREATE SCHEMA `minions`;
USE `minions`;

-- Task 1
CREATE TABLE `minions` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `age` INT
);

CREATE TABLE `towns` (
    `town_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

--
ALTER TABLE `towns`
CHANGE COLUMN `town_id` `id` INT;
-- 

-- Task 2

ALTER TABLE `minions`
ADD COLUMN `town_id` INT,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY `minions`(`town_id`)
REFERENCES `towns`(`id`);

-- Task 3

INSERT INTO `towns`(`id`,`name`) VALUES
("1","Sofia"),
("2","Plovdiv"),
("3","Varna");

INSERT INTO `minions`(`id`,`name`,`age`,`town_id`) VALUES
("1","Kevin","22","1"),
("2","Bob","15","3"),
("3","Steward",NULL,"2");

-- Task 4

TRUNCATE TABLE `minions`;

-- Task 5

DROP TABLES `minions`,`towns`;

-- Task 6

CREATE TABLE `people` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10 , 2 ),
    `weight` DOUBLE(10 , 2 ),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

 INSERT INTO `people`(`name`, `gender`, `birthdate`) VALUES -- Other values could be NULL
 ('Pesho','m','1999-05-24'),
 ('Gosho','m','1993-07-20'),
 ('Misho','m','1994-08-05'),
 ('Maria','f','1988-07-21'),
 ('Mira','f','1985-03-15');

-- Task 7

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN,
    CONSTRAINT pk_users PRIMARY KEY `users` (`id`)
);

INSERT INTO `users`(`username`,`password`) VALUES -- Other values could be NULL
('A','1'),
('B','2'),
('C','3'),
('D','4'),
('E','5');

-- Task 8

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users`(`id`,`username`);

-- Task 9

ALTER TABLE `users`
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME DEFAULT NOW();

-- Task 10

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users`(`id`),
CHANGE COLUMN `username` `username` VARCHAR(30) UNIQUE;

-- Task 11
 
 --
CREATE DATABASE `movie`;
USE `movie`;
--

CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors`(`director_name`,`notes`) VALUES -- no need to fill column notes because could be NULL
('Test1','Note1'),
('Test2','Note2'),
('Test3','Note3'),
('Test4','Note4'),
('Test5','Note5');

CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `genres`(`genre_name`) VALUES
('Test1'),
('Test2'),
('Test3'),
('Test4'),
('Test5');

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `categories`(`category_name`) VALUES
('Test1'),
('Test2'),
('Test3'),
('Test4'),
('Test5');


CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `director_id` INT,
    `copyright_year` INT,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT
);

INSERT INTO `movies`(`title`) VALUES
('Movie1'),
('Movie2'),
('Movie3'),
('Movie4'),
('Movie5');

--
CREATE DATABASE `car_rental`;
USE `car_rental`;
--

-- Task 12

-- !!! Don't try to add foreign keyes because not said in task condition and Judje give 66/100 !!!

-- DROP TABLES `categories`,  `cars`, `employees`, `customers`, `rental_orders`;

CREATE TABLE `categories` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category` VARCHAR(20) NOT NULL,
`daily_rate` DOUBLE,
`weekly_rate` DOUBLE,
`monthly_rate` DOUBLE, 
`weekend_rate` DOUBLE
);

INSERT INTO `categories`(`category`) VALUES
('Truck'),
('Bus'),
('Car');

CREATE TABLE `cars` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`plate_number` VARCHAR(20) NOT NULL,
`make` VARCHAR(15),
`model` VARCHAR(15), 
`car_year` INT, 
`category_id` INT,
`doors` INT, 
`picture` BLOB, 
`car_condition` VARCHAR(10), 
`available` BOOLEAN
);

INSERT INTO `cars`(`plate_number`) VALUES
('1234'),
('56'),
('789');

CREATE TABLE `employees` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(15),
`last_name` VARCHAR(15),
`title`VARCHAR(20) NOT NULL,
`notes` TEXT
 );

INSERT INTO `employees`(`title`) VALUES
('Test1'),
('Test2'),
('Test3');

CREATE TABLE `customers` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`driver_licence_number` INT NOT NULL, 
`full_name` VARCHAR(15), 
`address` VARCHAR(40), 
`city` VARCHAR(20), 
`zip_code` INT, 
`notes` TEXT
);

INSERT INTO `customers`(`driver_licence_number`) VALUES
('454'),
('5555'),
('1267890');

CREATE TABLE `rental_orders` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`employee_id` INT, 
`customer_id` INT, 
`car_id` INT, 
`car_condition` VARCHAR(10) NOT NULL, 
`tank_level` INT, 
`kilometrage_start` INT, 
`kilometrage_end` INT, 
`total_kilometrage` INT, 
`start_date` DATE, 
`end_date` DATE, 
`total_days` INT, 
`rate_applied` DOUBLE, 
`tax_rate` DOUBLE, 
`order_status` VARCHAR(20), 
`notes` TEXT
);

INSERT INTO `rental_orders`(`car_condition`) VALUES
('Good'),
('Bad'),
('Excelent');

-- 
CREATE DATABASE `soft_uni`;
USE `soft_uni`;
--

-- Task 13

-- Do not submit creation of database and tables only the INSERT statements!

CREATE TABLE `towns` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(15) NOT NULL
);

CREATE TABLE `addresses` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`address_text` VARCHAR(50) NOT NULL,
`town_id` INT,
CONSTRAINT fk_addresses_towns
FOREIGN KEY `addresses`(`town_id`)
REFERENCES `towns`(`id`)
);

CREATE TABLE `departments` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name`  VARCHAR(30) NOT NULL
);

CREATE TABLE `employees` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(15) NOT NULL,
`middle_name` VARCHAR(15) NOT NULL,
`last_name` VARCHAR(15) NOT NULL, 
`job_title`VARCHAR(20) NOT NULL,  
`department_id` INT, 
`hire_date` DATE NOT NULL, 
`salary` DECIMAL(10,2) NOT NULL, 
`address_id` INT,
CONSTRAINT fk_employees_departments
FOREIGN KEY `employees`(`department_id`)
REFERENCES `departments`(`id`),
CONSTRAINT fk_employees_addresses
FOREIGN KEY `employees`(`address_id`)
REFERENCES `addresses`(`id`)
);

INSERT INTO `towns`(`name`) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO `departments`(`name`) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO `employees`(`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) 
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', '4', '2013-02-01', '3500.00'),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', '1', '2004-03-02', '4000.00'),
('Maria', 'Petrova', 'Ivanova', 'Intern', '5', '2016-08-28', '525.25'),
('Georgi', 'Terziev', 'Ivanov', 'CEO', '2', '2007-12-09', '3000.00'),
('Peter', 'Pan', 'Pan', 'Intern', '3', '2016-08-28', '599.88');

-- Task 14

SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- Task 15

SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

-- Task 16

SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

-- Task 17

UPDATE `employees`
SET `salary` = `salary` * 1.1; 
SELECT `salary` FROM `employees`;

-- Task 18

TRUNCATE TABLE `occupancies`;

































