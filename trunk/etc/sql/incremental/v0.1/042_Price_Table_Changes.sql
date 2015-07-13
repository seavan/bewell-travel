SET NAMES utf8;

ALTER TABLE `hotel_prices` 
CHANGE COLUMN `hotel_id` `entity_id` BIGINT(20) NOT NULL ,
ADD COLUMN `entity_type` INT NULL AFTER `entity_id`, RENAME TO `prices`;

UPDATE `prices` SET `entity_type`=0 WHERE `id`=1;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=2;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=3;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=4;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=5;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=6;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=7;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=8;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=9;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=10;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=11;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=12;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=13;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=14;
UPDATE `prices` SET `entity_type`=0 WHERE `id`=15;

UPDATE `entity_fields` SET `action`='hotelprice' WHERE `id`=39;