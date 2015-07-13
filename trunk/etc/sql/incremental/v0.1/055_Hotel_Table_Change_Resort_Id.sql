SET NAMES utf8;

ALTER TABLE `hotels` 
ADD COLUMN `resort_id` BIGINT(20) NULL AFTER `treatment_options`;
