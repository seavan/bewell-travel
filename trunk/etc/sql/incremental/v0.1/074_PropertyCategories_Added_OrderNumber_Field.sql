SET NAMES utf8;

ALTER TABLE `property_categories` 
ADD COLUMN `order_number` BIGINT NULL DEFAULT 1 AFTER `show_in_search`;
