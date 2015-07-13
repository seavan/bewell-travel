SET NAMES utf8;

INSERT INTO `fieldsets` (`title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES ('Отзывы', 'comments', '0', '11', 0, 0, 0);
INSERT INTO `fieldsets` (`title`, `url`, `entity_type`, `order_number`, `show_gallery`, `show_map`, `show_in_anounce`) VALUES ('Отзывы', 'comments', '1', '8', 0, 0, 0);

INSERT INTO `entity_fields` (`id`, `title`, `fieldsets`, `announce_order`, `show_in_announce`, `controller`, `action`) VALUES (40, 'Отзывы', '59,60', 1, 0, 'fields', 'comments');

INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (59, 40, 1);
INSERT INTO `fieldset_fields_order` (`fieldset_id`, `field_id`, `order_number`) VALUES (60, 40, 1);
