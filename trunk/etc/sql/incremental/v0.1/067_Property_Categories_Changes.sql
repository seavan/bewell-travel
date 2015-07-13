SET NAMES utf8;

ALTER TABLE `property_categories` 
ADD COLUMN `show_in_search` BIT NULL DEFAULT 0 AFTER `title`;

UPDATE `property_categories` SET `show_in_search`=1 WHERE `id`='8';
UPDATE `property_categories` SET `show_in_search`=1 WHERE `id`='5';
UPDATE `property_categories` SET `show_in_search`=1 WHERE `id`='15';
UPDATE `property_categories` SET `show_in_search`=1 WHERE `id`='17';
UPDATE `property_categories` SET `show_in_search`=1 WHERE `id`='11';
