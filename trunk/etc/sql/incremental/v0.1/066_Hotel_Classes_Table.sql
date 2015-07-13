SET NAMES utf8;

CREATE TABLE `hotel_classes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
PRIMARY KEY (`id`));

INSERT INTO `hotel_classes` (`id`, `title`) VALUES ('1', 'Высокий');
INSERT INTO `hotel_classes` (`id`, `title`) VALUES ('2', 'Средний');
INSERT INTO `hotel_classes` (`id`, `title`) VALUES ('3', 'Средний+');
INSERT INTO `hotel_classes` (`id`, `title`) VALUES ('4', 'Эконом');

ALTER TABLE `hotels` 
ADD COLUMN `class_id` BIGINT NULL AFTER `stars`;
