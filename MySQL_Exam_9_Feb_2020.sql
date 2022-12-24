
CREATE DATABASE fsd;
USE fsd;

-- Task 1

CREATE TABLE countries(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE towns(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`country_id` INT NOT NULL,
CONSTRAINT fk_towns_countries
FOREIGN KEY(`country_id`)
REFERENCES `countries`(`id`)
);

CREATE TABLE stadiums(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`capacity` INT NOT NULL,
`town_id` INT NOT NULL,
CONSTRAINT fk_stadiums_towns
FOREIGN KEY(`town_id`)
REFERENCES `towns`(`id`)
);

CREATE TABLE teams(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`established` DATE NOT NULL,
`fan_base` BIGINT NOT NULL DEFAULT 0,
`stadium_id` INT NOT NULL,
CONSTRAINT fk_teams_stadiums
FOREIGN KEY(`stadium_id`)
REFERENCES `stadiums`(`id`)
);

CREATE TABLE skills_data(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`dribbling` INT DEFAULT 0,
`pace` INT DEFAULT 0,
`passing` INT DEFAULT 0,
`shooting` INT DEFAULT 0,
`speed` INT DEFAULT 0,
`strength` INT DEFAULT 0
);

CREATE TABLE coaches(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(10) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`salary` DECIMAL(10, 2) NOT NULL DEFAULT 0,
`coach_level` INT NOT NULL DEFAULT 0
);

CREATE TABLE players(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(10) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`age` INT NOT NULL DEFAULT 0,
`position` CHAR NOT NULL,
`salary` DECIMAL(10, 2) NOT NULL DEFAULT 0,
`hire_date` DATETIME,
`skills_data_id` INT NOT NULL,
`team_id` INT,
CONSTRAINT fk_players_skill_datas
FOREIGN KEY(`skills_data_id`)
REFERENCES `skills_data`(`id`),
CONSTRAINT fk_players_teams
FOREIGN KEY(`team_id`)
REFERENCES `teams`(`id`)
);

CREATE TABLE players_coaches(
`player_id` INT,
`coach_id` INT,
CONSTRAINT pk_players_coaches
PRIMARY KEY(`player_id`, `coach_id`),
CONSTRAINT fk_players_coaches_players
FOREIGN KEY(`player_id`)
REFERENCES `players`(`id`),
CONSTRAINT fk_players_coaches_coaches
FOREIGN KEY(`coach_id`)
REFERENCES `coaches`(`id`)
);

-- Task 2

INSERT INTO `coaches`(`first_name`, `last_name`, `salary`, `coach_level`)
SELECT `p`.`first_name`,
`p`.`last_name`,
`p`.`salary` + `p`.`salary`,
CHAR_LENGTH(`p`.`first_name`) FROM `players` AS `p`
WHERE `p`.`age` >= 45;

--  Variant 2

INSERT INTO `coaches`(`first_name`, `last_name`, `salary`, `coach_level`)
(SELECT `p`.`first_name`,
`p`.`last_name`,
`p`.`salary` + `p`.`salary`,
CHAR_LENGTH(`p`.`first_name`) FROM `players` AS `p`
WHERE `p`.`age` >= 45);

-- Task 3

UPDATE `coaches` AS `c`
JOIN `players_coaches` AS `pc`
ON `c`.`id` = `pc`.`coach_id` -- If thare is a record in `pc`.`coach_id` it's clear that the coach train at least one player
SET `c`.`coach_level` = `c`.`coach_level` + 1
WHERE `c`.`first_name` LIKE 'A%';

-- Variant 2

UPDATE `coaches` AS `c`
SET `c`.`coach_level` = `c`.`coach_level` + 1
WHERE `c`.`id` IN(SELECT `coach_id` FROM `players_coaches`)
AND `c`.`first_name` LIKE 'A%';

-- Task 4

DELETE FROM `players` AS `p`
WHERE `p`.`age` >= 45;

-- Task 5

-- DROP DATABASE fsd;

SELECT `p`.`first_name`, `p`.`age`, `p`.`salary` FROM `players` AS `p`
ORDER BY `p`.`salary` DESC;

-- Task 6 

SELECT `p`.`id`,
CONCAT(`p`.`first_name`, ' ', `p`.`last_name`) AS 'full_name',
`p`.`age`,
`p`.`position`,
`p`.`hire_date` FROM players AS `p`
JOIN `skills_data` AS `sd`
ON `p`.`skills_data_id` = `sd`.`id`
WHERE `p`.`age` < 23 AND `p`.`position` = 'A' AND `p`.`hire_date` IS NULL AND `sd`.`strength` > 50
ORDER BY `p`.`salary`, `p`.`age`;

-- Task 7

-- SET sql_mode = 'ONLY_FULL_GROUP_BY';

SELECT `t`.`name` AS 'team_name',
`t`.`established`,
`t`.`fan_base`,
COUNT(`p`.`id`) AS 'count_of_players' FROM `teams` AS `t`
LEFT JOIN `players` AS `p`
ON `t`.`id` = `p`.`team_id`
GROUP BY `t`.`id`
ORDER BY `count_of_players` DESC, `t`.`fan_base` DESC;

-- Variant 2

SELECT `t`.`name` AS 'team_name',
`t`.`established`,
`t`.`fan_base`,
(SELECT COUNT(*) FROM `players` AS `p` WHERE `p`.`team_id` = `t`.`id`) AS 'count_of_players' FROM `teams` AS `t`
ORDER BY `count_of_players` DESC, `t`.`fan_base` DESC;

-- Task 8

SELECT MAX(`sd`.`speed`) AS 'max_speed', `t`.`name` AS 'town_name' FROM `players` AS `p`
RIGHT JOIN `skills_data` AS `sd`
ON `p`.`skills_data_id` = `sd`.`id`
RIGHT JOIN `teams` AS `tm`
ON `p`.`team_id` = `tm`.`id`
JOIN `stadiums` AS `s`
ON `tm`.`stadium_id` = `s`.`id`
JOIN `towns` AS `t`
ON `s`.`town_id` = `t`.`id`
WHERE `tm`.`name` != 'Devify'
GROUP BY `t`.`name`
ORDER BY `max_speed` DESC, `town_name`;

-- Task 9

SELECT `c`.`name`,
COUNT(`p`.`id`) AS 'total_count_of_players',
SUM(`p`.`salary`) AS 'total_sum_of_salaries' FROM `countries` AS `c`
LEFT JOIN `towns` AS `t`
ON `c`.`id` = `t`.`country_id`
LEFT JOIN `stadiums` AS `s`
ON `t`.`id` = `s`.`town_id`
LEFT JOIN `teams` AS `tm`
ON `s`.`id` = `tm`.`stadium_id`
LEFT JOIN `players` AS `p`
ON `tm`.`id` = `p`.`team_id`
GROUP BY `c`.`name`
ORDER BY `total_count_of_players` DESC, `c`.`name`;

-- Task 10

DELIMITER $$
CREATE FUNCTION udf_stadium_players_count(stadium_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN( SELECT COUNT(*) AS 'count' FROM `stadiums` AS `s`
JOIN `teams` AS `tm`
ON `s`.`id` = `tm`.`stadium_id`
JOIN `players` AS `p`
ON `tm`.`id` = `p`.team_id
WHERE `s`.`name` = stadium_name);

END $$
DELIMITER ;

 SELECT udf_stadium_players_count('Jaxworks');

-- Task 11

DELIMITER $$
CREATE PROCEDURE udp_find_playmaker(min_dribble_points INT, team_name VARCHAR(45))
BEGIN

SELECT CONCAT(`p`.`first_name`, ' ', `p`.`last_name`) AS 'full_name',
`p`.`age`,
`p`.`salary`,
`sd`.`dribbling`,
`sd`.`speed`,
`tm`.`name` AS 'team_name'
FROM `players` AS `p`
JOIN `skills_data` AS `sd`
ON `p`.`skills_data_id` = `sd`.`id`
JOIN `teams` AS `tm`
ON `p`.`team_id` = `tm`.`id`
WHERE `sd`.`dribbling` > min_dribble_points AND `tm`.`name` = team_name
AND `sd`.`speed` > (SELECT AVG(`speed`) FROM `skills_data`)
ORDER BY `sd`.`speed` DESC LIMIT 1;

END $$
DELIMITER ;


-- CALL udp_find_playmaker (20, 'Skyble');




