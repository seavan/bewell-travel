SET NAMES utf8;

ALTER TABLE `territories` 
ADD COLUMN `map_key` VARCHAR(45) NULL AFTER `in_search`;

UPDATE `territories` SET `map_key`='eurasia' WHERE `id`=1;
UPDATE `territories` SET `map_key`='eurasia' WHERE `id`=2;
UPDATE `territories` SET `map_key`='australia' WHERE `id`=3;
UPDATE `territories` SET `map_key`='eurasia' WHERE `id`=4;
UPDATE `territories` SET `map_key`='africa' WHERE `id`=5;
UPDATE `territories` SET `map_key`='north-america' WHERE `id`=6;
UPDATE `territories` SET `map_key`='south-america' WHERE `id`=7;
