
DROP SCHEMA IF EXISTS online_store;
CREATE SCHEMA online_store;
USE online_store;

-- Task 1

CREATE TABLE brands(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE 
);

CREATE TABLE categories(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE 
);

CREATE TABLE reviews(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`content` TEXT,
`rating` DECIMAL(10, 2) NOT NULL,
`picture_url` VARCHAR(80) NOT NULL,
`published_at` DATETIME NOT NULL
);

CREATE TABLE products(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`price` DECIMAL(19, 2) NOT NULL,
`quantity_in_stock` INT,
`description` TEXT,
`brand_id` INT NOT NULL,
`category_id` INT NOT NULL,
`review_id` INT,
CONSTRAINT fk_products_brands
FOREIGN KEY (`brand_id`)
REFERENCES `brands`(`id`),
CONSTRAINT fk_products_categories
FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`),
CONSTRAINT fk_products_reviews
FOREIGN KEY (`review_id`)
REFERENCES `reviews`(`id`)
);

CREATE TABLE customers(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`phone` VARCHAR(30) NOT NULL UNIQUE,
`address` VARCHAR(60) NOT NULL,
`discount_card` BIT(1) NOT NULL DEFAULT FALSE
);

CREATE TABLE orders(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`order_datetime` DATETIME NOT NULL,
`customer_id` INT NOT NULL,
CONSTRAINT fk_orders_customers
FOREIGN KEY (`customer_id`)
REFERENCES `customers`(`id`)
);

CREATE TABLE orders_products(
`order_id` INT,
`product_id` INT,
CONSTRAINT fk_orders_products_orders
FOREIGN KEY (`order_id`)
REFERENCES `orders`(`id`),
CONSTRAINT fk_orders_products_products
FOREIGN KEY (`product_id`)
REFERENCES `products`(`id`)
);

-- Task 2

INSERT INTO `reviews`(`content`, `picture_url`, `published_at`, `rating`)
(SELECT
SUBSTRING(`p`.`description`, 1, 15),
REVERSE(`p`.`name`),
DATE('2010-10-10'),
`p`.`price` / 8
FROM `products` AS `p`
WHERE `p`.`id` >= 5);

-- Task 3

UPDATE `products` AS `p`
SET `p`.`quantity_in_stock` = `p`.`quantity_in_stock` - 5
WHERE `p`.`quantity_in_stock` BETWEEN 60 AND 70;

-- Task 4

DELETE `c` FROM `customers` AS `c`
LEFT JOIN `orders` AS `o`
ON `c`.`id` = `o`.`customer_id`
WHERE `o`.`customer_id` IS NULL;

-- Task 5

SELECT `id`, `name` FROM categories
ORDER BY `name` DESC;

-- Task 6

SELECT `p`.`id`, `b`.`id`, `p`.`name`, `p`.`quantity_in_stock` FROM `products` AS `p`
JOIN `brands` AS `b`
ON `p`.`brand_id` = `b`.`id`
WHERE `p`.`price` > 1000 AND `p`.`quantity_in_stock` < 30
ORDER BY `p`.`quantity_in_stock`, `p`.`id`;

-- Task 7

SELECT `id`, `content`, `rating`, `picture_url`, `published_at` FROM `reviews`
WHERE `content` LIKE 'My%' AND CHAR_LENGTH(`content`) > 61
ORDER BY `rating` DESC;

-- Task 8

SELECT CONCAT_WS(' ', `c`.`first_name`, `c`.`last_name`) AS 'full_name',
`c`.`address`,
`o`.`order_datetime` AS 'order_date'
FROM `customers` AS `c`
JOIN `orders` AS `o`
ON `c`.`id` = `o`.`customer_id`
WHERE YEAR(`o`.`order_datetime`) <= 2018
ORDER BY `full_name` DESC;

-- Task 9

SELECT 
COUNT(`p`.`id`) AS 'items_count',
`c`.`name`,
SUM(`p`.`quantity_in_stock`) AS 'total_quantity' FROM `categories` AS `c`
JOIN `products` AS `p`
ON  `c`.`id` = `p`.`category_id`
GROUP BY `c`.`id`
ORDER BY `items_count` DESC, `total_quantity`
LIMIT 5;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_customer_products_count(name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(`p`.`id`) FROM `customers` AS `c`
JOIN `orders` AS `o`
ON `c`.`id` = `o`.`customer_id`
JOIN `orders_products` AS `op`
ON `op`.`order_id` = `o`.`id`
JOIN `products` AS `p`
ON `p`.`id` = `op`.`product_id`
WHERE `c`.`first_name` = name);

END $$
DELIMITER ;

SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_reduce_price(category_name VARCHAR(50))
BEGIN

UPDATE `products` AS `p`
JOIN `categories` AS `c`
ON `c`.`id` = `p`.`category_id`
JOIN `reviews` AS `r`
ON `r`.`id` = `p`.`review_id`
SET `p`.`price` = `p`.`price` * 0.7
WHERE `r`.`rating` < 4 AND `c`.`name` = category_name;

END $$
DELIMITER ;

CALL udp_reduce_price ('Phones and tablets');



















