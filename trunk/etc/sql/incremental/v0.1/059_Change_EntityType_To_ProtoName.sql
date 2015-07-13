SET NAMES utf8;

ALTER TABLE `fieldsets` 
CHANGE COLUMN `entity_type` `proto_name` VARCHAR(255) NOT NULL;

ALTER TABLE `comments` 
CHANGE COLUMN `entity_type` `proto_name` VARCHAR(255) NOT NULL;

ALTER TABLE `entity_photos` 
CHANGE COLUMN `entity_type` `proto_name` VARCHAR(255) NOT NULL;

ALTER TABLE `field_values` 
CHANGE COLUMN `entity_type` `proto_name` VARCHAR(255) NOT NULL;

ALTER TABLE `prices` 
CHANGE COLUMN `entity_type` `proto_name` VARCHAR(255) NOT NULL;

SET SQL_SAFE_UPDATES=0;

UPDATE `fieldsets` SET `proto_name`='hotels' WHERE `proto_name`='0';
UPDATE `fieldsets` SET `proto_name`='resorts' WHERE `proto_name`='1';
UPDATE `fieldsets` SET `proto_name`='countries' WHERE `proto_name`='2';
UPDATE `fieldsets` SET `proto_name`='regions' WHERE `proto_name`='3';
UPDATE `fieldsets` SET `proto_name`='resort_zones' WHERE `proto_name`='4';
UPDATE `fieldsets` SET `proto_name`='health_factors' WHERE `proto_name`='5';
UPDATE `fieldsets` SET `proto_name`='treatment_options' WHERE `proto_name`='6';
UPDATE `fieldsets` SET `proto_name`='cure_profiles' WHERE `proto_name`='7';
UPDATE `fieldsets` SET `proto_name`='deseases' WHERE `proto_name`='8';

UPDATE `comments` SET `proto_name`='hotels' WHERE `proto_name`='0';
UPDATE `comments` SET `proto_name`='resorts' WHERE `proto_name`='1';
UPDATE `comments` SET `proto_name`='countries' WHERE `proto_name`='2';
UPDATE `comments` SET `proto_name`='regions' WHERE `proto_name`='3';
UPDATE `comments` SET `proto_name`='resort_zones' WHERE `proto_name`='4';
UPDATE `comments` SET `proto_name`='health_factors' WHERE `proto_name`='5';
UPDATE `comments` SET `proto_name`='treatment_options' WHERE `proto_name`='6';
UPDATE `comments` SET `proto_name`='cure_profiles' WHERE `proto_name`='7';
UPDATE `comments` SET `proto_name`='deseases' WHERE `proto_name`='8';

UPDATE `entity_photos` SET `proto_name`='hotels' WHERE `proto_name`='0';
UPDATE `entity_photos` SET `proto_name`='resorts' WHERE `proto_name`='1';
UPDATE `entity_photos` SET `proto_name`='countries' WHERE `proto_name`='2';
UPDATE `entity_photos` SET `proto_name`='regions' WHERE `proto_name`='3';
UPDATE `entity_photos` SET `proto_name`='resort_zones' WHERE `proto_name`='4';
UPDATE `entity_photos` SET `proto_name`='health_factors' WHERE `proto_name`='5';
UPDATE `entity_photos` SET `proto_name`='treatment_options' WHERE `proto_name`='6';
UPDATE `entity_photos` SET `proto_name`='cure_profiles' WHERE `proto_name`='7';
UPDATE `entity_photos` SET `proto_name`='deseases' WHERE `proto_name`='8';

UPDATE `field_values` SET `proto_name`='hotels' WHERE `proto_name`='0';
UPDATE `field_values` SET `proto_name`='resorts' WHERE `proto_name`='1';
UPDATE `field_values` SET `proto_name`='countries' WHERE `proto_name`='2';
UPDATE `field_values` SET `proto_name`='regions' WHERE `proto_name`='3';
UPDATE `field_values` SET `proto_name`='resort_zones' WHERE `proto_name`='4';
UPDATE `field_values` SET `proto_name`='health_factors' WHERE `proto_name`='5';
UPDATE `field_values` SET `proto_name`='treatment_options' WHERE `proto_name`='6';
UPDATE `field_values` SET `proto_name`='cure_profiles' WHERE `proto_name`='7';
UPDATE `field_values` SET `proto_name`='deseases' WHERE `proto_name`='8';

UPDATE `prices` SET `proto_name`='hotels' WHERE `proto_name`='0';
UPDATE `prices` SET `proto_name`='resorts' WHERE `proto_name`='1';
UPDATE `prices` SET `proto_name`='countries' WHERE `proto_name`='2';
UPDATE `prices` SET `proto_name`='regions' WHERE `proto_name`='3';
UPDATE `prices` SET `proto_name`='resort_zones' WHERE `proto_name`='4';
UPDATE `prices` SET `proto_name`='health_factors' WHERE `proto_name`='5';
UPDATE `prices` SET `proto_name`='treatment_options' WHERE `proto_name`='6';
UPDATE `prices` SET `proto_name`='cure_profiles' WHERE `proto_name`='7';
UPDATE `prices` SET `proto_name`='deseases' WHERE `proto_name`='8';

SET SQL_SAFE_UPDATES=1;
