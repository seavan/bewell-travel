SET NAMES utf8;

ALTER TABLE `hotels` 
CHANGE COLUMN `is_recomended` `is_recomended_main_page` BIT(1) NOT NULL DEFAULT b'0';

ALTER TABLE `hotels` 
ADD COLUMN `is_recomended` BIT NULL DEFAULT 0 AFTER `is_recomended_main_page`;

ALTER TABLE `resorts` 
ADD COLUMN `is_recomended` BIT NULL DEFAULT 0 AFTER `health_factors`;
