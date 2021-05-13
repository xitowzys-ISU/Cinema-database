/* Список всех сотрудников */
CREATE VIEW `staff_list` AS SELECT
	`staff`.`id`,
    `staff`.`surname`,
    `staff`.`name`,
    `staff`.`middle_name`,
    DATE_FORMAT( `staff`.`date_of_birth`, '%d.%m.%Y' ) AS 'date',
    `staff`.`email`,
    `staff`.`residential_address`,
    `staff`.`phone`,
    `staff`.`salary`,
    `positions`.`title` AS 'position',
	`staff_statuses`.`title` AS 'status'
FROM `staff`
    JOIN `positions` ON `staff`.`position_id` LIKE `positions`.`id`
    JOIN `staff_statuses` ON `staff`.`status_id` LIKE `staff_statuses`.`id`
ORDER BY `id`;

/* Список сеансов */
CREATE VIEW `session_list` AS SELECT
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
	JOIN `mpaa_ratings` ON `films`.`raiting_id` LIKE `mpaa_ratings`.`id`;

/* Билеты в кино для распечатки */
CREATE VIEW `print_ticket` AS SELECT
	`tickets`.`id`,
	`tickets`.`operation_number`,
	`films`.`title` AS 'title',
	`formats`.`title` AS 'format',
	DATE_FORMAT( `sessions`.`start`, '%d.%m.%Y' ) AS 'date',
	DATE_FORMAT( `sessions`.`start`, '%H:%i' ) AS 'start_film',
	`halls`.`title` AS 'hall',
	`tickets`.`row`,
	`tickets`.`seat`,
	( `price_group_of_seats`.`price` + `additional_session_price`.`price_increase` ) AS 'price',
	`mpaa_ratings`.`title` AS 'age_limit'
FROM
	`tickets`
	JOIN `sessions` ON `tickets`.`session_id` LIKE `sessions`.`id`
	JOIN `places` ON ( `sessions`.`hall_id` LIKE `places`.`hall_id` AND `tickets`.`row` LIKE `places`.`row` AND `tickets`.`seat` LIKE `places`.`seat` )
	JOIN `price_group_of_seats` ON `places`.`price_group_of_seat_id` LIKE `price_group_of_seats`.`id`
	JOIN `additional_session_price` ON ( `sessions`.`id` LIKE `additional_session_price`.`session_id` AND `places`.`price_group_of_seat_id` LIKE `additional_session_price`.`price_group_of_seat_id` )
	JOIN `films` ON `sessions`.`film_id` LIKE `films`.`id`
	JOIN `halls` ON `sessions`.`hall_id` LIKE `halls`.`id`
	JOIN `hall_formats` ON `sessions`.`hall_id` LIKE `hall_formats`.`hall_id`
	JOIN `formats` ON `hall_formats`.`format_id` LIKE `formats`.`id`
	JOIN `mpaa_ratings` ON `films`.`raiting_id` LIKE `mpaa_ratings`.`id`;