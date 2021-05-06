CREATE TABLE `deliveries`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int(0) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `film_formats`  (
  `film_id` int(0) UNSIGNED NOT NULL,
  `format_id` int(0) UNSIGNED NOT NULL
);

CREATE TABLE `film_genres`  (
  `film_id` int(0) UNSIGNED NOT NULL,
  `genre_id` int(0) UNSIGNED NOT NULL
);

CREATE TABLE `films`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `duration` time(0) NOT NULL,
  `raiting_id` int(0) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);

CREATE TABLE `films_period`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` int(0) UNSIGNED NOT NULL,
  `start_of_rental` date NOT NULL,
  `end_of_rental` date NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `formats`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `genres`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `hall_types`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `halls`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` tinyint(0) UNSIGNED NOT NULL,
  `rows` smallint(0) UNSIGNED NOT NULL,
  `seats` smallint(0) UNSIGNED NOT NULL,
  `format_id` int(0) UNSIGNED NOT NULL,
  `type_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `mpaa_ratings`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `payment_types`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `places`  (
  `hall_id` int(0) UNSIGNED NOT NULL,
  `price_group_of_seat_id` int(0) UNSIGNED NOT NULL,
  `row` smallint(0) UNSIGNED NOT NULL,
  `seat` smallint(0) UNSIGNED NOT NULL
);

CREATE TABLE `positions`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `price_group_of_seats`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(10, 2) UNSIGNED NOT NULL,
  `hall_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `products`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NULL,
  `availability` enum("yes", "no") NOT NULL,
  `price` decimal(10, 2) UNSIGNED NOT NULL,
  `unit_of_measurement` enum("kg", "piece") NOT NULL,
  `quantity` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `delivery_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `purchases`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(0) UNSIGNED NOT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `quantity` int(0) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sessions`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hall_id` int(0) UNSIGNED NOT NULL,
  `film_id` int(0) UNSIGNED NOT NULL,
  `time` time(0) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `staff`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `surname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NULL,
  `residential_address` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `position_id` int(0) UNSIGNED NOT NULL,
  `salary` decimal(10, 2) UNSIGNED NOT NULL,
  `status_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `staff_statuses`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `suppliers`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tickets`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_id` int(0) UNSIGNED NOT NULL,
  `employee_id` int(0) UNSIGNED NULL,
  `payment_type_id` int(0) UNSIGNED NOT NULL,
  `data` datetime(0) NOT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `deliveries` ADD CONSTRAINT `fk_deliveries_suppliers_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `film_formats` ADD CONSTRAINT `fk_film_formats_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `film_formats` ADD CONSTRAINT `fk_film_formats_formats_format_id` FOREIGN KEY (`format_id`) REFERENCES `formats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `film_genres` ADD CONSTRAINT `fk_film_genres_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `film_genres` ADD CONSTRAINT `fk_film_genres_genres_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `films` ADD CONSTRAINT `fk_films_mpaa_raitings_raiting_id` FOREIGN KEY (`raiting_id`) REFERENCES `mpaa_ratings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `films_period` ADD CONSTRAINT `fk_films_period_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `halls` ADD CONSTRAINT `fk_halls_formats_format_id` FOREIGN KEY (`format_id`) REFERENCES `formats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `halls` ADD CONSTRAINT `fk_halls_hall_types_type_id` FOREIGN KEY (`type_id`) REFERENCES `hall_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `places` ADD CONSTRAINT `fk_places_halls_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `places` ADD CONSTRAINT `fk_places_price_group_of_seats_price_group_of_seat_id` FOREIGN KEY (`price_group_of_seat_id`) REFERENCES `price_group_of_seats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `price_group_of_seats` ADD CONSTRAINT `fk_price_group_of_seats_halls_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `fk_products_deliveries_delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `purchases` ADD CONSTRAINT `fk_purchases_staff_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `purchases` ADD CONSTRAINT `fk_purchases_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sessions` ADD CONSTRAINT `fk_sessions_halls_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sessions` ADD CONSTRAINT `fk_sessions_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `staff` ADD CONSTRAINT `fk_staff_positions_position_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `staff` ADD CONSTRAINT `fk_staff_staff_statuses_status_id` FOREIGN KEY (`status_id`) REFERENCES `staff_statuses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `tickets` ADD CONSTRAINT `fk_tickets_sessions_session_id` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `tickets` ADD CONSTRAINT `fk_tickets_staff_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `tickets` ADD CONSTRAINT `fk_tickets_payment_types_payment_type_id` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

