
DROP SCHEMA IF EXISTS softuni_stores_system;
CREATE SCHEMA softuni_stores_system;
USE softuni_stores_system;


-- Task 1

CREATE TABLE pictures(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`url` VARCHAR(100) NOT NULL,
`added_on` DATETIME NOT NULL
);

CREATE TABLE categories(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE products(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
`best_before` DATE,
`price` DECIMAL(10, 2) NOT NULL,
`description` TEXT,
`category_id` INT NOT NULL,
`picture_id` INT NOT NULL,
CONSTRAINT fk_products_categories
FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`),
CONSTRAINT fk_products_pictures
FOREIGN KEY (`picture_id`)
REFERENCES `pictures`(`id`)
);

CREATE TABLE towns(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE addresses(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE,
`town_id` INT NOT NULL,
CONSTRAINT fk_addresses_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`)
);

CREATE TABLE stores(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL UNIQUE,
`rating` FLOAT NOT NULL,
`has_parking` TINYINT(1) DEFAULT FALSE,
`address_id` INT NOT NULL,
CONSTRAINT fk_stores_addresses
FOREIGN KEY (`address_id`)
REFERENCES `addresses`(`id`)
);

CREATE TABLE products_stores(
`product_id` INT NOT NULL,
`store_id` INT NOT NULL,
CONSTRAINT pk_products_stores
PRIMARY KEY (`product_id`, `store_id`),
CONSTRAINT fk_products_stores_products
FOREIGN KEY (`product_id`)
REFERENCES `products`(`id`),
CONSTRAINT fk_products_stores_stores
FOREIGN KEY (`store_id`)
REFERENCES `stores`(`id`)
);

CREATE TABLE employees(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(15) NOT NULL,
`middle_name` CHAR(1),
`last_name` VARCHAR(20) NOT NULL,
`salary` DECIMAL(19, 2) DEFAULT 0,
`hire_date` DATE NOT NULL,
`manager_id` INT,
`store_id` INT NOT NULL,
CONSTRAINT fk_employees_employees
FOREIGN KEY (`manager_id`)
REFERENCES `employees`(`id`), 
CONSTRAINT fk_employees_stores
FOREIGN KEY (`store_id`)
REFERENCES `stores`(`id`)
);

-- Task 2

INSERT INTO `products_stores`(`product_id`, `store_id`)
(SELECT `p`.`id`, 1 FROM `products` AS `p`
LEFT JOIN `products_stores` AS `ps`
ON `p`.`id` = `ps`.`product_id`
WHERE `ps`.`product_id` IS NULL);

-- Variant 2

INSERT INTO `products_stores`(`product_id`, `store_id`)
(SELECT `p`.`id`, 1 FROM `products` AS `p`
WHERE `p`.`id` NOT IN(SELECT `product_id` FROM `products_stores`));

-- Task 3

UPDATE `employees` AS `e`
JOIN `stores` AS `s`
ON `s`.`id` = `e`.`store_id`
SET `e`.`manager_id` = 3, `e`.`salary` = `e`.`salary` - 500
WHERE YEAR(`e`.`hire_date`) > 2003 AND `s`.`name` NOT IN('Cardguard', 'Veribet');

-- Task 4

DELETE FROM `employees` AS `e`
WHERE `e`.`salary` >= 6000 AND `e`.`manager_id` IS NOT NULL;

-- Task 5

SELECT `first_name`, `middle_name`, `last_name`, `salary`, `hire_date` FROM `employees`
ORDER BY `hire_date` DESC;

-- Task 6

SELECT
`p`.`name` AS 'product_name',
`p`.`price`,
`p`.`best_before`,
CONCAT(LEFT(`p`.`description`, 10), '...') AS 'short_description',
`pi`.`url`
FROM `products` AS `p`
JOIN `pictures` AS `pi`
ON `p`.`picture_id` = `pi`.`id`
WHERE CHAR_LENGTH(`p`.`description`) > 100
AND YEAR(`pi`.`added_on`) < 2019
AND `p`.`price` > 20
ORDER BY `p`.`price` DESC;

-- Task 7

SELECT
`s`.`name`,
COUNT(`p`.`id`) AS 'product_count',
ROUND(AVG(`p`.`price`), 2) AS 'avg'
FROM `stores` AS `s`
LEFT JOIN `products_stores` AS `ps`
ON `s`.`id` = `ps`.`store_id`
LEFT JOIN `products` AS `p`
ON `p`.`id` = `ps`.`product_id`
GROUP BY `s`.`name`
ORDER BY `product_count` DESC, `avg` DESC, `s`.`id`;

-- Task 8

SELECT
CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS 'Full_name',
`s`.`name` AS 'Store_name',
`a`.`name` 'address',
`e`.`salary`
FROM `employees` AS `e`
JOIN `stores` AS `s`
ON `s`.`id` = `e`.`store_id`
JOIN `addresses` AS `a`
ON `a`.`id` = `s`.`address_id`
WHERE `e`.`salary` < 4000
AND `a`.`name` LIKE '%5%'
AND CHAR_LENGTH(`s`.`name`) > 8
AND `e`.`last_name` LIKE '%n';

-- Task 9

SELECT
REVERSE(`s`.`name`) AS 'reversed_name',
CONCAT(UPPER(`t`.`name`), '-', `a`.`name`) AS 'full_address',
COUNT(`e`.`id`) AS 'employees_count'
FROM `stores` AS `s`
JOIN `addresses` AS `a`
ON `a`.`id` = `s`.`address_id`
JOIN `towns` AS `t`
ON `t`.`id` = `a`.`town_id`
JOIN `employees` AS `e`
ON `e`.`store_id` = `s`.`id`
GROUP BY `s`.`name`
HAVING `employees_count` >= 1
ORDER BY `full_address`;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS TEXT
DETERMINISTIC
BEGIN

RETURN(SELECT
CONCAT(`e`.`first_name`, ' ', `e`.`middle_name`, '. ', `e`.`last_name`, ' works in store for ', TIMESTAMPDIFF(YEAR, `e`.`hire_date`, '2020-10-18'), ' years')
FROM `employees` AS `e`
JOIN `stores` AS `s`
ON `s`.`id` = `e`.`store_id`
WHERE `s`.`name` = store_name
GROUP BY `e`.`id`
ORDER BY `e`.`salary` DESC LIMIT 1);

END $$
DELIMITER ;

SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN

UPDATE `products` AS `p`
JOIN `products_stores` AS `ps`
ON `p`.`id` = `ps`.`product_id`
JOIN `stores` AS `s`
ON `s`.`id` = `ps`.`store_id`
JOIN `addresses` AS `a`
ON `a`.`id` = `s`.`address_id`
SET `p`.`price` = `p`.`price` + IF(`a`.`name` LIKE '0%', 100, 200 )
WHERE `a`.`name` = address_name;

END $$
DELIMITER ;

CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;

CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;














