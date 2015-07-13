SET NAMES utf8;

UPDATE `hotels` SET `resort_id`='1' WHERE `id`='1';
UPDATE `hotels` SET `resort_id`='2' WHERE `id`='2';
UPDATE `hotels` SET `resort_id`='2' WHERE `id`='3';
UPDATE `hotels` SET `resort_id`='1' WHERE `id`='4';
UPDATE `hotels` SET `resort_id`='2' WHERE `id`='5';

ALTER TABLE `hotels` DROP COLUMN `territory_id`;

