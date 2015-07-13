SET NAMES UTF8;
ALTER TABLE `bewell`.`hotels` 
CHANGE COLUMN `deseases` `deseases` VARCHAR(1024) NULL DEFAULT NULL ,
CHANGE COLUMN `treatment_options` `treatment_options` VARCHAR(1024) NULL DEFAULT NULL ,
CHANGE COLUMN `properties` `properties` VARCHAR(1024) NULL DEFAULT NULL ;
