SET NAMES utf8;

UPDATE `entity_fields` SET `fieldsets`='6' WHERE `id`='10';
UPDATE `entity_fields` SET `fieldsets`='' WHERE `id`='9';

UPDATE `fieldset_fields_order` SET `field_id`='10' WHERE `id`='9';

