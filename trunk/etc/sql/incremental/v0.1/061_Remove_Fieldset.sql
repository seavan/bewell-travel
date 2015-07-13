SET NAMES utf8;

DELETE FROM `bewell`.`fieldsets` WHERE `id`='14';
UPDATE `bewell`.`fieldsets` SET `order_number`='4' WHERE `id`='15';
UPDATE `bewell`.`fieldsets` SET `order_number`='5' WHERE `id`='16';
UPDATE `bewell`.`fieldsets` SET `order_number`='6' WHERE `id`='17';

UPDATE `bewell`.`entity_fields` SET `fieldsets`='15,53,57' WHERE `id`='17';
DELETE FROM `bewell`.`fieldset_fields_order` WHERE `id`='17';
