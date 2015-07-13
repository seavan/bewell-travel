set names utf8;

ALTER TABLE `cure_profiles` 
ADD COLUMN `item_order` INT NOT NULL DEFAULT 0 AFTER `css_class`;