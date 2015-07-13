SET NAMES utf8;

ALTER TABLE `hotels` 
ADD COLUMN `is_published` BIT NOT NULL DEFAULT 0 AFTER `noyayesgo`;

ALTER TABLE `resorts` 
ADD COLUMN `is_published` BIT NOT NULL DEFAULT 0 AFTER `noyayesgo`;

UPDATE `hotels` SET `is_published`=1 WHERE `id` > 0;
UPDATE `resorts` SET `is_published`=1 WHERE `id` > 0;


