CREATE TABLE `gamebar`.`employees` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL
  );
  
  CREATE TABLE `gamebar`.`categories` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL
  );
  
CREATE TABLE `gamebar`.`products` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  INDEX `my_fk_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `my_fk`
    FOREIGN KEY (`category_id`)
    REFERENCES `gamebar`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SELECT * FROM gamebar.employees;

INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`) VALUES ('1', 'Test1', 'Test1');
INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`) VALUES ('2', 'Test2', 'Test2');
INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`) VALUES ('3', 'Test3', 'Test3');


-- Here are SQL queries for Judge tasks -- 

CREATE TABLE `employees` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL
  );
  
  CREATE TABLE `categories` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL
  );
  
CREATE TABLE `products` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL
  );
  

-- Variant 1 --

INSERT INTO `employees` (`first_name`,`last_name`) VALUES ('Test1','Test1');
INSERT INTO `employees` (`first_name`,`last_name`) VALUES ('Test2','Test2');
INSERT INTO `employees` (`first_name`,`last_name`) VALUES ('Test3','Test3');

-- Variant 2 --

INSERT INTO `employees` (`first_name`,`last_name`) VALUES 
('Test1','Test1'),
('Test2','Test2'),
('Test3','Test3');



ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(50) NOT NULL;


ALTER TABLE `products`
ADD CONSTRAINT fk_products_categories
FOREIGN KEY `products`(`category_id`)
REFERENCES `categories`(`id`);


ALTER TABLE `employees`
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100);







