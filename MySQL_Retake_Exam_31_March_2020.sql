
CREATE DATABASE instd;
USE instd;


-- Task 1

CREATE TABLE users(
`id` INT PRIMARY KEY,
`username` VARCHAR(30) NOT NULL UNIQUE,
`password` VARCHAR(30) NOT NULL,
`email` VARCHAR(50) NOT NULL,
`gender` CHAR NOT NULL,
`age` INT NOT NULL,
`job_title` VARCHAR(40) NOT NULL,
`ip`  VARCHAR(30) NOT NULL
);

CREATE TABLE addresses(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`address` VARCHAR(30) NOT NULL,
`town` VARCHAR(30) NOT NULL,
`country` VARCHAR(30) NOT NULL,
`user_id` INT NOT NULL,
CONSTRAINT fk_addresses_users
FOREIGN KEY (`user_id`)
REFERENCES `users`(`id`)
);

CREATE TABLE photos(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`description` TEXT NOT NULL,
`date` DATETIME NOT NULL,
`views` INT NOT NULL DEFAULT 0
);

CREATE TABLE comments(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`comment` VARCHAR(255) NOT NULL, 
`date` DATETIME NOT NULL,
`photo_id` INT NOT NULL,
CONSTRAINT fk_comments_photos
FOREIGN KEY (`photo_id`)
REFERENCES `photos`(`id`)
);

CREATE TABLE users_photos(
`user_id` INT NOT NULL,
`photo_id` INT NOT NULL,
-- CONSTRAINT pk_users_photo -- Po uslovie go ima no Judge gyrmi
-- PRIMARY KEY (`user_id`, `photo_id`), -- -- Po uslovie go ima no Judge gyrmi
CONSTRAINT fk_users_photos_users
FOREIGN KEY (`user_id`)
REFERENCES `users`(`id`),
CONSTRAINT fk_users_photos_photos
FOREIGN KEY (`photo_id`)
REFERENCES `photos`(`id`)
);

CREATE TABLE likes(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`photo_id` INT,
`user_id` INT,
CONSTRAINT fk_likes_photos
FOREIGN KEY (`photo_id`)
REFERENCES `photos`(`id`),
CONSTRAINT fk_likes_users
FOREIGN KEY (`user_id`)
REFERENCES `users`(`id`)
);

-- Task 2
 
INSERT INTO `addresses`(`address`, `town`, `country`, `user_id`)
SELECT `u`.`username`, `u`.`password`, `u`.`ip`, `u`.`age` FROM `users` AS `u`
WHERE `u`.`gender` = 'M';

-- Task 3

UPDATE `addresses` 
SET `country` = (
CASE
WHEN `country` LIKE 'B%' THEN 'Blocked'
WHEN `country` LIKE 'T%' THEN 'Test'
WHEN `country` LIKE 'P%' THEN 'In Progress'
ELSE `country`
END
);

-- Task 4

DELETE FROM `addresses`
WHERE `id` % 3 = 0;

-- Task 5

SELECT `u`.`username`, `u`.`gender`, `u`.`age` FROM `users` AS `u`
ORDER BY `u`.`age` DESC, `u`.`username`;

-- Task 6

SELECT `p`.`id`,
`p`.`date` AS 'date_and_time',
`p`.`description`,
COUNT(`c`.`id`) AS 'commentsCount' FROM `photos` AS `p`
JOIN `comments` AS `c`
ON `p`.`id` = `c`.`photo_id`
GROUP BY `p`.`id`
ORDER BY `commentsCount` DESC, `p`.`id` LIMIT 5;

-- Variant 2

SELECT `p`.`id`,
`p`.`date` AS 'date_and_time',
`p`.`description`,
(SELECT COUNT(*) FROM `comments` AS `c` WHERE `p`.`id` =  `c`.`photo_id`) AS 'commentsCount' FROM `photos` AS `p`
ORDER BY `commentsCount` DESC, `p`.`id` LIMIT 5;

-- Task 7

SELECT CONCAT(`u`.`id`, ' ', `u`.`username`) AS 'id_username', `u`.`email`  FROM `users` AS `u`
JOIN `users_photos` AS `up`
ON `u`.`id` = `up`.`user_id`
JOIN `photos` AS `p`
ON `up`.`photo_id` = `p`.`id`
WHERE `u`.`id` = `p`.`id`
ORDER BY `u`.`id`;

-- Variant 2

SELECT CONCAT(`u`.`id`, ' ', `u`.`username`) AS 'id_username', `u`.`email`  FROM `users` AS `u`
JOIN `users_photos` AS `up`
ON `u`.`id` = `up`.`user_id` AND `u`.`id` = `up`.`photo_id`
ORDER BY `u`.`id`;

-- Task 8

SELECT `p`.`id` AS 'photo_id',
(SELECT COUNT(*) FROM `likes` AS `l` WHERE  `p`.`id` = `l`.`photo_id`) AS 'likes_count',
(SELECT COUNT(*) FROM `comments` AS `c` WHERE `p`.`id` = `c`.`photo_id`) AS 'comments_count'
FROM `photos` AS `p`
ORDER BY `likes_count` DESC, `comments_count` DESC, `p`.`id`;

-- Variant 2

SELECT `p`.`id` AS 'photo_id',
COUNT(DISTINCT `l`.`id`) AS 'likes_count', -- DISTINCT - za da ne broim praznite laikove povtorno kogato otchitame komentarite
COUNT(DISTINCT `c`.`id`) AS 'comments_count' -- DISTINCT - za da ne broim praznite comentari povtorno kogato otchitame laikovete
FROM `photos` AS `p`
LEFT JOIN `likes` AS `l`
ON `p`.`id` = `l`.`photo_id`
LEFT JOIN `comments` AS `c`
ON `p`.`id` = `c`.`photo_id`
GROUP BY `p`.`id`
ORDER BY `likes_count` DESC, `comments_count` DESC, `photo_id`;

-- Task 9

SELECT CONCAT(SUBSTRING(`description`, 1 , 30), '...') AS 'summary', `date` FROM `photos`
WHERE EXTRACT(DAY FROM `date`) = 10
ORDER BY `date` DESC;

-- Variant 2

SELECT CONCAT(LEFT(`description`, 30), '...') AS 'summary', `date` FROM `photos`
WHERE DAY(`date`) = 10
ORDER BY `date` DESC;


-- Task 10

DELIMITER $$
CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(*) AS 'photosCount' FROM `users` AS `u`
JOIN `users_photos` AS `up`
ON `u`.`id` = `up`.`user_id`
JOIN `photos` AS `p`
ON `up`.`photo_id` = `p`.`id`
WHERE `u`.`username` = username);

END $$
DELIMITER ;

-- SELECT	udf_users_photos_count('ssantryd');

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_modify_user (address VARCHAR(30), town VARCHAR(30))
BEGIN

UPDATE `users` AS `u`
JOIN `addresses` AS `a`
ON `u`.`id` = `a`.`user_id`
SET `u`.`age` = `u`.`age` + 10
WHERE `a`.`address` = address AND `a`.`town` = town;

END $$
DELIMITER ;


CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
SELECT `u`.`username`, `u`.`email`, `u`.`gender`, `u`.`age`, `u`.`job_title` AS 'Job_title' FROM `users` AS `u`
WHERE `u`.`username` = 'eblagden21';











