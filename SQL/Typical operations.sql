-- Показать все фильмы, которые будут показывать в определенный дату
SELECT
	`films`.`title`,
	`films`.`duration`,
	`mpaa_ratings`.`title` AS `mpaa_rating`
FROM
	`sessions`
	JOIN `films` ON `sessions`.`film_id` LIKE `films`.`id`
	JOIN `mpaa_ratings` ON `films`.`raiting_id` LIKE `mpaa_ratings`.`id`
WHERE
	DATE( `start` ) LIKE '2021-05-20'
GROUP BY `films`.`title`;

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

