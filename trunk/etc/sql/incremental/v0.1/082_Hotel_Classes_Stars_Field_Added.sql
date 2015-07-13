SET NAMES utf8;

ALTER TABLE `hotel_classes` 
ADD COLUMN `stars` INT NULL AFTER `title`;

UPDATE `hotel_classes` SET `stars`='5' WHERE `id`='1';
UPDATE `hotel_classes` SET `stars`='4' WHERE `id`='3';
UPDATE `hotel_classes` SET `stars`='3' WHERE `id`='2';
UPDATE `hotel_classes` SET `stars`='2' WHERE `id`='4';

