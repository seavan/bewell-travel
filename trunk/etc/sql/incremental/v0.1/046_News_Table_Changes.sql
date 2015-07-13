SET NAMES utf8;

ALTER TABLE `news` 
ADD COLUMN `preview` VARCHAR(50) NULL AFTER `is_published`;