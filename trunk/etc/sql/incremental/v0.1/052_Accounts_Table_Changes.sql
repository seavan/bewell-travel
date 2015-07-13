SET NAMES utf8;

ALTER TABLE `accounts` 
ADD COLUMN `post` VARCHAR(255) NULL AFTER `role_id`;
