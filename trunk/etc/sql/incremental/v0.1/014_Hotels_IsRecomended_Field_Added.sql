SET NAMES utf8;

ALTER TABLE `hotels` 
ADD COLUMN `is_recomended` BIT NOT NULL DEFAULT 0 AFTER `coordinates`;

UPDATE `hotels` SET `is_recomended`=1 WHERE `id`='2';
UPDATE `hotels` SET `is_recomended`=1 WHERE `id`='4';
UPDATE `hotels` SET `is_recomended`=1 WHERE `id`='3';
UPDATE `hotels` SET `is_recomended`=1 WHERE `id`='5';
