SET NAMES utf8;

CREATE TABLE `hotel_prices` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `hotel_id` BIGINT NOT NULL,
  `month` TINYINT UNSIGNED NOT NULL,
  `price` FLOAT NULL,
  `comment` VARCHAR(255) NULL,
PRIMARY KEY (`id`));

INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('1', '1', 16500, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('1', '2', 13100, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('1', '12', 11800, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('2', '1', 27300, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('2', '2', 28500, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('2', '12', 22400, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('3', '1', 19500, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('3', '2', 23100, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('3', '12', 18950, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('4', '1', 14600, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('4', '2', 16500, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('4', '12', 13670, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('5', '1', 27450, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('5', '2', 25700, 'стоимость проживания с лечением в двухместном стандартном номере');
INSERT INTO `hotel_prices` (`hotel_id`, `month`, `price`, `comment`) VALUES ('5', '12', 24650, 'стоимость проживания с лечением в двухместном стандартном номере');

INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`, `controller`, `action`) VALUES (39, 'Цена', '1,19', 2, 1, 'fields', 'price');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('1', '39', '1');

