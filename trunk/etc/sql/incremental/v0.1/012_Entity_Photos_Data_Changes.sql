SET NAMES utf8;

ALTER TABLE `entity_photos` 
CHANGE COLUMN `thumbnail_large` `thumbnail_large` VARCHAR(45) NOT NULL COMMENT 'большое изображение (620x424 px) для отображения главного изображения в галерее' ;

UPDATE `entity_photos` SET `guid`='hotel1_1', `original`='hotel1_1.original.jpg', `thumbnail_large`='hotel1_1.large.jpg', `thumbnail_mid`='hotel1_1.mid.jpg', `thumbnail_small`='hotel1_1.small.jpg' WHERE `id`='1';
UPDATE `entity_photos` SET `guid`='hotel1_2', `original`='hotel1_2.original.jpg', `thumbnail_large`='hotel1_2.large.jpg', `thumbnail_mid`='hotel1_2.mid.jpg', `thumbnail_small`='hotel1_2.small.jpg' WHERE `id`='2';
UPDATE `entity_photos` SET `guid`='hotel1_3', `original`='hotel1_3.original.jpg', `thumbnail_large`='hotel1_3.large.jpg', `thumbnail_mid`='hotel1_3.mid.jpg', `thumbnail_small`='hotel1_3.small.jpg' WHERE `id`='3';
UPDATE `entity_photos` SET `guid`='hotel1_4', `original`='hotel1_4.original.jpg', `thumbnail_large`='hotel1_4.large.jpg', `thumbnail_mid`='hotel1_4.mid.jpg', `thumbnail_small`='hotel1_4.small.jpg' WHERE `id`='4';
UPDATE `entity_photos` SET `guid`='hotel1_5', `original`='hotel1_5.original.jpg', `thumbnail_large`='hotel1_5.large.jpg', `thumbnail_mid`='hotel1_5.mid.jpg', `thumbnail_small`='hotel1_5.small.jpg' WHERE `id`='5';
UPDATE `entity_photos` SET `guid`='hotel1_6', `original`='hotel1_6.original.jpg', `thumbnail_large`='hotel1_6.large.jpg', `thumbnail_mid`='hotel1_6.mid.jpg', `thumbnail_small`='hotel1_6.small.jpg' WHERE `id`='6';
UPDATE `entity_photos` SET `guid`='hotel2_1', `original`='hotel2_1.original.jpg', `thumbnail_large`='hotel2_1.large.jpg', `thumbnail_mid`='hotel2_1.mid.jpg', `thumbnail_small`='hotel2_1.small.jpg' WHERE `id`='7';
UPDATE `entity_photos` SET `guid`='hotel2_2', `original`='hotel2_2.original.jpg', `thumbnail_large`='hotel2_2.large.jpg', `thumbnail_mid`='hotel2_2.mid.jpg', `thumbnail_small`='hotel2_2.small.jpg' WHERE `id`='8';
UPDATE `entity_photos` SET `guid`='hotel2_3', `original`='hotel2_3.original.jpg', `thumbnail_large`='hotel2_3.large.jpg', `thumbnail_mid`='hotel2_3.mid.jpg', `thumbnail_small`='hotel2_3.small.jpg' WHERE `id`='9';
UPDATE `entity_photos` SET `guid`='hotel2_4', `original`='hotel3_4.original.jpg', `thumbnail_large`='hotel2_4.large.jpg', `thumbnail_mid`='hotel2_4.mid.jpg', `thumbnail_small`='hotel2_4.small.jpg' WHERE `id`='13';
UPDATE `entity_photos` SET `guid`='hotel2_5', `original`='hotel2_5.original.jpg', `thumbnail_large`='hotel2_5.large.jpg', `thumbnail_mid`='hotel2_5.mid.jpg', `thumbnail_small`='hotel2_5.small.jpg' WHERE `id`='10';
UPDATE `entity_photos` SET `guid`='hotel2_6', `original`='hotel2_6.original.jpg', `thumbnail_large`='hotel2_6.large.jpg', `thumbnail_mid`='hotel2_6.mid.jpg', `thumbnail_small`='hotel2_6.small.jpg' WHERE `id`='11';
UPDATE `entity_photos` SET `guid`='hotel3_1', `original`='hotel2_1.original.jpg', `thumbnail_large`='hotel2_1.large.jpg', `thumbnail_mid`='hotel2_1.mid.jpg', `thumbnail_small`='hotel2_1.small.jpg' WHERE `id`='12';
UPDATE `entity_photos` SET `guid`='hotel3_2', `original`='hotel3_2.original.jpg', `thumbnail_large`='hotel3_2.large.jpg', `thumbnail_mid`='hotel3_2.mid.jpg', `thumbnail_small`='hotel3_2.small.jpg' WHERE `id`='14';
UPDATE `entity_photos` SET `guid`='hotel3_3', `original`='hotel3_3.original.jpg', `thumbnail_large`='hotel3_3.large.jpg', `thumbnail_mid`='hotel3_3.mid.jpg', `thumbnail_small`='hotel3_3.small.jpg' WHERE `id`='15';
UPDATE `entity_photos` SET `guid`='hotel3_4', `original`='hotel3_4.original.jpg', `thumbnail_large`='hotel3_4.large.jpg', `thumbnail_mid`='hotel3_4.mid.jpg', `thumbnail_small`='hotel3_4.small.jpg' WHERE `id`='16';
UPDATE `entity_photos` SET `guid`='hotel3_5', `original`='hotel3_5.original.jpg', `thumbnail_large`='hotel3_5.large.jpg', `thumbnail_mid`='hotel3_5.mid.jpg', `thumbnail_small`='hotel3_5.small.jpg' WHERE `id`='17';
UPDATE `entity_photos` SET `guid`='hotel3_6', `original`='hotel3_6.original.jpg', `thumbnail_large`='hotel3_6.large.jpg', `thumbnail_mid`='hotel3_6.mid.jpg', `thumbnail_small`='hotel3_6.small.jpg' WHERE `id`='18';
UPDATE `entity_photos` SET `guid`='hotel4_1', `original`='hotel4_1.original.jpg', `thumbnail_large`='hotel4_1.large.jpg', `thumbnail_mid`='hotel4_1.mid.jpg', `thumbnail_small`='hotel4_1.small.jpg' WHERE `id`='19';
UPDATE `entity_photos` SET `guid`='hotel4_2', `original`='hotel4_2.original.jpg', `thumbnail_large`='hotel4_2.large.jpg', `thumbnail_mid`='hotel4_2.mid.jpg', `thumbnail_small`='hotel4_2.small.jpg' WHERE `id`='20';
UPDATE `entity_photos` SET `guid`='hotel4_3', `original`='hotel4_3.original.jpg', `thumbnail_large`='hotel4_3.large.jpg', `thumbnail_mid`='hotel4_3.mid.jpg', `thumbnail_small`='hotel4_3.small.jpg' WHERE `id`='21';
UPDATE `entity_photos` SET `guid`='hotel4_4', `original`='hotel4_4.original.jpg', `thumbnail_large`='hotel4_4.large.jpg', `thumbnail_mid`='hotel4_4.mid.jpg', `thumbnail_small`='hotel4_4.small.jpg' WHERE `id`='22';
UPDATE `entity_photos` SET `guid`='hotel4_5', `original`='hotel4_5.original.jpg', `thumbnail_large`='hotel4_5.large.jpg', `thumbnail_mid`='hotel4_5.mid.jpg', `thumbnail_small`='hotel4_5.small.jpg' WHERE `id`='23';
UPDATE `entity_photos` SET `guid`='hotel4_6', `original`='hotel4_6.original.jpg', `thumbnail_large`='hotel4_6.large.jpg', `thumbnail_mid`='hotel4_6.mid.jpg', `thumbnail_small`='hotel4_6.small.jpg' WHERE `id`='24';
UPDATE `entity_photos` SET `guid`='hotel5_1', `original`='hotel5_1.original.jpg', `thumbnail_large`='hotel5_1.large.jpg', `thumbnail_mid`='hotel5_1.mid.jpg', `thumbnail_small`='hotel5_1.small.jpg' WHERE `id`='25';
UPDATE `entity_photos` SET `guid`='hotel5_2', `original`='hotel5_2.original.jpg', `thumbnail_large`='hotel5_2.large.jpg', `thumbnail_mid`='hotel5_2.mid.jpg', `thumbnail_small`='hotel5_2.small.jpg' WHERE `id`='26';
UPDATE `entity_photos` SET `guid`='hotel5_3', `original`='hotel5_3.original.jpg', `thumbnail_large`='hotel5_3.large.jpg', `thumbnail_mid`='hotel5_3.mid.jpg', `thumbnail_small`='hotel5_3.small.jpg' WHERE `id`='27';
UPDATE `entity_photos` SET `guid`='hotel5_4', `original`='hotel5_4.original.jpg', `thumbnail_large`='hotel5_4.large.jpg', `thumbnail_mid`='hotel5_4.mid.jpg', `thumbnail_small`='hotel5_4.small.jpg' WHERE `id`='28';
UPDATE `entity_photos` SET `guid`='hotel5_5', `original`='hotel5_5.original.jpg', `thumbnail_large`='hotel5_5.large.jpg', `thumbnail_mid`='hotel5_5.mid.jpg', `thumbnail_small`='hotel5_5.small.jpg' WHERE `id`='29';
UPDATE `entity_photos` SET `guid`='hotel5_6', `original`='hotel5_6.original.jpg', `thumbnail_large`='hotel5_6.large.jpg', `thumbnail_mid`='hotel5_6.mid.jpg', `thumbnail_small`='hotel5_6.small.jpg' WHERE `id`='30';
