-- Список сеансов
SELECT * FROM `session_list` WHERE DATE( `start` ) BETWEEN '2021-05-12' AND '2021-05-19';

-- Данные для распечатки билетов
SELECT * FROM `print_ticket` WHERE `id` LIKE 1 LIMIT 1;

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

/* Количество работников по каждой должности */
SELECT
	`positions`.`title` AS `position`,
	IF(`staff`.`id` IS NULL, 0, COUNT( `positions`.`title` )) AS `count`
FROM
	`positions`
	LEFT JOIN `staff` ON `positions`.`id` LIKE `staff`.`position_id` 
	WHERE `staff`.`status_id` LIKE 1
GROUP BY
	`positions`.`title`;