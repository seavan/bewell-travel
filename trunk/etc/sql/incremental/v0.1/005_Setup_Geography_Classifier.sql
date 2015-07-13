set names utf8;

CREATE  TABLE `territory_categories` (
  `id` BIGINT NOT NULL ,
  `title` VARCHAR(128) NULL ,
  PRIMARY KEY (`id`) )
COMMENT = 'Описание категорий разделения территорий по географическому признаку';

ALTER TABLE `territories` ADD COLUMN `parent_id` BIGINT NULL  AFTER `title` , ADD COLUMN `category_id` BIGINT NULL  AFTER `parent_id` , ADD COLUMN `nested_category_id` BIGINT NULL COMMENT 'Категория вложенных территорий'  AFTER `category_id` ;