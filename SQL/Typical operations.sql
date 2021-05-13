-- Показать сеансы фильмов в определенный дату
SELECT
	`sessions`.`id` AS 'sessions_id',
	DATE_FORMAT( `start`, '%d.%m' ) AS 'date',
	`films`.`title` AS 'title',
	`halls`.`title` AS 'hall',
	`mpaa_ratings`.`title` AS 'mpaa_ratings',
	DATE_FORMAT(`films`.`duration`, '%H:%i') AS 'duration',
	DATE_FORMAT( `start`, '%H:%i' ) AS 'start_film',
	DATE_FORMAT(DATE_ADD(`films`.`duration`, interval (DATE_FORMAT( `start`, '%H:%i' )) HOUR_MINUTE), '%H:%i') AS 'end_film'
FROM
	`sessions`
	JOIN `halls` ON `sessions`.`hall_id` LIKE `halls`.`id`
	JOIN `films` ON `sessions`.`film_id` LIKE `films`.`id`
	JOIN `mpaa_ratings` ON `films`.`raiting_id` LIKE `mpaa_ratings`.`id` WHERE DATE( `start` ) LIKE '2021-05-19';

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

