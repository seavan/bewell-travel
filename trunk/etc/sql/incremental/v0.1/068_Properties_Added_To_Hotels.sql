SET NAMES utf8;

ALTER TABLE `bewell`.`hotels` 
ADD COLUMN `properties` VARCHAR(255) NULL AFTER `treatment_options`;

UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=1) WHERE `id`='1';
UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=2) WHERE `id`='2';
UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=3) WHERE `id`='3';
UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=4) WHERE `id`='4';
UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=5) WHERE `id`='5';
UPDATE `hotels` SET `properties`=(SELECT GROUP_CONCAT(property_id) FROM hotel_properties where hotel_id=7) WHERE `id`='7';

DROP TABLE `hotel_properties`;
