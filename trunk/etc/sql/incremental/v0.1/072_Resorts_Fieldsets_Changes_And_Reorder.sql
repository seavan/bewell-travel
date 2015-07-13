SET NAMES utf8;

INSERT INTO `fieldsets` (`id`, `title`, `url`, `proto_name`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES ('62', 'Почему выбирают курорт', 'why', 'resorts', '8', 0, 0, 0);
UPDATE `fieldsets` SET `order_number`='7' WHERE `id`='60';
INSERT INTO `fieldsets` (`id`, `title`, `url`, `proto_name`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES ('63', 'Курортный досуг', 'resort-leisure', 'resorts', '9', 0, 0, 0);

DELETE FROM `fieldsets` WHERE `id`='12';
DELETE FROM `fieldsets` WHERE `id`='13';

UPDATE `entity_fields` SET `fieldsets`='11,13,20,28,32' WHERE `id`='16';
UPDATE `entity_fields` SET `fieldsets`='11,12,20,28,32' WHERE `id`='15';
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`, `controller`, `action`) VALUES ('42', 'Профили лечения', '11', '1', 0, 'fields', 'cureprofiles');
UPDATE `entity_fields` SET `fieldsets`='17,18', `announce_order`='3' WHERE `id`='20';
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('43', 'Почему выбирают курорт', '18,62', '1', 1);
INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`) VALUES ('44', 'Курортный досуг', '63', '1', 0);
UPDATE `entity_fields` SET `fieldsets`='11,20,28,32' WHERE `id`='14';
UPDATE `entity_fields` SET `announce_order`='2' WHERE `id`='18';

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('11', '16', '2');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('11', '15', '3');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('11', '42', '4');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('62', '43', '1');
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES ('63', '44', '1');