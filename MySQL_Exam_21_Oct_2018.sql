
DROP SCHEMA IF EXISTS cjms_db;
CREATE SCHEMA cjms_db;
USE cjms_db;


-- Task 0

CREATE TABLE planets(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL
);

CREATE TABLE spaceports(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`planet_id` INT,
CONSTRAINT fk_spaceports_planets
FOREIGN KEY (`planet_id`)
REFERENCES `planets`(`id`)
);

CREATE TABLE spaceships(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`manufacturer` VARCHAR(30) NOT NULL,
`light_speed_rate` INT DEFAULT 0
);

CREATE TABLE colonists(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`ucn` CHAR(10) NOT NULL UNIQUE,
`birth_date` DATE NOT NULL
);

CREATE TABLE journeys(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`journey_start` DATETIME NOT NULL,
`journey_end` DATETIME NOT NULL,
`purpose` ENUM('Medical', 'Technical', 'Educational', 'Military'),
`destination_spaceport_id` INT,
`spaceship_id` INT,
CONSTRAINT fk_journeys_spaceports
FOREIGN KEY (`destination_spaceport_id`)
REFERENCES `spaceports`(`id`),
CONSTRAINT fk_journeys_spaceships
FOREIGN KEY (`spaceship_id`)
REFERENCES `spaceships`(`id`)
);

CREATE TABLE travel_cards(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`card_number` CHAR(10) NOT NULL UNIQUE,
`job_during_journey` ENUM('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook'),
`colonist_id` INT, 
`journey_id` INT, 
CONSTRAINT fk_travel_cards_colonists
FOREIGN KEY (`colonist_id`)
REFERENCES `colonists`(`id`),
CONSTRAINT fk_travel_cards_journeys
FOREIGN KEY (`journey_id`)
REFERENCES `journeys`(`id`)
);

-- Task 1

INSERT INTO `travel_cards`(`card_number`, `job_during_journey`, `colonist_id`, `journey_id`)
SELECT
(CASE
WHEN `birth_date` > '1980-01-01' THEN CONCAT(YEAR(`birth_date`), DAY(`birth_date`), LEFT(`ucn`, 4))
ELSE CONCAT(YEAR(`birth_date`), MONTH(`birth_date`), RIGHT(`ucn`, 4))
END),
(CASE
WHEN `id` % 2 = 0 THEN 'Pilot'
WHEN `id` % 3 = 0 THEN 'Cook'
ELSE 'Engineer'
END),
`id`, -- It's Not Written - You have to found it
LEFT(`ucn`, 1)
FROM `colonists`
WHERE `id` BETWEEN 96 AND 100;

-- Task 2

UPDATE `journeys`
SET `purpose` = (
CASE
WHEN `id` % 2 = 0 THEN 'Medical'
WHEN `id` % 3 = 0 THEN 'Technical'
WHEN `id` % 5 = 0 THEN 'Educational'
WHEN `id` % 7 = 0 THEN 'Military'
ELSE `purpose`
END
);

-- Task 3

DELETE `c` FROM `colonists` AS `c`
LEFT JOIN `travel_cards` AS `tc`
ON `c`.`id` = `tc`.`colonist_id`
WHERE `tc`.`journey_id` IS NULL;

-- Variant 2

DELETE FROM `colonists`
WHERE `id` NOT IN (SELECT `tc`.`colonist_id` FROM `travel_cards` AS `tc`);

-- Task 4

SELECT `card_number`, `job_during_journey` FROM `travel_cards`
ORDER BY `card_number`;

-- Task 5

SELECT`id`, CONCAT(`first_name`, ' ', `last_name`) AS 'full_name', `ucn`
FROM `colonists`
ORDER BY `first_name`, `last_name`, `id`;

-- Task 6

SELECT `id`, `journey_start`, `journey_end` FROM `journeys`
WHERE `purpose` = 'Military'
ORDER BY `journey_start`;

-- Task 7

SELECT `c`.`id`, CONCAT(`c`.`first_name`, ' ', `c`.`last_name`) AS 'full_name' FROM `colonists` AS `c`
LEFT JOIN `travel_cards` AS `tc`
ON `c`.`id` = `tc`.`colonist_id`
WHERE `tc`.`job_during_journey` = 'Pilot'
ORDER BY `c`.`id`;

-- Task 8

SELECT COUNT(`c`.`id`) AS 'count' FROM `colonists` AS `c`
JOIN `travel_cards` AS `tc`
ON `c`.`id` = `tc`.`colonist_id`
JOIN `journeys` AS `j`
ON `j`.`id` = `tc`.`journey_id`
WHERE `j`.`purpose` = 'Technical';

-- Task 9

SELECT `s`.`name` AS 'spaceship_name', `sp`.`name` AS 'spaceport_name' FROM `spaceships` AS `s`
JOIN `journeys` AS `j`
ON `j`.`spaceship_id` = `s`.`id`
JOIN `spaceports` AS `sp`
ON `sp`.`id` = `j`.`destination_spaceport_id`
ORDER BY `s`.`light_speed_rate` DESC LIMIT 1;

-- Task 10

SELECT `s`.`name`, `s`.`manufacturer` FROM `spaceships` AS `s`
JOIN `journeys` AS `j`
ON `j`.`spaceship_id` = `s`.`id`
JOIN `travel_cards` AS `tc`
ON `tc`.`journey_id` = `j`.`id`
JOIN `colonists` AS `c`
ON `c`.`id` = `tc`.`colonist_id`
WHERE `tc`.`job_during_journey` = 'Pilot' AND YEAR('2019-01-01') - YEAR(`c`.`birth_date`) < 30
ORDER BY `s`.`name`;

-- Task 11

SELECT `p`.`name` AS 'planet_name', `sp`.`name` AS 'spaceport_name' FROM `planets` AS `p`
JOIN `spaceports` AS `sp`
ON `p`.`id` = `sp`.`planet_id`
JOIN `journeys` AS `j`
ON `sp`.`id` = `j`.`destination_spaceport_id`
WHERE `j`.`purpose` = 'Educational'
ORDER BY `spaceport_name` DESC;

-- Task 12

SELECT `p`.`name` AS 'planet_name', COUNT(`j`.`id`) AS 'journeys_count' FROM `planets` AS `p`
JOIN `spaceports` AS `sp`
ON `p`.`id` = `sp`.`planet_id`
JOIN `journeys` AS `j`
ON `sp`.`id` = `j`.`destination_spaceport_id`
GROUP BY `p`.`id`
ORDER BY `journeys_count` DESC, `planet_name`;

-- Task 13

SELECT `j`.`id`, `p`.`name` AS 'planet_name', `sp`.`name` AS 'spaceport_name', `j`.`purpose` AS 'journey_purpose'
FROM `planets` AS `p`
JOIN `spaceports` AS `sp`
ON `p`.`id` = `sp`.`planet_id`
JOIN `journeys` AS `j`
ON `sp`.`id` = `j`.`destination_spaceport_id`
ORDER BY DATEDIFF(`j`.`journey_start` ,`j`.`journey_end`) DESC LIMIT 1;

-- Task 14

SELECT `tc`.`job_during_journey` FROM `travel_cards` AS `tc`
WHERE `tc`.`journey_id` =  (
SELECT `j`.`id`
FROM `journeys` AS `j`
ORDER BY DATEDIFF(`j`.`journey_end`, `j`.`journey_start`) DESC
LIMIT 1
)
GROUP BY `tc`.`job_during_journey`
ORDER BY COUNT(`tc`.`job_during_journey`) LIMIT 1;

-- Task 15

DELIMITER $$
CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR (30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN(SELECT COUNT(`c`.`id`) FROM `planets` AS `p`
JOIN `spaceports` AS `s`
ON `p`.`id` = `s`.`planet_id`
JOIN `journeys` AS `j`
ON `s`.`id` = `j`.`destination_spaceport_id`
JOIN `travel_cards` AS `tc`
ON `j`.`id` = `tc`.`journey_id`
JOIN `colonists` AS `c`
ON `c`.`id` = `tc`.`colonist_id`
WHERE `p`.`name` = planet_name);

END $$
DELIMITER ;


SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
FROM planets AS p
WHERE p.name = 'Otroyphus';

-- Task 16

DELIMITER $$
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
  BEGIN
    IF (SELECT count(`s`.`name`) FROM `spaceships` AS `s` WHERE `s`.`name` = spaceship_name > 0) THEN
      UPDATE `spaceships` AS `s`
        SET `s`.`light_speed_rate` = `s`.`light_speed_rate` + light_speed_rate_increse
        WHERE `s`.`name` = spaceship_name;
    ELSE
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
      ROLLBACK;
    END IF;
  END $$
DELIMITER ;

CALL udp_modify_spaceship_light_speed_rate ('Na Pesho koraba', 1914);
SELECT name, light_speed_rate FROM spacheships WHERE name = 'Na Pesho koraba';

CALL udp_modify_spaceship_light_speed_rate ('USS Templar', 5);
SELECT name, light_speed_rate FROM spaceships WHERE name = 'USS Templar'



















