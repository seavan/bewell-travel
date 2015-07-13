SET NAMES utf8;

CREATE TABLE `seo_metadata` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `entity_id` BIGINT NULL,
  `proto_name` VARCHAR(255) NULL,
  `url` VARCHAR(255) NULL,
  `title` VARCHAR(255) NULL,
  `keywords` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
 PRIMARY KEY (`id`));
