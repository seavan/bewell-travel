SET NAMES utf8;

UPDATE `entity_fields` SET `fieldsets`='19,36' WHERE `id`=3;
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('38', 'Методы лечения', '2', '1', 0);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (2, 38, 1);
DELETE FROM `fieldset_fields_order` WHERE `id`=3;

