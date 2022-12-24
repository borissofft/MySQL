
DROP DATABASE softuni_imdb;
CREATE DATABASE softuni_imdb;
USE softuni_imdb;

-- Task 1

CREATE TABLE countries(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL UNIQUE,
`continent` VARCHAR(30) NOT NULL,
`currency` VARCHAR(5) NOT NULL
);

CREATE TABLE genres(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE actors(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`birthdate` DATE NOT NULL,
`height` INT,
`awards` INT,
`country_id` INT NOT NULL,
CONSTRAINT fk_actors_countries
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`)
);

CREATE TABLE movies_additional_info(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`rating` DECIMAL(10, 2) NOT NULL,
`runtime` INT NOT NULL,
`picture_url` VARCHAR(80) NOT NULL,
`budget` DECIMAL(10, 2),
`release_date` DATE NOT NULL,
`has_subtitles` BOOLEAN,
`description` TEXT
);

CREATE TABLE movies(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(70) NOT NULL UNIQUE,
`country_id` INT NOT NULL,
`movie_info_id` INT NOT NULL UNIQUE,
CONSTRAINT fk_movies_countries
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`),
CONSTRAINT fk_movies_movies_additional_info
FOREIGN KEY (`movie_info_id`)
REFERENCES `movies_additional_info`(`id`)
);

CREATE TABLE movies_actors(
`movie_id` INT,
`actor_id` INT,
CONSTRAINT fk_movies_actors_movies
FOREIGN KEY (`movie_id`)
REFERENCES `movies`(`id`),
CONSTRAINT fk_movies_actors_actors
FOREIGN KEY (`actor_id`)
REFERENCES `actors`(`id`)
);

CREATE TABLE genres_movies(
`genre_id` INT, 
`movie_id` INT,
CONSTRAINT fk_genres_movies_genres
FOREIGN KEY (`genre_id`)
REFERENCES `genres`(`id`),
CONSTRAINT fk_genres_movies_movies
FOREIGN KEY (`movie_id`)
REFERENCES `movies`(`id`)
);

-- Task 2

INSERT INTO `actors`(`first_name`, `last_name`, `birthdate`, `height`, `awards`, `country_id`)
SELECT 
REVERSE(`a`.`first_name`),
REVERSE(`a`.`last_name`),
-- DATE_SUB(`a`.`birthdate`, INTERVAL 2 DAY),
DATE_ADD(`a`.`birthdate`, INTERVAL -2 DAY),
`a`.`height` + 10,
`a`.`country_id`,
3
FROM `actors` AS `a`
WHERE `a`.`id` <= 10;

-- Task 3

UPDATE movies_additional_info AS `m`
SET `m`.`runtime` = `m`.`runtime` - 10
-- WHERE `m`.`id` >= 15 AND `m`.`id` <= 25;
WHERE `m`.`id` BETWEEN 15 AND 25;

-- Task 4

DELETE `c` FROM `countries` AS `c`
LEFT JOIN `movies` AS `m`
ON `c`.`id` = `m`.`country_id`
WHERE `m`.`country_id` IS NULL;

-- Variant 2

DELETE `c` FROM `countries` AS `c`
WHERE `id` NOT IN(SELECT `country_id` FROM `movies`);

-- Task 5

-- DROP DATABASE softuni_imdb;

-- SELECT `id`, `name`, `continent`, `currency` FROM `countries`
SELECT * FROM `countries`
ORDER BY `currency` DESC, `id`;

-- Task 6

SELECT `mi`.`id`, `m`.`title`, `mi`.`runtime`, `mi`.`budget`, `mi`.`release_date` FROM `movies_additional_info` AS `mi`
JOIN `movies` AS `m`
ON `mi`.`id` = `m`.`movie_info_id`
WHERE YEAR(`mi`.`release_date`) BETWEEN 1996 AND 1999
ORDER BY `mi`.`runtime`, `mi`.`id` LIMIT 20;

-- Task 7

SELECT 
CONCAT(`a`.`first_name` , ' ', `a`.`last_name`) AS 'full_name',
CONCAT(REVERSE(`a`.`last_name`), CHAR_LENGTH(`a`.`last_name`), '@cast.com') AS 'email',
(2022 - YEAR(`a`.`birthdate`)) AS 'age',
`a`.`height`
FROM `actors` AS `a`
LEFT JOIN `movies_actors` AS `ma`
ON `a`.`id` = `ma`.`actor_id`
-- LEFT JOIN `movies` AS `m`
-- ON `ma`.`movie_id` = `m`.`id`
WHERE `ma`.`movie_id` IS NULL
ORDER BY `a`.`height`;

-- Variant 2

SELECT 
CONCAT(`first_name` , ' ', `last_name`) AS 'full_name',
CONCAT(REVERSE(`last_name`), CHAR_LENGTH(`last_name`), '@cast.com') AS 'email',
(2022 - YEAR(`birthdate`)) AS 'age',
`height`
FROM `actors` AS `a`
WHERE `id` NOT IN(SELECT `actor_id` FROM `movies_actors`)
ORDER BY `height`;

-- Task 8

SELECT `c`.`name`, COUNT(`m`.`id`) AS 'movies_count' FROM `movies` AS `m`
LEFT JOIN `countries` AS `c`
ON `m`.`country_id` = `c`.`id`
GROUP BY `c`.`name`
HAVING `movies_count` >= 7
ORDER BY `c`.`name` DESC;

-- Task 9

SELECT `m`.`title`, 
(CASE
WHEN `mi`.`rating` <= 4 THEN 'poor'
WHEN `mi`.`rating` <= 7 THEN 'good'
-- WHEN `mi`.`rating` > 7 THEN 'excellent'
ELSE 'excellent'
END) AS 'rating',
-- IF(`mi`.`has_subtitles` = 1, 'english', '-') AS 'subtitles',
IF(`mi`.`has_subtitles`, 'english', '-') AS 'subtitles',
`mi`.`budget`
FROM `movies` AS `m`
LEFT JOIN `movies_additional_info` AS `mi`
ON `m`.`movie_info_id` = `mi`.`id`
ORDER BY `mi`.`budget` DESC;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(*) FROM `movies` AS `m`
JOIN `genres_movies` AS `gm`
ON `m`.`id` = `gm`.`movie_id`
JOIN `genres` AS `g`
ON `gm`.`genre_id` = `g`.`id`
JOIN `movies_actors` AS `ma`
ON `m`.`id` = `ma`.`movie_id`
JOIN `actors` AS `a`
ON `a`.`id` = `ma`.`actor_id`
WHERE `g`.`name` = 'History'
AND CONCAT_WS(' ', `a`.`first_name`, `a`.`last_name`) = full_name);

END $$
DELIMITER ;

-- Variant 2

DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(*)
FROM `actors` AS `a`
JOIN `movies_actors` AS `ma`
ON `a`.`id` = `ma`.`actor_id`
JOIN `genres_movies` AS `gm` USING (`movie_id`)
JOIN `genres` AS `g`
ON `g`.`id` = `gm`.`genre_id`
WHERE `g`.`name` = 'History' AND CONCAT_WS(' ', `a`.`first_name`, `a`.`last_name`) = full_name);

END $$
DELIMITER ;

-- SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';
-- SELECT udf_actor_history_movies_count('Jared Di Batista')  AS 'history_movies';

-- Task 11

-- Purvoto reshenie ne raboti!!!! Trqbva UPDATE i SET, bez SELECT(ne e zadadeno korektno uslovieto)

/*
DELIMITER $$
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN

UPDATE `actors` AS `a`
JOIN `movies_actors` AS `ma` 
ON `a`.`id` = `ma`.`actor_id`
JOIN `movies` AS `m`
ON `m`.`id` = `ma`.`movie_id`
SET  `a`.`awards` = `a`.`awards` + 1
WHERE `m`.`title` = movie_title;

SELECT CONCAT_WS(' ', `a`.`first_name`, `a`.`last_name`) AS 'full_name',
`a`.`awards` - 1 AS 'awards before',
CONCAT('-', '>') AS '->',
`a`.`awards` AS 'awards after'
FROM `movies` AS `m`
JOIN `movies_actors` AS `ma`
ON `m`.`id` = `ma`.`movie_id`
JOIN `actors` AS `a`
ON `a`.`id` = `ma`.`actor_id`
WHERE `m`.`title` = movie_title
ORDER BY `a`.`id`;

END $$
DELIMITER ;

CALL udp_award_movie('Tea For Two');
*/

DELIMITER $$
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN

UPDATE `actors` AS `a`
JOIN `movies_actors` AS `ma` 
ON `a`.`id` = `ma`.`actor_id`
JOIN `movies` AS `m`
ON `m`.`id` = `ma`.`movie_id`
SET  `a`.`awards` = `a`.`awards` + 1
WHERE `m`.`title` = movie_title;

END $$
DELIMITER ;

-- CALL udp_award_movie('Tea For Two');
-- CALL udp_award_movie('Miss You Can Do It');

-- CALL udp_award_movie('Tea For Two');
/*
SELECT a.awards FROM actors a
JOIN movies_actors ma on a.id = ma.actor_id
join movies m on m.id = ma.movie_id
WHERE m.title = 'Tea For Two';
*/


