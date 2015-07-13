SET NAMES utf8;

ALTER TABLE `entity_photos` 
CHANGE COLUMN `thumbnail_large` `thumbnail_large` VARCHAR(50) NOT NULL COMMENT 'большое изображение (620x424 px) для отображения главного изображения в галерее' ;
