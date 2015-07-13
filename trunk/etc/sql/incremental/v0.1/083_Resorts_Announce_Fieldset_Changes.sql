SET NAMES utf8;

UPDATE `entity_fields` SET `fieldsets`='17', `announce_order`='1', `show_in_announce`=0 WHERE `id`='20';
UPDATE `entity_fields` SET `fieldsets`='11,17,18', `announce_order`='3', `show_in_announce`=1 WHERE `id`='42';

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('17', '42', '2');
