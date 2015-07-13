SET NAMES utf8;

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('1', '3', '2');

UPDATE `entity_fields` SET `fieldsets`='1,19,36' WHERE `id`='3';
UPDATE `fieldset_fields_order` SET `order_number`='3' WHERE `id`='76';
UPDATE `fieldset_fields_order` SET `order_number`='4' WHERE `id`='2';

