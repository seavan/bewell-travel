SET NAMES utf8;

ALTER TABLE `hotels` 
ADD COLUMN `deseases` VARCHAR(255) NULL AFTER `is_recomended`,
ADD COLUMN `treatment_options` VARCHAR(255) NULL AFTER `deseases`;

ALTER TABLE `resorts` 
ADD COLUMN `cure_profiles` VARCHAR(255) NULL AFTER `territory_id`,
ADD COLUMN `health_factors` VARCHAR(255) NULL AFTER `cure_profiles`;
