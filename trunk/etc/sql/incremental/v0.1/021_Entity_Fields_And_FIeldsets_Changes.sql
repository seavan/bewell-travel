SET NAMES utf8;

ALTER TABLE `entity_fields` 
CHANGE COLUMN `fieldset_id` `fieldsets` VARCHAR(255) NOT NULL COMMENT 'ссылка на fieldset`ы',
ADD COLUMN `announce_order` INT NOT NULL DEFAULT 1 AFTER `order_number`,
ADD COLUMN `show_in_announce` BIT NOT NULL DEFAULT 0 AFTER `announce_order`,
ADD COLUMN `controller` VARCHAR(255) NULL AFTER `show_in_announce`,
ADD COLUMN `action` VARCHAR(255) NULL AFTER `controller`;

ALTER TABLE `fieldsets` 
ADD COLUMN `show_in_anounce` BIT NOT NULL DEFAULT 0 AFTER `show_map`;

