SET NAMES utf8;

ALTER TABLE `hotels` 
ADD COLUMN `noyayesgo` BIT(1) NULL AFTER `resort_id`;

ALTER TABLE `resorts` 
ADD COLUMN `coordinates` VARCHAR(30) NULL AFTER `health_factors`;

ALTER TABLE `resorts` 
ADD COLUMN `noyayesgo` BIT(1) NULL AFTER `coordinates`;
