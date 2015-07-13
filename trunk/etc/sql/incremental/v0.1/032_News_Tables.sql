SET NAMES utf8;

CREATE TABLE `news_categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `news` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `category_id` BIGINT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `announce` TEXT NULL,
  `text` TEXT NULL,
  `publish_date` DATETIME NULL,
  `is_published` BIT NOT NULL DEFAULT 0,
PRIMARY KEY (`id`));