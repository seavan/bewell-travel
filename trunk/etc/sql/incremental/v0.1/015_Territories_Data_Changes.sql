SET NAMES utf8;

ALTER TABLE `territories` 
ADD COLUMN `item_order` BIGINT NOT NULL DEFAULT 1 AFTER `nested_category_id`,
ADD COLUMN `in_search` BIT NOT NULL DEFAULT 0 AFTER `item_order`;

UPDATE `territories` SET `parent_id`='1' WHERE `id`='8';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='9';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='10';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='11';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='12';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='13';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='14';
UPDATE `territories` SET `parent_id`='1' WHERE `id`='15';
UPDATE `territories` SET `parent_id`='8' WHERE `id`='16';
UPDATE `territories` SET `parent_id`='8' WHERE `id`='17';
UPDATE `territories` SET `parent_id`='9' WHERE `id`='18';
UPDATE `territories` SET `parent_id`='9' WHERE `id`='19';

UPDATE `territories` SET `in_search`=1 WHERE `id`='1';
UPDATE `territories` SET `in_search`=1 WHERE `id`='2';
UPDATE `territories` SET `in_search`=1 WHERE `id`='3';
UPDATE `territories` SET `in_search`=1 WHERE `id`='4';
UPDATE `territories` SET `in_search`=1 WHERE `id`='5';
UPDATE `territories` SET `in_search`=1 WHERE `id`='6';
UPDATE `territories` SET `in_search`=1 WHERE `id`='7';
UPDATE `territories` SET `in_search`=1 WHERE `id`='8';
UPDATE `territories` SET `in_search`=1 WHERE `id`='10';
UPDATE `territories` SET `in_search`=1 WHERE `id`='11';
UPDATE `territories` SET `in_search`=1 WHERE `id`='15';
UPDATE `territories` SET `in_search`=1 WHERE `id`='20';
UPDATE `territories` SET `in_search`=1 WHERE `id`='21';
UPDATE `territories` SET `in_search`=1 WHERE `id`='22';
UPDATE `territories` SET `in_search`=1 WHERE `id`='23';
UPDATE `territories` SET `in_search`=1 WHERE `id`='24';
UPDATE `territories` SET `in_search`=1 WHERE `id`='25';
UPDATE `territories` SET `in_search`=1 WHERE `id`='26';
UPDATE `territories` SET `in_search`=1 WHERE `id`='27';
UPDATE `territories` SET `in_search`=1 WHERE `id`='28';
UPDATE `territories` SET `in_search`=1 WHERE `id`='29';
UPDATE `territories` SET `in_search`=1 WHERE `id`='30';
UPDATE `territories` SET `in_search`=1 WHERE `id`='31';
UPDATE `territories` SET `in_search`=1 WHERE `id`='32';
UPDATE `territories` SET `in_search`=1 WHERE `id`='33';
UPDATE `territories` SET `in_search`=1 WHERE `id`='34';
UPDATE `territories` SET `in_search`=1 WHERE `id`='35';
UPDATE `territories` SET `in_search`=1 WHERE `id`='36';
UPDATE `territories` SET `in_search`=1 WHERE `id`='37';
UPDATE `territories` SET `in_search`=1 WHERE `id`='38';
UPDATE `territories` SET `in_search`=1 WHERE `id`='39';
UPDATE `territories` SET `in_search`=1 WHERE `id`='40';
UPDATE `territories` SET `in_search`=1 WHERE `id`='41';
