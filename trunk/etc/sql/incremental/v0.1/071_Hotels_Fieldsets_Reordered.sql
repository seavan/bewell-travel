SET NAMES utf8;

UPDATE `fieldsets` SET `order_number`='2' WHERE `id`='3';
UPDATE `fieldsets` SET `order_number`='3' WHERE `id`='2';
UPDATE `fieldsets` SET `order_number`='4' WHERE `id`='5';
UPDATE `fieldsets` SET `order_number`='5' WHERE `id`='4';
UPDATE `fieldsets` SET `order_number`='7' WHERE `id`='9';
UPDATE `fieldsets` SET `order_number`='8' WHERE `id`='10';
UPDATE `fieldsets` SET `order_number`='9' WHERE `id`='59';
UPDATE `fieldsets` SET `order_number`='10' WHERE `id`='61';

DELETE FROM `fieldsets` WHERE `id`='7';
DELETE FROM `fieldsets` WHERE `id`='8';

UPDATE `entity_fields` SET `fieldsets`='6,37' WHERE `id`='8';
UPDATE `entity_fields` SET `fieldsets`='6' WHERE `id`='9';

UPDATE `fieldset_fields_order` SET `fieldset_id`='6', `order_number`='2' WHERE `id`='8';
UPDATE `fieldset_fields_order` SET `fieldset_id`='6', `order_number`='3' WHERE `id`='9';

