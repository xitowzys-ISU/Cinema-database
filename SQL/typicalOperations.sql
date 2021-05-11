-- Жанры фильма
SELECT 
	`genres`.`title` AS 'genre'
FROM `films` 
	JOIN `film_genres` ON `films`.`id` LIKE `film_genres`.`film_id`
	JOIN `genres` ON `genres`.`id` LIKE `film_genres`.`genre_id`
	WHERE `films`.`id` LIKE 1;

-- Список работников
SELECT
    `staff`.`surname`,
    `staff`.`name`,
    `staff`.`middle_name`,
    `staff`.`date_of_birth`,
    `staff`.`email`,
    `staff`.`residential_address`,
    `staff`.`phone`,
    `staff`.`salary`,
    `positions`.`title` AS 'position',
	`staff_statuses`.`title` AS 'status'
FROM `staff`
    JOIN `positions` ON `staff`.`position_id` LIKE `positions`.`id`
    JOIN `staff_statuses` ON `staff`.`status_id` LIKE `staff_statuses`.`id`
ORDER BY `position` LIMIT 50;

