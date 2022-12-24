
DROP SCHEMA IF EXISTS ruk_bank;
CREATE SCHEMA ruk_bank;
USE ruk_bank;

-- Task 1

CREATE TABLE branches(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`salary` DECIMAL(10, 2) NOT NULL,
`started_on` DATE NOT NULL,
`branch_id` INT NOT NULL,
CONSTRAINT fk_employees_branches
FOREIGN KEY (`branch_id`)
REFERENCES `branches`(`id`)
);

CREATE TABLE clients(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`full_name` VARCHAR(50) NOT NULL,
`age` INT NOT NULL
);

CREATE TABLE employees_clients(
`employee_id` INT,
`client_id` INT,
CONSTRAINT fk_employees_clients_employees
FOREIGN KEY (`employee_id`)
REFERENCES `employees`(`id`),
CONSTRAINT fk_employees_clients_clients
FOREIGN KEY (`client_id`)
REFERENCES `clients`(`id`)
);

CREATE TABLE bank_accounts(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`account_number` VARCHAR(10) NOT NULL,
`balance` DECIMAL(10, 2) NOT NULL,
`client_id` INT NOT NULL UNIQUE,
CONSTRAINT fk_bank_accounts_clients
FOREIGN KEY (`client_id`)
REFERENCES `clients`(`id`)
);

CREATE TABLE cards(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`card_number` VARCHAR(19) NOT NULL,
`card_status` VARCHAR(7) NOT NULL,
`bank_account_id` INT NOT NULL,
CONSTRAINT fk_cards_bank_accounts
FOREIGN KEY (`bank_account_id`)
REFERENCES `bank_accounts`(`id`)
);

-- Task 2

INSERT INTO `cards`(`card_number`, `card_status`, `bank_account_id`)
(SELECT REVERSE(`c`.`full_name`), 'Active', `c`.`id` FROM `clients` AS `c`
WHERE `c`.`id` BETWEEN 191 AND 200);

-- Task 3

UPDATE employees_clients
SET employee_id = (
SELECT ecc.employee_id FROM (SELECT * FROM employees_clients)  AS ecc
GROUP BY ecc.employee_id
ORDER BY COUNT(ecc.client_id), ecc.employee_id LIMIT 1
)
WHERE employee_id = client_id;

-- Task 4

DELETE `e` FROM `employees` AS `e`
LEFT JOIN `employees_clients` AS `ec`
ON `e`.`id` = `ec`.`employee_id`
WHERE `ec`.`client_id` IS NULL;

-- Task 5

SELECT `id`, `full_name` FROM `clients`
ORDER BY `id`;

-- Task 6

SELECT
`id`,
CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
CONCAT('$',`salary`) AS 'salary',
`started_on`
 AS 'started_on'
FROM `employees`
WHERE `salary` >= 100000 AND `started_on` >= '2018-01-01'
ORDER BY `salary` DESC, `id`;

-- Task 7

SELECT 
`c`.`id`,
CONCAT(`c`.`card_number`, ' : ', `cl`.`full_name`) AS 'card_token'
FROM `cards` AS `c`
JOIN `bank_accounts` AS `ba`
ON `c`.`bank_account_id` = `ba`.`id`
JOIN `clients` AS `cl`
ON `cl`.`id` = `ba`.`client_id`
ORDER BY `c`.`id` DESC;

-- Task 8

SELECT 
CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS 'name',
`e`.`started_on`,
COUNT(`c`.`id`) AS 'count_of_clients'
FROM `employees` AS `e`
JOIN `employees_clients` AS `ec`
ON `e`.`id` = `ec`.`employee_id`
JOIN `clients` AS `c`
ON `c`.`id` = `ec`.`client_id`
GROUP BY `e`.`id`
ORDER BY   `count_of_clients` DESC, `e`.`id` LIMIT 5;

-- Task 9

SELECT 
`b`.`name`,
COUNT(`ca`.`id`) AS 'count_of_cards'
FROM `branches` AS `b`
LEFT JOIN `employees` AS `e`
ON `e`.`branch_id` = `b`.`id`
LEFT JOIN `employees_clients` AS `ec`
ON `e`.`id` = `ec`.`employee_id`
LEFT JOIN `clients` AS `c`
ON `c`.`id` = `ec`.`client_id`
LEFT JOIN `bank_accounts` AS `ba`
ON `c`.`id` = `ba`.`client_id`
LEFT JOIN `cards` AS `ca`
ON `ca`.`bank_account_id` = `ba`.`id`
GROUP BY `b`.`id`
ORDER BY `count_of_cards` DESC, `b`.`name` ASC;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_client_cards_count(`name` VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT 
COUNT(`ca`.`id`)
FROM `clients` AS `cl`
JOIN `bank_accounts` AS `ba`
ON `ba`.`client_id` = `cl`.`id`
JOIN `cards` AS `ca`
ON `ca`.`bank_account_id` = `ba`.`id`
WHERE `cl`.`full_name` = `name`);

END $$
DELIMITER ;

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_clientinfo(full_name VARCHAR(50))
BEGIN

SELECT 
`cl`.`full_name`,
`cl`.`age`,
`ba`.`account_number`,
CONCAT('$', `ba`.`balance`) AS 'balance'
FROM `clients` AS `cl`
JOIN `bank_accounts` AS `ba`
ON `ba`.`client_id` = `cl`.`id`
WHERE `cl`.`full_name` = full_name;

END $$
DELIMITER ;

CALL udp_clientinfo('Hunter Wesgate')











